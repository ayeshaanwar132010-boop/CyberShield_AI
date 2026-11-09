# Image authenticity model training

This project now includes a reproducible EfficientNet-B0 transfer-learning pipeline.
**The model has not been trained yet** because no labeled image dataset was supplied
or bundled. Do not interpret the presence of this script as a trained detector.

## Dataset layout
Create:
- `data/image-authenticity/train/ai/`
- `data/image-authenticity/train/real/`
- `data/image-authenticity/val/ai/`
- `data/image-authenticity/val/real/`

Put AI-generated images only in `ai`, and camera-origin images in `real`.
Use images you have permission to use. Prefer many generators, cameras, scenes,
resolutions and compression conditions. Keep classes balanced. Split by source,
creator or capture session so near-duplicates do not appear in both train and val.
A small dataset is only a prototype; thousands to tens of thousands per class
from diverse sources are a better starting point, and independent test data is
still necessary.

## Train on Windows
Run `TRAIN-IMAGE-MODEL-WINDOWS.bat`, add the dataset, then:
`python training\train_image_authenticity.py --epochs 8 --batch-size 16`

The first run downloads pretrained EfficientNet weights. The output is
`models/image_authenticity.pt`. A GPU is helpful; CPU training can be slow.

## Important limitations
AI-image detection is an adversarial, changing problem. Cropping, resizing,
screenshots, compression and new image generators can reduce accuracy.
Validation accuracy is not a probability that an individual image is AI.
Do not use this model alone for moderation, accusations, identity checks,
legal decisions or other high-stakes decisions. Always show uncertainty and
allow human review.
