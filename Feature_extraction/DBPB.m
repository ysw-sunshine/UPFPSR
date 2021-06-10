clear;
clc;
function [DBPB1,DBPB2,DBPB3,DBPB4]=DBPB(positive,negative,Test_p,Test_n)
M1=length(positive{1,1});
x=(M1+1)/2;
n1=length(positive);
for i=1:n1
   positive{1,i}(x)='';
   s=positive{1,i};
   positive{1,i}=s;
end

n2=length(negative);
for i=1:n2
   negative{1,i}(x)='';
   s=negative{1,i};
   negative{1,i}=s;
end

AA='ACDEFGHIKLMNPQRSTVWYX';
M=length(negative{1,1});
F1=zeros(21*21,M-1);
F2=zeros(21*21,M-1);
for m=1:n1
    for k=1:M-1
        s=positive{1,m}(k);
        t=positive{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        F1(j+(i-1)*21,k)=F1(j+(i-1)*21,k)+1;
    end
end

for m=1:n2
    for k=1:M-1
        s=negative{1,m}(k);
        t=negative{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        F2(j+(i-1)*21,k)=F2(j+(i-1)*21,k)+1;
    end
end
F1= F1/n1;
F2= F2/n2;

DBPB1=zeros(n1,2*(M-1));
DBPB2=zeros(n2,2*(M-1));
for m=1:n1
    for k=1:M-1
        s=positive{1,m}(k);
        t=positive{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        DBPB1(m,k)=F1(j+(i-1)*21,k);
        DBPB1(m,M-1+k)=F2(j+(i-1)*21,k);
    end
end

for m=1:n2 
    for k=1:M-1
        s=negative{1,m}(k);
        t=negative{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        DBPB2(m,k)=F1(j+(i-1)*21,k);
        DBPB2(m,M-1+k)=F2(j+(i-1)*21,k);
    end
end

n3=length(Test_p);
n4=length(Test_n);
DBPB3=zeros(n3,2*(M-1));
DBPB4=zeros(n4,2*(M-1));
for i=1:n3
   Test_p{1,i}(x)='';
   s=Test_p{1,i};
   Test_p{1,i}=s;
end
for i=1:n4
   Test_n{1,i}(x)='';
   s=Test_n{1,i};
   Test_n{1,i}=s;
end
for m=1:n3
    for k=1:M-1
        s=Test_p{1,m}(k);
        t=Test_p{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        DBPB3(m,k)=F1(j+(i-1)*21,k);
        DBPB3(m,M-1+k)=F2(j+(i-1)*21,k);
    end
end
for m=1:n4
    for k=1:M-1
        s=Test_n{1,m}(k);
        t=Test_n{1,m}(k+1);
        i=strfind(AA,s);
        j=strfind(AA,t);
        DBPB4(m,k)=F1(j+(i-1)*21,k);
        DBPB4(m,M-1+k)=F2(j+(i-1)*21,k);
    end
end
end
