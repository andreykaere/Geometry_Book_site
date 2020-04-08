import geometry;
size(9cm);

pen penColor = rgb("bcbdd0");

triangle t = triangleabc(4, 6, 5.5);

point B = t.C;
point A = t.A;
point C = t.B;

circle w = circle(t);

line a = tangent(w, A);
line c = tangent(w, C);

point M = midpoint(segment(A, C));

point P = intersectionpoint(a, c);

point A1 = intersectionpoint(perpendicular(A, line(B, A)), line(B, C));
point C1 = intersectionpoint(perpendicular(C, line(B, C)), line(B, A));


//draw

dot("$B$", B, N+E, fontsize(12) + penColor);
dot("$A$", A, S*0+W*2, fontsize(12) + penColor);
dot("$C$", C, S*0+E*2, fontsize(12) + penColor);

//dot("$M$", M, S*1.5+W*0.7, fontsize(12) + penColor);

draw(t, penColor);
draw(w, penColor);

//draw(segment(A, P), penColor);
//draw(segment(A1, P), penColor);


draw(segment(A, C1), penColor);
draw(segment(C, A1), penColor);

draw(segment(A, A1), penColor+dashed);
draw(segment(C, C1), penColor+dashed);


draw(segment(C1, P), penColor, StickIntervalMarker(1, 1, 4, penColor));
draw(segment(C, P), penColor, StickIntervalMarker(1, 1, 4, penColor));
draw(segment(A1, P), penColor, StickIntervalMarker(1, 1, 4, penColor));

//draw(segment(B, M), penColor);
//draw(segment(B, P), penColor);

dot("$C_p$", P, S+W*2, fontsize(12) + penColor);

//markangle(A, B, M, penColor, n=1, radius=6mm);
//markangle(P, B, C, penColor, n=1, radius=6.7mm);



dot("$A_1$", A1, SE, fontsize(12) + penColor);
dot("$C_1$", C1, SW, fontsize(12) + penColor);



markrightangle(A1, A, C1, 7, penColor);
markrightangle(C1, C, B, 7, penColor);


dot(intersectionpoint(line(A, A1), line(C, C1)), penColor);

markangle(C1, C, P,  penColor, n=1, Fill(penColor), radius=4.5mm);
markangle(A1, A, C,  penColor, n=1, Fill(penColor), radius=5mm);
markangle(A1, C1, C, penColor, n=1, Fill(penColor), radius=5mm);

/*
markangle(Label("$\alpha$", fontsize(10) + penColor), C1, C, P, penColor, n=1, radius=4.5mm);
markangle(Label("$\alpha$", fontsize(10) + penColor), A1, A, C, penColor, n=1, radius=5mm);
markangle(Label("$\alpha$", fontsize(10) + penColor), A1, C1, C, penColor, n=1, radius=5mm);
*/
