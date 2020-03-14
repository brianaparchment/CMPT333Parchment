%v1
unnest_v1([],[]). /*An empty list is flattened*/
unnest_v1([X|Xs],L):- /*Flatten the head and the tail*/
	unnest_v1(X,L1),
	unnest_v1(Xs,L2),
	append(L1,L2,L). /*Concatenates List1 and List2*/
unnest_v1(Y,[Y]).
unnest_v1([X|Xs],[X|Ys]):-
    atom(X),
    unnest_v1(Xs,Ys).


%v2
unnest_v2([],[],[]).
unnest_v2([[X|Xs],Y],L):-
unnest_v2([],Acc,Acc), /*Accumulator contains result, when list is empty
*/
	unnest_v2(X,Acc,L1),
	unnest_v2(Xs,Acc,L2),
	unnest_v2(Y,Acc,L3),
	append(L1,L2,L3,L).
unnest_v2([X|Xs],[Y|Ys]):-
	atom(X),
	unnest_v2(Xs,Y,Ys).
	
	
%EqualLists
equals([],[]).
equals([X|Xs],Y):-
	select(X,Y,Ys), /*Compares the elements of both lists */
	equals(Xs,Ys).