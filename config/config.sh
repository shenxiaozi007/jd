## Version: v3.15.0
## Date: 2021-01-18
## Update Content: 增加全民炸年兽活动助力环境变量。

## 上面版本号中，如果第2位数字有变化，那么代表增加了新的参数，如果只有第3位数字有变化，仅代表更新了注释，没有增加新的参数，可更新可不更新
## 如需更新，请参考WIKI（https://github.com/EvineDeng/jd-base/wiki）中"如何更新配置文件"部分的操作说明，进行智能比对后修改。

################################## 说明 ##################################
## 以下配置中，带有 export 申明的，均由lxk0301大佬定义，详见：https://github.com/LXK9301/jd_scripts/blob/master/githubAction.md#%E4%B8%8B%E6%96%B9%E6%8F%90%E4%BE%9B%E4%BD%BF%E7%94%A8%E5%88%B0%E7%9A%84-secrets%E5%85%A8%E9%9B%86%E5%90%88
## 其他互助码，考虑到直接按lxk0301大佬定义的变量去填的话，一是不方便记忆，二是容易搞混，所以最终的变量将由脚本去组合，你只要按注释去填即可
## 除此之外，还额外增加了是否自动删除失效任务AutoDelCron、是否自动增加新任务AutoAddCron、删除旧日志时间RmLogDaysAgo、随机延迟启动任务RandomDelay、是否添加自定义脚本EnableExtraShell五个人性化的设置供选择
## 所有赋值等号两边不能有空格，所有的值请一律在两侧添加半角的双引号
## 所有的赋值都可以参考 “定义东东萌宠是否静默运行” 部分，在不同时间设置不同的值，以达到你想要的效果，具体判断条件如下：
## $(date "+%d") 当前的日期，如：13
## $(date "+%w") 当前是星期几，如：3
## $(date "+%H") 当前的小时数，如：23
## $(date "+%M") 当前的分钟数，如：49
## 其他date命令的更多用法，可以在命令行中输入 date --help  查看
## 判断条件 -eq -ne -gt -ge -lt -le ，具体含义可百度一下


################################## 定义Cookie（必填） ##################################
## 请依次填入每个用户的Cookie，Cookie的具体形式（只有pt_key字段和pt_pin字段，没有其他字段）：pt_key=xxxxxxxxxx;pt_pin=xxxx;
## 1. 如果是通过控制面板编辑本文件，点击页面上方“扫码获取Cookie”即可获取，此方式获取的Cookie有效期为3个月
## 2. 还可以通过浏览器开发工具获取，此方式获得的Cookie只有1个月有效期，教程：https://github.com/LXK9301/jd_scripts/wiki/GetCookies
## 必须按数字顺序1、2、3、4...依次编号下去，例子只有6个，超出6个你继续往下编号即可
## 不允许有汉字，如果ID有汉字，请在PC浏览器上获取Cookie，会自动将汉字转换为URL编码

Cookie1="pt_key=AAJhLJqJADB6dX-_azFTjBBuUIBQaVdV10lma5Ti8-P7iaeuYZyQ_gyTyMYzP563yQ7nvBateMI;pt_pin=jd_VAKitQvdtiCb;"
Cookie2="pt_key=AAJhLKOZADA9f1cb8MAPX0y5goYk1uJ4TExsQaB1tqbdvQRvx2orZeY2k9TT0VZPqgdTxPrzsck;pt_pin=%E6%B0%B5%E5%8F%88%E7%86%A0;" #hy
Cookie3="pt_key=AAJhLJoCADB3oVlZCUnxzK9dQMYqzjnM1ku8Zv6BXpGjseaZ45_omZR2xnOaw5irQwDTculU9Fs;pt_pin=173315279;"
Cookie4="pt_key=AAJhLKJTADCuaqAXzPIJIEAd6L6zK7GUmbJK0oshT7O3ORhf_Zb8F7kN6xyJnxgREsbXTOCFnN0;pt_pin=%E6%B5%85%E8%8D%89%E5%B9%BB%E9%9B%AA;"
Cookie5="pt_key=AAJgdoxgADDEeOK53U7s5cMO5hx4rfhPlhyfgX00U6QvMP4-leVGi7c0hdkwzCOOa7Xz9qobI44;pt_pin=%E7%90%B3%E7%B4%AB%E5%A7%90%E5%A7%90;" #lz
Cookie6="pt_key=AAJhMZmhADAcvCslSHIL6o32RPOlp8X5Y5kNsz7zg3ymuznn8O9TauRrHSsVuFxH_Aqq-OXrW2E;pt_pin=jd_YcslZQLIeUkW;" #小小瞒小号


