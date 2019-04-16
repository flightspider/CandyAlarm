file=.mz_weather_`date +%Y-%m-%d`.dat
if [ ! -f $file ];then
wget -O $file http://aider.meizu.com/app/weather/listWeather?cityIds=101220101
fi

