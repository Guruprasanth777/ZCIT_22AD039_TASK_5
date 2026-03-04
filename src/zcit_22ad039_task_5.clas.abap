CLASS zcit_22ad039_task_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcit_22ad039_task_5 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CONSTANTS gc_pass_mark TYPE i VALUE 50.

    TYPES: BEGIN OF ty_student,
             id    TYPE i,
             name  TYPE string,
             marks TYPE i,
           END OF ty_student.

    DATA: gt_students TYPE STANDARD TABLE OF ty_student,
          gs_student  TYPE ty_student.

    " Insert records
    gs_student-id = 1.
    gs_student-name = 'Guruprasanth J'.
    gs_student-marks = 96.
    APPEND gs_student TO gt_students.

    gs_student-id = 2.
    gs_student-name = 'Hari Varshan M'.
    gs_student-marks = 87.
    APPEND gs_student TO gt_students.

    " Display Students
    out->write( '--- Student List ---' ).

    LOOP AT gt_students INTO gs_student.
      out->write( |{ gs_student-id } { gs_student-name } { gs_student-marks }| ).
    ENDLOOP.

    " READ TABLE Example
    READ TABLE gt_students INTO gs_student WITH KEY id = 2.

    IF sy-subrc = 0.
      out->write( |Student Found: { gs_student-name }| ).
    ELSE.
      out->write( 'Student Not Found' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
