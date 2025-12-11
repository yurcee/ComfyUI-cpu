#!/bin/bash
python3 -m venv venv
source venv/bin/activate
pip3 install torch==2.4.1+cpu torchvision==0.19.1+cpu torchaudio==2.4.1+cpu --index-url https://download.pytorch.org/whl/cpu
pip3 install -r requirements.txt
cd custom_nodes || exit
git clone https://github.com/yurcee/ComfyUI-Manager.git
python3 main.py --cpu --cpu-vae
