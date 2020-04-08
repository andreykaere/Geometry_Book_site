import geometry;
size(11cm);


var a = 7;
var h = 10;

var x = (h*h - a*a)/(2*a);

point A = (0, 0);
point B = (a, 0);
point M = (0, -h);


point C = (-x, -h);
point D = (x+a, -h);

point T = intersectionpoint(line(A, C), line(B, D));

line l = line(A, B);
line k = parallel(M, l);

circle in = incircle(C, D, T);
circle w = circle(A, B, C);

point X = relpoint(w, -170/550);

point Y = intersectionpoints(tangents(in, X)[0], w)[1];
point Z = intersectionpoints(tangents(in, X)[1], w)[1];
point R = intersectionpoints(tangents(in, Z)[1], w)[1];

point Q = intersectionpoint(line(Z, X), line(R, Y));
point P = intersectionpoint(line(Z, R), line(X, Y));


line l1 = bisector(line(R, P), line(Y, P));
line l2 = bisector(line(Z, Q), line(Q, R));

point M = intersectionpoint(l1, l2);


point A = Z;
point B = R;
point C = Y;
point D = X;

transform reflect_1 = reflect(l1);
transform reflect_2 = reflect(l2);

point B1 = reflect_1*B;
point C1 = reflect_1*C;

point B2 = reflect_2*B;
point A2 = reflect_2*A;

//draw

draw(segment(X, Y));
draw(segment(X, Z));
draw(segment(R, Z));
draw(segment(R, Y));

draw(segment(Q, Z));
draw(segment(R, Q));
draw(segment(R, P));
draw(segment(Y, P));

draw(segment(B1, C1));
draw(segment(B2, A2));

draw(segment(D, M), linewidth(0.1));
draw(segment(A, M), linewidth(0.1));
draw(segment(B, M), linewidth(0.1));
draw(segment(C, M), linewidth(0.1));
draw(segment(A2, M), linewidth(0.1));
draw(segment(B2, M), linewidth(0.1));
draw(segment(C1, M), linewidth(0.1));
draw(segment(B1, M), linewidth(0.1));


//draw(segment(M, Q));
draw(Label("$\ell_1$", Relative(0.5)), segment(M, P));
draw(Label("$\ell_2$", Relative(0.5)), segment(M, Q));

dot("$A$", A, N*0.1 + W);
dot("$B$", B, N*1 + E*0.5);
dot("$C$", C);
dot("$D$", D, S + 0.5*W);



dot("$C_1$", C1, N*1.5 + E);
dot("$B_1$", B1, S*1 + E*0.5);

dot("$A_2$", A2, N*1.5 + E*0);
dot("$B_2$", B2, S*1 + W*0.5);

//dot("$P$", P);
//dot("$Q$", Q, NW);
dot(Label("$M$", UnFill), M, 2.1*E+N*1.1);


draw(w, linewidth(0.2)+dashed);
draw(in, linewidth(0.2)+dashed);

markangle(Label("$\beta_1$", fontsize(10)), D, M, B1, n=1, radius=4mm, 
linewidth(0.1));

markangle(Label("$\beta_2$", fontsize(10)), B2, M, D, n=2, radius=3mm, 
linewidth(0.1));

markangle(B1, D, M, Fill(black), n=1, radius=4mm);
markangle(M, D, B2, Fill(black), n=1, radius=5mm);
//dot(T);
//draw(k);
//draw(l);

/*
dot("$A$", A);
dot("$B$", B);
dot("$C$", C);
dot("$D$", D);
*/
