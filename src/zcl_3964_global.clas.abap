CLASS zcl_3964_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_3964_global IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection TYPE REF TO lcl_connection.
  DATA connection2 TYPE REF TO lcl_connection.

  connection = NEW #(  ).
  connection->carrier_id = 'LH'.
  connection->connection_id = '0400'.

  connection2 = connection.

  ENDMETHOD.
ENDCLASS.
