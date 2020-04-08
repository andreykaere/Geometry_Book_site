import geometry;
size(7cm);

pen penColor = rgb("c5c5c5");

triangle t = triangleabc(4, 6, 5.5);

point B = t.C;
point A = t.A;
point C = t.B;

circle w = circle(t);

line a = tangent(w, A);
line c = tangent(w, C);

point M = midpoint(segment(A, C));

point P = intersectionpoint(a, c);
//draw

dot("$B$", B, N+E, fontsize(12) + penColor);
dot("$A$", A, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);

dot("$M$", M, S*1.5+W*0.7, fontsize(12) + penColor);

draw(t, penColor);
draw(w, penColor);

draw(segment(A, P), penColor);
draw(segment(C, P), penColor);

draw(segment(B, M), penColor);
draw(segment(B, P), penColor+dashed);

dot("$P$", P, SE, fontsize(12) + penColor);

markangle(A, B, M, penColor, n=1, radius=6mm);
markangle(P, B, C, penColor, n=1, radius=6.7mm);
