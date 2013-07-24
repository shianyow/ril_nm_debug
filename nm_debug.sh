#!/bin/bash

OMNI_DIR=omni_dir
NETWORK_MANAGER_PATH=components/NetworkManager.js
NET_WORKER_PATH=modules/net_worker.js
RIL_PATH=modules/ril_consts.js

adb remount
rm -rf $OMNI_DIR
mkdir $OMNI_DIR
cd $OMNI_DIR
adb pull /system/b2g/omni.ja
unzip omni.ja
sed -i 's/const DEBUG = false;/const DEBUG = true;/g' $NETWORK_MANAGER_PATH
sed -i 's/const DEBUG = false;/const DEBUG = true;/g' $NET_WORKER_PATH
sed -i 's/this.DEBUG_ALL = false;/this.DEBUG_ALL = true;/g' $RIL_PATH
rm omni.ja
zip -r -D omni.ja *
adb push omni.ja /system/b2g
adb shell stop b2g
adb shell start b2g
