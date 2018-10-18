clc;
clear all;
load('./DataSet/DataSet.mat');
Labels1=Labels;
Labels1(Labels1==1)=-1;
Labels1(Labels1==2)=-1;
Labels1(Labels1==0)=1;
X0=[DataHist(1:15000,:) Labels1(1:15000,:)];
for i=1:256
   X(:,i)=(X0(:,i)-mean(X0(:,i)))/(std(X0(:,i)));
end
[m,~]=size(X);
e=ones(m,1);
D=X0(:,257);
B=zeros(m,m);
C=zeros(m,m);
B(logical(eye(size(B))))=1;
for i=1:m
    C(i,i)=D(i,1);
end
A=[-X.*D,D,-B];
b=-e;
f=[zeros(1,257),ones(1,m)];
lb=[-inf.*ones(1,257),zeros(1,m)]';
x=linprog(f,A,b,[],[],lb);
W=x(1:256,1);
CC=x(257,1);
X1=X(:,1:256);
R1=X1*W-CC;
R=R1;
W_sp = W;
CC_sp=CC;


Labels2=Labels;
Labels2(Labels2==1)=1;
Labels2(Labels2==0)=-1;
Labels2(Labels2==2)=-1;
X0=[DataHist(1:15000,:) Labels2(1:15000,:)];
for i=1:256
   X(:,i)=(X0(:,i)-mean(X0(:,i)))/(std(X0(:,i)));
end
[m,~]=size(X);
e=ones(m,1);
D=X0(:,257);
B=zeros(m,m);
B(logical(eye(size(B))))=1;
C=zeros(m,m);
for i=1:m
    C(i,i)=D(i,1);
end
A=[-X.*D,D,-B];
b=-e;
f=[zeros(1,257),ones(1,m)];
lb=[-inf.*ones(1,257),zeros(1,m)]';
x=linprog(f,A,b,[],[],lb);
W=x(1:256,1);
CC=x(257,1);
X1=X(:,1:256);
R1=X1*W-CC;
R=[R R1];
W_ga = W;
CC_ga=CC;

Labels3=Labels;
Labels3(Labels3==1)=-1;
Labels3(Labels3==0)=-1;
Labels3(Labels3==2)=1;
X0=[DataHist(1:15000,:) Labels3(1:15000,:)];
for i=1:256
   X(:,i)=(X0(:,i)-mean(X0(:,i)))/(std(X0(:,i)));
end
[m,~]=size(X);
e=ones(m,1);
D=X0(:,257);
B=zeros(m,m);
B(logical(eye(size(B))))=1;
C=zeros(m,m);
for i=1:m
    C(i,i)=D(i,1);
end
A=[-X.*D,D,-B];
b=-e;
f=[zeros(1,257),ones(1,m)];
lb=[-inf.*ones(1,257),zeros(1,m)]';
x=linprog(f,A,b,[],[],lb);
W=x(1:256,1);
CC=x(257,1);
X1=X(:,1:256);
R1=X1*W-CC;
R=[R R1];
W_po = W;
CC_po=CC;

Mx0=mean(X0);
Sx0=std(X0);

save('./DataSet/params.mat','W_sp','W_ga','CC_sp','CC_ga','W_po','CC_po')
save('./DataSet/NormParams.mat','Mx0','Sx0')