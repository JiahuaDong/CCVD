<div align="center">
  
## Bring Your Dreams to Life: Continual Text-to-Video Customization
---

Official implementation of **[Bring Your Dreams to Life: Continual Text-to-Video Customization](https://arxiv.org/abs/2512.05802)**.


Jiahua Dong, Xudong Wang, Wenqi Liang, Zongyan Han, Meng Cao, Duzhen Zhang, 

Hanbin Zhao, Zhi Han, Salman Khan, Fahad Shahbaz Khan

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


## Multi-concept Results

### · DreamVideo Baseline

<video src="https://github.com/user-attachments/assets/dc00b864-4b41-4f12-8a70-4422fa207952"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/bc10b5ab-6809-48bd-a810-4afa34ca1c94"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/d3847abc-8c4b-4b05-9ed1-dbff214a489f"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/055ed5d3-bb4f-4d00-8cc1-acb32ffef15a"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/3c557440-690d-4904-811f-3086bcf02f4a"  width="30%" controls muted loop></video> 

### · Wan Baseline

|        | Base: The desert with blue sky in the background. Region: V2 cat and V20 dog walking in the desert   | Base: A river with flowers and plants on its banks. Region: V16 duck toy and V10 dog playing on the river.| Base: A street with buildings. Region: V10 dog and V28 bear toy and V2 cat walking in the street. |
|--------|-------------------------------------------------------|-------------------------------------------------------|-------------------------------------------------------|
| Ours   | <video src="https://github.com/user-attachments/assets/70385b77-d51f-4b83-82de-31d4292b6e6a"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/fa33c6f0-ece2-4e50-9262-19edba153791"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/11351300-c091-4c7c-973e-020b694e629e"  width="30%" controls muted loop></video> |
| L2DM  | <video src="https://github.com/user-attachments/assets/cddc7f6e-9c18-475d-928b-d676af46b9d7" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/640ddf08-1b50-4bc3-a13a-521515b811df" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/b2f73494-9916-4b76-be84-8f39e26c6623" width="30%" controls muted loop></video> |
| CLoRA | <video src="https://github.com/user-attachments/assets/ae2e8079-b76d-4fa0-9848-6b9c7715c50c" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/373b3159-0141-4ce6-8a92-dc4da97344e2" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/7911f2ae-2e0d-49a6-a846-bb94ce24242b" width="30%" controls muted loop></video> |
| LoRA-M   | <video src="https://github.com/user-attachments/assets/d6e639e0-0115-4bbd-b0e5-3329d6813243"  width="260" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/81dd40eb-e8f8-468f-8692-2958de719efe"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/cffe7f5e-8a12-4032-ac04-e58c7d2f936d"  width="260" controls muted loop></video>|


## Single-concept Results

### · DreamVideo Baseline

<video src="https://github.com/user-attachments/assets/5e22f6a2-d4b7-4ba7-a74c-472ef76bc58f"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/fadb9c6c-f156-4ddb-814b-d1a0c23838f3"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/c613b0be-4e4b-41e5-8f4c-646a0e1e5a24"  width="30%" controls muted loop></video> 

### · Wan Baseline

|        |V30 man wearing a chef's hat, cutting vegetables in the kitchen. | V1 dog running on the park lawn. | V2 cat wearing sunglasses lying on a beach chair on a sunset beach. |
|--------|-----------|-----------|-----------|
| Ours   | <video src="https://github.com/user-attachments/assets/d25bc75f-8f40-4f5a-a8f7-83db3f522b78"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/73793b7a-ea5d-4b53-86bf-684171d85148"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/705ac4bb-7349-475d-956d-344511c61dd5"  width="30%" controls muted loop></video> |
| L2DM  | <video src="https://github.com/user-attachments/assets/f372207c-15fc-4138-af88-c5ff023e8ba3" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/032bf640-42fb-4616-b441-868378fa0721" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/3386e230-1138-42be-b270-1f197a3fa7c5" width="30%" controls muted loop></video> |
| CLoRA | <video src="https://github.com/user-attachments/assets/c1e2ebbf-9e63-460a-9ca5-f0bd5a02ad9a" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/03788ef9-8aac-4a09-bd02-71a989277cd7" width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/c0c0b3e9-cfe5-47cd-8392-f4a0c5589aa9" width="30%" controls muted loop></video> |
| LoRA-M  | <video src="https://github.com/user-attachments/assets/4286f3c4-6136-4da5-a616-2726ac221e7d"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/eaa1836b-29d7-429c-9e28-e760a8841faf"  width="30%" controls muted loop></video> | <video src="https://github.com/user-attachments/assets/2295aea3-b794-4c95-bed2-b01b837eca3c"  width="30%" controls muted loop></video> |

## Style Transfer

<video src="https://github.com/user-attachments/assets/5103626c-f34c-4c1b-bec7-c8b9942191a1"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/0bf65060-7450-4d07-a054-333cfa9339c6"  width="30%" controls muted loop></video> 
<video src="https://github.com/user-attachments/assets/3e7fdc2d-1907-411a-a5d4-a9536723f63c"  width="30%" controls muted loop></video> 

## Video Editing

<video src="https://github.com/user-attachments/assets/eff75b43-1a47-4a1e-bc83-c991e7e844bf"  width="30%" controls muted loop></video> 

## Implementation

· If you wish to build upon the DreamVideo baseline model, please refer to **[DreamVideo](https://github.com/JiahuaDong/CCVD/tree/main/DreamVideo)**.

· If you wish to build upon the Wan baseline model, please refer to **[Wan](https://github.com/JiahuaDong/CCVD/tree/main/Wan-1.3)**.

## Acknowledgement

This project is mainly based on DreamVideo and Wan. In our experiments, we use the following projects:

[1] **[DreamVideo: Composing Your Dream Videos with Customized Subject and Motion.](https://github.com/ali-vilab/VGen)**

[2] **[Wan: Open and Advanced Large-Scale Video Generative Models.](https://github.com/Wan-Video/Wan2.1)**

[3] **[How to Continually Adapt Text-to-Image Diffusion Models for Flexible Customization?](https://github.com/JiahuaDong/CIFC)**


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
