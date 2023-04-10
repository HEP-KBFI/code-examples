#!/bin/bash
#SBATCH -p short
#SBATCH --no-requeue

echo "Environment at job start"
env
hostname

export IMG=/cvmfs/singularity.opensciencegrid.org/cmssw/cms:rhel8
export SCRAM_ARCH=el8_amd64_gcc10
export MYCMSSW=/home/joosep/CMSSW_12_5_5_patch1
export WORKDIR=/scratch/local/$USER/${SLURM_JOB_ID}

mkdir -p $WORKDIR
cd $WORKDIR

cat << EOF > run.sh
#!/bin/bash

source /cvmfs/cms.cern.ch/cmsset_default.sh
which scram

cd $MYCMSSW
cmsenv
echo "Environment after cmsenv"
env

cd $WORKDIR 
cmsRun -h
EOF

cat run.sh
chmod +x run.sh

singularity exec \
    -B /local \
    -B /scratch \
    -B /cvmfs \
    -B /home \
    --env WORKDIR=$WORKDIR \
    --env SCRAM_ARCH=$SCRAM_ARCH \
    --env MYCMSSW=$MYCMSSW \
    $IMG \
    ./run.sh

rm -Rf $WORKDIR
