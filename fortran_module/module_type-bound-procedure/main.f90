program test_module_type

    use module_types
    implicit none

    ! use 'employee' type
    type(employee) :: emp_1, emp_2;

    emp_1%name = "John Doe"
    emp_1%age = 42
    emp_1%rank = 7
    ! write(*,'(a)') emp_1%name

    call emp_1%show_info()
    write(*,'(A)') "--------------------------------"
    call emp_1%set_info("Banana Cream",21,9)  ! reset
    call emp_1%show_info()

    write(*,'(A,I4)') "sizeof(type):", sizeof(emp_1)

end program test_module_type
