toolkit
=======

个人小工具
这些工具都可以放到~/bin/下面，作为命令来使用

=== cll ===
cd+ll
当然它有更高级的功能，不过一般用不着
在~/.bashrc里面加下面一句才可用：
alias cll="source cll"

=== cls ===
cd+ls
与cll一样
alias cls="source cls"

=== viw ===
viw file
查看一个文件的内容，如果文件少于100行，则用cat命令查看
否则，用less命令来查看

=== lc ===
lc rootdir file-postfix
行数计算，本人用于查看源代码的行数
rootdir是目录，迭代检查该目录下所有以file-postfix为后缀名的文件
罗列它们，并统计行数，最后计算总行数
例如：lc sqlalchemy py
统计sqlalchemy文件夹下，所有.py文件的行数

=== chargeup ===
简易记账工具，详情请查看该工具的readme文件
注意：用的时候需要把相应环境搭好，然后直接把chargeup文件放到~/bin/下面，不是放文件夹
