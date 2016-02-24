%swarmpos_init()

%% Using Array Operations
n=n/4;
r = random('Normal',0,1,2,n);
% r=rand(2,n);                  % 2D random array 2 x n
R=[r -r];                       % 2D random array 2 x 4n
for i=1:2*n
swarmx(i)=X+vmax*R(1,i);        % updating position for all n particles
swarmy(i)=Y+vmax*R(2,i);
swarmx(i+2*n)=X-vmax*R(1,i);
swarmy(i+2*n)=Y+vmax*R(2,i);
end
n=4*n;
%% Using gmdistribution and random
% mu = [X Y];
% sigma = [vmax vmax];
% obj = gmdistribution(mu,sigma);
% swarm = random(obj,n);
% swarmx=swarm(:,1);
% swarmy=swarm(:,2);
%% Common part
%The particles that go out of frame are relocated on edges.
swarmx(swarmx>xrng)=xrng;
swarmy(swarmy>yrng)=yrng;
