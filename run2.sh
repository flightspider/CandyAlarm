
text='NULL'
sound(){

audio=audio.mp3  # for MS use audio.wav

  echo 'date' >> $path/.tts_report.log
  echo $text >> $path/.tts_report.log
 
  if [ ! -f "$audio" ];then
     echo "Audio Cleared."
  else
    rm $audio
  fi

  echo $text
  python3 $path/bd_tts.py "$text"
  #python3 $path/ms_tts.py "$text"

  xdg-open $audio
}

path=/home/xyang/Alarm/
wdata=.w2.json
mz_wdata=.mz_weather_`date +%Y-%m-%d`.dat

cd $path
$path/weather2.sh

time=`date +%m月%d日,%A,时间%H点%M分`

time_pre=`./time_class.sh`

$path./mz_weather.sh

city=`cat $wdata |jq '.cityname'`
weather=`cat $wdata |jq '.weather'`
temp=`cat $wdata |jq '.temp'`
wd=`cat $wdata |jq '.WD'`
ws=`cat $wdata |jq '.WS'`
sd=`cat $wdata |jq '.SD'`

dt=`cat $wdata |jq '.date'`
aqi=`cat $wdata |jq '.aqi'`

lunar=`./lunar_cal.sh`

ct_life=`cat $mz_wdata |jq '.value[0].indexes|sort_by(.abbreviation)[]|select(.abbreviation=="ct").content'`

mode=$1
cal=''
if [ "$mode" == "eve" ];then 
  cal='明天的安排有,'`./cal.sh 1`',北京第三区交通委提醒您：早睡早起，有益健康！'
elif [ "$mode" == "mor" ];then 
  cal=$ct_life',今天的安排有,'`./cal.sh 1`',加油'
elif [ "$mode" == "clk" ];then 
  cal="`wget -q -O - https://www.solidot.org/ |pup '.famous text{}'`"'.年轻人,加油干啊！'
fi

text=$time_pre'好,现在是'$time','$lunar',今天'$city'天气,'$weather',温度,'$temp'度,湿度'$sd','$wd','$ws','$cal
text=`echo $text|sed s/\"//g`
text=`echo $text|sed s/\ /,/g`
text=`echo $text|sed 's/,\+/,/g'`

sound ;
#sleep 25s

if [ "$mode" == "mor" ];then 

  text='好奇心日报,今日娱乐,'`./.qdaily/qdaily.sh 今日娱乐`; sound ;  
  day=`date +%d日`
  text='早读,'`./.zx8/zx8.sh ${day}日早读`; sound ;sleep 200s  
#  text='好奇心日报,大公司头条,'`./.qdaily/qdaily.sh 大公司头条`; sound ;sleep 200s

elif [ "$mode" == "clk" ];then

   echo hi clk
#  text=`wget -q -O - https://www.solidot.org/ |pup '.famous text{}'`;sound;

elif [ "$mode" == "eve" ];then
   echo 'night'
   text='夜读,'`./.zx8/zx8.sh ${day}日早读`; sound ;  
fi
