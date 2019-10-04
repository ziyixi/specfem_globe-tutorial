#!/bin/bash
#----------------------------------------------------
# Sample Slurm job script
#   for TACC Stampede2 KNL nodes
#
#   *** MPI Job on Normal Queue ***
# 
# Last revised: 20 Oct 2017
#
# Notes:
#
#   -- Launch this script by executing
#      "sbatch knl.mpi.slurm" on Stampede2 login node.
#
#   -- Use ibrun to launch MPI codes on TACC systems.
#      Do not use mpirun or mpiexec.
#
#   -- Max recommended MPI tasks per KNL node: 64-68
#      (start small, increase gradually).
#
#   -- If you're running out of memory, try running
#      fewer tasks per node to give each task more memory.
#
#----------------------------------------------------

#SBATCH -J all           # Job name
#SBATCH -o myjob.o%j       # Name of stdout output file
#SBATCH -e myjob.e%j       # Name of stderr error file
#SBATCH -p skx-normal          # Queue (partition) name
#SBATCH -N 10               # Total # of nodes 
#SBATCH -n 441              # Total # of mpi tasks
#SBATCH -t 02:00:00        # Run time (hh:mm:ss)
#SBATCH -A TG-EAR130011

# Other commands must follow all #SBATCH directives...

module list
cd ..
pwd
date
module load intel/18.0.2
# Launch MPI code... 

ibrun "./bin/xmeshfem3D"
date
ibrun "./bin/xspecfem3D"         # Use ibrun instead of mpirun or mpiexec
date
# ---------------------------------------------------
