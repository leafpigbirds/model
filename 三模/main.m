data1=xlsread('C:\Users\leafpigbirds\Desktop\database1.xlsx');
data=data1(2:56,:)';%ת��120*55
avg_data=sum(data(:,:))/120;%���ά��ƽ��ֵ
% avg_data1=mean(data);
data_adjust=data-avg_data;%�������ֵ������
cov_mat=cov(data_adjust);%Э�������
% cov_mat1=data_adjust'*data_adjust*1/119;
[eigenvectors,eigenvalues] = eig(cov_mat);
eigenvalues=diag(eigenvalues);
% disp('������(��С����):');
% disp(eigenvalues);
% disp('��������:');
% disp(eigenvectors);
eigenvectors=eigenvectors(:,54:55);
FinalData=data_adjust*eigenvectors;



