import geometry;

size(8cm);

pen penColor = black;

triangle t = triangleabc(8, 12, 5);

point A = t.B;
point C = t.A;
point B = t.C;

point L = bisectorpoint(t.AB);

//draw

draw(t);

dot("$B$", B, N+E, fontsize(12) + penColor);
dot("$C$", C, SW, fontsize(11) + penColor);
dot("$A$", A, SE, fontsize(11) + penColor);

dot("$L$", L, SE, fontsize(11) + penColor);

draw(segment(B, L));

markangle(Label("$\alpha$", Relative(0.6), fontsize(8) + penColor), C, B, 
L, black, n=1, radius=10mm);


markangle(Label("$\alpha$", Relative(0.6), fontsize(8) + penColor), L, B, 
A, black, n=1, radius=11mm);


markangle(Label("$\beta$", fontsize(8) + penColor), A, L, B, black, 
n=2, radius=5mm);

markangle(Label("$180^{\circ} - \beta$", fontsize(6) + penColor), 
B, L, C, black, n=2, radius=2mm);