################################## 定义是否自动删除失效的脚本与定时任务（选填） ##################################
## 有的时候，某些JS脚本只在特定的时间有效，过了时间就失效了，需要自动删除失效的本地定时任务，则设置为 "true" ，否则请设置为 "false"
## 当设置为 "true" 时，会自动从 lxk0301/jd_scripts 仓库中的 docker/crontab_list.sh 文件中读取比对删除的任务（识别以“jd_”、“jr_”、“jx_”开头的任务）
## 当设置为 "true" 时，脚本只会删除一整行失效的定时任务，不会修改其他现有任务，所以任何时候，你都可以自己调整你的crontab.list
## 当设置为 "true" 时，如果你有添加额外脚本是以“jd_”“jr_”“jx_”开头的，如不在 lxk0301/jd_scripts 仓库下 docker/crontab_list.sh 中，会被删除，不是以“jd_”“jr_”“jx_”开头的任务则不受影响
AutoDelCron="true"


################################## 定义是否自动增加新的本地定时任务（选填） ##################################
## lxk0301 大佬会在有需要的时候，增加定时任务，如需要本地自动增加新的定时任务，则设置为 "true" ，否则请设置为 "false"
## 当设置为 "true" 时，如果检测到 lxk0301/jd_scripts 仓库中的 docker/crontab_list.sh 中有增加新的定时任务，那么在本地也增加（识别以“jd_”、“jr_”、“jx_”开头的任务）
## 当设置为 "true" 时，会自动从 lxk0301/jd_scripts 仓库中的 docker/crontab_list.sh 文件新增加的任务中读取时间，该时间为北京时间
## 当设置为 "true" 时，脚本只会增加新的定时任务，不会修改其他现有任务，所以任何时候，你都可以自己调整你的crontab.list
AutoAddCron="true"


################################## 定义删除日志的时间（选填） ##################################
## 定义在运行删除旧的日志任务时，要删除多少天以前的日志，请输入正整数，不填则禁用删除日志的功能
RmLogDaysAgo="7"


################################## 定义随机延迟启动任务（选填） ##################################
## 如果任务不是必须准点运行的任务，那么给它增加一个随机延迟，由你定义最大延迟时间，单位为秒，如 RandomDelay="300" ，表示任务将在 1-300 秒内随机延迟一个秒数，然后再运行
## 在crontab.list中，在每小时第0-2分、第30-31分、第59分这几个时间内启动的任务，均算作必须准点运行的任务，在启动这些任务时，即使你定义了RandomDelay，也将准点运行，不启用随机延迟
## 在crontab.list中，除掉每小时上述时间启动的任务外，其他任务在你定义了 RandomDelay 的情况下，一律启用随机延迟，但如果你按照Wiki教程给某些任务添加了 "now"，那么这些任务也将无视随机延迟直接启动
RandomDelay="300"


################################## 定义User-Agent（选填） ##################################
## 自定义lxk0301大佬仓库里京东系列js脚本的User-Agent，不懂不知不会User-Agent的请不要随意填写内容，随意填写了出错概不负责
## 如需使用，请自行解除下一行注释
# export JD_USER_AGENT=""


################################## 定义通知TOKEN（选填） ##################################
## 想通过什么渠道收取通知，就填入对应渠道的值
## 1. ServerChan，教程：http://sc.ftqq.com/3.version
export PUSH_KEY=""

