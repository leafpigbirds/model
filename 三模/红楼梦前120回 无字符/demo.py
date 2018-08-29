# -*- coding: utf-8 -*-
# coding=utf-8
import collections
f1 = open("sum_OUT",'a',encoding='utf8')
for i in range(1,121):
	name=str(i)+".txt"
	f1.write(name)
	f = open(name, 'r', encoding='utf8')  # 打开文件，并读取要处理的大段文字
	txt1 = f.read()
	print(" ",len(txt1),file=f1)