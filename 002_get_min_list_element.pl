% helper function that gets the minimum out of 2 numbers
min(X, Y, MIN) :- X =< Y, MIN is X; MIN is Y.

% when list's len is 1
get_min([HEAD]) :- write(HEAD).

% base case: when we have 2 items left, print the smallest
get_min([HEAD1, HEAD2]) :- min(HEAD1, HEAD2, MIN), write(MIN), !.

% logic: get the minimum out of the first 2 list elements and recurse with the tail
get_min([HEAD1, HEAD2 | TAIL]) :- min(HEAD1, HEAD2, MIN), get_min([MIN | TAIL]).

% query:
% | ?- get_min([2, 1, 3, 0])
% 0 
% true
