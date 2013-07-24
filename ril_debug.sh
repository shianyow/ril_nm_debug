#!/bin/bash

adb pull /system/b2g/defaults/pref/user.js
sed -i 's/pref("ril.debugging.enabled", false);/pref("ril.debugging.enabled", true);/g' user.js
adb remount
adb push user.js /system/b2g/defaults/pref/user.js
adb shell stop b2g
adb shell start b2g
