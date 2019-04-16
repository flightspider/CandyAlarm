#  HeFei's weather , some small change needed on cityID for other city

wdata=.w2.json

wget -q -O $wdata.t --refer http://www.weather.com.cn/weather1d/101220101.shtml -U 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36' http://d1.weather.com.cn/sk_2d/101220101.html\?_\=1555229036824
cat $wdata.t|awk -F = '{print $2}' > $wdata
rm $wdata.t
