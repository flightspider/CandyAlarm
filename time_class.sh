#!/bin/bash
value=$(date +%T |awk -F: '{print $1}')
#晚上
if [ $value -ge 19 ] && [ $value -le 23 ]
then
echo "晚上"
#凌晨
elif [ $value -ge 00 ] && [ $value -le 05 ]
then
echo "凌晨"
#早上
elif [ $value -ge 05 ] && [ $value  -le 08 ]
then
echo "早上"
#上午
elif [ $value -ge 08 ] && [ $value -le 10 ]
then
echo "上午"
#中午
elif [ $value -ge 11 ] && [ $value -le 12 ]
then
echo "中午"
#下午
elif [ $value -ge 13 ] && [ $value -le 16 ]
then
echo "下午"
else [ $value -ge 17 ] && [ $value -le 19 ]
echo "傍晚"
fi
