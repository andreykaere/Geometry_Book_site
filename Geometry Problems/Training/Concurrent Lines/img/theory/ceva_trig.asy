import geometry;

size(5cm);

triangle t = triangleabc(7,5,6);

draw(t, linewidth(bp));

label("$A$", "$B$", "$C$", t);


point C1=0.4*t.B;//intersectionpoint(bisector(t.VA), t.CB); 
point B1=0.4*t.C;//intersectionpoint(bisector(t.VB), t.AC);

//point c1=0.6*t.AB;//intersectionpoint(bisector(t.VC), t.AB); 
//draw(segment(a1, t.A));
point i  = intersectionpoint(line(C1, t.C), line(B1,t.B));
point A1 = intersectionpoint(line(t.A, i), t.BC);

draw(segment(A1, t.A));
draw(segment(B1, t.B));
draw(segment(C1, t.C));


dot("$A_1$", A1,NE);
dot("$B_1$", B1, W);
dot("$C_1$", C1, S);

dot(i);

dot(t.A);
dot(t.B);
dot(t.C);

//dot(t.ince


markangle("$\alpha_2$", A1, t.A, t.C, radius=6mm, Arrow, fontsize(11));
markangle("$\alpha_1$", t.B, t.A, A1, radius=5mm, Arrow, fontsize(11));

markangle(Label("$\gamma_1$", Relative(0.55)), t.A, t.C, C1, radius=6mm, Arrow, fontsize(11));
markangle("$\gamma_2$", C1, t.C, t.B, radius=7mm, Arrow, fontsize(11));


markangle("$\beta_1$", t.C, t.B, B1, radius=8mm, Arrow, fontsize(10));
markangle("$\beta_2$", B1, t.B, t.A, radius=9mm, Arrow, fontsize(10));
