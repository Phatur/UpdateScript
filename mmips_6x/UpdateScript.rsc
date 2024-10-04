/system script
add dont-require-permissions=no name=StartRouterUpdate owner=root policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system script add name=UpgradeRouter source=\"/tool fetch url=\\\"https://\
    download.mikrotik.com/routeros/7.15.3/routeros-7.15.3-mmips.npk\\\" mode=\
    https; \\\r\
    \n    /system script add name=UpgradeRouterBOARD source=\\\"\\\r\
    \n        /system routerboard upgrade; \\\r\
    \n        :delay 3s; \\\r\
    \n        /system script remove UpgradeRouterBOARD; \\\r\
    \n        /system scheduler remove run-UpgradeRouterBOARD; \\\r\
    \n        /system reboot\\\"; \\\r\
    \n    /system scheduler add name=run-UpgradeRouterBOARD start-time=startup\
    \_on-event=UpgradeRouterBOARD; \\\r\
    \n    /system scheduler remove run-UpgradeRouter; \\\r\
    \n    /system script remove UpgradeRouter; \\\r\
    \n    :delay 5s; \\\r\
    \n    /system reboot; \\\r\
    \n\"\r\
    \n\r\
    \n/system scheduler add name=run-UpgradeRouter start-time=startup interval\
    =60s on-event=UpgradeRouter;\r\
    \n\r\
    \n/file remove \"UpdateScript.rsc\"\r\
    \n/system script remove StartRouterUpdate\r\
    \n\r\
    \n/system package update set channel=testing; \\\r\
    \n/system package update check-for-updates once; \\\r\
    \n:delay 5s; \\\r\
    \n:if ([/system package update get status] = \"New version is available\")\
    \_do={{ \\\r\
    \n    /system package update install; \\\r\
    \n}}\r\
    \n"
