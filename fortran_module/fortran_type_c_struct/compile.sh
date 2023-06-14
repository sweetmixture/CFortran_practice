#!/bin/bash

# C
icc -c main.c

# Fortran
ifort -c type_module.f90 
ifort -c type_subroutine.f90 

# C/Fortran cross
icc -o a.out *.o -lifcore

rm -rf *.o *.mod
