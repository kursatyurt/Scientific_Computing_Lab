%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mchoice - computes the next choice of the computer player based on
% different prediction policies
%
%   next = mchoice(ng, i, j, i_comp, j_comp)
%
%--------
% Input: 
%--------
%           ng      number of rounds   
%           i       second last entry in game history of human player
%           j       last entry in game history of human player 
%                    (previous step)
%           i_comp  second last entry in game history of computer player
%           j_comp  last entry in game history of computer player
%                    (previous step)
%
%           all input arguments are integers
%
%--------
% Output: 
%--------
%           next    integer - next choice of the computer player
%                   1   rock
%                   2   paper
%                   3   scissors
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
%%% --- SECTION WHERE YOU CAN EDIT (MODIFY/ADD FUNCTIONS AS NEEDED) --- %%%
%

% --- Main function ---
function next = mchoice(ng, i, j,i_comp,j_comp)
% machine next move
global samplem transm policy samplem2 transm2 % keeps track of human moves for computer strategy
if(ng == 1)
    % initialize matrices
    [samplem,transm]   = initmchoice;
    [samplem2,transm2]   = initmchoice;
    next = randi(3);
else
    samplem  = updatesamplem(i,j,samplem);
    transm   = updatetransm(samplem);
    
    samplem2  = updatesamplem(i_comp,j_comp,samplem2);
    transm2   = updatetransm(samplem2); 
    
    switch policy
        case 1
            next = predict1(j,transm);
        case 2
            next = predict2(j,transm);
        case 3
            next = predict3(j,transm);
        otherwise
            error('Bad policy given!')
    end  
end
display(transm2);


% --- prediction policy 1 ---

%%% Fill in this function! [WS exercise a)]
function next = predict1(j, transm)
% j - prev move human player
% transm - current trans matrix of human player
% predict player next move
display(transm);

global param_a param_b
rnd = rand();
hnext = -1;
if(rnd<= param_a)
    hnext = mod(j,3) + 1;
elseif(rnd <= param_b)
    hnext = mod(j+1,3) + 1;
else
    hnext = j;
end

next = winchoice(hnext); % This is a dummy function
% HINT: The function should look similar to predict2 and predict3 below


%
%%% --- DO NOT MODIFY FUNCTIONS BELOW --------------------------------- %%%
%


% --- Additional functions ---

function [samplem,transm] = initmchoice()
% initialize sample and transition matrices

samplem = [1 1 1; 1 1 1; 1 1 1];
transm = updatetransm(samplem);

function transm = updatetransm(samplem)
% update transition matrix

w = sum(samplem,2);
transm = zeros(3);
for i=1:size(samplem,1)
    transm(i,:) = samplem(i,:)./w(i);
end

function samplem = updatesamplem(i,j,sample)
% update sample matrix

samplem = sample;
samplem(i,j) = sample(i,j)+1;


% --- The prediction policies ---

function next = predict2(j,transm)
% predict player next move
% take the move that ist most likely based on the previous move
transm % display transition matrix
[hprob,hnext] = max(transm(j,:)); % [value, index]
next = winchoice(hnext);

function next = predict3(j,transm)
% predict player next move

transm % display transition matrix
prob = transm(j,:);
r = rand;
hnext = sum(r>=cumsum([0,prob]));
next = winchoice(hnext);


% --- Choosing the computer next move ---

function next = winchoice(hnext)
% choose next move to win

switch hnext
    case 1 % rock
        next = 2; % paper
    case 2 % paper
        next = 3; % scissors
    case 3 % scissors
        next = 1; % rock
end
