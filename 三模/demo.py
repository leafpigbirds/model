# -*- coding: utf-8 -*-
# coding=utf-8
import collections
f1 = open("sum_OUT",'a',encoding='utf8')
for i in range(121)
	name=str(i)+".txt"
	f1.write(name,":")
	f = open(name, 'r', encoding='utf8')  # 打开文件，并读取要处理的大段文字
	f1.write()
	txt1 = f.read()
	txt1 = txt1.replace('\n', '')  # 删掉换行符
	txt1 = txt1.replace('，', '')  # 删掉逗号
	txt1 = txt1.replace('。', '')  # 删掉句号
	mylist = list(txt1)
	mycount = collections.Counter(mylist)
	for key, val in mycount.most_common(10000):  # 有序（返回前10个）
		f1.write(key, val)
	del mycount
	del mylist
	del txt1