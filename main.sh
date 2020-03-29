#!/bin/sh

if [ ${#1} -eq 0 ]; then
  echo 'You must specifed iso image path.'
  exit 1
fi

echo "\n==============BLOCK DEVICE INFO=================\n"
lsblk
echo "\n================================================\n"

echo  "which device do you want to use?\n"

dev_list=`lsblk | grep disk | awk '{print substr($0,0,10)}'`

echo "---device name list---\n$dev_list\n----------------------\n"

read -p "Enter the dvice name : " dev_name

chk_flg=0
for i in $dev_list;
do
	if [ $dev_name = $i ]; then
		chk_flg=1
	fi
done

if [ $chk_flg -ne 1 ]; then
    echo 'Device name is not correct.'
	exit 1
fi

for i in `lsblk | grep -e "$dev_name[0-9]" | awk '{print substr($0,3,6)}'`;
do 
	umount /dev/$i
	mkfs.vfat -F 32 /dev/$i
done

dd if=$1 of=/dev/$dev_name bs=4M status=progress oflag=sync

if [ $? -eq 0 ]; then
	echo "\n--------------------------------------\n"
	echo "Creating Live USB is complete.\n"
else
	echo "\n--------------------------------------\n"
    echo "Creating Live USB is failed.\n"
fi

exit 0
