function [bestSol, bestCost] = sim_anneal_opt(LB,UB,initTemp,coolRate)
    % LB, UB is upper, lower bound respectively, initTemp is initial temp,
    % coolRate is cooling rate. bestSol and bestCost are the best solution
    % and best cost respectively. 

    currSol = LB + (UB - LB) * rand();
    bestSol = currSol;
   
    currCost = f(currSol);
   
    for i = 1:nIter
        neighborSol = currSol + randn() * (UB - LB);
        neighborSol = max(min(neighborSol, UB), LB);
        neighborCost = f(neighborSol);
        aP = exp((currCost - neighborCost) / initTemp);
        if neighborCost < currCost || rand() < aP
            currSol = neighborSol;
            currCost = neighborCost;
        end

        if currCost < f(bestSol)
            bestSol = currSol;
        end
        initTemp = initTemp * coolRate;
    end

    bestCost=f(bestSol);
end