data1=xlsread('C:\Users\leafpigbirds\Desktop\database1.xlsx');
data=data1(2:56,:)';%转置120*55
avg_data=sum(data(:,:))/120;%求各维度平均值
% avg_data1=mean(data);
data_adjust=data-avg_data;%矩阵零均值化处理
cov_mat=cov(data_adjust);%协方差矩阵
% cov_mat1=data_adjust'*data_adjust*1/119;
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
% disp('特征根(由小到大):');
% disp(eigenvalues);
% disp('特征向量:');
% disp(eigenvectors);
eigenvectors=eigenvectors(:,54:55);
FinalData=data_adjust*eigenvectors;



