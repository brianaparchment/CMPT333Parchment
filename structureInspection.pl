/*Problem1*/
occurences_n(Sub, Term, N) :-
   bagof(t, occurences(Sub,Term), Xs),
   length(Xs, N).
occurences(Term, Term).
occurences(Sub, Term) :-
   compound(Term),
   Term =.. [_|Ls],
   member(L, Ls),
   occurences(L, Sub).


/*Problem2*/
position([Sub|_], Sub, 1).
position([_|Term], Sub, Position):-
    position(Term,Sub, Ps2),
    Ps is P2+1.
position([_|Term], Sub, Ps, Position):-
    P1 is Ps+1,
    position(Term,Sub, Ps, P1).
     

