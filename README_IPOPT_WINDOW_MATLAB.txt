Windows with MATLAB 2014a or later
 

1. Linux terminal
 (a) Use MinGW-MSYS since CygWin is not supported by IPOPT anymore. 
 (b) Need wget unzip
 (c) The components you need are: core (under gcc), c++ (under gcc), fortran (under gcc), openmp 
     (under gcc, necessary if you want to use any multi-threaded linear solvers), binutils, and mingw64-runtime. 
 (d) (64bit)  We recommend TDM-GCC, which is available from 
     http://sourceforge.net/projects/tdm-gcc/files/TDM-GCC%20Installer/tdm-gcc-webdl.exe/download
     Save it in MinGW-64 folder
 (e)  After MinGW-64 is installed, open the file 
    C:\MinGW\msys\1.0\etc\fstab, and replace the line

	  C:\MinGW\     /mingw

	with

	  C:\MinGW64\   /mingw


2. Get IPOPT code 
 (a) Get the source code of the IPOPT from git or tarball(recommended - easy) not using subversion 
     Subversion is not used by default in MinGW-MSYS.

3. External Code
 (a) (BLAS, LAPACK, ASL) Install BLAS, LAPACK, ASL (Follow the instruction)
 (b) (HSL for MA27) Go to http://hsl.rl.ac.uk/ipopt and download HSLArchive (Follow instruction)

4.Compile and Install IPOPT
 (a) (Follow http://www.coin-or.org/Ipopt/documentation/node14.html)
 (b) (If you get all the code and environment set up correctly 
     meaning that 1, 2, 3 are done)../configure, make, make test, make install will work fine.

5.Interface with MATLAB2014a (64bit)
 (a) Instruction : http://www.coin-or.org/Ipopt/documentation/node18.html will not work and need to modify.
 (a-1) However, follow the working folder as explained in the above link.
 (b) Do not use ./get/gnumex. Download (gnumex2.06.zip : https://sourceforge.net/projects/gnumex/files/). (Not in the instruction)
 (c) Unzip the file and you will have a folder name "trunk". (This is what one do in ./get/gnumex file after downloading)
 (d) mv trunk gnumex

  
 (e) chmod +x gnumex/*.exe gnumex/*.mexw32


 (f) (64bit) Need to inistall the patch  (Not in the instruction)
     Download the patch -> https://projects.coin-or.org/Ipopt/browser/trunk/Ipopt/contrib/MatlabInterface/gnumex_win64.patch?rev=2112
 (g) make gnumex  (CAUSTION: run this inside the correct folder where you install the IPOPT). If not, there will be linking problem 
     connecting to the wrong libray path.
 (h) C: may not have the writing permit for Program files, so one need to copy the mexopts.bat and mexopts.stp to the ../R2014b/bin/win64/mexopts folder in ones local MATLAB program path
 (i) make mexopts
 (j) Addpath {directory where it has ipopt.mex}


