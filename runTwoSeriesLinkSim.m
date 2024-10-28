function result = runTwoSeriesLinkSim(K, p, N)
    simResults = zeros(1, N); % Store results for each simulation

    for i = 1:N
        totalAttempts = 0; % Total attempts for each simulation
        packetsTransmitted = 0; % Counter for successful packets through both links

        while packetsTransmitted < K
            link1Success = rand > p; % First link transmission
            link2Success = rand > p; % Second link transmission
            totalAttempts = totalAttempts + 1;

            % Both links must be successful to count as a successful packet
            if link1Success && link2Success
                packetsTransmitted = packetsTransmitted + 1;
            end
        end
        simResults(i) = totalAttempts;
    end

    result = mean(simResults); % Average transmissions for this simulation
end
