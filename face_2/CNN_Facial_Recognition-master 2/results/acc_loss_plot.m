clear all;
close all;
fontsize=15;
linewidthval=2;
plotcolor='b';
plotcolor_nodropout='r';
plotcolor_3='g';
dirname='/Users/Sean/Documents/GitHub/cogs 118b/face_2/CNN_Facial_Recognition-master/';
dirData = dir(dirname);      %# Get the data for the current directory
dirIndex = [dirData.isdir];  %# Find the index for directories
fileList = {dirData(~dirIndex).name}';
for k = 1:length(fileList)
    temp = char(fileList(k));
  if temp(1:3)=='acc'
    accuracy=csvread(strcat(dirname,temp));
    figure;plot(accuracy*100,plotcolor,'LineWidth',3);hold on;
    set(gca,'LineWidth',linewidthval,'FontSize',fontsize);
    box off;
    axis square;
    xlabel('Epoch #','FontSize',fontsize);
    ylabel('Test Accuracy (%)','FontSize',fontsize);
    ylim([0 100]);
    saveas(gcf,strcat(dirname,temp),'png');
    %plot(accuracy_nodropout*100,plotcolor_nodropout,'LineWidth',3);
  elseif temp(1:3)== 'los'
    loss = csvread(strcat(dirname,temp));
    figure;plot(loss,plotcolor,'LineWidth',3);hold on;
    set(gca,'LineWidth',linewidthval,'FontSize',fontsize);hold on;
    box off;
    axis square;
    xlabel('Epoch #','FontSize',fontsize);
    ylabel('Loss','FontSize',fontsize);
    %saveas(gcf,strcat(dirname,'CNNloss_graph'),'png');
    plot(loss,plotcolor,'LineWidth',3);hold on;
    saveas(gcf,strcat(dirname,temp),'png');
    %plot(loss_nodropout*100,plotcolor_nodropout,'LineWidth',3);
  else
    continue
  end
end
temp1 = 'accuracy_dropout_1_avgpool_Adam'
temp2 = 'accuracy_dropout_0.5_avgpool_Adam'
temp3 = 'accuracy_dropout_0.8_avgpool_Adam'
temp4 = 'accuracy_dropout_1_maxpool_Adam'
temp5 = 'accuracy_dropout_0.5_maxpool_Adam'
temp6 = 'accuracy_dropout_0.8_maxpool_Adam'
accuracy1=csvread(strcat(dirname,temp1));
accuracy2=csvread(strcat(dirname,temp2));
accuracy3=csvread(strcat(dirname,temp3));
accuracy4=csvread(strcat(dirname,temp4));
accuracy5=csvread(strcat(dirname,temp5));
accuracy6=csvread(strcat(dirname,temp6));

figure;
plot(accuracy1*100,plotcolor_nodropout,'LineWidth',2);hold on;
set(gca,'LineWidth',linewidthval,'FontSize',fontsize);
box off;
axis square;
xlabel('Epoch #','FontSize',fontsize);
ylabel('Test Accuracy (%)','FontSize',fontsize);
ylim([0 100]);
plot(accuracy2*100,plotcolor,'LineWidth',2);
plot(accuracy3*100,plotcolor_3,'LineWidth',2);
leg=legend('Avgpool Without Dropout','Avgpool With Dropout 0.5','Avgpool With Dropout 0.2');
set(leg,'box','off','FontSize',fontsize,'Location','SouthEast');
saveas(gcf,strcat(dirname,'CNNaccuracy_graph_comparison_Avgpool'),'png');

figure;
plot(accuracy4*100,plotcolor_nodropout,'LineWidth',2);hold on;
set(gca,'LineWidth',linewidthval,'FontSize',fontsize);
box off;
axis square;
xlabel('Epoch #','FontSize',fontsize);
ylabel('Test Accuracy (%)','FontSize',fontsize);
ylim([0 100]);
plot(accuracy5*100,plotcolor,'LineWidth',2);
plot(accuracy6*100,plotcolor_3,'LineWidth',2);
leg=legend('Maxpool Without Dropout','Maxpool With Dropout 0.5','Maxpool With Dropout 0.2');
set(leg,'box','off','FontSize',fontsize,'Location','SouthEast');
saveas(gcf,strcat(dirname,'CNNaccuracy_graph_comparison_Maxpool'),'png');

%loss_nodropout=csvread(strcat(dirname,'your_file'));
%leg=legend('With Dropout','Without Dropout');
%set(leg,'box','off','FontSize',fontsize);
%saveas(gcf,strcat(dirname,'CNNloss_graph_dropoutvsnodropout'),'png');
