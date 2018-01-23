# 金庸群侠传 SDL Linux_x64

## 2018-1-22  更新
修改说明：
1. 修改Lua默认编码gbk为utf-8，增加jycharset.lua编码模块，替换原C的转换代码
2. 存档使用的编码依旧为big5，存储或读档时会转为utf-8

## 运行
SDL、Lua等库文件放在Lib目录下，无需手动下载，运行脚本会设置LD_LIBRARY_PATH
> ./jysdllua.sh

## 截图
![Alt text](./screenshot.png)
