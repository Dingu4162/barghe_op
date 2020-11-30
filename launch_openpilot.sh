#!/usr/bin/bash

if [ ! -f "/system/fonts/NanumGothic.ttf" ]; then
    sleep 3
    mount -o remount,rw /system

    cp -rf /data/openpilot/selfdrive/fonts/kor/NanumGothic* /system/fonts/
    cp -rf /data/openpilot/selfdrive/fonts/kor/fonts.xml /system/etc/fonts.xml
    chmod 644 /system/etc/fonts.xml
    chmod 644 /system/fonts/NanumGothic*

    mount -o remount,r /system

    setprop persist.sys.locale ko-KR
    setprop persist.sys.local ko-KR
    setprop persist.sys.timezone Asia/Seoul

    echo ==========================================================
    echo Ko-KR NanumGothic font install complete
    echo Bootanimation change complete
    echo Ko-KR locale change complete
    echo Comma boot logo change complete
    echo Reboot Now..!!
    echo ==========================================================

    reboot
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh
