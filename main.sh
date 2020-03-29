#!/bin/sh

if [ ${#1} -eq 0 ]; then
  echo 'You must specifed iso image path.'
  exit 1
fi

os=`uname`

echo "\n==============BLOCK DEVICE INFO=================\n"
case $os in
	"Linux" ) lsblk;;
	"Darwin" ) diskutil list;;
esac
echo "\n================================================\n"

echo  "which device do you want to use?\n"

case $os in
	"Linux" ) dev_list=`lsblk | grep disk | awk '{print substr($0,0,10)}'` ;;
	"Darwin" ) dev_list=`diskutil list | grep external | sed -e 's/(.*)://g' | sed -e 's/\/dev\///g'`;;
esac

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


case $os in
	"Linux" ) partitions=`lsblk | grep -e "$dev_name[0-9]" | awk '{print substr($0,3,6)}'` ;;
	"Darwin" ) partitions=`diskutil list | grep $dev_name | grep -E "[0-9] (KB|MB|GB)" | awk "/$dev_name.+/ {print $5}"`;;
esac

for i in $partitions;
do 
	umount /dev/$i
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
