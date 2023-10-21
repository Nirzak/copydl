#!/bin/bash
# Author: Nirjas Jakilim
# Motive: Zip and upload downloaded rtorrent files to telegram

n=$1
path=$2

chatid="tg_chat_id>"
bot_token="token"

dash_con=$(echo "$n" | tr -d -c '-' | awk '{ print length; }') # checking dash count to prevent removing whole filename
if [[ $dash_con > 1 && $n != *"T-Series"* ]]
then
        name=$(echo $n | cut -d- -f2-) #removing extra part before - character
        name=$(echo $name | sed 's/^[ \t]*//') # removing extra space before line start
else
        name=$n
fi

cd /torrents/rtorrent
zip -r "$name.zip" "$n" &
wait
curl -F chat_id="$chatid" -F "document=@\"$name.zip\"" -F caption="$n" https://api.telegram.org/bot${bottoken}/sendDocument &
#telegram-upload -d "$name.zip" --caption "$n" >> /tmp/tgup.log & #uncomment this when using telegram-upload
wait
rm -rf "$name.zip" #comment this when using telegram-upload command
