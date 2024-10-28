% Define parameters
K_values = [1, 5, 15, 50, 100];
N = 1000; % Number of iterations
p_values = 0.01:0.01:0.99; % Range of failure probabilities

% Loop through each K value and plot results
figure;
hold on; % Hold to plot all K values on the same figure

for k = 1:length(K_values)
    K = K_values(k);
    simulated_results = zeros(size(p_values));
    
    % Run simulations across each p value
    for j = 1:length(p_values)
        p = p_values(j);
        simulated_results(j) = runTwoParallelLinkSim(K, p, N);
    end
    
    % Plot simulated results with hollow circles
    semilogy(p_values, simulated_results, 'o', 'DisplayName', sprintf('Simulated K=%d', K));
end

% Add labels, legend, and title
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
title('Simulated Results for Two Parallel Link Network');
legend('show');
hold off;
