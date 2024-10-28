% Task 5 Program File
clc;
clear;

K_values = [1, 5, 10]; % Different K values
N = 1000; % Number of iterations
p1_configs = {0.10, 0.60}; % First two configurations of p1
p2_configs = {0.60, 0.10}; % Second two configurations of p2
p3 = 0.01:0.01:0.99; % Range for p3 (1% to 99%)

% Store figure handles for individual plots
figureHandles = zeros(1, 6);

% Initialize a figure for all configurations
figure('Name', 'Combined Figure of All Configurations'); 
hold on;

for figNum = 1:6
    % Create individual figure for each configuration
    figureHandles(figNum) = figure('Name', sprintf('Figure %d', figNum)); 
    hold on;
    
    % Determine the current probabilities based on the figure number
    if figNum == 1
        p1 = p1_configs{1}; 
        p2 = p2_configs{1};
    elseif figNum == 2
        p1 = p1_configs{2}; 
        p2 = p2_configs{2};
    elseif figNum == 3
        p1 = p1_configs{1}; 
        p2 = 0; % Minimum probability for p2
    elseif figNum == 4
        p1 = p1_configs{2}; 
        p2 = 0; % Minimum probability for p2
    elseif figNum == 5
        p1 = 0; % Minimum probability for p1
        p2 = p2_configs{1}; 
    elseif figNum == 6
        p1 = 0; % Minimum probability for p1
        p2 = p2_configs{2}; 
    end
    
    % Simulate for different K values
    for K = K_values
        simResults = zeros(length(p3), 1);
        
        for j = 1:length(p3)
            simResults(j) = runCustomCompoundNetworkSim(K, p1, p2, p3(j), N);
        end
        
        % Plot results on individual figure
        plot(p3 * 100, simResults, 'o-', 'DisplayName', sprintf('K = %d', K)); % Convert p3 to percentage
        
        % Plot results on the combined figure
        plot(p3 * 100, simResults, 'o-', 'DisplayName', sprintf('Figure %d, K = %d', figNum, K)); % Convert p3 to percentage
    end
    
    % Formatting the individual figure
    xlabel('Packet Failure Probability (%)');
    ylabel('Average Number of Transmissions');
    title(sprintf('Average Number of Transmissions for Different K Values (Figure %d)', figNum));
    set(gca, 'YScale', 'log'); % Set logarithmic scale
    grid on;
    legend('show');
    hold off;
end

% Formatting the combined figure
xlabel('Packet Failure Probability (%)');
ylabel('Average Number of Transmissions');
title('Combined Average Number of Transmissions for All Configurations');
set(gca, 'YScale', 'log'); % Set logarithmic scale
grid on;
legend('show');
hold off;
