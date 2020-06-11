%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prolog TicTacToe alpha-beta expert
%% Design to play against human (Java GUI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The empty Tac Tac Toe board
%%   Z1  Z2   Z3   Z4  Z5  Z6
%%   Z7  Z8   Z9   Z10 Z11 Z12   [Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16] 
%%   Z13 Z14  Z15  Z16 Z17 Z18
%%   Z19 Z20  Z21  Z22 Z23 Z24
%%   Z25 Z26  Z27  Z28 Z29 Z30
%%   Z31 Z32  Z33  Z34 Z35 Z36
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic board/1.

init:- 
   retractall(board(_)),
   assert(board([_Z1,_Z2,_Z3,_Z4,_Z5,_Z6,_Z7,_Z8,_Z9,_Z10,_Z11,_Z12,_Z13,_Z14,_Z15,_Z16,_Z17,_Z18,_Z19,_Z20,_Z21,_Z22,_Z23,_Z24,_Z25,_Z26,_Z27,_Z28,_Z29,_Z30,_Z31,_Z32,_Z33,_Z34,_Z35,_Z36])).
:- init.

%%%%%
%%  Generate possible marks on a free spot on the board.
%%  Use mark(+,+,-X,-Y) to query/generate possible moves (X,Y).
%%%%%
mark(Player, [X|_],1,1) :- var(X), X=Player.
mark(Player, [_,X|_],2,1) :- var(X), X=Player.
mark(Player, [_,_,X|_],3,1) :- var(X), X=Player.
mark(Player, [_,_,_,X|_],4,1) :- var(X), X=Player.
mark(Player, [_,_,_,_,X|_],5,1) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,X|_],6,1) :- var(X), X=Player.

mark(Player, [_,_,_,_,_,_,X|_],1,2) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,X|_],2,2) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,X|_],3,2) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,X|_],4,2) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,X|_],5,2) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,X|_],6,2) :- var(X), X=Player.

mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,X|_],1,3) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],2,3) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],3,3) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],4,3) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],5,3) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],6,3) :- var(X), X=Player.

mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],1,4) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],2,4) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],3,4) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],4,4) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],5,4) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],6,4) :- var(X), X=Player.

mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],1,5) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],2,5) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],3,5) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],4,5) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],5,5) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],6,5) :- var(X), X=Player.

mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],1,6) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],2,6) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],3,6) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],4,6) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],5,6) :- var(X), X=Player.
mark(Player, [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X|_],6,6) :- var(X), X=Player.

%%%%%
%%  Move 
%%%%%
move(P,(1,1),[X1|R],[P|R]) :- var(X1).
move(P,(2,1),[X1,X2|R],[X1,P|R]) :- var(X2).
move(P,(3,1),[X1,X2,X3|R],[X1,X2,P|R]) :- var(X3).
move(P,(4,1),[X1,X2,X3,X4|R],[X1,X2,X3,P|R]) :- var(X4).
move(P,(5,1),[X1,X2,X3,X4,X5|R],[X1,X2,X3,X4,P|R]) :- var(X5).
move(P,(6,1),[X1,X2,X3,X4,X5,X6|R],[X1,X2,X3,X4,X5,P|R]) :- var(X6).

move(P,(1,2),[X1,X2,X3,X4,X5,X6,X7|R],[X1,X2,X3,X4,X5,X6,P|R]) :- var(X7).
move(P,(2,2),[X1,X2,X3,X4,X5,X6,X7,X8|R],[X1,X2,X3,X4,X5,X6,X7,P|R]) :- var(X8).
move(P,(3,2),[X1,X2,X3,X4,X5,X6,X7,X8,X9|R],[X1,X2,X3,X4,X5,X6,X7,X8,P|R]) :- var(X9).
move(P,(4,2),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,P|R]) :- var(X10).
move(P,(5,2),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,P|R]) :- var(X11).
move(P,(6,2),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,P|R]) :- var(X12).

move(P,(1,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,P|R]) :- var(X13).
move(P,(2,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,P|R]) :- var(X14).
move(P,(3,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,P|R]) :- var(X15).
move(P,(4,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,P|R]) :- var(X16).
move(P,(5,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,P|R]) :- var(X17).
move(P,(6,3),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,P|R]) :- var(X18).

