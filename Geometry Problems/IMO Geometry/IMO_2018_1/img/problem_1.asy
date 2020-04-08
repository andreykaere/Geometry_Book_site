import geometry;
size(8cm);


triangle t = triangleabc(5, 7, 6);
point A = t.C;
point B = t.B;
point C = t.A;

circle w = circle(t);

point E_ = 0.7*A;

circle e = circle(A, length(segment(A, E_)));

point D = intersectionpoints(e, line(A, B))[0];

line l = bisector(segment(D, B));
line k = bisector(segment(C, E_));


point G = intersectionpoints(w, k)[1];
point F = intersectionpoints(w, l)[1];

point Gp = intersectionpoint(line(A, C), k);
point Fp = intersectionpoint(line(A, B), l);

point Q = intersectionpoint(line(F, G), line(A, B));
point P = intersectionpoint(line(F, G), line(A, C));

point Cp = intersectionpoints(e, w)[1];
point Bp = intersectionpoints(e, w)[0];

//point Mg = midpoint(segment(G, Gp));
//point Mf = midpoint(segment(F, Fp));

//draw
draw(t);

dot("$A$", A, N+E, fontsize(15));
dot("$B$", B, S+E, fontsize(15));
dot("$C$", C, S+W, fontsize(15));

draw(Label("$\Gamma$", Relative(0.33), fontsize(15)), w);
draw(e, dashed + linewidth(0.3));


draw(segment(G, Gp), dashed + linewidth(0.3));
draw(segment(F, Fp), dashed + linewidth(0.3));

dot("$G$", G, S+W*2, fontsize(15));
dot("$F$", F, S*1.2+E, fontsize(15));
dot("$Q$", Q, SW, fontsize(15));
dot("$P$", P, S*1.7+E*0.3, fontsize(15));

markrightangle(G, Gp, A, 5);
markrightangle(F, Fp, A, 5);

draw(segment(F, G));
draw(segment(E_, D));

draw(segment(C, G), linewidth(0.2));
draw(segment(E_, G), linewidth(0.2));

draw(segment(D, F), linewidth(0.2));
draw(segment(B, F), linewidth(0.2));

draw(segment(A, F));
draw(segment(A, G));

dot("$B'$", Bp, fontsize(15));
dot("$C'$", Cp, N+W*0.6, fontsize(15));

draw(segment(A, Cp), linewidth(0.2));
draw(segment(A, Bp), linewidth(0.2));

draw(segment(G, Cp), linewidth(0.2));
draw(segment(F, Bp), linewidth(0.2));



markangle(E_, G, A, n=3, radius=7mm);
markangle(A, G, Cp, n=3, radius=8.5mm);
markangle(A, F, D,  n=3, radius=6mm);
markangle(Bp, F, A, n=3, radius=7.5mm);

markangle(B, D, F, n=1, radius=5mm);
markangle(F, B, D, n=1, radius=5mm);


markangle(G, E_, C, n=2, radius=5mm);
markangle(E_, C, G, n=2, radius=5mm);

markangle(F, A, Bp, Fill(black), n=1, radius=6mm);
markangle(B, A, F,  Fill(black), n=1, radius=7mm);
//draw(segment(D, Cp), dashed);
//draw(segment(E_, Bp), dashed);
dot(Label("$D$", UnFill), D, N*2+E, fontsize(15));
dot(Label("$E$", UnFill), E_, N*2+W*0.3, fontsize(15));
//draw(segment(A, E_), red);
