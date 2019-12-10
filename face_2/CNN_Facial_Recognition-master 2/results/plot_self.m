function acc = plot_self(acc,pic_path,plotcolor,fontsize,linewidthval)
    figure;plot(acc*100,plotcolor,'LineWidth',3);hold on;
    set(gca,'LineWidth',linewidthval,'FontSize',fontsize);
    box off;
    axis square;
    xlabel('Epoch #','FontSize',fontsize);
    ylabel('Test Accuracy (%)','FontSize',fontsize);
    ylim([0 100]);
    saveas(gcf,pic_path,'png');
    disp('go')
end