set -ex


# PROMPT_TYPE="deepseek-math"
PROMPT_TYPE="qwen25-math-cot"

export CUDA_VISIBLE_DEVICES="0"
MODEL_NAME_OR_PATH="Qwen/Qwen3-8B"
OUTPUT_DIR=${MODEL_NAME_OR_PATH}/math_eval

SPLIT="test"
NUM_TEST_SAMPLE=-1


# English open datasets
DATA_NAME="gaokao2023en"
# # DATA_NAME="gsm8k,math,olympiadbench,gaokao2023en,amc23,aime24,aime25"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval_ours.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --check_model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 42 \
    --temperature 0.6 \
    --n_sampling 1 \
    --max_tokens_per_call 8192 \
    --top_p 0.95 \
    --start 0 \
    --end -1 \
    --use_vllm \
    --save_outputs \
    --overwrite \
