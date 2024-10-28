function result = runTwoParallelLinkSim(K, p, N)
    simResults = ones(1, N); % Store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % Transmission count for each simulation
        pktSuccessCount = 0; % Count of packets successfully transmitted
        
        while pktSuccessCount < K
            txAttemptCount = txAttemptCount + 1; % Each transmission attempt
            
            % Check success for each parallel link
            link1_success = rand > p;
            link2_success = rand > p;
            
            % If either link succeeds, the packet is considered transmitted
            if link1_success || link2_success
                pktSuccessCount = pktSuccessCount + 1;
            end
        end
        simResults(i) = txAttemptCount; % Store transmission count for this simulation
    end
    
    result = mean(simResults); % Return the average transmission count
end
