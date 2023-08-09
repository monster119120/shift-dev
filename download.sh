#!/bin/sh

# Install dependency
python3 -m pip install -r requirements.txt
# pip install torchshow

# Example commands to downaload from all 1fps images and convert them into hdf5.
# python3 download.py --view "all" --group "all" --split "all" --framerate "[images]" ./shift_dataset/
# python3 -m shift_dev.io.to_hdf5 "./shift_dataset/**/*.zip" --zip -j 4


# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[train,val]"  --framerate "[images]"   --shift "discrete" ./SHIFT_dataset      
# unzip ./SHIFT_dataset/discrete/images/val/front/img.zip -d ./SHIFT_dataset/discrete/images/val/front
# unzip ./SHIFT_dataset/discrete/images/train/front/img.zip -d ./SHIFT_dataset/discrete/images/train/front



# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val]"  --framerate "[images]"   --shift "continuous/100x" ./SHIFT_dataset              
# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val]"  --framerate "[images]"   --shift "continuous/10x" ./SHIFT_dataset     
# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val]"  --framerate "[images]"   --shift "continuous/1x" ./SHIFT_dataset  
# unzip ./SHIFT_dataset/continuous/images/100x/val/front/img.zip -d ./SHIFT_dataset/continuous/images/100x/val/front/
# unzip ./SHIFT_dataset/continuous/images/10x/val/front/img.zip -d ./SHIFT_dataset/continuous/images/10x/val/front/
# unzip ./SHIFT_dataset/continuous/images/1x/val/front/img.zip -d ./SHIFT_dataset/continuous/images/1x/val/front/



python download.py --view  "[front]"   --group "[img, det_2d, det_insseg_2d]"  --split "[train, val]"  --framerate "[images]"   --shift "continuous/1x" ./SHIFT_dataset  
unzip ./SHIFT_dataset/continuous/images/1x/val/front/img.zip -d ./SHIFT_dataset/continuous/images/1x/val/front/
unzip ./SHIFT_dataset/continuous/images/1x/train/front/img.zip -d ./SHIFT_dataset/continuous/images/1x/train/front/

python -m shift_dev.io.decompress_videos "SHIFT_dataset/continuous/videos/1x/val/front/*.tar" -m "folder" -j 1
