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

draw(line(A, B), penColor);
draw(line(A, C), penColor);
draw(line(C, B), penColor);

dot("$A$", A, N*2+E*0.2, fontsize(12) + penColor);
dot("$B$", B, S*1.25+W*3, fontsize(12) + penColor);
dot("$C$", C, S*1+E*2, fontsize(12) + penColor);

clipdraw(exB, penColor);
clipdraw(exC, penColor);


dot("$I_c$", Ic, S*0+W, fontsize(12) + penColor);
dot("$I_b$", Ib, S*0+E, fontsize(12) + penColor);

clipdraw(circle(B, C, Ib), penColor + dashed);


addMargins(cm/2, cm);
