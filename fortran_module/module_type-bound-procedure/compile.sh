#!/bin/bash

ifort -c module_type.f90
ifort -c main.f90
ifort -o a.out *.o

rm -rf *.o *.mod
