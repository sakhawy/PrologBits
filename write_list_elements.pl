printlist([X]) :- write(X), !.
printlist([X|Y]) :- write(X), printlist(Y).
