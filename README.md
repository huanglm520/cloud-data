## Cloud-Data数据一体化服务平台项目说明
### 项目开发工具
[Eclipse](https://www.eclipse.org) Version: 2018-09 (4.9.0) Build id: 20180917-1800
### 项目开发环境
[Java SE Development Kit](https://www.oracle.com/technetwork/java/javase/downloads) Version: 1.8.0_162u
### 数据库版本
[MySQL](https://www.mysql.com/) Version: 5.7.23-amd64
### 项目静态资源仓库
https://github.com/huanglm520/cloud-data.statis.io

### 项目资源下载
项目数据资源已经托管到发布仓库<br>
可执行WAR包：[点击下载](https://github.com/huanglm520/cloud-data/releases/download/1.0/cloud-data.war)&nbsp;&nbsp;&nbsp;数据库文件：[点击下载](https://github.com/huanglm520/cloud-data/releases/download/1.0/db_cloud_data.sql)

### 项目配置说明
项目必须修改的配置文件：`log4j2-config.xml`和`mysql.properties`<br>

`log4j2-config.xml`配置说明<br>
导入项目后打开文件：`src/main/resources/config/log4j2-config.xml`,寻找以下代码：<br>
`<properties>`<br>
`<property name="log-home">F:/cloud-data/logs</property>`<br>
`</properties>`<br>
将第二行中的路径修改为你电脑上的日志目录<br>

`mysql.properties`配置说明<br>
导入项目后打开文件：`src/main/resources/config/mysql.properties`<br>
`mysql.driver=com.mysql.jdbc.Driver #mysql驱动类`<br>
`mysql.address=127.0.0.1 #改为你的MySQL地址`<br>
`mysql.port=3306 #改为你的MySQL端口`<br>
`mysql.dbname=db_cloud_data #改为你的项目数据库名称`<br>
`mysql.username=admin #改为你的MySQL账户`<br>
`mysql.password=YWRtaW5AbG9jYWxob3N0 #改为你的MySQL账户密码`<br>
`mysql.useSSL=false #是否启用SSL，如需启用改为true`<br>
`mysql.useUnicode=true #是否使用Unicode字符，推荐开启`<br>
`mysql.characterEncoding=utf8 #传输使用的字符编码，如无特殊需要无需修改`<br>

### 项目数据过滤配置
项目支持自定义数据过滤规则，可过滤用户账户相关数据，容器信息相关数据等按照你的要求进行筛选<br>
数据过滤配置文件位于：`src/main/resources/check`<br>

### Maven仓库说明
推荐使用阿里云maven，启用阿里云maven请在你的maven配置文件`settings.xml`中找到`<mirrors></mirrors>`节点，向节点中添加如下数据<br>
`<mirror>`<br>
`<id>AliMaven</id>`<br>
`<name>aliyun maven</name>`<br>
`<url>http://maven.aliyun.com/nexus/content/groups/public/</url>`<br>
`<mirrorOf>central</mirrorOf>`<br>
`</mirror>`<br>

### 关于此项目
该项目于2018-09-17创建，在2018-12-19托管到github平台，于2019-03-14完成编码和测试<br>
