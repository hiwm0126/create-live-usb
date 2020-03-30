# create-live-usb
Create Live usb script.
（I don't take any responsibility for this script）

## Available Environment
`Linux` and `macOS`

## 1. Install

```
$ git clone https://github.com/hiwm0126/create-live-usb.git ~/.create-live-usb
$ sudo ln -snf ~/.create-live-usb/main.sh /usr/local/bin/create-live-usb
```
## 2. How to use

### 2-1. Example (Linux)
```
$ sudo create-live-usb ~/Download/********.iso

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

Enter the dvice name : sda
1560281088 bytes (1.6 GB, 1.5 GiB) copied, 266 s, 5.9 MB/s 
372+1 records in
372+1 records out
1562378240 bytes (1.6 GB, 1.5 GiB) copied, 266.846 s, 5.9 MB/s

--------------------------------------

Creating Live USB is complete.

```

### 2-2. Example (macOS)
```
$ sudo create-live-usb ~/Download/********.iso

==============BLOCK DEVICE INFO=================

/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *251.0 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                 Apple_APFS Container disk1         250.8 GB   disk0s2

/dev/disk1 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +250.8 GB   disk1
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD - Data     107.7 GB   disk1s1
   2:                APFS Volume Preboot                 83.5 MB    disk1s2
   3:                APFS Volume Recovery                528.1 MB   disk1s3
   4:                APFS Volume VM                      1.1 GB     disk1s4
   5:                APFS Volume Macintosh HD            11.2 GB    disk1s5

/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *4.0 GB     disk2
   1:                       0xEF                         2.4 MB     disk2s2


================================================

which device do you want to use?

---device name list---
disk2 
----------------------

Enter the dvice name : disk2
460+0 records in
460+0 records out
1929379840 bytes transferred in 324.378169 secs (5947934 bytes/sec)

--------------------------------------

Creating Live USB is complete.

```
