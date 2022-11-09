% base case: when list has only one item, print it and stop
printlist([HEAD]) :- write(HEAD), !.

% logic: print the list's head and recurse
printlist([HEAD|TAIL]) :- write(HEAD), printlist(TAIL).

% query:
% | ?- 123
% true