import geometry;


size(8cm);

point A = (0,0);
point B = (2.5,7);
point C = (8,0);


point H = projection(line(A,C))*B;


point A_1 = midpoint(segment(B,C));
point B_1 = midpoint(segment(A,C));
point C_1 = midpoint(segment(B,A));

circle w1 = circle(A,C_1, H);
circle w2 = circle(C,A_1, H);

point M = intersectionpoints(w1,w2)[1];


point P = intersectionpoints(w2, line(B,H))[1];


point T = midpoint(segment(P,C));
point L = midpoint(segment(A_1,C_1));


point B_1p = reflect(line(A_1, C_1))*B_1;

//draw 
dot("$A$", A, SW);
dot("$B$", B, NW);
dot("$C$", C);
dot("$H$", H, S*1.5 + W*.9);

dot("$A_1$", A_1, N+E*1.3);
dot("$B_1$", B_1, S);
dot("$C_1$", C_1, N+W*1.3);
//dot(Label("$M$", UnFill), M);
dot("$P$", P, SW);
dot("$T$", T, NE);
dot("$L$", L, S*.8+E*.7);
dot("$B_1'$", B_1p, N*.5+E);


draw(A--B--C--cycle);

draw(A_1--C_1^^B--H^^P--C^^T--A_1^^H--B_1p);


draw(B--B_1--B_1p--cycle, linewidth(.2));

draw(Label("$\Gamma$", Relative(.42)), circle(B,C_1,A_1), dashed);


dot(Label("$M$", UnFill), M, S*.5 + E);

draw(w1^^w2, linewidth(.35));

draw(B--A_1--M--C_1--cycle, linewidth(1));

markrightangle(B,H,C,6);
markrightangle(T,A_1,C_1,5);


