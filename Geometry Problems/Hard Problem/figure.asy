import geometry;
size(8cm);
pen penColor = black;



var a = 8;
var b = 11;



//var a = 19;
//var b = 8;

triangle t = triangleabc(a, b, sqrt(a*a+b*b));

point A = t.B;
point B = t.A;
point C = t.C;


point I = incenter(t);

point Ap = intersectionpoint(line(I, A), line(B, C));
point Bp = intersectionpoint(line(I, B), line(A, C));

point H = projection(t.AB)*I;

point P = midpoint(segment(A, Ap));
point Q = midpoint(segment(B, Bp));
point Ma = midpoint(segment(C, B));
point Mc = midpoint(segment(A, B));
point Mb = midpoint(segment(C, A));

point E_ = midpoint(segment(Ap, Bp));


//point M = midpoint(segment(A, B));

//draw
draw(t);


dot("$A$", A, S*0.5+E*0.3, fontsize(12) + penColor);
dot("$B$", B, W*1.2+S*0.7, fontsize(12) + penColor);
dot("$C$", C, E*1.5+N*0.6, fontsize(12) + penColor);



dot("$A'$", Ap, N*0.7+W*0.7, fontsize(12) + penColor);
dot("$B'$", Bp, E*1.5+N*1, fontsize(12) + penColor);
dot("$H$", H, E*1+S, fontsize(12) + penColor);



dot("$Q$", Q, S*0.9+W*0.5, fontsize(12) + penColor);
dot("$P$", P, E*0.6+S*1.5, fontsize(12) + penColor);
dot("$I$", I, W*0.7+N*1.3, fontsize(12) + penColor);


draw(segment(A, Ap));
draw(segment(B, Bp));

draw(segment(H, P));
draw(segment(H, Q));
//draw(segment(H, I), dashed+linewidth(0.4));

draw(incircle(t), dashed + linewidth(0.3));

markrightangle(A, C, B, 6, penColor+linewidth(0.4));
markrightangle(I, H, B, 6, linewidth(0.3) + penColor);
//markrightangle(P, H, Q, 5, linewidth(0.2)+dashed + penColor);



dot(Label("$M_b$"), Mb, S*0.3+E*1.2, fontsize(11) + penColor);
dot(Label("$M_c$"), Mc, S*1.6+W*0.7, fontsize(11) + penColor);
dot(Label("$M_a$"), Ma, N*0.8+W*0.7, fontsize(11) + penColor);


draw(segment(Ma, Q), linewidth(0.3));
draw(segment(Mb, P), linewidth(0.3));

draw(segment(Mc, Q), linewidth(0.3));
draw(segment(Mc, P), linewidth(0.3));
markrightangle(P, Mc, Q, 5, linewidth(0.3) + penColor);




markrightangle(B, Ma, Q, 5, linewidth(0.3) + penColor);
markrightangle(A, Mb, P, 5, linewidth(0.3) + penColor);



draw(segment(Ap, Bp), linewidth(0.3));

dot("$E$", E_, W*0.7+N*1.3, fontsize(12) + penColor);

draw(segment(Q, P), linewidth(0.3));

draw(segment(E_, P), linewidth(0.3));
draw(segment(E_, Q), linewidth(0.3));
draw(segment(E_, H), linewidth(0.3));
draw(segment(E_, Mc), linewidth(0.3));

markrightangle(Q, E_, P, 5, linewidth(0.3) + penColor);

draw(circle(P, Q, H), dashed + linewidth(0.3));