## 2. BARK，教程（看BARK_PUSH和BARK_SOUND的说明）：https://github.com/LXK9301/jd_scripts/blob/master/githubAction.md#%E4%B8%8B%E6%96%B9%E6%8F%90%E4%BE%9B%E4%BD%BF%E7%94%A8%E5%88%B0%E7%9A%84-secrets%E5%85%A8%E9%9B%86%E5%90%88
export BARK_PUSH=""
export BARK_SOUND=""

## 3. Telegram，如需使用，TG_BOT_TOKEN和TG_USER_ID必须同时赋值，教程：https://github.com/LXK9301/jd_scripts/blob/master/backUp/TG_PUSH.md
export TG_BOT_TOKEN=""
export TG_USER_ID=""

## 4. 钉钉，教程（看DD_BOT_TOKEN和DD_BOT_SECRET部分）：https://github.com/LXK9301/jd_scripts/blob/master/githubAction.md#%E4%B8%8B%E6%96%B9%E6%8F%90%E4%BE%9B%E4%BD%BF%E7%94%A8%E5%88%B0%E7%9A%84-secrets%E5%85%A8%E9%9B%86%E5%90%88
export DD_BOT_TOKEN=""
export DD_BOT_SECRET=""

## 5. iGot聚合推送，支持多方式推送，填写iGot的推送key。教程：https://wahao.github.io/Bark-MP-helper/#/
export IGOT_PUSH_KEY=""

## 6. 酷推(Cool Push)，向QQ发送推送消息，参考文档：https://cp.xuthus.cc ，其中QQ_MODE的可选项有（默认send）：send[私聊]、group[群聊]、wx[个微]、ww[企微]、email[邮件]
export QQ_SKEY=""
export QQ_MODE=""

## 7. Push Plus，微信扫码登录后一对一推送或一对多推送，参考文档：http://pushplus.hxtrip.com/
## 其中PUSH_PLUS_USER是一对多推送的“群组编码”（一对多推送下面->您的群组(如无则新建)->群组编码）注:(1、需订阅者扫描二维码 2、如果您是创建群组所属人，也需点击“查看二维码”扫描绑定，否则不能接受群组消息推送)，只填PUSH_PLUS_TOKEN默认为一对一推送
export PUSH_PLUS_TOKEN=""
export PUSH_PLUS_USER=""

## 8. 企业微信机器人消息推送 webhook 后面的 key，文档：https://work.weixin.qq.com/api/doc/90000/90136/91770
export QYWX_KEY="d11d0716-1603-4f40-ad1f-35728aebc7f8"

## 9. 企业微信应用消息推送的值，文档：https://work.weixin.qq.com/api/doc/90000/90135/90236 
## 依次填上corpid的值,corpsecret的值,touser的值,agentid,media_id的值，注意用,号隔开，例如："wwcff56746d9adwers,B-791548lnzXBE6_BWfxdf3kSTMJr9vFEPKAbh6WERQ,mingcheng,1000001,2COXgjH2UIfERF2zxrtUOKgQ9XklUqMdGSWLBoW_lSDAdafat"
export QYWX_AM=""


################################## 定义每日签到的通知形式（选填） ##################################
## js脚本每日签到提供3种通知方式，分别为：
## 关闭通知，那么请在下方填入0
## 简洁通知，那么请在下方填入1，其效果见：https://github.com/LXK9301/jd_scripts/blob/master/icon/bean_sign_simple.jpg
## 原始通知，那么请在下方填入2，如果不填也默认为2，内容比较长，这也是默认通知方式
NotifyBeanSign=""


################################## 定义每日签到每个接口间的延迟时间（选填） ##################################
## 默认每个签到接口并发无延迟，如需要依次进行每个接口，请自定义延迟时间，单位为毫秒，延迟作用于每个签到接口, 如填入延迟则切换顺序签到(耗时较长)
export JD_BEAN_STOP=""


