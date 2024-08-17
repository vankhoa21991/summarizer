from pathlib import Path

BASE_DIR = Path(__file__).parent.parent.absolute()

INFERENCE_CONFIG_PATH = Path(BASE_DIR, "configs/inference_config.yaml")

# HuggingFace Model ID
HUGGINGFACE_MODEL_ID = "facebook/bart-large-cnn"

# Model dir
MODEL_DIR = Path(BASE_DIR, "model")
