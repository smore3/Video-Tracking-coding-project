%PSOinit()
% n = input('Enter maximum swarm size: ');
vmax = 10;                   %maximum velocity or distance between points 
                             %in two consecutive frames
n = 12;                      %swarm size
kmax = 5;                   %optimum number of iterations

%allocating n*1 size for initialisation
swarmx = ones(n,1);          %initialisation of x-co ordinates of swarm
swarmy = ones(n,1);          %initialisation of y-co ordinates of swarm
pbestx = ones(n,1);          %initialisation of co ordinates personal bests 
pbesty = ones(n,1);
gbestx = ones(1,1);          %initialisation of global best
gbesty = ones(1,1);
pbest = 255*sqrt(3)*ones(n,1);%initialisatoin done to the maximum value of pbest
gbest = 255*sqrt(3);         %initialisation done to the maximum value of gbest
vx = zeros(n,1);
vy = zeros(n,1);
c1 = 2;                      %weighing coefficients
c2 = 2;
FFth=50;                      %threshold fitness function value                      