################################## 定义东东农场互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyFruit1=""
MyFruit2=""
MyFruit3=""
MyFruit4=""
MyFruit5=""
MyFruit6=""
MyFruitA=""
MyFruitB=""

ForOtherFruit1=""
ForOtherFruit2=""
ForOtherFruit3=""
ForOtherFruit4=""
ForOtherFruit5=""
ForOtherFruit6=""


################################## 定义东东萌宠互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyPet1=""
MyPet2=""
MyPet3=""
MyPet4=""
MyPet5=""
MyPet6=""
MyPetA=""
MyPetB=""

ForOtherPet1=""
ForOtherPet2=""
ForOtherPet3=""
ForOtherPet4=""
ForOtherPet5=""
ForOtherPet6=""


################################## 定义种豆得豆互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyBean1=""
MyBean2=""
MyBean3=""
MyBean4=""
MyBean5=""
MyBean6=""
MyBeanA=""
MyBeanB=""

ForOtherBean1=""
ForOtherBean2=""
ForOtherBean3=""
ForOtherBean4=""
ForOtherBean5=""
ForOtherBean6=""


################################## 定义京喜工厂互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyDreamFactory1=""
MyDreamFactory2=""
MyDreamFactory3=""
MyDreamFactory4=""
MyDreamFactory5=""
MyDreamFactory6=""
MyDreamFactoryA=""
MyDreamFactoryB=""

ForOtherDreamFactory1=""
ForOtherDreamFactory2=""
ForOtherDreamFactory3=""
ForOtherDreamFactory4=""
ForOtherDreamFactory5=""
ForOtherDreamFactory6=""


################################## 定义东东工厂互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyJdFactory1=""
MyJdFactory2=""
MyJdFactory3=""
MyJdFactory4=""
MyJdFactory5=""
MyJdFactory6=""
MyJdFactoryA=""
MyJdFactoryB=""

ForOtherJdFactory1=""
ForOtherJdFactory2=""
ForOtherJdFactory3=""
ForOtherJdFactory4=""
ForOtherJdFactory5=""
ForOtherJdFactory6=""


################################## 定义京东赚赚互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyJdzz1=""
MyJdzz2=""
MyJdzz3=""
MyJdzz4=""
MyJdzz5=""
MyJdzz6=""
MyJdzzA=""
MyJdzzB=""

ForOtherJdzz1=""
ForOtherJdzz2=""
ForOtherJdzz3=""
ForOtherJdzz4=""
ForOtherJdzz5=""
ForOtherJdzz6=""


################################## 定义疯狂的JOY互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyJoy1=""
MyJoy2=""
MyJoy3=""
MyJoy4=""
MyJoy5=""
MyJoy6=""
MyJoyA=""
MyJoyB=""

ForOtherJoy1=""
ForOtherJoy2=""
ForOtherJoy3=""
ForOtherJoy4=""
ForOtherJoy5=""
ForOtherJoy6=""


################################## 定义京喜农场互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyJxnc1=""
MyJxnc2=""
MyJxnc3=""
MyJxnc4=""
MyJxnc5=""
MyJxnc6=""
MyJxncA=""
MyJxncB=""

ForOtherJxnc1=""
ForOtherJxnc2=""
ForOtherJxnc3=""
ForOtherJxnc4=""
ForOtherJxnc5=""
ForOtherJxnc6=""


################################## 定义京喜农场TOKEN（选填） ##################################
## 如果某个Cookie的账号种植的是app种子，则必须填入有效的TOKEN；而种植非app种子则不需要TOKEN
## TOKEN的形式：{"farm_jstoken":"749a90f871adsfads8ffda7bf3b1576760","timestamp":"1610165423873","phoneid":"42c7e3dadfadsfdsaac-18f0e4f4a0cf"}
## 因TOKEN中带有双引号，因此，变量值两侧必须由一对单引号引起来
## TOKEN如何获取请阅读以下文件的注释：https://github.com/LXK9301/jd_scripts/blob/master/jd_jxnc.js
TokenJxnc1=''
TokenJxnc2=''
TokenJxnc3=''
TokenJxnc4=''
TokenJxnc5=''
TokenJxnc6=''


