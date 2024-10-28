% Main script for Task 2: Two Series Link Network Simulation
K_values = [1, 5, 15, 50, 100];
p_values = 0.01:0.01:0.99;
num_iterations = 1000; % Reduced temporarily for testing

% Arrays to store results
simulated_results_all_K = zeros(length(K_values), length(p_values));
calculated_results_all_K = zeros(length(K_values), length(p_values));

% Loop over each K value
for k_idx = 1:length(K_values)
    K = K_values(k_idx);

    % Loop over each p value
    for p_idx = 1:length(p_values)
        p = p_values(p_idx);

        % Run the simulation
        simulated_results_all_K(k_idx, p_idx) = runTwoSeriesLinkSim(K, p, num_iterations);

        % Theoretical average for two links
        calculated_results_all_K(k_idx, p_idx) = K / ((1 - p) ^ 2);
    end

    % Comment out individual plotting for each K
    % figure;
    % semilogy(p_values, calculated_results_all_K(k_idx, :), 'LineWidth', 1.5, 'Color', 'b');
    % hold on;
    % semilogy(p_values, simulated_results_all_K(k_idx, :), 'o', 'MarkerSize', 5, 'MarkerEdgeColor', 'r');
    % hold off;

    % title(['Task 2: Two Link Network for K = ', num2str(K)]);
    % xlabel('Failure Probability (p)');
    % ylabel('Average Number of Transmissions');
    % legend('Calculated', 'Simulated');
    % grid on;
end

% Combined Plot for all K values
figure;
colors = lines(length(K_values)); % Different colors for each K
for k_idx = 1:length(K_values)
    semilogy(p_values, calculated_results_all_K(k_idx, :), 'LineWidth', 1.5, 'Color', colors(k_idx, :));
    hold on;
    semilogy(p_values, simulated_results_all_K(k_idx, :), 'o', 'MarkerSize', 5, 'MarkerEdgeColor', colors(k_idx, :));
end
hold off;

title('Task 2: Two Link Network - Combined for All K Values');
xlabel('Failure Probability (p)');
ylabel('Average Number of Transmissions');
legend(arrayfun(@(k) ['K = ', num2str(k)], K_values, 'UniformOutput', false));
grid on;
