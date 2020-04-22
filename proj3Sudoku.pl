:- use_module(library(clpfd)).

sudoku(Puzzle) :-
    flatten(Puzzle, Xs),
    Xs ins 1..9,
    Rows = Puzzle,
    transpose(Rows, Columns),
    squares(Rows, Squares),
    maplist(all_distinct, Rows),
    maplist(all_distinct, Columns),
    maplist(all_distinct, Squares),
    maplist(label, Rows).
squares([As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is], Squares) :-
    squares(As,Bs,Cs,Square1), squares(Ds,Es,Fs,Square2), 
		squares(Gs,Hs,Is,Square3),
    append([Square1, Square2, Square3], Squares).
  
squares([], [], [], []).
squares([As,Bs,Cs|Ss1],[Ds,Es,Fs|Ss2],[Gs,Hs,Is|Ss3], [Square|Squares]) :-
    Square = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    squares(Ss1, Ss2, Ss3, Squares). 
