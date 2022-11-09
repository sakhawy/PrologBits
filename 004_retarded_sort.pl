% WARINING: THE CODE IS JUST LIKE THE ALGORITHM: RETARDED.

% --- getting the minimum number in an array

% helper function that gets the minimum out of 2 numbers
min(X, Y, MIN) :- X =< Y, MIN is X; MIN is Y.

% when list's len is 1
get_min([HEAD], Z) :- Z is HEAD.

% base case: when we have 2 items left, print the smallest
get_min([HEAD1, HEAD2], Z) :- min(HEAD1, HEAD2, Z), !.

% logic: get the minimum out of the first 2 list elements and recurse with the tail
get_min([HEAD1, HEAD2 | TAIL], Z) :- 
  min(HEAD1, HEAD2, MIN),
  get_min([MIN | TAIL], Z).

% --- appending to a list

% base case: create a new list with item if the other is empty
append(ITEM, [], [ITEM]).

% logic: use the same head, and recurse the tails until we reach the base case
append(ITEM, [HEAD | TAIL], [HEAD | NEW_TAIL]) :- append(ITEM, TAIL, NEW_TAIL).

% --- deleting from a list
% base case 1: if the item is the last one, return an empty list
delete(ITEM, [ITEM], []).

% base case 2: if the item is the head, return the tail
delete(ITEM, [ITEM | TAIL], TAIL).

% logic: the old and the new will use same head, recurse the different tails to check for the item
delete(ITEM, [Y|TAIL1], [Y|TAIL2]) :- delete(ITEM, TAIL1, TAIL2).

% --- sorting by getting the minimum, appending it to a new list, 
% and deleting it from the old one, then recurse.
 
retarded_sort([HEAD, TAIL], [NEW_HEAD | NEW_TAIL]) :- 
  min(HEAD, TAIL, MIN),
  delete(MIN, [HEAD, TAIL], [REDUCED_LIST]),
  append(MIN, [NEW_HEAD | NEW_TAIL], APPENDED_LIST),
  append(REDUCED_LIST, APPENDED_LIST, RESULT),
  write(RESULT).

retarded_sort([HEAD | TAIL], RESULT) :-
  get_min([HEAD | TAIL], MIN),
  delete(MIN, [HEAD | TAIL], Z1),
  append(MIN, RESULT, Z2),
  retarded_sort(Z1, Z2).

% query:
% | ?- retarded_sort([2, 1, 3, 5, 4], Z)
% [1, 2, 3, 4, 5]
% Z = []

% WARINING: THE QUERY WILL STILL BE RUNNING :D NEED TO FIX THAT..