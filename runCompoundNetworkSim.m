%% Function runCompoundNetworkSim()
% Parameters:
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average number of transmissions required for K successful packets
function result = runCompoundNetworkSim(K, p, N)
    simResults = ones(1, N);  % Store each simulation's total transmissions

    for i = 1:N
        txAttemptCount = 0;  % Transmission attempts counter
        pktSuccessCount = 0; % Number of successfully transmitted packets

        while pktSuccessCount < K
            txAttemptCount = txAttemptCount + 1; % Increment attempts

            % Simulate parallel links (Task 3) and series link (Task 2)
            link1 = rand > p;
            link2 = rand > p;
            seriesLink = rand > p;
            
            % Packet is successfully transmitted if it passes either the
            % parallel path (link1 or link2) or the series link
            if (link1 || link2) && seriesLink
                pktSuccessCount = pktSuccessCount + 1;
            end
        end
        simResults(i) = txAttemptCount; % Record total transmissions for this simulation
    end

    result = mean(simResults); % Average transmissions over all simulations
end
