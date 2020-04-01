/*Problem1*/
triangle(0,0).
triangle(N,T):-
	N>0,
	T>0,
	N1 is N-1,
	T1 is T+N,
	triangle(N1,T1).

/*Problem 2*/
triangle(N,T):-
	triangle(N,0,T).
triangle(0,T,T).
triangle(N,X,T):-
	N>0,
	N1 is N-1,
	X1 is X+N,
	triangle(N1,X1,T).

/*Problem3*/
list([],0).
list([_|N],T1) :-
    list(N,T),
    T1 is T+1.
