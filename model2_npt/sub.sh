#!/bin/bash
#SBATCH --export=ALL
#SBATCH --job-name=m2
#SBATCH -N 1 -c 2
#SBATCH -p gpu_4090 --gres=gpu:1
#SBATCH -o out -e err

module load cuda/11.8
module load cudnn/8.6.0_cuda11.x
module load anaconda/2020.11
source activate dmff_1.0

export OPENMM_CPU_THREADS=1
export OMP_NUM_THREADS=1

scrdir=/tmp

# clean folder
rm $scrdir/ipi_unix_dmff_*
# rm $scrdir/ipi_unix_eann_*
echo "***** start time *****"
date

# cd  $SLURM_SUBMIT_DIR
# run server
bash run_server.sh &
sleep 30

# check socket
ls -l $scrdir

# run client
# iclient=1
# while [ $iclient -le 4 ];do
#     bash run_EANN.sh &
#     export CUDA_VISIBLE_DEVICES=$((iclient+3))
#     bash run_client_dmff.sh &
#     iclient=$((iclient+1))
#     sleep 1s
# done
bash run_client_dmff.sh & 
wait

echo "***** finish time *****"
date

sleep 1
 


