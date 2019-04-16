date=`date +%Y-%m-%d`
file=.lunar.$date.dat
if [ ! -f $file ];then
wget -O $file https://www.sojson.com/open/api/lunar/json.shtml?date=$date
fi
text='农历，'
text=$text`cat $file|jq .data.cnmonth`'月'
text=$text`cat $file|jq .data.cnday`','
echo $text

