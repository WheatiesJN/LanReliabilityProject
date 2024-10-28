function avgTransmissions = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    totalTransmissions = 0;
    
    for n = 1:N
        transmissions = 0;
        
        for k = 1:K
            % Reset for each packet
            successfulTransmission = false;
            
            while ~successfulTransmission
                transmissions = transmissions + 1; % Count each attempt
                
                % Simulate the success of sending the packet through the network
                if rand() > p1 && (rand() > p2 || rand() > p3)
                    successfulTransmission = true; % Packet successfully transmitted
                end
            end
        end
        
        totalTransmissions = totalTransmissions + transmissions; % Aggregate transmissions
    end
    
    avgTransmissions = totalTransmissions / N; % Calculate average
end
