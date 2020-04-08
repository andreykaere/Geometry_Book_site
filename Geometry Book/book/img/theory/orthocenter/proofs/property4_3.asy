import geometry;

size(7cm);

pen penColor = red;

triangle t = triangleabc(4.8, 6.35, 6);

point A = t.C;
point B = t.A;
point C = t.B;

circle w = circle(t);

point O = w.C;

point H = orthocentercenter(t);

point A1 = midpoint(segment(A, H));
point B1 = midpoint(segment(B, H));
point Ma = midpoint(segment(B, C));
point Mc = midpoint(segment(B, A));

point Ha = intersectionpoint(line(A, H), line(B, C));
point Hb = intersectionpoint(line(B, H), line(A, C));
point Hc = intersectionpoint(line(C, H), line(B, A));

//draw

draw(t, penColor);
draw(w, penColor);


dot("$O$", O, penColor);
dot("$H$", H, N*2+E*1.5, penColor);

dot("$A_1$", A1, W, penColor);
dot("$B_1$", B1, NW, penColor);

dot(Label("$M_C$"), Mc, N*1.6+W*0.7, fontsize(12) + penColor);
dot(Label("$M_A$"), Ma, S*1.5, fontsize(12) + penColor);



dot("$A$", A, N+E, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);


draw(segment(Ma, O), penColor);
draw(segment(Mc, B1), penColor);
draw(segment(H, A), penColor);


draw(segment(Mc, O), penColor);
draw(segment(B1, Ma), penColor);



draw(segment(B, Hb), penColor);
draw(segment(A, Ha), penColor);
draw(segment(C, Hc), penColor);


markrightangle(O, Ma, C, 6, penColor);
markrightangle(A, Ha, C, 6, penColor);

markrightangle(A, Hc, C, 6, penColor);
markrightangle(A, Mc, O, 6, penColor);

