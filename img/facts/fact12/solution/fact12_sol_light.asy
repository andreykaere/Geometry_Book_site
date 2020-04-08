import geometry;
size(7cm);

pen penColor = red;

triangle t = triangleabc(3.8, 5.7, 6);

point A = t.C;
point D = t.A;
point B = t.B;

circle w = circle(t);


point U = 0.75*B;



point C = intersectionpoints(w, line(A, U))[0];


point O = w.C;


point P = midpoint(segment(A, B));
point Q = midpoint(segment(B, C));
point R = midpoint(segment(C, D));
point S = midpoint(segment(D, A));

point Z = intersectionpoint(line(P, R), line(Q, S));

point Pp = projection(line(D, C))*P;
point Qp = projection(line(D, A))*Q;
point Rp = projection(line(B, A))*R;
point Sp = projection(line(B, C))*S;

point M = intersectionpoint(line(R, Rp), line(P, Pp));

//draw

draw(segment(A, B), penColor);
draw(segment(B, C), penColor);
draw(segment(C, D), penColor);
draw(segment(D, A), penColor);

draw(w, penColor);

dot("$A$", A, N+E*0.5, fontsize(12) + penColor);
dot("$B$", B, SE, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);
dot("$D$", D, SW, fontsize(12) + penColor);


dot("$P$", P, N+E*0.5, fontsize(12) + penColor);
dot("$Q$", Q, SE, fontsize(12) + penColor);
dot("$R$", R, SE, fontsize(12) + penColor);
dot("$S$", S, SW, fontsize(12) + penColor);


dot(Label("$O$"), O, S*0.7+E*0.5, fontsize(12) + penColor);

dot(Label("$Z$"), Z, S*0.7+E*0.5, fontsize(12) + penColor);

dot(Label("$P'$"), Pp, S*0.7+E*0.5, fontsize(12) + penColor);
dot(Label("$Q'$"), Qp, S*0.7+E*0.5, fontsize(12) + penColor);
dot(Label("$R'$"), Rp, S*0.7+E*0.5, fontsize(12) + penColor);
dot(Label("$S'$"), Sp, S*0.7+E*0.5, fontsize(12) + penColor);

dot(Label("$M$"), M, S*0.7+E*0.5, fontsize(12) + penColor);

draw(segment(P, Pp), penColor+dashed);
draw(segment(Q, Qp), penColor+dashed);
draw(segment(R, Rp), penColor+dashed);
draw(segment(S, Sp), penColor+dashed);
