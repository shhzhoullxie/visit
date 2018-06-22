#/usr/local/graphics/visit/cmake/3.8.1/linux-x86_64_gcc-4.8/bin/cmake
##
## ./build_visit generated host.cmake, modified by Paul Selby
## created: Wed 25 Feb 16:48:25 GMT 2015
## system: Linux UL329899 3.11.10-25-desktop #1 SMP PREEMPT Wed Dec 17 17:57:03 UTC 2014 (8210f77) x86_64 x86_64 x86_64 GNU/Linux
## by: selby

##
## Build extra for testing
##
VISIT_OPTION_DEFAULT(VISIT_DATA_MANUAL_EXAMPLES ON TYPE BOOL)
VISIT_OPTION_DEFAULT(VISIT_BUILD_ALL_PLUGINS ON TYPE BOOL)

##
## Setup VISITHOME & VISITARCH variables.
##
SET(VISITHOME /usr/local/graphics/visit)
SET(VISITARCH linux-x86_64_gcc-4.8)

## Compiler flags.
##
VISIT_OPTION_DEFAULT(VISIT_C_COMPILER gcc TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_CXX_COMPILER g++ TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_FORTRAN_COMPILER no TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_C_FLAGS " -m64 -fPIC -fvisibility=hidden -Wall" TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_CXX_FLAGS " -m64 -fPIC -fvisibility=hidden -Wall --std=c++11" TYPE STRING)

##
## Parallel Options
##
VISIT_OPTION_DEFAULT(VISIT_MPI_C_FLAGS "-DOMPI_SKIP_MPICXX -I/usr/lib64/mpi/gcc/openmpi/include -I/usr/lib64/mpi/gcc/openmpi/include/openmpi")
VISIT_OPTION_DEFAULT(VISIT_MPI_CXX_FLAGS "-DOMPI_SKIP_MPICXX -I/usr/lib64/mpi/gcc/openmpi/include -I/usr/lib64/mpi/gcc/openmpi/include/openmpi")
VISIT_OPTION_DEFAULT(VISIT_PARALLEL_LINKER_FLAGS "-Wl,--export-dynamic")
VISIT_OPTION_DEFAULT(VISIT_MPI_LIBS "/usr/lib64/mpi/gcc/openmpi/lib64/libmpi.so")
VISIT_OPTION_DEFAULT(VISIT_PARALLEL ON TYPE BOOL)
VISIT_OPTION_DEFAULT(VISIT_PARALLEL_RPATH "/usr/lib64/mpi/gcc/openmpi/lib64")

##
## VisIt Thread Option
##
VISIT_OPTION_DEFAULT(VISIT_THREAD OFF TYPE BOOL)

##############################################################
##
## Database reader plugin support libraries
##
## The HDF4, HDF5 and NetCDF libraries must be first so that
## their libdeps are defined for any plugins that need them.
##
## For libraries with LIBDEP settings, order matters.
## Libraries with LIBDEP settings that depend on other
## Library's LIBDEP settings must come after them.
##############################################################
##

##
## Python
##
VISIT_OPTION_DEFAULT(VISIT_PYTHON_DIR ${VISITHOME}/python/2.7.11/${VISITARCH})

##
## Qt
##
SETUP_APP_VERSION(QT 5.6.1)
VISIT_OPTION_DEFAULT(VISIT_QT5 ON TYPE BOOL)
VISIT_OPTION_DEFAULT(VISIT_QT_DIR ${VISITHOME}/qt/${QT_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_QT_BIN ${VISIT_QT_DIR}/bin)

##
## QWT
##
SETUP_APP_VERSION(QWT 6.1.2)
VISIT_OPTION_DEFAULT(VISIT_QWT_DIR ${VISITHOME}/qwt/${QWT_VERSION}/${VISITARCH})

##
## VTK
##
SETUP_APP_VERSION(VTK 6.1.0)
VISIT_OPTION_DEFAULT(VISIT_VTK_DIR ${VISITHOME}/vtk/${VTK_VERSION}/${VISITARCH})

##
## SZIP
##
VISIT_OPTION_DEFAULT(VISIT_SZIP_DIR ${VISITHOME}/szip/2.1/${VISITARCH})

##
## HDF5
##
VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR ${VISITHOME}/hdf5/1.8.14/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_HDF5_MPI_DIR ${VISITHOME}/hdf5_mpi/1.8.14/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP ${VISITHOME}/szip/2.1/${VISITARCH}/lib sz /usr/lib z TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_HDF5_MPI_LIBDEP ${VISITHOME}/szip/2.1/${VISITARCH}/lib sz /usr/lib z TYPE STRING)