################################## 定义口袋书店互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyBookShop1=""
MyBookShop2=""
MyBookShop3=""
MyBookShop4=""
MyBookShop5=""
MyBookShop6=""
MyBookShopA=""
MyBookShopB=""

ForOtherBookShop1=""
ForOtherBookShop2=""
ForOtherBookShop3=""
ForOtherBookShop4=""
ForOtherBookShop5=""
ForOtherBookShop6=""


################################## 定义签到领现金互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
MyCash1=""
MyCash2=""
MyCash3=""
MyCash4=""
MyCash5=""
MyCash6=""
MyCashA=""
MyCashB=""

ForOtherCash1=""
ForOtherCash2=""
ForOtherCash3=""
ForOtherCash4=""
ForOtherCash5=""
ForOtherCash6=""


################################## 定义2020年炸年兽活动互助（选填） ##################################
## 具体填法及要求详见：https://github.com/EvineDeng/jd-base/wiki/FAQ
## 仅2021年2月12日前有效
MyNian1=""
MyNian2=""
MyNian3=""
MyNian4=""
MyNian5=""
MyNian6=""
MyNianA=""
MyNianB=""

ForOtherNian1=""
ForOtherNian2=""
ForOtherNian3=""
ForOtherNian4=""
ForOtherNian5=""
ForOtherNian6=""


################################## 定义东东超市蓝币兑换数量（选填） ##################################
## 东东超市蓝币兑换，可用值包括：
## 一、0：表示不兑换京豆，这也是js脚本的默认值
## 二、20：表示兑换20个京豆
## 三、1000：表示兑换1000个京豆
## 四、可兑换清单的商品名称，输入能跟唯一识别出来的关键词即可，比如：MARKET_COIN_TO_BEANS="抽纸"
## 注意：有些比较贵的实物商品京东只是展示出来忽悠人的，即使你零点用脚本去抢，也会提示没有或提示已下架
export MARKET_COIN_TO_BEANS="0"


################################## 定义东东超市蓝币成功兑换奖品是否静默运行（选填） ##################################
## 默认 "false" 关闭（即:奖品兑换成功后会发出通知提示），如需要静默运行不发出通知，请改为 "true"
export MARKET_REWARD_NOTIFY=""


################################## 定义东东超市是否自动升级商品和货架（选填） ##################################
## 升级顺序：解锁升级商品、升级货架，默认 "true" 自动升级，如需关闭自动升级，请改为 "false"
export SUPERMARKET_UPGRADE=""


################################## 定义东东超市是否自动更换商圈（选填） ##################################
## 小于对方300热力值自动更换商圈队伍，默认 "true" 自动更换，如不想更换商圈，请改为 "false"
## 目前已无此功能，申明了也无效
# export BUSINESS_CIRCLE_JUMP=""


################################## 定义东东超市是否自动使用金币去抽奖（选填） ##################################
## 是否用金币去抽奖，默认 "false" 关闭，如需开启，请修改为 "true"
export SUPERMARKET_LOTTERY=""


################################## 定义东东农场是否静默运行（选填） ##################################
## 默认为 "false"，不静默，发送推送通知消息，如不想收到通知，请修改为 "true"
## 如果你不想完全关闭或者完全开启通知，只想在特定的时间发送通知，可以参考下面的“定义东东萌宠是否静默运行”部分，设定几个if判断条件
export FRUIT_NOTIFY_CONTROL=""


################################## 定义东东农场是否使用水滴换豆卡（选填） ##################################
## 如果出现限时活动时100g水换20豆，此时比浇水划算，"true" 表示换豆（不浇水），"false" 表示不换豆（继续浇水）,默认是"false"
## 如需切换为换豆（不浇水），请修改为 "true"
export FRUIT_BEAN_CARD=""


