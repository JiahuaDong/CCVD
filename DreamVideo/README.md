<div align="center">
  
## Bring Your Dreams to Life: Continual Text-to-Video Customization

---

Official implementation of **[Bring Your Dreams to Life: Continual Text-to-Video Customization](https://arxiv.org/abs/2410.17594)**.
</div>


### **Continual Text-to-Video Customization Task**

<div align="center">
<img src="source/F1.png" width=980>
</div>

### **Our CCVD Framework**

<div align="center">
<img src="source/F2.png" width=980>
</div>

### **Abstract**
Customized text-to-video generation (CTVG) has recently witnessed significant progress in generating tailored videos from user-specific text. However, existing CTVG methods unrealistically assume that personalized concepts remain static and do not expand incrementally over time. Additionally, they struggle with catastrophic forgetting and concept neglect when continuously learning new concepts, including subjects and motions. To resolve the above challenges, we develop a novel Continual Customized Video Diffusion (CCVD) model, which can continuously learn new concepts to generate videos across various text-to-video generation tasks by tackling catastrophic forgetting and concept neglect. Specifically, to address catastrophic forgetting, we introduce a concept-specific attribute retention module and a task-aware concept aggregation strategy. They can capture the unique characteristics and identities of old concepts during training, while combining all subject and motion adapters of old concepts based on their relevance during testing. Furthermore, to tackle concept neglect, we develop a controllable conditional synthesis to enhance regional features and align video contexts with user conditions, by incorporating layer-specific region attention-guided noise estimation. Experimental comparisons demonstrate that our CCVD outperforms existing CTVG models.


## **Examples**

### Concept-incremental learning tasks
<div align="center">
<img src="source/F3.png" width=980>
</div>

### Single-concept customization
<div align="center">
<img src="source/F4.png" width=980>
</div>

### Multi-concept customization
<div align="center">
<img src="source/F5.png" width=980>
</div>

### Custom style transfer
<div align="center">
<img src="source/F6.png" width=980>
</div>

### Custom image editing
<div align="center">
<img src="source/F7.png" width=980>
</div>

## **Dependencies and Installation**

- Linux or macOS with Python ≥ 3.8
- PyTorch ≥ 1.12.0 and [torchvision](https://github.com/pytorch/vision/) that matches the PyTorch installation.
  Install them together at [pytorch.org](https://pytorch.org) to make sure of this.
```shell
conda create -n CCVD python=3.8
conda activate CCVD
pip install torch==1.12.0+cu113 torchvision==0.13.0+cu113 torchaudio==0.12.0 --extra-index-url https://download.pytorch.org/whl/cu113
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
  ```

## CCVD Training and Testing

### Step 1: Pretrained Model and Data Preparation

1.1 The datasets are assumed to exist in a directory specified by the environment variable
`/data/`.

#### Expected dataset structure for all:
```
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
```

1.2  Download the base models ModelScopeT2V V1.5.
```shell
!pip install modelscope
from modelscope.hub.snapshot_download import snapshot_download
model_dir = snapshot_download('iic/dreamvideo-t2v', cache_dir='models/')
```
Then you might need the following command to move the checkpoints to the "models/" directory:
```shell
mv ./models/iic/dreamvideo-t2v/* ./models/
```

### Step 2: Start Training

Please run the following command for training:
```shell
bash train.sh
```


### Step 3: Inference and Evaluation

Please run the following command for inference:
```shell
bash inference.sh
```
The inference results can be found in the `/workspace` directory.

## Acknowledgement

This project is mainly based on DreamVideo. In our experiments, we use the following projects:

[1] **[DreamVideo: Composing Your Dream Videos with Customized Subject and Motion.](https://github.com/ali-vilab/VGen)**

[2] **[How to Continually Adapt Text-to-Image Diffusion Models for Flexible Customization?](https://github.com/JiahuaDong/CIFC)**


## Contact
If you have any questions, you are very welcome to email dongjiahua1995@gmail.com.


## BibTeX
If you find CIDM useful for your research and applications, please cite using this BibTeX:

```BibTeX
@ARTICLE{AAAI2026_CCVDbring,
      title={Bring Your Dreams to Life: Continual Text-to-Video Customization}, 
      author={Jiahua Dong and Xudong Wang and Wenqi Liang and Zongyan Han and Meng Cao and Duzhen Zhang and Hanbin Zhao and Zhi Han and Salman Khan and Fahad Shahbaz Khan},
      year={2025},
      journal={arXiv preprint arXiv:2512.05802}
}