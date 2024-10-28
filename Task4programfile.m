%% Main Program for Task 4
% Parameters
K_values = [1, 5, 15, 50, 100]; % Different packet sizes
p_values = 0.01:0.01:0.99;      % Range of probabilities
N = 1000;                        % Number of simulations per configuration
compoundResults = zeros(length(K_values), length(p_values)); % Initialize storage for results

% Run simulation for each K value across all p values
for kIdx = 1:length(K_values)
    K = K_values(kIdx);
    for pIdx = 1:length(p_values)
        p = p_values(pIdx);
        % Call compound network simulation
        compoundResults(kIdx, pIdx) = runCompoundNetworkSim(K, p, N);
    end

    % Plotting the results for each K value
    figure;
    semilogy(p_values, compoundResults(kIdx, :), 'o'); % Plot simulated results
    title(['Task 4: Compound Network Simulation for K = ', num2str(K)]);
    xlabel('Failure Probability, p');
    ylabel('Average Number of Transmissions');
    legend('Simulated Results');
end

% Combined plot with all K values
figure;
hold on;
for kIdx = 1:length(K_values)
    semilogy(p_values, compoundResults(kIdx, :), 'o'); % Plot all K values
end
title('Task 4: Compound Network Simulation for All K Values');
xlabel('Failure Probability, p');
ylabel('Average Number of Transmissions');
legend(arrayfun(@(k) ['K = ', num2str(k)], K_values, 'UniformOutput', false));
hold off;
\