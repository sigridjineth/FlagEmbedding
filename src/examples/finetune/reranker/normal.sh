torchrun --nproc_per_node 8 \
-m src.finetune.reranker.encoder_only.base \
--output_dir ./test \
--model_name_or_path BAAI/bge-reranker-base \
--train_data /share/chaofan/dataset/mteb_data_new_score/en/fiqa.jsonl \
--cache_dir /share/shared_models \
--learning_rate 6e-5 \
--fp16 \
--num_train_epochs 1 \
--per_device_train_batch_size 16 \
--gradient_accumulation_steps 4 \
--dataloader_drop_last True \
--train_group_size 16 \
--query_max_len 256 \
--passage_max_len 256 \
--weight_decay 0.01 \
--logging_steps 10 \
--gradient_checkpointing \
--cache_path ./data \
--deepspeed /share/chaofan/code/stage/stage1.json