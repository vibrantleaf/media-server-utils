#!/usr/bin/python3
import os
import glob
tmpdir="" 
ffmpegdir=""
container="" #eg .mp4 or .mkv
def downlo():
  wgcmd=str("wget '' ")
  for i in range(count):
    if i == 0 : 
      continue
    numint=i #convert i into str
    numstr=("%02d" % (numint)) # add leading 0 if i isn't 2 characters long may be usefull
    os.system(wgcmd+'e'+numstr+container' -O'+tmpdir+'e'+numstr+container')
  return
#def traco():
#    os.system('bash ./fortr.sh '+tmpdir+'*.mp4 ')
#    return
def main():
  downlo()
  #traco()
  return

if __name__ == "__main__":
  main()
