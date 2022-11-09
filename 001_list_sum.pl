% base case: when we don't have elements, the sum is 0
sumlist([], 0).

% logic: the total sum is whatever's next plus the list's head 
sumlist([HEAD|TAIL], TOTAL) :- sumlist(TAIL, SUM), TOTAL is HEAD + SUM.

% query:
% | ?- sumlist([1, 2, 3], SUM)
% SUM = 6