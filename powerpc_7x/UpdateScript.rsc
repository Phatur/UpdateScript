/system script
add dont-require-permissions=no name=StartRouterUpdate owner=root policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    file remove \"UpdateScript.rsc\"\r\
    \n/system script remove StartRouterUpdate\r\
    \n\r\
    \n/system script add name=UpgradeRouterBOARD source=\"\\\r\
    \n    /system routerboard upgrade; \\\r\
    \n    :delay 3s; \\\r\
    \n    /system script remove UpgradeRouterBOARD; \\\r\
    \n    /system scheduler remove run-UpgradeRouterBOARD; \\\r\
    \n    /system reboot\"; \\\r\
    \n/system scheduler add name=run-UpgradeRouterBOARD start-time=startup on-\
    event=UpgradeRouterBOARD;\r\
    \n/tool fetch url=\"https://download.mikrotik.com/routeros/7.15.3/routeros\
    -7.15.3-arm.npk\" mode=https;\r\
    \n:delay 5s;\r\
    \n/system reboot;\r\
    \n"
