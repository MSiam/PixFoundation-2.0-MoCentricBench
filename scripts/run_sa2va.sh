DATATYPE=$1
DATA=$2
OUT=$3
CKPT=$4
FLIP=$5

# Using Sa2VA pipeline as is 
export PYTHONPATH=$PWD/../Sa2VA/:$PYTHONPATH

ARGS="${CKPT} --dataset ${DATATYPE} --dataset_root ${DATA} --work_dir ${OUT}"

if [ $FLIP == "True" ]
then
    ARGS="$ARGS --flip"
fi

python ../../infer/refVOS/infer_sa2va.py ${ARGS}
