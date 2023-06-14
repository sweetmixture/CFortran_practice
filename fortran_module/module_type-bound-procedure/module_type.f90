module module_types

    implicit none

    public

    ! type 
    ! type, bind(c) :: employee
    type :: employee
        integer :: age, rank                ! 4  bytes * 2
        character(len=40) :: name           ! 40 bytes

        ! must declare this: to identify there are type-bound procedures
        ! note. this part does not influence on the size of this type, 'employee'
        contains
            procedure :: show_info, set_info

    end type

    contains

        subroutine show_info(self)
            !type(employee), intent(in) :: employee
            !write(*,'(a,a)') "Name: ", employee%name
            !class(employee), intent(in) :: self
            class(employee), intent(in) :: self
            write(*,'(a,a)') "Name: ", self%name
            write(*,'(a,I4,a,I2)') "Age / Grade : ", self%age, ' /', self%rank
  
        end subroutine show_info

        subroutine set_info(self,name,age,rank)

            class(employee), intent(inout) :: self
            ! character(len=40), intent(in) :: name ! this will invoke error, since 'name' must be len=40 strictly
            character(len=*), intent(in) :: name
            integer, intent(in) :: age, rank

            self%name = name
            self%age = age
            self%rank = rank
      
        end subroutine set_info

end module module_types
