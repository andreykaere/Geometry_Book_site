import geometry;


size(6cm);

point A = (1,9);
point B = (0,0);
point C = (10,0);


point M = midpoint(segment(B,C));


circle w1 = incircle(A,M,C);
circle w2 = incircle(A,M,B);

point P = intersectionpoints(line(A,B), w2)[0];
point Q = intersectionpoints(line(A,C), w1)[0];

point T = midpoint(segment(P,Q));

point Bp = scale(-1, P)*B;
point Cp = scale(-1, Q)*C;

point S_ = scale(-1, T)*M;
//draw


dot("$A$", A, NW);
dot("$B$", B, SW);
dot("$C$", C);
dot("$M$", M, S);



dot("$P$", P, NW);
dot("$Q$", Q, NE);
dot("$S$", S_, NE);
dot("$T$", T, NW);

draw(A--B--C--cycle^^A--M, linewidth(.8));

draw(w1^^w2^^M--P--S_--Q--cycle^^P--Q, linewidth(.3));


dot("$B'$", Bp, NW);
dot("$C'$", Cp, NE);
draw(Bp--Cp);


draw(bisector(line(A,B), line(A,C)), linewidth(.3));

