DATA=$1
PREDDIR=$2
TILE=$3
SINGLE=$4
REVERSE=$5
KEYFRAMESFILE=$6
STATICEXP=$7
UPFLAG=$8

ARGS="--mevis_mask_path ${DATA}/valid_u/mask_dict.json --mevis_pred_path ${PREDDIR} --save_name ${PREDDIR}/results.json --num_workers 4 --frames_selection_file ${KEYFRAMESFILE}"

if [ $TILE == "True" ]
then
    ARGS="$ARGS --tile_flag"
fi

if [ $SINGLE == "True" ]
then
    ARGS="$ARGS --single_frame_flag"
fi

if [ $REVERSE == "True" ]
then
    ARGS="$ARGS --reverse_flag --mevis_exp_path ${DATA}/valid_u/meta_expressions_reverse_filtered.json"
else
    ARGS="$ARGS --mevis_exp_path ${DATA}/valid_u/meta_expressions.json"

fi

if [ $STATICEXP == "True" ]
then
    ARGS="$ARGS --filterout_static_exprs"
fi

if [ $UPFLAG == "True" ]
then
    ARGS="$ARGS --up_flag"
fi

python ../../eval/eval_mevis_variants.py $ARGS
