*"*<p class="shorttext synchronized">S4D401 live session – demo class</p>
*"*Demo code for the 2-hour live session "Deepening Your ABAP Programming Knowledge".
*"*Replace 00 with your participant number. Run with F9 (console app).
*"*Prerequisite: ABAP Flight Reference Scenario (/DMO/ tables) with generated data
*"*(/DMO/CL_FLIGHT_DATA_GENERATOR).
*"*The local test class (Unit 1, Demo 2) is at the bottom of this file –
*"*Paste it into the "Test Classes" tab in ADT.

CLASS zcl_3964_s4d401_demo1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    "! Unit 1 / Demo 2: method under test
    METHODS get_free_seats
      IMPORTING seats_max     TYPE i
                seats_occ     TYPE i
      RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA out TYPE REF TO if_oo_adt_classrun_out.

    " Unit 1 / Demo 1: ATC reports this attribute as unused – the pragma
    " documents that it is kept on purpose. Remove ##NEEDED to see the finding.
    DATA currency_code TYPE /dmo/currency_code ##NEEDED.

    METHODS header IMPORTING title TYPE string.

    " Unit 1
    METHODS nested_select_slow.
    " Unit 2
    METHODS conversion_pitfalls.
    METHODS date_calculations.
    " Unit 3
    METHODS text_symbols.
    METHODS string_processing.
    " Unit 4
    METHODS joins_inner.
    METHODS joins_outer.
    METHODS nested_join_fast.
    METHODS sql_expressions.
    METHODS sql_aggregation.
ENDCLASS.



