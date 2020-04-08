import geometry;
size(7cm);

pen penColor = rgb("262625");


triangle t = triangleabc(5, 6, 7);

point A = t.C;
point B = t.A;
point C = t.B;

circle w = circle(t);

point O = w.C;
point H = orthocentercenter(t);
point M = centroid(t);

point A1 = midpoint(segment(C, B));
point C1 = midpoint(segment(A, B));
point B1 = midpoint(segment(C, A));

//draw 

draw(t, penColor);

dot("$A$", A, N*0.7+E*0.7, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);

dot("$O$", O, N*0.9+W*0.7, fontsize(12) + penColor);
dot("$H$", H, fontsize(12) + penColor);
dot("$M$", M, fontsize(12) + penColor);

dot("$A_1$", A1, S, fontsize(12) + penColor);
dot("$B_1$", B1, N*0.2+E, fontsize(12) + penColor);
dot("$C_1$", C1, N*0.2+W*1.2, fontsize(12) + penColor);

draw(segment(A1, B1), penColor);
draw(segment(A1, C1), penColor);
draw(segment(C1, B1), penColor);

draw(segment(A1, A), penColor);
draw(segment(H, O), penColor);


draw(segment(H, A), penColor);
draw(segment(A1, O), penColor);
