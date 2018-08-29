# -*- coding: utf-8 -*-
# coding=utf-8
import jieba
import jieba.analyse
text=''
f1 = open("dict",'a',encoding='utf8')
f = open('T2.txt', 'r', encoding='utf8')  # 要进行分词处理的文本文件 (统统按照utf8文件去处理，省得麻烦)
text1=f.read();
seg_list = jieba.cut(text1, cut_all=False)
print("Default Mode: " + "/ ".join(seg_list))  # 精确模式
f1.write( "Default Mode: " + "/ ".join(seg_list) )