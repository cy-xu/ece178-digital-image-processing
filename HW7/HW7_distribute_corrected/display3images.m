function [] = display3images(img_cell, title_str, sub_title)

figure,
subplot(1,3,1), subimage(img_cell{1}), axis off;
title(sub_title{1})
subplot(1,3,2), subimage(img_cell{2}), axis off;
title(sub_title{2})
subplot(1,3,3), subimage(img_cell{3}), axis off;
title(sub_title{3})
set(gcf,'NextPlot','add');
axes;
h = title(title_str);
set(gca,'Visible','off');
set(h,'Visible','on');