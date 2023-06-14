#include <stdio.h>
#include <stdlib.h>

// equivalent with 'fortran_struct' in type_module.f90
typedef struct c_struct{

	int int_val[2];		// 4 bytes x 2 = 8
	double double_val[4];	// 8 bytes x 4 = 32
	char string[40];	// 1 bytes x 40= 40
				// total 80 bytes
}c_struct;

// Fortran subroutines in type_subroutine.f90
extern void f_show_contents( c_struct* );
extern void f_init_contents( c_struct* );

int main()
{
	c_struct* c_struct_ptr = malloc(sizeof(c_struct));
	char string[] = "Banana is white";

	// print c_struct_ptr
	c_struct_ptr->int_val[0] = 1;
	c_struct_ptr->int_val[1] = 2;
	c_struct_ptr->double_val[0] = 1.1;
	c_struct_ptr->double_val[1] = 1.2;
	c_struct_ptr->double_val[2] = 1.3;
	c_struct_ptr->double_val[3] = 1.4;
	sprintf(c_struct_ptr->string,"%s",string);

	//printf("string: %s\n",c_struct_ptr->string);
	printf("C>       sizeof(type): %4d\n",sizeof(*c_struct_ptr));

	// call fortran
	f_show_contents( c_struct_ptr );

	printf("C>       call init_contents() on C interface\n");
	f_init_contents( c_struct_ptr );
	f_show_contents( c_struct_ptr );

	free(c_struct_ptr);

	return 0;
}
