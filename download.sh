#!/bin/sh

# Install dependency
python3 -m pip install -r requirements.txt
pip install torchshow

# Example commands to downaload from all 1fps images and convert them into hdf5.
# python3 download.py --view "all" --group "all" --split "all" --framerate "[images]" ./shift_dataset/
# python3 -m shift_dev.io.to_hdf5 "./shift_dataset/**/*.zip" --zip -j 4


# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val,]"  --framerate "[images, videos]"   --shift "continuous/100x" ./SHIFT_dataset              
# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val,]"  --framerate "[images, videos]"   --shift "continuous/10x" ./SHIFT_dataset     
# python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[val,]"  --framerate "[images, videos]"   --shift "continuous/1x" ./SHIFT_dataset  



python download.py --view  "[front]"   --group "[img, det_2d]"  --split "[train, val]"  --framerate "[images]"   --shift "discrete" ./SHIFT_dataset      



!unzip ./shift_dataset/discrete/images/val/front/img.zip -d ./shift_dataset/discrete/images/val/front
!tar -xvf ./shift_dataset/discrete/videos/val/front/img.tar tar xf file.tar -C ./shift_dataset/discrete/videos/val/front/
