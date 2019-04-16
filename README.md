
# CandyAlarm

*CandyAlarm* is aming to provide flexible, custom, fancy and pragmatic, music alarm clocks on linux

if you happen to have a unused computer or a [Raspberry Pi], you can use this one to build a perrty cool alarm clock

# Features

- bedtime/morning music
- hourly strike 
- real time weather
- news automatic grab
- calendar report
- text-to-speech (currently BAIDU and MS)
- more is comming....


# Dependency

   - [jq](https://stedolan.github.io/jq/) (Json process)
   - [pnp] (Html process)
   - [mplayer]/[cvnc] (audio player)
   - [icalBuddy] (calendar support on Mac)

   - You also need a [Baidu](https://ai.baidu.com/tech/speech/tts) or [MS](https://azure.microsoft.com/en-us/services/cognitive-services/text-to-speech/) API key to use TTS support, (not hard to apply accturally, just google it).

# Get Start

1. Clone the code

```sh
$ git clone git@github.com:flightspider/CandyAlarm.git
$ cd CandyAlarm
```

2. Configure the Baidu or MS API key by edit `setup_api.sh`

```sh
$ vi setup_api.sh 
$ source setup_api.sh 
```


```sh
$ vi setup_api.sh 
```

3. Configure the Cron job, the example are 

```sh
$ vi crontab_setting_example.txt
$ crontab -e
```

4. Put some music file you Love in the `Music/` folder


6. check the `run2.sh` file make sure it fit you need


7. You can directly run the program by `run2.sh` to make sure everything works

```sh
$ ./run2.sh clk     # (make a hourly report)
$ ./run2.sh mor     # (make a morning report)
$ ./run2.sh eve     # (make a evening report)
```

8. If you have your own perfered news resource on web, you can use the `.qdaily/.zx8` as examples, just 

- 1. make a copy of `.qdaily/` and make some changes accordingly. 
- 2. add the calling of the new script in the main file (`run2.sh`) 

It's pretty easy if you know a little about HTML, the `pup` makes the process very convenient.

8. If you want calendar in your alarm, for Exchange calendar user on MAC you can use the [icalBuddy] to make a text output of your calender and sync it to the alarm host daily. some thing like this, output example can be found at `./cal`

```

today=`date +%Y%m%d`
 
path=~/.cal

for n in {0..10}
do
day=`date -v +${n}d +%Y%m%d`
md=`date -v +${n}d +%m-%d`
icalBuddy  eventsFrom:$md to:$md > $path/$day.cal.txt
done


scp -P 10022 $path/*.cal.txt user@IpOfAlarmhost:~/Alarm/.cal/

echo Sync finished at `date` >> ~/.cal/sync_log.txt

```

On Linux/Windows platform it have not been further studied, but MS Graph API could be a solution as a better solution.

# Develop

   - Let's make it better    
   - MS Graph could make it powerful, could be considered in future
   
# License
MIT
