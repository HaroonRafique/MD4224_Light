#!/bin/bash
#SBATCH --job-name=02_PLT
#SBATCH --output=slurm.%N.%j.out
#SBATCH --error=slurm.%N.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --partition=inf-short
#SBATCH --time=120:00:00
#SBATCH --mem-per-cpu=3200M
#SBATCH --exclusive
#SBATCH --hint=nomultithread

BATCH_ROOT_DIR=/hpcscratch/user/harafiqu
RUN_DIR=/hpcscratch/user/harafiqu/MD4224_Light/02_Mini_Simulation_Scan
OrigIwd=$(pwd)

# Make an output folder in the root directory to hold SLURM info file
cd ${BATCH_ROOT_DIR}
output_dir="output"
mkdir -p $output_dir

# Fill the SLURM info file
simulation_info_file="${BATCH_ROOT_DIR}/${output_dir}/simulation_info_${SLURM_JOB_ID}.${SLURM_NODEID}.${SLURM_PROCID}.txt"
echo "PyOrbit path:  `readlink -f ${ORBIT_ROOT}`" >> ${simulation_info_file}
echo "Run path:  `readlink -f ${RUN_DIR}`" >> ${simulation_info_file}
echo "Submit host:  `readlink -f ${SLURM_SUBMIT_HOST}`" >> ${simulation_info_file}
echo "SLURM Job name:  `readlink -f ${SLURM_JOB_NAME}`" >> ${simulation_info_file}
echo "SLURM Job ID:  `readlink -f ${SLURM_JOB_ID}`" >> ${simulation_info_file}
echo "SLURM Nodes allocated:  `readlink -f ${SLURM_JOB_NUM_NODES}`" >> ${simulation_info_file}
echo "SLURM CPUS per Node:  `readlink -f ${SLURM_CPUS_ON_NODE}`" >> ${simulation_info_file}
echo "SLURM Node ID:  `readlink -f ${SLURM_NODEID}`" >> ${simulation_info_file}
echo "SLURM total cores for job:  `readlink -f ${SLURM_NTASKS}`" >> ${simulation_info_file}
echo "SLURM process ID:  `readlink -f ${SLURM_PROCID}`" >> ${simulation_info_file}
echo "****************************************" >> ${simulation_info_file}

# Enter job directory, clean it, and setup environment -> SLURM info file
cd ${RUN_DIR}
. setup_environment.sh

# Load correct MPI
module load mpi/mvapich2/2.3

tstart=$(date +%s)

# Run the jobs
srun --exclusive -n 1 ./1_H_07/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_08/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_09/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_10/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_11/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_12/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_13/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_14/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_15/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_16/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_17/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_18/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_19/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_20/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_H_21/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_10/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_11/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_12/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_13/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_14/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_15/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_16/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_17/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_18/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_19/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_20/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_21/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_22/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_23/Plot_Tune_and_Distn_Footprints.py &
srun --exclusive -n 1 ./1_V_24/Plot_Tune_and_Distn_Footprints.py &
wait

tend=$(date +%s)
dt=$(($tend - $tstart))
echo "total simulation time (s): " $dt >> ${simulation_info_file}
