% Step 1: Define parameters
K_values = [1, 5, 15, 50, 100]; % Values of K
num_iterations = 1000;          % Number of simulations
p_values = 0.01:0.01:0.99;      % Probability of failure values (0.01 to 0.99)

% Step 2: Initialize matrices to store simulated and calculated results
simulated_results_all_K = zeros(length(K_values), length(p_values));
calculated_results_all_K = zeros(length(K_values), length(p_values));

for k_idx = 1:length(K_values)
    K = K_values(k_idx);
    
    for p_idx = 1:length(p_values)
        p = p_values(p_idx);
        
        % Call the provided function to get the simulated result
        simulated_results_all_K(k_idx, p_idx) = runSingleLinkSim(K, p, num_iterations);
        
        % Calculate the theoretical average number of transmissions needed
        calculated_results_all_K(k_idx, p_idx) = K / (1 - p);
    end
end

% Step 3: Plot results for each K value
figure;
hold on;

colors = lines(length(K_values)); % Get distinct colors for each K

for k_idx = 1:length(K_values)
    K = K_values(k_idx);
    
    % Plot calculated results
    plot(p_values, calculated_results_all_K(k_idx, :), ...
         'Color', colors(k_idx, :), 'LineWidth', 2, 'DisplayName', sprintf('Calculated (K=%d)', K));
     
    % Plot simulated results
    scatter(p_values, simulated_results_all_K(k_idx, :), ...
            'MarkerEdgeColor', colors(k_idx, :), ...
            'MarkerFaceColor', 'none', 'SizeData', 100, 'DisplayName', sprintf('Simulated (K=%d)', K));
end

% Formatting the figure
xlabel('Probability of Success (p)');
ylabel('Average Number of Transmissions');
title('Calculated vs Simulated Results for Different K Values');
legend('Location', 'Best');
set(gca, 'YScale', 'log'); % Logarithmic scale for y-axis
grid on;
hold off;

% Step 4: Plot all results in a single figure
figure;
hold on;

for k_idx = 1:length(K_values)
    K = K_values(k_idx);
    
    % Plot calculated results
    plot(p_values, calculated_results_all_K(k_idx, :), ...
         'Color', colors(k_idx, :), 'LineWidth', 2);
     
    % Plot simulated results
    scatter(p_values, simulated_results_all_K(k_idx, :), ...
            'MarkerEdgeColor', colors(k_idx, :), ...
            'MarkerFaceColor', 'none', 'SizeData', 100);
end

% Formatting the figure
xlabel('Probability of Success (p)');
ylabel('Average Number of Transmissions');
title('All K Values - Calculated vs Simulated Results');
legend(arrayfun(@(x) sprintf('K = %d', x), K_values, 'UniformOutput', false), ...
       'Location', 'Best');
set(gca, 'YScale', 'log'); % Logarithmic scale for y-axis
grid on;
hold off;
