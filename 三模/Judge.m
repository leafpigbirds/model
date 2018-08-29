data1=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',2);
X=data1(2:56,1:40)';
[p,n]=size(X);
for j=1:n
    mju(j)=mean(X(:,j));
    sigma(j)=sqrt(cov(X(:,j)));
end
for i=1:p
    for j=1:n
        Y(i,j)=(X(i,j)-mju(j))/sigma(j);
    end
end
sigmaY=cov(Y);
%求X标准化的协差矩阵的特征根和特征向量
[T,lambda]=eig(sigmaY);
disp('特征根(由小到大):');
disp(lambda);
disp('特征向量:');
disp(T);
%方差贡献率;累计方差贡献率
Xsum=sum(sum(lambda,2),1);
for i=1:n
    fai(i)=lambda(i,i)/Xsum;
end
for i=1:n
    psai(i)= sum(sum(lambda(1:i,1:i),2),1)/Xsum;
end
disp('方差贡献率:');
disp(fai);
disp('累计方差贡献率:');
disp(psai);
