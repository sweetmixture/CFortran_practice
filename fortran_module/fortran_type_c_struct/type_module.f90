module derived_type

    implicit none

    public

    !type, bind(c) :: fortran_struct
    type :: fortran_struct
        SEQUENCE ! for binding with C, the above comment line causes warning

!type_module.f90(11): warning #8753: A CHARACTER component of an interoperable derived type must have length 1.   [STRING]
!        character(len=40) :: string

        integer, dimension(2) :: int_val
        real(8), dimension(4) :: real_val
        character(len=40) :: string

    end type fortran_struct

end module derived_type
