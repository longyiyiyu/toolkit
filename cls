#!/bin/bash
###
# @file -- cls
# @brief -- combine the 'cd' and 'ls' together
# @[$1] -- the path you want to go to, the default is 'ls' for no input
# @[$2] -- ...
# @output -- list the file you input or goto the path and list the files
# @return --
# @author -- Li Qinglong
# @date -- 2011.7.13
# @version -- 2.0 增加了相对跳转功能，但是应该不会有多少用处，因为相对跳转不能使用自动补全功能
###

#dflag=0;
fflag=1;
fix=1;
fullpath=`pwd`;

#这里有错误，一个shell只会搭配一个全局的getopts动作，猜想它内置了一个计数器，用了一次之后就读不了第二次的参数了
#while getopts :r OPTION
#do
#	case ${OPTION} in
#	r)
#		fix=1;
#		;;
#	\?)
#		echo "Usage: `basename $0` [-r] [paths or files]";
#		;;
#	esac
#done	

#shift `expr ${OPTIND} - 1`;

if [ $# -eq 0 ]
then
	ls;
else
	if [ $1 = "-r" ]
	then
		fix=0;
		shift;
	fi

	for file in $@
	do
		basename=`basename ${file}`;
		dirname=`dirname ${file}`;
		if [ -d ${dirname}/${basename} ]
		then
			#echo "fix is [${fix}]";
			if [ ${fix} -eq 0 ]
			then
				cd ${dirname}/${basename};
			else
				fullpath=${dirname}/${basename};
			fi

			if [ ${fflag} -eq 1 ]
			then
				fflag=0;
			else
				if [ ${fix} -eq 0 ]
				then
					echo "the files in `pwd`:";
				else
					echo "the files in `pwd`/${dirname}/${basename}:";
				fi
			fi

			if [ ${fix} -eq 0 ]
			then
				ls;
			else
				ls ${dirname}/${basename};
			fi
		elif [ -f ${dirname}/${basename} ]
		then
			ls ${dirname}/${basename};
			fflag=0;
		else
			echo "file ${dirname}/${basename} does not exist, please check the relation path!";
		fi
		#echo "now we in `pwd`";
		echo;
	done
	if [ ${fix} -eq 1 ]
	then
		cd ${fullpath};
	fi
fi
