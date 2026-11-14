*"* use this source file for your ABAP unit test classes
*"* ===================================================================
*"* Unit 1 / Demo 2 – paste into the "Test Classes" tab
*"* Run with Ctrl+Shift+F10
*"* ===================================================================

CLASS ltc_seats DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_3964_s4d401_demo1.

    METHODS setup.
    METHODS free_seats FOR TESTING.
    METHODS full_flight FOR TESTING.
    METHODS overbooked FOR TESTING.
ENDCLASS.


CLASS ltc_seats IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD free_seats.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_free_seats( seats_max = 180 seats_occ = 150 )
      exp = 30
      msg = 'Free seats calculated wrongly' ).
  ENDMETHOD.

  METHOD full_flight.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_free_seats( seats_max = 180 seats_occ = 180 )
      exp = 0 ).
  ENDMETHOD.

  METHOD overbooked.
    " Red-green demo: remove nmax( ) in GET_FREE_SEATS to see this fail
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_free_seats( seats_max = 180 seats_occ = 190 )
      exp = 0
      msg = 'Overbooked flights must not have negative free seats' ).
  ENDMETHOD.

ENDCLASS.


