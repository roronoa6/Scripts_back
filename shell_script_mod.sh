#!/bin/sh

echo "拷贝脚本到/scripts/目录下"
cp -f /mod_scripts/*_*.js /scripts
echo "自定义增加crontab任务"
cat /mod_scripts/remote_crontab_list.sh >> /scripts/docker/merged_list_file.sh
