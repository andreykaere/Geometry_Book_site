import geometry;
size(6cm);

triangle t = triangleabc(5, 6.5, 7);

point A = t.A;
point B = t.B;
point C = t.C;


point C1 = 0.8*t.B;
point B1 = 0.7*t.C;


line b = line(B, false, B1);
line c = line(C, false, C1);

point P = intersectionpoint(c, b);

line a = line(A, false, P);

point Pp = isogonalconjugate(t, P); 

line Ap = line(A, false, Pp);
line Bp = line(B, false, Pp);
line Cp = line(C, false, Pp);

//draw all figures

draw(t, linewidth(bp));
dot("\(A\)", A, SW);
dot("\(B\)", B, SE);
dot("\(C\)", C, N);

draw(Label("\(a\)", Relative(1), fontsize(10)), a);
draw(Label("\(b\)", Relative(1), fontsize(10)), b);
draw(Label("\(c\)", Relative(1), fontsize(10)), c);



draw(Label("\(a'\)", Relative(1), fontsize(10)), Ap);
draw(Label("\(b'\)", Relative(0.98), fontsize(10), align=N), Bp);
draw(Label("\(c'\)", Relative(1), fontsize(10)), Cp);


dot(Label("\(P\)", fontsize(9.5)), P, E*0.98+N*1.5);
dot(Label("\(P'\)", fontsize(10)), Pp, W*0.2+N*1.3);

//angles
markangle(Label("\(\alpha\)"), n=1, B, A, P, radius=6mm, fontsize(9));
markangle(Label("\(\alpha\)", Relative(0.55)), n=1, Pp, A, C, radius=7mm,
fontsize(9));


markangle(Label("\(\beta\)", Relative(0.55)), n=2, C, B, P, radius=4mm,
fontsize(9));
markangle(Label("\(\beta\)", Relative(0.55)), n=2, Pp, B, A, radius=5.0mm,
fontsize(9));

markangle(Label("\(\gamma\)", Relative(0.4)), n=3, P, C, B, radius=4mm,
fontsize(9));
markangle(Label("\(\gamma\)", Relative(0.55)), n=3, A, C, Pp, radius=5mm,
fontsize(9));

label("\(\gamma'\)", C, S*4+W*0.7, fontsize(9));
label("\(\beta'\)", B, N*5+W*8, fontsize(8));
label("\(\alpha'\)", A, N*4+E*9, fontsize(9));
//Pp, C, P, radius=5mm,
//fontsize(9));

//unfill dots
dot(A);
dot(B);
dot(C);


//draw(box((-5, -5), (5, 5)), invisible);

