# YQ5 
## Overview
This is a **long-term visual localization dataset** collected in campus environment. The five trajectories are collected in summer and winter in 2017-08-23, 2017-08-24, 2017-08-28 and 2018-01-29,in which the trajectory of 2017-08-24 is opposite to the other four trajectories. All data is available in Rosbag format that can be visualized, modified and applied using the open source Robot Operating System (ROS). Each Rosbag file contains synchronized data from the following sensors:
* Velodyne VLP-16 Lidar
* A pair of Point grey cameras
* MTi-100 IMU

You can download the dataset [here](https://pan.baidu.com/s/1KXRSEvJBoRsVfYQJjHc8ig) with passward `d43p`. 

Notice that there are another 21 sessions of data collected in spring in 2017-03-03, 2017-03-07 and 2017-03-09 along almost the same trajectory, which we used to build the map in our work to test the long term visual localization. The camera used in the dataset is a ZED stereo camera. You can find the data [here](https://tangli.site/projects/academic/yq21/).

## Usage
Since the original bag exceeds the 4G upload limit, we compress and split each of the bag into several smaller files. You can first merge the files of each directory using
```
cat thomas_2017-08-28-17-06-06.bag.tar.gz.* > thomas_2017-08-28-17-06-06.bag.tar.gz
```
Then uncompress the file into the original bag.

You can download this project into your ROS workspace and build it with ```catkin_make```. Specify the directory of the bag in ```launch/raw_transport.launch```. Then you can run the following command to play the bag
```
roslaunch YQ5 raw_transport.launch
```
You can find the intrinsic of the cameras in ```script/pointgreyleft.yaml``` and ```script/pointgreyright.yaml```. The extrinsics of camera-lidar and camera-IMU are in ```script/extrinsic_lidar_camera.txt``` and ```script/extrinsic_camera_imu.txt```.


## Reference
This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/) and is intended for non-commercial academic use. If you want to use this dataset in your publications please cite either of the following paper:

    @article{ding2019persistent,
      title={Persistent Stereo Visual Localization on Cross-Modal Invariant Map},
      author={Ding, Xiaqing and Wang, Yue and Xiong, Rong and Li, Dongxuan and Tang, Li and Yin, Huan and Zhao, Liang},
      journal={IEEE Transactions on Intelligent Transportation Systems},
      year={2019},
      publisher={IEEE}
    }
    
    @inproceedings{ding2018laser,
      title={Laser map aided visual inertial localization in changing environment},
      author={Ding, Xiaqing and Wang, Yue and Li, Dongxuan and Tang, Li and Yin, Huan and Xiong, Rong},
      booktitle={2018 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)},
      pages={4794--4801},
      year={2018},
      organization={IEEE}
    }
