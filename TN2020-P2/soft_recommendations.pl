common_director(X,Y):-
	director(X,P),
	director(Y,P),
	X\=Y.

common_language(X,Y):-
	language(X,P),
	language(Y,P), 
	X\=Y.

common_actors1(X,Y):-
	c11(X,Y);
	c21(X,Y);
	c31(X,Y);
	c12(X,Y);
	c22(X,Y);
	c32(X,Y);
	c13(X,Y);
	c23(X,Y);
	c33(X,Y).

common_mak(X,Y):-
    genre(X,Z),
    genre(Y,Z),
    X=\Y.

common_actors2(X,Y):-
    (c11(X,Y),c22(X,Y));
    (c11(X,Y),c32(X,Y));
    (c11(X,Y),c23(X,Y));
	(c11(X,Y),c33(X,Y));
    (c22(X,Y),c31(X,Y));
    (c22(X,Y),c13(X,Y));
    (c22(X,Y),c33(X,Y));
    (c33(X,Y),c12(X,Y));
    (c33(X,Y),c21(X,Y)).

common_actors25(X,Y):-
    (c11(X,Y),c21(X,Y));
    (c21(X,Y),c31(X,Y));
    (c11(X,Y),c31(X,Y));
	(c12(X,Y),c22(X,Y));
    (c22(X,Y),c32(X,Y));
    (c12(X,Y),c32(X,Y));
    (c13(X,Y),c23(X,Y));
    (c23(X,Y),c33(X,Y));
    (c13(X,Y),c33(X,Y)).

common_actors3(X,Y):-
    (c11(X,Y);
    c21(X,Y);
    c31(X,Y)),
    (c12(X,Y);
    c22(X,Y);
    c32(X,Y)),
    (c13(X,Y);
    c23(X,Y);
    c33(X,Y)).

common_genre1(X,Y):-
	genre(X,Z),
	genre(Y,Z),
	not(common_genre2(X,Y)),
	X\=Y.

common_genre2(X,Y):-
    genre(X,Z),
	genre(Y,Z),
	genre(X,P),
	genre(Y,P),
	not(common_genre3(X,Y)),
	X\=Y,
	Z\=P.
	
common_genre3(X,Y):-
	genre(X,Z),
	genre(Y,Z),
	genre(X,W),
	genre(Y,W),
	genre(X,P),
	genre(Y,P),
	X\=Y,
	Z\=W,
	Z\=P,
	P\=W.

common_genre4(X,Y):-
	genre(X,Z),
	genre(Y,Z),
	genre(X,W),
	genre(Y,W),
	genre(X,P),
	genre(Y,P),
	genre(X,Q),
	genre(Y,Q),
	X\=Y,
	Z\=W,
	Z\=P,
	Z\=Q,
	P\=W,
	P\=Q,
	W\=Q.
	
common_genre5(X,Y):-
	genre(X,Z),
	genre(Y,Z),
	genre(X,W),
	genre(Y,W),
	genre(X,P),
	genre(Y,P),
	genre(X,Q),
	genre(Y,Q),
	genre(X,R),
	genre(Y,R),
	X\=Y,
	Z\=W,
	Z\=P,
	Z\=Q,
	Z\=R,
	P\=W,
	P\=Q,
	P\=R,
	W\=Q,
	W\=R,
	Q\=R.    

common_plot1(X,Y):-
    plot_keywords(X,Z),
    plot_keywords(Y,Z),
    not(common_plot4(X,Y)),
    X\=Y.

common_plot4(X,Y):-
    plot_keywords(X,Z),
    plot_keywords(Y,Z),
    plot_keywords(X,W),
    plot_keywords(Y,W),
    plot_keywords(X,P),
    plot_keywords(Y,P),
    plot_keywords(X,Q),
	plot_keywords(Y,Q),
	X\=Y,
	Z\=W,
	Z\=P,
	Z\=Q,
	P\=W,
	P\=Q,
	W\=Q.

common_color(X,Y):-
    color(X,Ζ),
    color(Y,Ζ),
    X\=Y.

c11(X,Y):-
    actor1(X,Z),
    actor1(Y,Z),
    X\=Y.

c21(X,Y):-
    actor1(X,Z),
    actor2(Y,Z),
    X\=Y.
    
c31(X,Y):-
    actor1(X,Z),
    actor3(Y,Z),
    X\=Y.

c12(X,Y):-
    actor2(X,Z),
    actor1(Y,Z),
    X\=Y.

c22(X,Y):-
    actor2(X,Z),
    actor2(Y,Z),
    X\=Y.
    
c32(X,Y):-
    actor2(X,Z),
    actor3(Y,Z),
    X\=Y.    

c13(X,Y):-
    actor3(X,Z),
    actor1(Y,Z),
    X\=Y.

c23(X,Y):-
    actor3(X,Z),
    actor2(Y,Z),
    X\=Y.
    
c33(X,Y):-
    actor3(X,Z),
    actor3(Y,Z),
    X\=Y.    
    
    
find_similar5(X,Y):-
    common_genre3(X,Y),
    common_plot1(X,Y),
    X\=Y.
    
find_similar4(X,Y):-
    (common_actors2(X,Y);
    common_director(X,Y)),
    common_genre2(X,Y),
    common_plot1(X,Y),
    X\=Y.
    
find_similar3(X,Y):-
    common_genre1(X,Y),
    common_actors1(X,Y),
    common_plot1(X,Y),
    X\=Y.
    
find_similar2(X,Y):-
    common_plot1(X,Y),
    common_language(X,Y),
    common_genre1(X,Y),
    X\=Y.

find_similar1(X,Y):-
    common_language(X,Y),
    common_genre1(X,Y),
    common_color(X,Y),
    X\=Y.