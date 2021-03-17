#!/bin/bash

# Dawn
# test_list=( \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-07-52-31.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-07-43-30.bag"
# )

# Noon
# test_list=( \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-12-59-16.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-12-40-29.bag"
# )

# Evening
# test_list=( \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-17-38-14.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-17-25-06.bag"
# )

# Global consistent
test_list=( \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-07-52-31.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-09-20-13.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-10-23-11.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-11-48-03.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-12-59-16.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-14-34-43.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-16-05-54.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170303/thomas_2017-03-03-17-38-14.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-07-43-30.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-09-06-04.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-10-19-45.bag" \
"/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-12-40-29.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-14-35-16.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-16-28-26.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-17-25-06.bag" \
"/mnt/DataBlock/thomas/YQ/vision_exp/20170307/thomas_2017-03-07-18-07-21.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170309/thomas_2017-03-09-09-06-05.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170309/thomas_2017-03-09-10-03-57.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170309/thomas_2017-03-09-11-25-40.bag" \
# "/mnt/DataBlock/thomas/YQ/vision_exp/20170309/thomas_2017-03-09-15-06-14.bag" \
 #"/mnt/DataBlock/thomas/YQ/vision_exp/20170309/thomas_2017-03-09-16-31-34.bag" \
)

rosrun stereo_localiser orbslam.sh &
while [ -n `rosservice list | grep localization_mode` ]; do
    echo 'Waiting for ORB_SLAM ready...'
    sleep 1
  done

first=true
for test in ${test_list[@]}; do

  roslaunch zed_wrapper zed_raw.launch need_split:=false bag_file:=$test

  # rosservice call /localization_mode/active
  # roslaunch zed_wrapper zed_raw.launch need_split:=false bag_file:=$test &
  # sleep 1
  # rosnode kill /player
  # rosservice call /localization_mode/deactive
done

rosnode kill /RGBD
