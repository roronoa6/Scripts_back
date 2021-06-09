# Scripts_back

###shell
+ 2021-01-22更新 CUSTOM_LIST_FILE 参数支持远程定时任务列表 (⚠️务必确认列表中的任务在仓库里存在)
+ 例1:配置远程crontab_list.sh, 此处借用 shylocks 大佬的定时任务列表, 本仓库不包含列表中的任务代码, 仅作示范
+ CUSTOM_LIST_FILE=https://raw.githubusercontent.com/shylocks/Loon/main/docker/crontab_list.sh
+
+ 例2:配置docker挂载本地定时任务列表, 用法不变, 注意volumes挂载
+ volumes:
+   - ./my_crontab_list.sh:/scripts/docker/my_crontab_list.sh
+ environment:
+   - CUSTOM_LIST_FILE=my_crontab_list.sh


+ 2021-01-21更新 增加 DO_NOT_RUN_SCRIPTS 参数配置不执行的脚本
+ 例:DO_NOT_RUN_SCRIPTS=jd_family.js&jd_dreamFactory.js&jd_jxnc.js
建议填写完整文件名,不完整的文件名可能导致其他脚本被禁用。
例如：“jd_joy”会匹配到“jd_joy_feedPets”、“jd_joy_reward”、“jd_joy_steal”

+ 2021-01-03更新 增加 CUSTOM_SHELL_FILE 参数配置执行自定义shell脚本
+ 例1:配置远程shell脚本, 我自己写了一个shell脚本https://raw.githubusercontent.com/iouAkira/someDockerfile/master/jd_scripts/shell_script_mod.sh 内容很简单下载惊喜农场并添加定时任务
+ CUSTOM_SHELL_FILE=https://raw.githubusercontent.com/iouAkira/someDockerfile/master/jd_scripts/shell_script_mod.sh
+
+ 例2:配置docker挂载本地自定义shell脚本,/scripts/docker/shell_script_mod.sh 为你在docker-compose.yml里面挂载到容器里面绝对路径
+ CUSTOM_SHELL_FILE=/scripts/docker/shell_script_mod.sh
+
+ tip：如果使用远程自定义，请保证网络畅通或者选择合适的国内仓库，例如有部分人的容器里面就下载不到github的raw文件，那就可以把自己的自定义shell写在gitee上，或者换本地挂载
+      如果是 docker 挂载本地，请保证文件挂载进去了，并且配置的是绝对路径。
+      自定义 shell 脚本里面如果要加 crontab 任务请使用 echo 追加到 /scripts/docker/merged_list_file.sh 里面否则不生效
+ 注⚠️ 建议无shell能力的不要轻易使用，当然你可以找别人写好适配了这个docker镜像的脚本直接远程配置
+     上面写了这么多如果还看不懂，不建议使用该变量功能。
