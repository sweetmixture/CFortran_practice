! TestCase - 1
subroutine show_contents( c_struct ) bind(C,name='f_show_contents')

    use iso_c_binding
    use derived_type

    implicit none

    type(fortran_struct), intent(in) :: c_struct

    write(*,'(A,I4)') "FORTRAN> sizeof(type): ", sizeof(c_struct)

    ! print contents
    write(*,'(A,I4,I4)')               "int   : ", c_struct%int_val(1), c_struct%int_val(2)
    write(*,'(A,f4.1,f4.1,f4.1,f4.1)') "real  : ", c_struct%real_val(1), c_struct%real_val(2), c_struct%real_val(3), c_struct%real_val(4)
    write(*,'(A,A)')                   "string: ", c_struct%string

end subroutine show_contents


! TestCase - 2
subroutine init_contents( c_struct ) bind(C,name='f_init_contents')

    use iso_c_binding
    use derived_type

    implicit none

    type(fortran_struct), intent(inout) :: c_struct
    integer :: i 

    do i=1,2
        c_struct%int_val(i) = 0
    end do

    do i=1,4
        c_struct%real_val(i) = 0.
    end do

    c_struct%string = ""

end subroutine init_contents
