python finetune_t5.py \
--data_dir=wiki_pos \
--gpus 1 \
--learning_rate=3e-5 \
--output_dir=t5_large_wiki_pretrained_results \
--num_train_epochs 5 \
--train_batch_size 12 --eval_batch_size 12 \
--max_source_length=120 \
--max_target_length=100 \
--val_max_target_length=100 \
--test_max_target_length=100 \
--eval_max_gen_length=100 \
--model_name_or_path t5-large \
--task rdf2text \
--warmup_steps 2 \
--do_train \
--early_stopping_patience 15 \
--do_predict \
 "$@"

python finetune_t5.py \
--data_dir=pos \
--gpus 1 \
--learning_rate=3e-5 \
--output_dir=t5_large_wiki_final_results \
--num_train_epochs 3 \
--train_batch_size 10 --eval_batch_size 10 \
--max_source_length=150 \
--max_target_length=100 \
--val_max_target_length=100 \
--test_max_target_length=100 \
--eval_max_gen_length=100 \
--model_name_or_path  t5_large_wiki_pretrained_results/best_tfmr \
--task rdf2text \
--do_train \
--early_stopping_patience 15 \
--warmup_steps 2 \
--do_predict \
--eval_beams 3 \
"$@"