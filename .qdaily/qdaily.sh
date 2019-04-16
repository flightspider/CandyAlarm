path='/home/xyang/Alarm/.qdaily'

file=$path/.qdaily.index.`date +%Y%m%d.%H`.dat
if [ ! -f $file ]; then
  wget -O $file http://www.qdaily.com/
fi

#cat $file
title=$1

fetch(){

#if [ "$req" == "dgs" ]; then
#  title="大公司"  
#elif [ "$req" == "yl" ]; then
#  title="今日娱乐"  
#fi

  artID=`cat $file |pup ':parent-of(:parent-of(h3:contains("'$title'")))' |grep href |grep -o "[0-9]\+"`
  if [ -z "$artID" ]; then
	echo $title',未找到!'
        return
  fi

  afile=$path/.qdaily.$title.$artID.dat


  if [ ! -f $afile ]; then
    wget -O $afile http://www.qdaily.com/articles/$artID.html
  fi

  
  cat $afile |pup '.detail  text{}'|sed ':label;N;s/\n/*/'|tr '\n' '.'| sed 's/\xc2\x91\|\xc2\x92\|\xc2\xa0\|\xe2\x80\x8e//' 

}

fetch req

