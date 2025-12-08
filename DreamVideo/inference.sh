PYTHONUNBUFFERED=1; export CUDA_VISIBLE_DEVICES=5

accelerate launch inference.py --cfg configs/dreamvideo/infer/task_11.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_13.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_16.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_19.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_23.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_26.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_30.yaml
accelerate launch inference.py --cfg configs/dreamvideo/infer/task_33.yaml