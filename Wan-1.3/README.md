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

<div align="center">
  <video src="video/1_multi_l2dm.mp4" width="70%" poster=""> </video>
</div>


## **Examples**

## Multi-object Results

|        | Example 1 (Desert)                                    | Example 2 (River)                                     | Example 3 (Street)                                    |
|--------|-------------------------------------------------------|-------------------------------------------------------|-------------------------------------------------------|
| L2DM   | <video src="video/1_multi_l2dm.mp4"  width="260" controls muted loop></video> | <video src="video/2_multi_l2dm.mp4"  width="260" controls muted loop></video> | <video src="video/3_multi_l2dm.mp4.mp4"  width="260" controls muted loop></video> |
| CLoRA  | <video src="./1_multi_clora.mp4" width="260" controls muted loop></video> | <video src="./2_multi_clora.mp4" width="260" controls muted loop></video> | <video src="./3_multi_clora.mp4" width="260" controls muted loop></video> |
| LoRA-M | <video src="./1_multi_lora_m.mp4" width="260" controls muted loop></video> | <video src="./2_multi_lora_m.mp4" width="260" controls muted loop></video> | <video src="./3_multi_lora_m.mp4" width="260" controls muted loop></video> |
| Ours   | <video src="./1_multi_ours.mp4"  width="260" controls muted loop></video><br><sub>Base: The desert with blue sky in the background. Region: V2 cat \| V20 dog walking in the desert</sub> | <video src="./2_multi_ours.mp4"  width="260" controls muted loop></video><br><sub>Base: A river with flowers and plants on its banks. Region: V16 duck toy and V10 dog playing on the river</sub> | <video src="./3_multi_ours.mp4"  width="260" controls muted loop></video><br><sub>Base: A street with buildings. Region: V10 dog \| V28 bear toy \| V2 cat walking in the street</sub> |


## Single-object Results

|        | Example 1 | Example 2 | Example 3 |
|--------|-----------|-----------|-----------|
| L2DM   | <video src="./1_single_l2dm.mp4"  width="260" controls muted loop></video> | <video src="./2_single_l2dm.mp4"  width="260" controls muted loop></video> | <video src="./3_single_l2dm.mp4"  width="260" controls muted loop></video> |
| CLoRA  | <video src="./1_single_clora.mp4" width="260" controls muted loop></video> | <video src="./2_single_clora.mp4" width="260" controls muted loop></video> | <video src="./3_single_clora.mp4" width="260" controls muted loop></video> |
| LoRA-M | <video src="./1_single_lora_m.mp4" width="260" controls muted loop></video> | <video src="./2_single_lora_m.mp4" width="260" controls muted loop></video> | <video src="./3_single_lora_m.mp4" width="260" controls muted loop></video> |
| Ours   | <video src="./1_single_ours.mp4"  width="260" controls muted loop></video> | <video src="./2_single_ours.mp4"  width="260" controls muted loop></video> | <video src="./3_single_ours.mp4"  width="260" controls muted loop></video> |


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
