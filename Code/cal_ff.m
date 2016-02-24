%cal_ff()

rgb = impixel(im ,swarmx ,swarmy);
swarmval = ((rgb(:,1)-Ro).^2+(rgb(:,2)-Go).^2+(rgb(:,3)-Bo).^2).^(1/2);%Eucledian distance metric
