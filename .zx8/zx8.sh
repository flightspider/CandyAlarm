app='zx8'
path='/home/xyang/Alarm/.zx8'

file=$path/.$app.index.`date +%Y%m%d.%H`.dat
if [ ! -f $file ]; then
  wget -O $file http://mp.sohu.com/profile?xpt=c29odXptdGZlbXl2NGRAc29odS5jb20=
fi

#cat $file
title=$1

fetch(){

#if [ "$req" == "dgs" ]; then
#  title="大公司"  
#elif [ "$req" == "yl" ]; then
#  title="今日娱乐"  
#fi

  artID=`cat $file |pup 'a:contains("4月15日早读分享")' |grep href |grep -o "[0-9_]\+[0-9_]\+"`
  if [ -z "$artID" ]; then
	echo $title',未找到!'
        return
  fi

  afile=$path/.$app.$title.$artID.dat


  if [ ! -f $afile ]; then
    wget -O $afile http://www.sohu.com/a/$artID
  fi

  
  cat $afile |pup '.article  text{}'|sed ':label;N;s/\n/*/'|grep -vE '(只做参考学习|责任编辑|原标题)'|tr '\n' '.'| sed 's/\xc2\x91\|\xc2\x92\|\xc2\xa0\|\xe2\x80\x8e//' 

}

fetch req

