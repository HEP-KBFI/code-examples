```
singularity exec /home/software/singularity/base.simg mpicc mpi-example.c -o example
singularity exec --env HWLOC_COMPONENTS=-gl /home/software/singularity/base.simg mpirun -v -np 5 --host localhost:5 example
```
