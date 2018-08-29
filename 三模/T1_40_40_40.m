data1=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',4);
N=18+1;
data=data1(2:N,1:40)';%中80回数据读取 40*55
% Z=zscore(data);%标准化处理
Z=data-mean(data);
cov_M=cov(Z);%协方差矩阵
[Vectors,Values]=eig(cov_M);%特征向量 特征根（值）
D=diag(Values);%提取特征根
eig1=sort(D,'descend');%贡献率从小到大
V=fliplr(Vectors);%依照D重新排列
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'b*');
hold on;

data=data1(2:N,41:80)';%中40回数据读取 40*55
% Z=zscore(data);%标准化处理
Z=data-mean(data);
cov_M=cov(Z);%协方差矩阵
[Vectors,Values]=eig(cov_M);%特征向量 特征根（值）
D=diag(Values);%提取特征根
eig1=sort(D,'descend');%贡献率从小到大
V=fliplr(Vectors);%依照D重新排列
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'g.');
hold on;

data=data1(2:N,81:120)';%后40回数据读取 40*55
% Z=zscore(data);%标准化处理
Z=data-mean(data);
cov_M=cov(Z);%协方差矩阵
[Vectors,Values]=eig(cov_M);%特征向量 特征根（值）
D=diag(Values);%提取特征根
eig1=sort(D,'descend');%贡献率从小到大
V=fliplr(Vectors);%依照D重新排列
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'r+');
