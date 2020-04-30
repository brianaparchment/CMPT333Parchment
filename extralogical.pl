/*Problem 1*/
log :- shell(log). 
shell(Flag) :-
	shell_prompt,shell_read(Goal,Flag),shell(Goal,Flag).
shell(exit,Flag) :-
	close_logging_file. 
shell(nolog,Flag) :-
	shell(nolog). 
shell(log,Flag) :-
	shell(log). 
shell(Goal,Flag) :-
	ground(Goal),!,shell_solve_ground(Goal,Flag),shell(Flag).
shell(Goal,Flag) :-
	shell_solve(Goal,Flag),shell(Flag).
	
shell_solve(Goal,Flag) :- 
	Goal,shell_write(Goal,Flag),nl,fail.
shell_solve (Goal,Flag) :-
	shell_write(‘No (more) solutions’,Flag),nl.
	
shell_solve_ground(Goal Flag) :- 
	Goal,!,shell_write('Yes’,Flag),nl.
shell_solve_ground(Goal,Flag) :- 
	shell_write('No',Flag),nl.
	
shell_prompt :- write('Next command? ‘).

shell_read(X,log) :- read(X),
	file_write(['Next command? ‘,X],'prolog.log').
shell_read(X,nolog) :- read(X).

shell_write(X,nolog) :- write(X).
shell_write(X,log) :- write(X), file_write(X, 'prolog.log’).

file_write(X,File) :- write_term(File,Term,[ ]). 
close_logging_file :- close('prolog.log'),
protocol(".trace_output.txt").

/*Problem 2*/
edit :- 
	edit(file([ ],[ ]). 
edit(File) :-
	write_prompt, read(Command), edit (File,Command). 
edit(File,exit) :- !.
edit(File ,Command) :-
	apply(Command,File,Filel),!,edit(Filel). 
edit (File, Command) :-
	writeln([Command,' is not applicable']),!,edit(File).
	
apply(up,file([X|Xs],Ys),file(Xs,[X|Ys])). apply(up(N),file(Xs,Ys),file(Xsl,Ysl)) :-
	N > O,up(N,Xs,Ys,Xsl,Ysl). 
apply(down,file(Xs,[Y|Ys]),file([Y|Xs],Ys)). 
apply(insert(Line),file(Xs,Ys),file(Xs,[Line|Ys])). 
apply(delete,file(Xs,[Y|Ys]),file(Xs,Ys)). 
apply(print,file([X|Xs],Ys),file([X|Xs],Ys)) :-
	write(X),nl. 
apply(print(*),file(Xs,Ys),file(Xs,Ys)) :-
	reverse(Xs,Xsl),write_file(Xsl),write_file(Ys).
	
up(N,[ ],Ys,[ ],Ys). 
up(O,Xs,Ys,Xs,Ys). 
up(N,[X|Xs] ,Ys,Xsl,Ysi) :-
	N > O, Nl is N-1, up(Nl,Xs,[XIYs],Xsl,Ysl). 
write_file([X|Xs]) :-
	write(X), nl, write_file(Xs). write_file([ ]).
write_prompt :- write('≫'), nl.

edit(File):-
apply(up(N),file([X|Xs],Ys),file,[Xs,|Ys])).