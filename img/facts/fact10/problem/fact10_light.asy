import geometry;
size(7cm);

pen penColor = rgb("333333");


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

point Ha = intersectionpoint(line(A, H), line(B, C));
point Hb = intersectionpoint(line(B, H), line(A, C));
point Hc = intersectionpoint(line(C, H), line(B, A));

//draw 

draw(t, penColor);

dot("$A$", A, N+E*0.5, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);



draw(line(O, H), penColor+dashed);

draw(w, penColor);

draw(segment(A, A1), penColor);
draw(segment(C, C1), penColor);
draw(segment(B, B1), penColor);

draw(segment(A, Ha), penColor);
draw(segment(C, Hc), penColor);
draw(segment(B, Hb), penColor);


dot(Label("$M$", UnFill), M, E*1.5, fontsize(12) + penColor);
dot(Label("$O$", UnFill), O, E*1.5, fontsize(12) + penColor);
dot(Label("$H$", UnFill), H, E*1.5, fontsize(12) + penColor);
