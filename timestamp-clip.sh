#!/usr/bin/env bash

convert_timestamp() {
        converted_timestamp=`date --utc +%Y-%m-%dT%H:%M:%SZ -d @$1`
}

clipboard_content=`xclip -o`

if [[ $clipboard_content =~ ^[0-9]{10}$ ]]; then
        convert_timestamp $clipboard_content
        notify-send -t 1500 $converted_timestamp
        exit 0
fi

if [[ $clipboard_content =~ ^[0-9]{13}$ ]]; then
        seconds=`expr $clipboard_content / 1000`
        convert_timestamp $seconds
        notify-send -t 1500 $converted_timestamp
        exit 0
fi

notify-send -t 1000 "No timestamp in clipboard!"
