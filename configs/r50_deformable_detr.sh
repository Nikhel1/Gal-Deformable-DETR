#!/usr/bin/env bash

set -x

#EXP_DIR=exps/r50_deformable_detr
PY_ARGS=${@:1}

python -u main.py \
    ${PY_ARGS}