move(P,(1,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,P|R]) :- var(X19).
move(P,(2,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,P|R]) :- var(X20).
move(P,(3,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,P|R]) :- var(X21).
move(P,(4,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,P|R]) :- var(X22).
move(P,(5,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,P|R]) :- var(X23).
move(P,(6,4),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,P|R]) :- var(X24).

move(P,(1,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,P|R]) :- var(X25).
move(P,(2,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,P|R]) :- var(X26).
move(P,(3,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,P|R]) :- var(X27).
move(P,(4,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,P|R]) :- var(X28).
move(P,(5,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,P|R]) :- var(X29).
move(P,(6,5),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,P|R]) :- var(X30).

move(P,(1,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,P|R]) :- var(X31).
move(P,(2,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,P|R]) :- var(X32).
move(P,(3,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,P|R]) :- var(X33).
move(P,(4,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,P|R]) :- var(X34).
move(P,(5,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,P|R]) :- var(X35).
move(P,(6,6),[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36|R],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,P|R]) :- var(X36).





%%%%%
%%  Record a move: record(+,+,+).
%%%%%
record(Player,X,Y) :- 
   retract(board(B)), 
   mark(Player,B,X,Y),
   assert(board(B)).

%%%%% 
%%  A winning line is ALREADY bound to Player. 
%%  win(+Board,+Player) is true or fail.
%%    e.g., win([P,P,P|_],P).  is NOT correct, because could bind 
%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prolog TicTacToe alpha-beta expert
%% Design to play against human (Java GUI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The empty Tac Tac Toe board
%%   Z1  Z2   Z3   Z4  Z5  Z6
%%   Z7  Z8   Z9   Z10 Z11 Z12   [Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16] 
%%   Z13 Z14  Z15  Z16 Z17 Z18
%%   Z19 Z20  Z21  Z22 Z23 Z24
%%   Z25 Z26  Z27  Z28 Z29 Z30
%%   Z31 Z32  Z33  Z34 Z35 Z36
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

win([Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.

% 789 8910 91011 101112
win([_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.

% 131415 141516 151617 161718
win([_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.

% 192021 202122 212223 222324
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.

% 252627 262728 272829 282930
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.

% 313233 323334 333435 343536
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.
win([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],P) :- Z1==P, Z2==P, Z3==P.




%%%%%
%%  A line is open if each position is either free or equals the Player
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prolog TicTacToe alpha-beta expert
%% Design to play against human (Java GUI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The empty Tac Tac Toe board
%%   Z1  Z2   Z3   Z4  Z5  Z6
%%   Z7  Z8   Z9   Z10 Z11 Z12   [Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36] 
%%   Z13 Z14  Z15  Z16 Z17 Z18
%%   Z19 Z20  Z21  Z22 Z23 Z24
%%   Z25 Z26  Z27  Z28 Z29 Z30
%%   Z31 Z32  Z33  Z34 Z35 Z36
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
open([Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).
open([_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Z1,Z2,Z3|_],Player) :- (var(Z1) | Z1 == Player),(var(Z2) | Z2 == Player), (var(Z3) | Z3 == Player).

%%%%%
%% Calculate the value of a position, o maximizes, x minimizes.
%%%%%
value(Board,100) :- win(Board,o), !.
value(Board,-100) :- win(Board,x), !.
value(Board,E) :- 
   findall(o,open(Board,o),MAX), 
   length(MAX,Emax),      % # lines open to o
   findall(x,open(Board,x),MIN), 
   length(MIN,Emin),      % # lines open to x
   E is Emax - Emin.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% using minimax procedure with alpha-beta cutoff.
% Computer (o) searches for best tic tac toe move, 
% Human player is x.
% Adapted from L. Sterling and E. Shapiro, The Art of Prolog, MIT Press, 1986.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- assert(lookahead(2)).
:- dynamic spy/0.  % debug calls to alpha_beta
:- assert(spy).    % Comment out stop spy.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
search(Position,Depth,(Move,Value)) :- 
   alpha_beta(o,Depth,Position,-100,100,Move,Value).

alpha_beta(Player,0,Position,_Alpha,_Beta,_NoMove,Value) :- 
   value(Position,Value),
   spy(Player,Position,Value).

alpha_beta(Player,D,Position,Alpha,Beta,Move,Value) :- 
   D > 0, 
   findall((X,Y),mark(Player,Position,X,Y),Moves), 
   Alpha1 is -Beta, % max/min
   Beta1 is -Alpha,
   D1 is D-1, 
   evaluate_and_choose(Player,Moves,Position,D1,Alpha1,Beta1,nil,(Move,Value)).

evaluate_and_choose(Player,[Move|Moves],Position,D,Alpha,Beta,Record,BestMove) :-
   move(Player,Move,Position,Position1), 
   other_player(Player,OtherPlayer),
   alpha_beta(OtherPlayer,D,Position1,Alpha,Beta,_OtherMove,Value),
   Value1 is -Value,
   cutoff(Player,Move,Value1,D,Alpha,Beta,Moves,Position,Record,BestMove).
evaluate_and_choose(_Player,[],_Position,_D,Alpha,_Beta,Move,(Move,Alpha)).

cutoff(_Player,Move,Value,_D,_Alpha,Beta,_Moves,_Position,_Record,(Move,Value)) :- 
   Value >= Beta, !.
cutoff(Player,Move,Value,D,Alpha,Beta,Moves,Position,_Record,BestMove) :- 
   Alpha < Value, Value < Beta, !, 
   evaluate_and_choose(Player,Moves,Position,D,Value,Beta,Move,BestMove).
cutoff(Player,_Move,Value,D,Alpha,Beta,Moves,Position,Record,BestMove) :- 
   Value =< Alpha, !, 
   evaluate_and_choose(Player,Moves,Position,D,Alpha,Beta,Record,BestMove).

other_player(o,x).
other_player(x,o).

spy(Player,Position,Value) :- 
   spy, !,
   write(Player),
   write(' '),
   write(Position),
   write(' '),
   writeln(Value).
spy(_,_,_). % do nothing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% For testing, use h(+,+) to record human move,
%%% supply coordinates. Then call c (computer plays).
%%% Use s to show board.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h(X,Y) :- 
   record(x,X,Y), 
   showBoard.

c :- 
   board(B), 
   alpha_beta(o,2,B,-200,200,(X,Y),_Value), 
   record(o,X,Y),
   showBoard.

showBoard :- 
   board([Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36]), 
   write('    '),mark(Z1),write(' '),mark(Z2),write(' '),mark(Z3),write(' '),mark(Z4),write(' '),mark(Z5),write(' '),mark(Z6),nl,
   write('    '),mark(Z7),write(' '),mark(Z8),write(' '),mark(Z9),write(' '),mark(Z10),write(' '),mark(Z11),write(' '),mark(Z12),nl,
   write('    '),mark(Z13),write(' '),mark(Z14),write(' '),mark(Z15),write(' '),mark(Z16),write(' '),mark(Z17),write(' '),mark(Z18),nl,
   write('    '),mark(Z19),write(' '),mark(Z20),write(' '),mark(Z21),write(' '),mark(Z22),write(' '),mark(Z23),write(' '),mark(Z24),nl,
   write('    '),mark(Z25),write(' '),mark(Z26),write(' '),mark(Z27),write(' '),mark(Z28),write(' '),mark(Z29),write(' '),mark(Z30),nl,
   write('    '),mark(Z31),write(' '),mark(Z32),write(' '),mark(Z33),write(' '),mark(Z34),write(' '),mark(Z35),write(' '),mark(Z36),nl.
s :- showBoard.

mark(X) :- 
   var(X),
   write('#').
mark(X) :- 
   \+var(X),
   write(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Play tic tac toe with the Java GUI
%%%  using port 54321.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

connect(Port) :- 
   tcp_socket(Socket), 
   gethostname(Host),  % local host
   tcp_connect(Socket,Host:Port),
   tcp_open_socket(Socket,INs,OUTs), 
   assert(connectedReadStream(INs)), 
   assert(connectedWriteStream(OUTs)).

:- connect(54321).  % Comment out for testing

ttt :- 
   connectedReadStream(IStream), 
   read(IStream,(X,Y)),
   record(x,X,Y), 
   board(B),
   alpha_beta(o,1,B,-100,100,(U,V),_Value), 
   record(o,U,V), 
   connectedWriteStream(OStream), 
   write(OStream,(U,V)),
   nl(OStream), flush_output(OStream),
   ttt.

:- ttt.             % Comment out for testing



