date1([Y,M1,D1],N):-
    N is (((Y*1461)/4)+((M1*153)/5)+D1).
date2([Y,M2,D2],X):-
    X is (((Y*1461)/4)+((M1*153)/5)+D1).
interval(date1[Y,M1,D1],date2[Y,M2,D2],N,X):-
    abs(X - N).


