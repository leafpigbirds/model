data1=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',3);
data=data1(2:43,1:40)';%ת��80*55
avg_data=mean(data);%���ά��ƽ��ֵ
% avg_data=sum(data(:,:))/40;%���ά��ƽ��ֵ
data_adjust=data-avg_data;%�������ֵ������
cov_mat=cov(data_adjust);%Э�������
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'b*');
hold on;

data=data1(2:43,41:80)';%ת��80*55
avg_data=mean(data);%���ά��ƽ��ֵ
% avg_data=sum(data(:,:))/40;%���ά��ƽ��ֵ
data_adjust=data-avg_data;%�������ֵ������
cov_mat=cov(data_adjust);%Э�������
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'g+');
hold on;

data=data1(2:43,81:120)';%ת��40*55
avg_data=mean(data);%���ά��ƽ��ֵ
% avg_data=sum(data(:,:))/40;%���ά��ƽ��ֵ
data_adjust=data-avg_data;%�������ֵ������
cov_mat=cov(data_adjust);%Э�������
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
eigenvectors=eigenvectors(:,41:42);
FinalData=data_adjust*eigenvectors;
% FinalData=abs(FinalData);
plot(FinalData(:,1),FinalData(:,2),'r+');