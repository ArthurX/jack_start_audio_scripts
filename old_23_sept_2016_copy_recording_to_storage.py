#!/usr/bin/python -tt

# Small script to copy audio recording files made with non-timeline to a new date named directory and create a new empty setup to start. You can change the recorded file size limit.
# You need to create the working and preset directories before.
# I use rename() because that is way quicker than really copying.

import sys
import re
import os
import shutil
import commands
import datetime


# 1  Copy existing recording to storage directory named after date
###################################################################

def rename_recording(work_dir, store_dir):
  

  today = datetime.date.today()
  old = work_dir
  new = os.path.join(store_dir, str(today.year), str(today.month), str(today.day))
  print new, old
  os.renames(old, new)



# 2   Rename a clean preset_temp to working directory
#########################################################

def rename_preset_temp_working_dir(preset_temp_dir, work_dir):
  
  old = preset_temp_dir
  new = work_dir
  print new, old
  os.renames(old, new)  


# 3   Creat new preset_temp directory
##############################################################

def create_new_preset_temp_dir(preset_temp_dir,preset_dir):

  shutil.copytree(preset_dir, preset_temp_dir)



#  4  Get work dir size
###############################################################

def get_work_dir_size(work_dir):


  total_work_size = 0
  filenames = os.listdir((os.path.join(work_dir, 'sources')))
  for filename in filenames:
    print filename  ## foo.txt
    print os.path.getsize(os.path.join(work_dir, 'sources', filename))
    total_work_size += os.path.getsize(os.path.join(work_dir, 'sources', filename))
    print total_work_size 

  return total_work_size 



  





def main():
  base_dir = "/home/arthurx/Audio_Rec_2016"

  work_dir  = "/home/arthurx/Audio_Rec_2016/work_dir"
  store_dir = "/home/arthurx/Audio_Rec_2016"
  preset_dir = "/home/arthurx/Audio_Rec_2016/preset_dir"
  preset_temp_dir = "/home/arthurx/Audio_Rec_2016/preset_temp_dir"





  new_timeline_size = 593090031    # +- 500 MB          #   293090031 = 260MB


  today = datetime.date.today()
  today_dir = os.path.join(store_dir, str(today.year), str(today.month), str(today.day))
  print today_dir
  today_dir_exists =  os.path.isdir(today_dir)
  print today_dir_exists

  work_dir_size = get_work_dir_size(work_dir)

  if os.path.isdir(today_dir) == False  and get_work_dir_size(work_dir) > new_timeline_size:


    print "OK, we can create new storage and working dir"


    rename_recording(work_dir, store_dir) 

    rename_preset_temp_working_dir(preset_temp_dir, work_dir)   
  
    create_new_preset_temp_dir(preset_temp_dir,preset_dir)



if __name__ == '__main__':
  main()
