w=@(t) 0.6;
% iwts = [0.9 0.6];
% w=@(t) (t*(iwts(2)-iwts(1))/(kmax-1)+iwts(1));
vx = w(k)*vx + c1*rand(n,1).*(pbestx-swarmx) +c2*rand(n,1).*(gbestx-swarmx);
vy = w(k)*vy + c1*rand(n,1).*(pbesty-swarmy) +c2*rand(n,1).*(gbesty-swarmy);
vx(vx>vmax) = vmax;
vy(vy>vmax) = vmax;
  