data1=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',3);
data=data1(2:43,1:40)';%转置80*55
avg_data=mean(data);%求各维度平均值
% avg_data=sum(data(:,:))/40;%求各维度平均值
data_adjust=data-avg_data;%矩阵零均值化处理
cov_mat=cov(data_adjust);%协方差矩阵
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'b*');
hold on;

data=data1(2:43,41:80)';%转置80*55
avg_data=mean(data);%求各维度平均值
% avg_data=sum(data(:,:))/40;%求各维度平均值
data_adjust=data-avg_data;%矩阵零均值化处理
cov_mat=cov(data_adjust);%协方差矩阵
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'g+');
hold on;

data=data1(2:43,81:120)';%转置40*55
avg_data=mean(data);%求各维度平均值
% avg_data=sum(data(:,:))/40;%求各维度平均值
data_adjust=data-avg_data;%矩阵零均值化处理
cov_mat=cov(data_adjust);%协方差矩阵
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'r+');