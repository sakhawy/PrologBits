printlist([X|Y]) :- write(X), printlist(Y), !.
printlist([X|Y]) :- write(X), printlist(Y).
