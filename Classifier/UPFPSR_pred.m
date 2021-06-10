close all
clear
clc

load('train.mat')
trainfeature=PAAC_DBPB_EGAAC_PWAAtrain;

load('test.mat')
testfeature =PAAC_DBPB_EGAAC_PWAAtest;

train_x=trainfeature;
train_y=[1*ones(1,2750),-1*ones(1,2750)]';
test_x = testfeature;
test_y = [1*ones(1,750),-1*ones(1,750)]';

model1=TreeBagger(200,train_x,train_y,'Method','classification');
[pre1,dec_values1] = predict(model1,test_x);
pre1=str2double(pre1);

t = size(test_y,1);
pt1=numel(find(test_y==1));
nt1=numel(find(test_y==-1));
TP1=numel(find(pre1(1:pt1,1)==1));
TN1=numel(find(pre1(pt1+1:t,1)==-1));
[X1,Y1,THRE1,AUC1] = perfcurve(test_y,dec_values1(:,2),'1');
plot(X1,Y1)    
title('The ROC curves');
FP1=nt1-TN1; 
FN1=pt1-TP1; 
value1=[TP1,FP1,TN1,FN1];
Sn1=TP1/(TP1+FN1);
Sp1=TN1/(TN1+FP1);
Acc1=(TP1+TN1)/(TP1+TN1+FP1+FN1);
MCC1=(TP1*TN1-FP1*FN1)/sqrt((TP1+FP1)*(TP1+FN1)*(TN1+FP1)*(TN1+FN1));
Precision=TP1/(TP1+FP1);
Recall=TP1/(TP1+FN1);
F_Score=(2*Precision*Recall)/(Precision+Recall);
Result1=[Acc1,Precision,Recall,F_Score,AUC1] 