################################## 定义宠汪汪喂食克数（选填） ##################################
## 你期望的宠汪汪每次喂食克数，只能填入10、20、40、80，默认为10
## 如实际持有食物量小于所设置的克数，脚本会自动降一档，直到降无可降
## 具体情况请自行在宠汪汪游戏中去查阅攻略
export JOY_FEED_COUNT=""


################################## 定义宠汪汪兑换京豆数量（选填） ##################################
## 目前的可用值包括：0、20、500、1000，其中0表示为不自动兑换京豆，如不设置，将默认为"20"
## 不同等级可兑换不同数量的京豆，详情请见宠汪汪游戏中兑换京豆选项
## 500、1000的京豆每天有总量限制，设置了并且你也有足够积分时，也并不代表就一定能抢到
export JD_JOY_REWARD_NAME=""


################################## 定义宠汪汪兑换京豆是否静默运行（选填） ##################################
## 默认为 "false"，在成功兑换京豆时将发送推送通知消息（失败不发送），如想要静默不发送通知，请修改为 "true"
export JD_JOY_REWARD_NOTIFY=""


################################## 定义宠汪汪是否自动给好友的汪汪喂食（选填） ##################################
## 默认 "false" 不会自动给好友的汪汪喂食，如想自动喂食，请改成 "true"
export JOY_HELP_FEED=""


################################## 定义宠汪汪是否自动报名宠物赛跑（选填） ##################################
## 默认 "true" 参加宠物赛跑，如需关闭，请改成 "false"
export JOY_RUN_FLAG=""


################################## 定义宠汪汪参加比赛类型（选填） ##################################
## 当JOY_RUN_FLAG不设置或设置为 "true" 时生效
## 可选值：2,10,50，其他值不可以。其中2代表参加双人PK赛，10代表参加10人突围赛，50代表参加50人挑战赛，不填时默认为2
## 各个账号间请使用 & 分隔，比如：JOY_TEAM_LEVEL="2&2&50&10"
## 如果你有5个账号但只写了四个数字，那么第5个账号将默认参加2人赛，账号如果更多，与此类似
export JOY_TEAM_LEVEL=""


################################## 定义摇钱树是否自动将金果卖出变成金币（选填） ##################################
## 金币有时效，默认为 "false"，不卖出金果为金币，如想希望自动卖出，请修改为 "true"
export MONEY_TREE_SELL_FRUIT=""


################################## 定义东东萌宠是否静默运行（选填） ##################################
## 默认 "false"（不静默，发送推送通知消息），如想静默请修改为 true
## 每次执行脚本通知太频繁了，改成只在周三和周六中午那一次运行时发送通知提醒
## 除掉上述提及时间之外，均设置为 true，静默不发通知
## 特别说明：针对北京时间有效。
if [ $(date "+%w") -eq 6 ] && [ $(date "+%H") -ge 9 ] && [ $(date "+%H") -lt 14 ]; then
  export PET_NOTIFY_CONTROL="false"
elif [ $(date "+%w") -eq 3 ] && [ $(date "+%H") -ge 9 ] && [ $(date "+%H") -lt 14 ]; then
  export PET_NOTIFY_CONTROL="false"
else
  export PET_NOTIFY_CONTROL="true"
fi


################################## 定义手机狂欢城是否发送上车提醒（选填） ##################################
## 情况请见jd_818的日志，默认为 "false"，不发送上车提醒，如想要收到提醒，请修改为 "true"
## 暂时没有手机狂欢城活动
export JD_818_SHAREID_NOTIFY=""


################################## 定义东东工厂心仪的商品（选填） ##################################
## 只有在满足以下条件时，才自动投入电力：一是存储的电力满足生产商品所需的电力，二是心仪的商品有库存，如果没有输入心仪的商品，那么当前你正在生产的商品视作心仪的商品
## 如果你看不懂上面的话，请去东东工厂游戏中查阅攻略
## 心仪的商品请输入商品的全称或能唯一识别出该商品的关键字
export FACTORAY_WANTPRODUCT_NAME=""


