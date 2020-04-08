import geometry;
size(8cm);

pen penColor = rgb("333333");

triangle t = triangleabc(5, 6, 7);

point B = t.A;
point A = t.C;
point C = t.B;


circle exB = excircle(A, C, B);
circle exC = excircle(A, B, C);

point Ib = exB.C;
point Ic = exC.C;

//draw



clipdraw(exB, penColor);
clipdraw(exC, penColor);


dot("$I_c$", Ic, S*0+W, fontsize(12) + penColor);
dot("$I_b$", Ib, S*0+E, fontsize(12) + penColor);

clipdraw(circle(B, C, Ib), penColor + dashed);




markangle(line(B, C), line(C, Ib), penColor, n=1, radius=4mm);
markangle(Ic, C, B, penColor, n=2, radius=5mm);
markangle(A, C, Ic, penColor, n=2, radius=4.3mm);
markangle(Ib, C, A, penColor, n=1,  radius=3.4mm);

draw(segment(Ic, Ib), penColor);
draw(segment(Ic, C), penColor);
draw(segment(B, Ib), penColor);
draw(segment(C, Ib), penColor);
draw(segment(Ic, B), penColor);

draw(line(A, B), penColor);
draw(line(A, C), penColor);
draw(line(C, B), penColor);

markrightangle(Ic, B, Ib, 8, penColor);

dot("$A$", A, N*2+E*0.2, fontsize(12) + penColor);
dot("$B$", B, S*1.25+W*3, fontsize(12) + penColor);
dot("$C$", C, S*1+E*2, fontsize(12) + penColor);



addMargins(cm/2, cm);
