<div align="center">
  
## Bring Your Dreams to Life: Continual Text-to-Video Customization (Wan)
---

Official implementation of **[Bring Your Dreams to Life: Continual Text-to-Video Customization](https://arxiv.org/abs/2512.05802)**.

</div>

## **Dependencies and Installation**

### Ensure torch >= 2.4.0
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple


## CCVD Wan-1.3 Training and Testing


### Step 1: Pretrained Model and Data Preparation

### 1.1 Dataset Layout

We assume datasets are mounted under `/data/`:

```bash
/data/
+-- custom/
|   +-- infer
|   |   +-- task_1.txt
|   |   +-- task_2.txt
|   |   ...
|   |   
|   +-- preview
|   |   +-- V1.txt
|   |   +-- V2.txt
|   |   ...
|   |   
|   +-- Train
|   |   +-- V1.txt
|   |   +-- V2.txt
|   |   ...
|
+-- images/
|   +-- custom/
|   |   +-- V1/00.jpg ...
|   |   +-- V2/00.jpg ...
|   |   ...
|
+-- videos/
|   |   +-- V3/01.avi ...
|   |   +-- V8/01.avi ...
|   |   ...
````


### 1.2 Download Wan-1.3 Base Model

We use **Wan2.1-T2V-1.3B** as the base checkpoint. 

Create a `models/` directory in your project root:

```bash
mkdir -p models
```

#### Download via `huggingface-cli`

```bash
pip install "huggingface_hub[cli]"

huggingface-cli download Wan-AI/Wan2.1-T2V-1.3B \
  --local-dir ./models/Wan2.1-T2V-1.3B
```


### Step 2: Start Training

Once the dataset and base model are ready and the repo dependencies are installed (e.g. `pip install -r requirements.txt`, `torch>=2.4` ([Hugging Face][1])), start fine-tuning:

```bash
bash train.sh
```

Typical behavior of `train.sh` (you can adapt to your project):

* Reads a config file (e.g. `configs/wan_1_3.yaml`) that specifies:

  * Path to base model (e.g. `./models/Wan2.1-T2V-1.3B`)
  * Dataset root (e.g. `/data/custom/Train`)
  * Training hyperparameters (lr, batch size, max steps, etc.)
* Saves fine-tuned checkpoints under something like:

  * `./outputs/wan_1_3/checkpoints/`

Please modify `train.sh` and the config file paths to match your own environment and naming.


### Step 3: Inference and Evaluation

After training completes, run inference with:

```bash
bash inference.sh
```
The inference results can be found in the `/workspace` directory.


## BibTeX
If you find CIDM useful for your research and applications, please cite using this BibTeX:

```BibTeX
@inproceedings{AAAI2026_CCVD_Bring, 
title={Bring Your Dreams to Life: Continual Text-to-Video Customization}, 
author={Jiahua Dong and Xudong Wang and Wenqi Liang and Zongyan Han and Meng Cao and Duzhen Zhang and Hanbin Zhao and Zhi Han and Salman Khan and Fahad Shahbaz Khan},
booktitle={Proceedings of the AAAI Conference on Artificial Intelligence},
year={2025}
}