################################## 定义京喜农场通知级别（选填） ##################################
## 可用值： 0(不通知); 1(本次获得水滴>0); 2(任务执行); 3(任务执行+未种植种子)，默认为"3"
export JXNC_NOTIFY_LEVEL="3"


################################## 定义取关参数（选填） ##################################
## jd_unsubscribe这个任务是用来取关每天做任务关注的商品和店铺，默认在每次运行时取关20个商品和20个店铺
## 如果取关数量不够，可以根据情况增加，还可以设置 jdUnsubscribeStopGoods 和 jdUnsubscribeStopShop 
## 商品取关数量
goodPageSize=""
## 店铺取关数量
shopPageSize=""
## 遇到此商品不再取关此商品以及它后面的商品，需去商品详情页长按拷贝商品信息
jdUnsubscribeStopGoods=""
## 遇到此店铺不再取关此店铺以及它后面的店铺，请从头开始输入店铺名称
jdUnsubscribeStopShop=""


################################## 定义注销店铺会员参数（选填） ##################################
## jd_unbind脚本需要的，注销京东已开的店铺会员，不是注销京东plus会员，个别店铺无法注销
## 此参数控制每次运行脚本时注销多少个店铺会员，默认200
export UN_BIND_CARD_NUM=""

## 遇到此参数设定的会员卡则跳过不进行注销，多个会员卡之间以 & 分隔，默认值"京东PLUS会员"
export UN_BIND_STOP_CARD=""


################################## 京东发现-看一看的视频抓包（选填） ##################################
## 虽然脚本内置了BODY，但强烈建议有能力者自行抓包，想要使用自行抓的包有两种方式：
## 1.按照jd_watch.js脚本中的注释说明，抓包后另存为watch.chlsj，放在和jd_watch.js同一个目录下，物理机用户建议用此方法
## 2.按照jd_watch.js脚本中的注释说明，把抓到的包整理后填在下面（WATCH_ACCEPTBODY和WATCH_DOBODY各需40个，每个之间使用@符号隔开），Docker用户建议用此方法
## 如需使用，请自行解除下一行注释
# export WATCH_ACCEPTBODY=""
# export WATCH_DOBODY=""


################################## 疯狂的JOY（选填） ##################################
## 疯狂的JOY循环助力，"true" 表示循环助力，"false" 表示不循环助力，默认 "false"
export JDJOY_HELPSELF=""

## 疯狂的JOY京豆兑换，目前最小值为500/1000京豆，默认为 "0" 不开启京豆兑换
export JDJOY_APPLYJDBEAN=""

## 疯狂的JOY自动购买什么等级的JOY，如需要使用请自行解除注释
# export BUY_JOY_LEVEL=""


################################## 定义是否自动加购物车（选填） ##################################
## 口袋书店和东东小窝有些任务需要将商品加进购物车才能完成，默认 "false" 不做这些任务，如想做，请设置为 "true"
export PURCHASE_SHOPS=""


################################## Telegram 代理（选填） ##################################
## Telegram 代理的 IP，代理类型为 http，比如你代理是 http://127.0.0.1:1080，则填写 "127.0.0.1"
## 如需使用，请自行解除下一行的注释
# export TG_PROXY_HOST=""

## Telegram 代理的端口，代理类型为 http，比如你代理是 http://127.0.0.1:1080，则填写 "1080"
## 如需使用，请自行解除下一行的注释
# export TG_PROXY_PORT=""


################################## 是否添加DIY脚本（选填） ##################################
## 如果你自己会写shell脚本，并且希望在每次git_pull.sh这个脚本运行时，额外运行你的DIY脚本，请赋值为 "true"
## 同时，请务必将你的脚本命名为 diy.sh (只能叫这个文件名)，放在 config 目录下
## 我已定义好的变量，你如果想直接使用，可以参考本仓库下 git_pull.sh 文件
EnableExtraShell=""


################################## 额外的环境变量（选填） ##################################
## 请在以下补充你需要用到的额外的环境变量，形式：export 变量名="变量值"

