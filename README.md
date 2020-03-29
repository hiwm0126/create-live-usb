# create-live-usb
Create Live usb script (This script is intended to be used on Linux.)

## 1. install

```
git clone https://github.com/hiwm0126/create-live-usb.git ~/.create-live-usb
sudo ln -snf ~/.create-live-usb/main.sh /usr/local/bin/create-live-usb
```
## 2. How to use

```
$ sudo create-live-usb [iso image path] <-- (ex: sudo create-live-usb ~/Download/Peppermint-10-20191210-amd64.iso)

==============BLOCK DEVICE INFO=================

NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    1  3.8G  0 disk 
└─sda1        8:1    1  3.8G  0 part 
mmcblk0     179:0    0 29.8G  0 disk 
├─mmcblk0p1 179:1    0   63M  0 part 
├─mmcblk0p2 179:2    0    1K  0 part 
├─mmcblk0p5 179:5    0   32M  0 part 
├─mmcblk0p6 179:6    0  256M  0 part /boot
└─mmcblk0p7 179:7    0 29.5G  0 part /

================================================

which device do you want to use?

---device name list---
sda       
mmcblk0   
----------------------

Enter the dvice name : <-- (ex: sda)
mkfs.fat 4.1 (2017-01-24)
1560281088 bytes (1.6 GB, 1.5 GiB) copied, 266 s, 5.9 MB/s 
372+1 records in
372+1 records out
1562378240 bytes (1.6 GB, 1.5 GiB) copied, 266.846 s, 5.9 MB/s

--------------------------------------

Creating Live USB is complete.

```