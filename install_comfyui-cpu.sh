#!/bin/bash
set -e

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing PyTorch CPU-only..."
pip install torch==2.4.1+cpu torchvision==0.19.1+cpu torchaudio==2.4.1+cpu --index-url https://download.pytorch.org/whl/cpu

echo "Installing requirements..."
pip install -r requirements.txt

echo "Installing ComfyUI-Manager..."
cd custom_nodes
git clone https://github.com/yurcee/ComfyUI-Manager.git
cd ..

echo ""
echo "✓ Installation complete!"
echo "✓ Run with: ./start_comfyui-cpu.sh"
