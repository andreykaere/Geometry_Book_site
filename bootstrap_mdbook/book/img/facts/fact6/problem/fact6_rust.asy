import geometry;
size(9cm);

triangle t = triangleabc(5, 7, 6);

point A = t.C;
point B = t.A;
point C = t.B;

point I = incircle(t).C;

circle w = circle(t);

circle g = excircle(t.AB);

point Ia = g.C;

point L = intersectionpoints(line(A, I), w)[0];

pen penColor = rgb("262625");
//draw

draw(Label(), w, penColor);
clipdraw(Label(), g, penColor);

/*
markangle(Label("$\alpha$", fontsize(10) + penColor), B, A, I, blue, n=1, radius=5mm, Fill(blue));
markangle(Label("$\alpha$", fontsize(10) + penColor), I, A, C, blue, n=1, radius=6mm, Fill(blue));
markangle(Label("$\alpha$", fontsize(10) + penColor), L, B, C, blue, n=1, radius=6mm, Fill(blue));

markangle(Label("$\beta$", fontsize(9) + penColor), I, B, A, yellow*0.3+purple, n=1, radius=4.5mm, Fill(yellow*0.3+purple));
markangle(Label("$\beta$", fontsize(9) + penColor), C, B, I, yellow*0.3+purple, n=1, radius=5.5mm, Fill(yellow*0.3+purple));

markrightangle(I, C, Ia, 7.5, penColor);
markangle(Label("$\alpha \! + \! \beta$", fontsize(7.5) + penColor), B, I, L, yellow+green, n=1, 
radius=5.5mm, Fill(yellow+green));
*/

draw(segment(B, C), penColor);
draw(line(A, false, B), penColor);
draw(line(A, false, C), penColor);

/*
draw(segment(I, L),  linewidth(0.7)+red, StickIntervalMarker(1, 1, 4, red));
draw(segment(Ia, L), linewidth(0.7)+red, StickIntervalMarker(1, 1, 4, red));
draw(segment(B, L),  linewidth(0.7)+red, StickIntervalMarker(1, 1, 4, red));
draw(segment(C, L),  linewidth(0.7)+red, StickIntervalMarker(1, 1, 4, red));

draw(segment(A, I),  penColor);
draw(segment(B, I),  penColor);
draw(segment(B, Ia), penColor);
draw(segment(C, Ia), penColor);
draw(segment(C, I),  penColor);
*/

draw(segment(A, Ia), penColor);
draw(segment(B, L),  penColor);
draw(segment(C, L),  penColor);

dot("$A$", A, N*0.7+E*0.7, fontsize(12) + penColor);
dot("$B$", B, W*1.5+S*0.2, fontsize(12) + penColor);
dot("$C$", C, E*1.5+S*0.2, fontsize(12) + penColor);
dot("$I$", I, N*0.5+E, fontsize(12) + penColor);
dot("$L$", L, SE, fontsize(12) + penColor);
dot("$I_A$", Ia, SE, fontsize(12) + penColor);




draw(box((0, 0), (-2.62, -1)), invisible);
