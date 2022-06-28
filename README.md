<h1 align="center"> SHIFT Dataset DevKit </h1>

This repo contains tools and scripts for [SHIFT Dataset](https://www.vis.xyz/shift/)'s downloading, conversion, and more!

<div align="center">
<div></div>

| **RGB**          |    **Optical Flow**    | **Depth**   | **LiDAR** |
|:----------------:|:----------------:|:----------------:|:---------:|
|  <img src="assert/figures/img.png">                |       <img src="assert/figures/flow.png">     |   <img src="assert/figures/depth.png">                       |   <img src="assert/figures/lidar.png" >         |
|   **Bounding box** | **Instance Segm.** | **Semantic Segm.**  | **Body Pose (soon)**  |
|   <img src="assert/figures/bbox2d.png">                 |     <img src="assert/figures/ins.png">            |         <img src="assert/figures/seg.png">           |       <img src="assert/figures/pose.png">      |

</div>

## News

- **[June 2020]** We released the DevKit repo!

## Data downloading
We recommend to download SHIFT using our Python download script. You can select the subset of views, data group, splits and framerates of the data to download. A usage example is shown below. You can find the abbreviation for views and data groups in the following tables.

```bash
python download.py --view  "[front, left_stereo]" \    # list of view abbreviation to download
                   --group "[img, semseg]" \          # list of data group abbreviation to download 
                   --split "[train, val, test]" \     # list of splits to download 
                   --framerate "[images, videos]" \   # chooses the desired frame rate (images=1fps, videos=10fps)
                   dataset_root                       # path where to store the downloaded data
```

## Tools
### Pack zip file into HDF5
Instead of unzipping the the downloaded zip files, you can also can convert them into corresponding [HDF5](https://en.wikipedia.org/wiki/Hierarchical_Data_Format) files. HDF5 file is designed to store a large of dataset in a single file and, meanwhile, to support efficient I/O for training purpose. Converting to HDF5 is a good practice in an environment where the number of files that can be stored are limited.
```bash
python -m shift_dev.io.to_hdf5 \
    "path/to/dataset/discrete/images/val/left_45/*.zip" -j 1
```
Note: The converted HDF5 file will maintain the same file structure of the zip file, i.e., `<seq>/<frame>_<group>_<view>.<ext>`.

Below is a code snippet for reading one image from a HDF5 file.
```python
import io
import h5py
import numpy as np
from PIL import Image

file_key = "0123-abcd/00000001_img_front.jpg"
with h5py.File("/path/to/file.hdf5", "r") as hdf5:      # load the HDF5 file
    data = np.array(hdf5[file_key])                     # select the file we want
    img = Image.open(io.BytesIO(data))                  # same as opening an ordinary png file.
```
### Visualization

We provide a visualization tool for object-level labels (e.g., bounding box, instance segmentation). The main rendering functions are provided in `shift_dev/vis/render.py` file. We believe you can reuse many of them for other kinds of visualization. 

We also provide a tool to make video with annotations:
```bash
python -m shift_dev.vis.video <seq_id> \
    -d <path/to/img.zip> \
    -l <path/to/label.json> \
    -o <path/for/output> \
    --view front
```
This command will render an MP4 video with the bounding boxes or instance masks plotted over the background images. Checkout the example of visualization [here](https://www.youtube.com/watch?v=BsqGrDd2Kzw) (starting from 00:10)!



## Coordinate systems
<p align="center"> 
  <img src="assert/figures/coor_sys.png" alt="Coordinate systems" width="100%">
</p>





Copyright © 2022, [Tao Sun](https://suniique.com) ([@suniique](https://github.com/suniique)), [ETH VIS Group](https://cv.ethz.ch/).