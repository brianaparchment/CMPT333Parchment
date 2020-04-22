/*Problem1*/
quicksort(X, Y):-
	quicksort(X, Y, []).
  
quicksort([], Y, Y).
quicksort([Xs|X], Y, Z):-
  partition(X, Xs, Is, Rs),
  quicksort(Rs, W, Z),
  quicksort(Is, Y, [Xs|W]).
	
partition([T|S], Xs, I, [T|R]):-
  Xs < T, !,
  partition(S, Xs, I, R).
partition([T|S], Xs, [T|I], R):-
  partition(S, Xs, I, R).
partition([], _, [], []).


/*Problem2*/
/*-Cuts could be placed in the functor program of substitute*/