


cat .bd_tts.py.tpl|sed 's/BAIDU_APP_ID/16014862/g' > bd_tts.py
sed -i 's/BAIDU_API_KEY/jFOh6GEavVruEldPdw34s9zk/g' bd_tts.py 
sed -i 's/BAIDU_SECRET_KEY/Gc4UWxj6usOgsfd3qKxj1VErpnX0ulXp/g'  bd_tts.py


cat .ms_tts.py.tpl|sed 's/MS_API_KEY/b01ed3f3d2c046c8baae5c757e383ce4/g' > ms_tts.py