CLASS ZCL_3964_S4D401_DEMO1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    me->out = out.

    " Comment in/out per unit during the session
    " ---- Unit 1: Analyzing and Testing Code --------------------------
    nested_select_slow( ).          " Demo 3: profile + SQL trace this

    " ---- Unit 2: Data Types and Type Conversions ----------------------
    conversion_pitfalls( ).         " Demo 4
    date_calculations( ).           " Demo 5

    " ---- Unit 3: Processing Character Fields --------------------------
    text_symbols( ).                " Demo 6
    string_processing( ).           " Demo 7

    " ---- Unit 4: Code Pushdown in ABAP SQL ----------------------------
    joins_inner( ).                 " Demo 8
    joins_outer( ).                 " Demo 8 cont.
    nested_join_fast( ).            " Demo 8 cont. – replaces Demo 3
    sql_expressions( ).             " Demo 9
    sql_aggregation( ).             " Demo 9 cont.
  ENDMETHOD.


  METHOD header.
    out->write( |{ repeat( val = `-` occ = 60 ) }| ).
    out->write( title ).
    out->write( |{ repeat( val = `-` occ = 60 ) }| ).
  ENDMETHOD.


  METHOD get_free_seats.
    " Never negative – overbooked flights have 0 free seats
    result = nmax( val1 = seats_max - seats_occ val2 = 0 ).
  ENDMETHOD.


  METHOD nested_select_slow.
    header( `Demo 3: SELECT in LOOP (slow)` ).

  "--------------------------------------------------------------------
  " Unit 1 / Demo 3 – deliberately slow: SELECT inside LOOP (1 + 2n)
  " ATC (performance checks) and the SQL trace both flag this.
  "--------------------------------------------------------------------

    SELECT FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      INTO TABLE @DATA(connections).

    LOOP AT connections INTO DATA(connection).
      SELECT SINGLE FROM /dmo/airport
        FIELDS city
        WHERE airport_id = @connection-airport_from_id
        INTO @DATA(city_from).

      SELECT SINGLE FROM /dmo/airport
        FIELDS city
        WHERE airport_id = @connection-airport_to_id
        INTO @DATA(city_to).

      out->write( |{ connection-carrier_id } { connection-connection_id }: | &&
                  |{ city_from } -> { city_to }| ).
    ENDLOOP.
  ENDMETHOD.


  METHOD conversion_pitfalls.
    header( `Demo 4: Type conversion pitfalls` ).

  "--------------------------------------------------------------------
  " Unit 2 / Demo 4 – silent conversions
  " Ask the audience to predict each value before running.
  "--------------------------------------------------------------------

    " 1) C is truncated on the right
    DATA char5 TYPE c LENGTH 5.
    char5 = 'ABAP Cloud'.
    out->write( |char5  = '{ char5 }'| ).                 " 'ABAP'

    " 2) P rounds commercially to its decimals
    DATA amount TYPE p LENGTH 8 DECIMALS 2.
    amount = 1 / 3.
    out->write( |amount = { amount }| ).                  " 0.33

    " 3) Inline declaration takes the calculation type: I
    DATA(half) = 5 / 2.
    out->write( |half   = { half }| ).                    " 3

    " 4) C -> N keeps digits only, right-aligned, zero-filled
    DATA numc TYPE n LENGTH 4.
    numc = 'A1B2'.
    out->write( |numc   = { numc }| ).                    " 0012

    " 5) CONV's target type takes part in the calculation type
    DATA(ratio) = CONV decfloat34( 5 / 2 ).
    out->write( |ratio  = { ratio }| ).                   " 2.5

    " 6) EXACT refuses to round
    TRY.
        DATA(exact_int) = EXACT i( '3.7' ).
        out->write( |exact  = { exact_int }| ).
      CATCH cx_sy_conversion_rounding INTO DATA(rounding).
        out->write( |EXACT: { rounding->get_text( ) }| ).
    ENDTRY.

    " 7) Overflow
    TRY.
        DATA small TYPE int1.          " range 0..255
        DATA(big) = 300.
        small = big.
        out->write( |small  = { small }| ).
      CATCH cx_sy_conversion_overflow INTO DATA(overflow).
        out->write( |Overflow: { overflow->get_text( ) }| ).
    ENDTRY.

    " Unit 1 / Demo 1: ATC/SLIN reports this unused variable
    DATA unused_variable TYPE string.
  ENDMETHOD.


  METHOD date_calculations.
    header( `Demo 5: Dates and timestamps` ).

  "--------------------------------------------------------------------
  " Unit 2 / Demo 5 – dates, times, timestamps
  "--------------------------------------------------------------------

    DATA(today) = cl_abap_context_info=>get_system_date( ).

    DATA due TYPE d.
    due = today + 30.                         " typed target: a date
    DATA(oops) = today + 30.                  " inline: type I (days since 0001-01-01)
    DATA(days) = due - today.                 " 30

    DATA month_end TYPE d.
    month_end = |{ today(6) }01|.             " first of this month
    month_end = month_end - 1.                " last day of previous month

    out->write( |today     = { today DATE = ISO }| ).
    out->write( |due       = { due DATE = ISO }| ).
    out->write( |oops      = { oops } (type I!)| ).
    out->write( |days      = { days }| ).
    out->write( |month end = { month_end DATE = ISO }| ).

    " Timestamps: store in UTC, convert for display
    DATA(now)   = utclong_current( ).
    DATA(later) = utclong_add( val = now hours = 2 ).
    DATA(secs)  = utclong_diff( high = later low = now ).   " 7200

    TRY.
        DATA(tz) = cl_abap_context_info=>get_user_time_zone( ).
      CATCH cx_abap_context_info_error.
        tz = 'UTC'.
    ENDTRY.

    CONVERT UTCLONG now TIME ZONE tz
      INTO DATE DATA(local_date) TIME DATA(local_time).

    out->write( |now (UTC) = { now TIMESTAMP = ISO }| ).
    out->write( |diff      = { secs } seconds| ).
    out->write( |local     = { local_date DATE = ISO } { local_time TIME = ISO } ({ tz })| ).
  ENDMETHOD.


  METHOD text_symbols.
    header( `Demo 6: Text symbols` ).

  "--------------------------------------------------------------------
  " Unit 3 / Demo 6 – text symbols
  " Put the cursor on a literal and press Ctrl+1 > Create text symbol.
  " The literal stays as fallback; ID 001/002 is translated.
  "--------------------------------------------------------------------

    SELECT SINGLE FROM /dmo/carrier
      FIELDS carrier_id, name
      WHERE carrier_id = 'LH'
      INTO @DATA(carrier).

    SELECT FROM /dmo/connection
      FIELDS COUNT( * )
      WHERE carrier_id = @carrier-carrier_id
      INTO @DATA(connection_count).

    " Before (not translatable):
    out->write( |{ 'Carrier Name:' } { carrier-name }| ).

    " After (translatable, literal = fallback):
    out->write( |{ 'Carrier Name:'(001) } { carrier-name }| ).
    out->write( |{ 'Connections:'(002) } { connection_count }| ).
  ENDMETHOD.


  METHOD string_processing.
    header( `Demo 7: String functions and regex` ).

  "--------------------------------------------------------------------
  " Unit 3 / Demo 7 – string functions and PCRE
  "--------------------------------------------------------------------

    DATA(raw) = `  ABAP   is   fun  `.
    DATA(txt) = condense( raw ).                               " `ABAP is fun`
    out->write( |condense  = '{ txt }'| ).
    out->write( |strlen    = { strlen( txt ) }| ).             " 11
    out->write( |to_upper  = { to_upper( txt ) }| ).
    out->write( |substring = { substring( val = txt off = 5 len = 2 ) }| ).  " is
    out->write( |find      = { find( val = txt sub = `fun` ) }| ).          " 8
    out->write( |segment   = { segment( val = `MM;SD;QM` index = 2 sep = `;` ) }| ). " SD

    SPLIT `MM;SD;QM` AT `;` INTO TABLE DATA(modules).
    out->write( modules ).

    " Regular expressions – always PCRE (POSIX REGEX is obsolete)
    DATA(mail) = `joe.dev@example.com`.
    IF matches( val = mail pcre = `^[\w.+-]+@[\w-]+\.[\w.]+$` ).
      out->write( |{ mail } is a valid e-mail address| ).
    ENDIF.

    DATA(masked) = replace( val = mail pcre = `^[^@]+` with = `***` ).
    out->write( |masked    = { masked }| ).                    " ***@example.com

    DATA(reference) = `PO 4500012 / item 10`.
    FIND ALL OCCURRENCES OF PCRE `\d+` IN reference RESULTS DATA(hits).
    LOOP AT hits INTO DATA(hit).
      out->write( |number    = { substring( val = reference off = hit-offset len = hit-length ) }| ).
    ENDLOOP.
  ENDMETHOD.


  METHOD joins_inner.
    header( `Demo 8: Inner join and self-join` ).

  "--------------------------------------------------------------------
  " Unit 4 / Demo 8 – inner join and self-join
  "--------------------------------------------------------------------

    SELECT FROM /dmo/carrier AS c
      INNER JOIN /dmo/connection AS p
        ON c~carrier_id = p~carrier_id
      FIELDS c~carrier_id, c~name,
             p~connection_id, p~airport_from_id, p~airport_to_id
      WHERE c~currency_code = 'EUR'
      INTO TABLE @DATA(connections).
    out->write( connections ).

    " Self-join: routes from FRA with one transfer
    SELECT FROM /dmo/connection AS a
      INNER JOIN /dmo/connection AS b
        ON a~airport_to_id = b~airport_from_id
      FIELDS a~airport_from_id AS departure,
             a~airport_to_id   AS via,
             b~airport_to_id   AS destination
      WHERE a~airport_from_id = 'FRA'
        AND b~airport_to_id <> a~airport_from_id
      INTO TABLE @DATA(one_stop).
    out->write( one_stop ).
  ENDMETHOD.


  METHOD joins_outer.
    header( `Demo 8: Outer join` ).

  "--------------------------------------------------------------------
  " Unit 4 / Demo 8 cont. – outer join
  " Switch LEFT OUTER to INNER / RIGHT OUTER and compare row counts.
  "--------------------------------------------------------------------

    SELECT FROM /dmo/agency AS a
      LEFT OUTER JOIN /dmo/customer AS c
        ON a~city = c~city
      FIELDS a~agency_id, a~city, c~customer_id, c~last_name
      WHERE ( c~customer_id < '000100' OR c~customer_id IS NULL )
      INTO TABLE @DATA(agencies).

    out->write( |Rows: { lines( agencies ) }| ).
    out->write( agencies ).   " unmatched customer_id = 000000 (initial, not NULL)
  ENDMETHOD.


  METHOD nested_join_fast.
    header( `Demo 8: Nested join (fast)` ).

  "--------------------------------------------------------------------
  " Unit 4 / Demo 8 cont. – nested join replaces nested_select_slow
  " Re-run the SQL trace: one statement instead of 1 + 2n.
  "--------------------------------------------------------------------

    SELECT FROM ( /dmo/connection AS c
                  LEFT OUTER JOIN /dmo/airport AS f
                    ON c~airport_from_id = f~airport_id )
                  LEFT OUTER JOIN /dmo/airport AS t
                    ON c~airport_to_id = t~airport_id
      FIELDS c~carrier_id, c~connection_id,
             coalesce( f~city, 'unknown' ) AS city_from,
             coalesce( t~city, 'unknown' ) AS city_to
      INTO TABLE @DATA(routes).

    out->write( routes ).
  ENDMETHOD.


  METHOD sql_expressions.
    header( `Demo 9: SQL expressions` ).

  "--------------------------------------------------------------------
  " Unit 4 / Demo 9 – SQL expressions and built-in functions
  "--------------------------------------------------------------------

    DATA(today) = cl_abap_context_info=>get_system_date( ).

    SELECT FROM /dmo/flight
      FIELDS carrier_id, connection_id, flight_date,
             concat_with_space( carrier_id, connection_id, 1 ) AS flight,
             seats_max - seats_occupied AS seats_free,
             division( seats_occupied * 100, seats_max, 1 ) AS load_pct,
             CASE WHEN seats_occupied >= seats_max THEN 'FULL'
                  ELSE 'OPEN'
             END AS status,
             dats_days_between( @today, flight_date ) AS days_to_go
      WHERE flight_date >= @today
      ORDER BY flight_date
      INTO TABLE @DATA(flights)
      UP TO 20 ROWS.
    out->write( flights ).

    " Special built-in function – needs exchange rates in the system
    TRY.
        SELECT FROM /dmo/flight
          FIELDS carrier_id, connection_id, flight_date, price, currency_code,
                 currency_conversion( amount             = price,
                                      source_currency    = currency_code,
                                      target_currency    = 'EUR',
                                      exchange_rate_date = flight_date ) AS price_eur
          WHERE flight_date >= @today
          ORDER BY flight_date
          INTO TABLE @DATA(prices)
          UP TO 10 ROWS.
        out->write( prices ).
      CATCH cx_sy_open_sql_db INTO DATA(sql_error).
        out->write( |Currency conversion failed: { sql_error->get_text( ) }| ).
    ENDTRY.
  ENDMETHOD.


  METHOD sql_aggregation.
    header( `Demo 9: Aggregation` ).

  "--------------------------------------------------------------------
  " Unit 4 / Demo 9 cont. – aggregation, HAVING, ORDER BY, UP TO
  "--------------------------------------------------------------------

    SELECT FROM /dmo/flight
      FIELDS carrier_id,
             COUNT( * ) AS flights,
             SUM( seats_occupied ) AS passengers,
             AVG( seats_occupied AS DEC( 10, 1 ) ) AS avg_passengers,
             MIN( flight_date ) AS first_flight
      GROUP BY carrier_id
      HAVING COUNT( * ) < 10
      ORDER BY passengers DESCENDING
      INTO TABLE @DATA(stats)
      UP TO 5 ROWS.

    out->write( stats ).
  ENDMETHOD.
ENDCLASS.
