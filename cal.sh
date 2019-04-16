path=/home/xyang/Alarm

d=$1

file=$path/.cal/`date -d "-$d days ago" +%Y%m%d`.cal.txt

a=`cat $file|grep '•'|sed 's/•/,/g'|grep -vE '家庭|SkyCal|note|http'|sed 's/•//g'`;echo $a
