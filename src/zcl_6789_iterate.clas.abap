CLASS zcl_6789_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_6789_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " Constants
  CONSTANTS max_count TYPE i VALUE 20.

  " Internal tables
  DATA numbers TYPE STANDARD TABLE OF i WITH EMPTY KEY.
  DATA output  TYPE STANDARD TABLE OF string WITH EMPTY KEY.

  " Variables
  DATA prev1 TYPE i.
  DATA prev2 TYPE i.

  " Calculate Fibonacci numbers
  DO max_count TIMES.

    CASE sy-index.

      WHEN 1.
        APPEND 0 TO numbers.

      WHEN 2.
        APPEND 1 TO numbers.

      WHEN OTHERS.

        READ TABLE numbers INDEX sy-index - 1 INTO prev1.
        READ TABLE numbers INDEX sy-index - 2 INTO prev2.

        APPEND prev1 + prev2 TO numbers.

    ENDCASE.

  ENDDO.

  " Prepare formatted output
  DATA(counter) = 0.

  LOOP AT numbers INTO DATA(number).

    counter += 1.

    APPEND
      |{ counter WIDTH = 4 ALIGN = LEFT } : { number WIDTH = 10 ALIGN = RIGHT }|
      TO output.

  ENDLOOP.

  " Console output
  out->write(
    name = 'Fibonacci Numbers'
    data = output
  ).

ENDMETHOD.
ENDCLASS.
