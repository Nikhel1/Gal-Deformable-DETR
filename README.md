**Gal-Deformable DETR**
========

## Installation
Create a Python 3.10.9 environement with CUDA 11.6.2 and GCC>=5.4.
Then, install PyTorch 1.5.1 and torchvision 0.6.1:
```
conda install pytorch=1.5.1 torchvision=0.6.1 -c pytorch
```
  
Install packages in requirements.txt.
```
pip install -r requirements.txt
```

### Compiling CUDA operators
```
cd ./models/ops
sh ./make.sh
# unit test (should see all checking is True)
python test.py
```

## Data preparation

Download and extract RadioGalaxyNET data from the link described in the datasheet.
We expect the directory structure to be the following:
```
./RadioGalaxyNET/
  annotations/  # annotation json files
  train/    # train images
  val/      # val images
  test/     # test images
```

## Training

To train on a single node with single gpu run:
```
GPUS_PER_NODE=1 ./tools/run_dist_launch.sh 1 ./configs/r50_deformable_detr.sh
```
To ease reproduction of our results we provide model checkpoint [here](). 
Place the model in `./outputs_gal/` directory.

## Evaluation
To evaluate on test images with a single GPU run:
```
GPUS_PER_NODE=1 ./tools/run_dist_launch.sh 1 ./configs/r50_deformable_detr.sh --eval --resume outputs_gal/checkpoint.pth
```
## License
The License will be updated after publication. Note that the Deformable DETR is released under the Apache 2.0 license.
