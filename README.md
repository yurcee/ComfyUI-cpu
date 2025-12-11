# ComfyUI-CPU

A lightweight, CPU-only fork of ComfyUI. Optimized for devices without a GPU: older laptops, servers, virtual machines, and low-power systems.

Includes a compatible, frozen-state version of **ComfyUI Manager** and supports SD1.5 LCM for fast 3-step generation.

---

## Features

* CPU-only execution (no CUDA, no GPU dependencies)
* Works on Linux, macOS, and Windows via Git Bash
* Includes an older, stable ComfyUI-Manager version optimized for this fork
* Simple installation script (`install_comfyui-cpu.sh`)
* Supports SD1.5 LCM models for fast inference on CPU hardware

---

## Quick Install (Linux + macOS)

Clone the repo:

```bash
git clone https://github.com/yurcee/ComfyUI-cpu.git
cd ComfyUI-cpu
```

Run the installer:

```bash
./install_comfyui-cpu.sh
```

Start ComfyUI:

```bash
./start_comfyui-cpu.sh
```

ComfyUI will launch a browser window at:

```
http://localhost:8188
```

---

## Manual Installation

### 1. Clone the repository

```bash
git clone https://github.com/yurcee/ComfyUI-cpu.git
cd ComfyUI-cpu
```

### 2. Add your models

Recommended SD1.5 LCM setup (fastest on CPU):

* **LCM SD1.5 Model (2.1 GB)**
  [https://huggingface.co/latent-consistency/lcm-sdv1-5](https://huggingface.co/latent-consistency/lcm-sdv1-5)
  Save to: `models/checkpoints/`

* **LCM LoRA (135 MB)**
  [https://huggingface.co/latent-consistency/lcm-lora-sdv1-5](https://huggingface.co/latent-consistency/lcm-lora-sdv1-5)
  Save to: `models/loras/`

* **Workflow SD1.5-LCM.json** (Downloaded with the repo.)
  Direct link for perusal:
  [https://github.com/yurcee/ComfyUI-cpu/blob/master/Workflow-SD15-LCM.json](https://github.com/yurcee/ComfyUI-cpu/blob/master/Workflow-SD15-LCM.json)
  Load inside ComfyUI via:
  **Menu → Load → Load Workflow**

Optional bundle containing all of the above:
[https://ko-fi.com/s/c66251b736](https://ko-fi.com/s/c66251b736)

> Tip: For faster CPU generation, you may swap `sgm-uniform` for the `lcm` scheduler in your workflow.

### 3. Create a virtual environment

```bash
python3 -m venv venv
```

### 4. Install PyTorch (CPU-Only)

```bash
pip install torch==2.4.1+cpu torchvision==0.19.1+cpu torchaudio==2.4.1+cpu \
  --index-url https://download.pytorch.org/whl/cpu
```

### 5. Install other dependencies

```bash
pip install -r requirements.txt
```

### 6. Run ComfyUI

```bash
python3 main.py --cpu --cpu-vae --auto-launch
```

---

## Windows Installation (Git Bash)

Windows requires Git Bash to run the installer.

1. Install Git for Windows:
   [https://gitforwindows.org/](https://gitforwindows.org/)

2. Open *Git Bash*

3. Run the same commands as Linux/macOS:

```bash
git clone https://github.com/yurcee/ComfyUI-cpu.git
cd ComfyUI-cpu
./install_comfyui-cpu.sh
./start_comfyui-cpu.sh
```

---

## Workflow & Prompts

To use the included SD1.5 LCM workflow:

* Load the JSON workflow via **Menu → Load**
* Edit:

  * Positive prompt = what you want (e.g., "vintage car on a mountain road")
  * Negative prompt = what to avoid (e.g., "blurry, distorted, watermark")
* Press **Queue Prompt** to generate

---

## Keyboard Shortcuts

| Keybind              | Description           |
| -------------------- | --------------------- |
| Ctrl + Enter         | Queue current graph   |
| Ctrl + Shift + Enter | Queue as first        |
| Ctrl + Alt + Enter   | Cancel generation     |
| Ctrl + S             | Save workflow         |
| Ctrl + O             | Load workflow         |
| Ctrl + Z/Y           | Undo/Redo             |
| Delete               | Remove selected nodes |
| Ctrl + A             | Select all nodes      |
| Double-Click         | Node search palette   |
| Q                    | Toggle queue          |
| H                    | Toggle history        |
| R                    | Refresh graph         |

---

## Docker Image (Ardenius)

```bash
docker pull ardenius/comfyui-cpu
```
