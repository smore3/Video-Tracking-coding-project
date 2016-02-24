%updatePG
for i=1:n
    if swarmval(i)<pbest(i)         %if better position is found
        pbest(i) = swarmval(i);     %update particle's best.
        pbestx(i) = swarmx(i);
        pbesty(i) = swarmy(i);       
       
    end
    
end

[tgbest tgi]=min(pbest);
if tgbest<gbest                     %If current iteration best is better than global best so far
    gbest = tgbest;                 %Update the Global best.
    gbestx = pbestx(tgi);
    gbesty = pbesty(tgi);
end
