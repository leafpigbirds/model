# -*- coding: utf-8 -*-
# coding=utf-8
import jieba
import jieba.analyse
text=''
f1 = open("dict",'a',encoding='utf8')
f = open('T2.txt', 'r', encoding='utf8')  # Ҫ���зִʴ�����ı��ļ� (ͳͳ����utf8�ļ�ȥ����ʡ���鷳)
text1=f.read();
seg_list = jieba.cut(text1, cut_all=False)
print("Default Mode: " + "/ ".join(seg_list))  # ��ȷģʽ
f1.write( "Default Mode: " + "/ ".join(seg_list) )