##
## Boxlib
##
VISIT_OPTION_DEFAULT(VISIT_BOXLIB_DIR ${VISITHOME}/boxlib/1.3.5/${VISITARCH})

##
## CFITSIO
##
VISIT_OPTION_DEFAULT(VISIT_CFITSIO_DIR ${VISITHOME}/cfitsio/3006/${VISITARCH})

##
## CGNS
##
VISIT_OPTION_DEFAULT(VISIT_CGNS_DIR ${VISITHOME}/cgns/3.2.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_CGNS_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## FastBit
##
SETUP_APP_VERSION(FASTBIT 2.0.3.4)
VISIT_OPTION_DEFAULT(VISIT_FASTBIT_DIR ${VISITHOME}/fastbit/${FASTBIT_VERSION}/${VISITARCH})

##
## GDAL
##
VISIT_OPTION_DEFAULT(VISIT_GDAL_DIR ${VISITHOME}/gdal/2.2.4/${VISITARCH})

##
## H5Part
##
SETUP_APP_VERSION(H5PART 1.6.6)
VISIT_OPTION_DEFAULT(VISIT_H5PART_DIR ${VISITHOME}/h5part/${H5PART_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_H5PART_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## Ice-T
##
VISIT_OPTION_DEFAULT(VISIT_ICET_DIR ${VISITHOME}/icet/1.0.0/${VISITARCH})

##
## Mesa
##
VISIT_OPTION_DEFAULT(VISIT_MESA_DIR ${VISITHOME}/mesa/7.10.2/${VISITARCH})

##
## MFEM 
##
VISIT_OPTION_DEFAULT(VISIT_MFEM_DIR ${VISITHOME}/mfem/3.3/${VISITARCH})

##
## Mili
##
VISIT_OPTION_DEFAULT(VISIT_MILI_DIR ${VISITHOME}/mili/15.1/${VISITARCH})

##
## MOAB 
##
VISIT_OPTION_DEFAULT(VISIT_MOAB_DIR ${VISITHOME}/moab/4.9.2-RC0/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_MOAB_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_MOAB_MPI_DIR ${VISITHOME}/moab_mpi/4.9.2-RC0/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_MOAB_MPI_LIBDEP HDF5_MPI_LIBRARY_DIR hdf5_mpi ${VISIT_HDF5_MPI_LIBDEP} TYPE STRING)
##

##
## NetCDF
##
VISIT_OPTION_DEFAULT(VISIT_NETCDF_DIR ${VISITHOME}/netcdf/4.1.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_NETCDF_LIBDEP HDF5_LIBRARY_DIR hdf5_hl HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## PySide
##
VISIT_OPTION_DEFAULT(VISIT_PYSIDE_DIR ${VISITHOME}/pyside/2.0.0-2017.08.30/${VISITARCH}/)

##
## Silo
##
VISIT_OPTION_DEFAULT(VISIT_SILO_DIR ${VISITHOME}/silo/4.10.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_SILO_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} /usr/lib z TYPE STRING)

##
## Xdmf
##
VISIT_OPTION_DEFAULT(VISIT_XDMF_DIR ${VISITHOME}/Xdmf/2.1.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_XDMF_LIBDEP HDF5_LIBRARY_DIR hdf5  VTK_LIBRARY_DIRS vtklibxml2-${VTK_MAJOR_VERSION}.${VTK_MINOR_VERSION}  TYPE STRING)

