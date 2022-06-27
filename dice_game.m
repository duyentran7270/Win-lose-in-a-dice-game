clear all; close all;

n = 10000;    % number of simulations 

x = 1:6;    % create a vector of possible cases

budget = 10;    % initial amount of money
win = 10;   % amount of money a player wins
game_cost = 1;  % game price

num_dice = 4;   % number of dice 


%% a)
p = [1 1 1 1 1 1]/6;    % vector of probabilities for the sides of the fair die
cdf = cumsum(p);    % calculate cumulative distribution function (CDF)

sim_vec = zeros(1, n);  % create a vector to store dice score for n simulations

% repeat simulation for n times
for i = 1:n 
    draw = invcdf(x, cdf, num_dice, 2); % simulate drawing 4 dice
    sum_draw = sum(draw);   % find total dice score
    sim_vec(i) = sum_draw;  % store it in a vector
    if sum_draw <= 9    % if the player wins
        budget = budget + win; 
    else    % otherwise
        budget = budget - game_cost;
    end 
end

% find mean value of dice score over simulations
mean_sim_a = mean(sim_vec)

% plot histogram
figure(1)
histogram(sim_vec, 'Normalization', 'probability')
title('Four fair dice');

sum_a = budget;   % the amount of money the player has after playing the game

range95_a = [quantile(sim_vec, 0.025), quantile(sim_vec, 0.975)]; % 95% range

%% b)
p = [0.5 0.5 1 1 1 2]/6;    % vector of probabilities for the sides of the unfair die
cdf = cumsum(p);    % find cumulative distribution function (CDF)

sim_vec = zeros(1, n);
budget = 10; 

for i = 1:n 
    draw = invcdf(x, cdf, num_dice, 2);
    sum_draw = sum(draw);
    sim_vec(i) = sum_draw;
    if sum_draw <= 9
        budget = budget + win; 
    else 
        budget = budget - game_cost;
    end 
end


mean_sim_b = mean(sim_vec);

figure(2)
histogram(sim_vec, 'Normalization', 'probability')
title('Four unfair dice');

sum_b = budget;

range95_b = [quantile(sim_vec, 0.025), quantile(sim_vec, 0.975)];

