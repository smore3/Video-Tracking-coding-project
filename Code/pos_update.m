%pos_update()
%calculate the position and store them in a temporary variable swarmt
swarmxt = swarmx+vx;
swarmyt = swarmy+vy;
%if the swarm goes out of range then do not update the position
swarmx(swarmxt<xrng & swarmxt>=1)=swarmxt(swarmxt<xrng & swarmxt>=1);
swarmy(swarmyt<yrng & swarmyt>=1)=swarmyt(swarmyt<yrng & swarmyt>=1);