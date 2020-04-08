import geometry;

size(7cm);

pen penColor = red;

triangle t = triangleabc(4.7, 6.4, 6);

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


point D = intersectionpoints(line(A, O), w)[0];

point M = intersectionpoint(line(A, Ma), line(H, O));

//draw

draw(t, penColor);
draw(w, penColor);


dot("$O$", O, W, penColor);
dot("$H$", H, S*0.5+E*1, penColor);

dot("$A_1$", A1, S*1+E*0.8, penColor);
//dot("$B_1$", B1, NW, penColor);

//dot(Label("$M_C$"), Mc, N*1.6+W*0.7, fontsize(12) + penColor);
dot(Label("$M_A$"), Ma, S*1.5+E, fontsize(12) + penColor);



dot("$A$", A, N+E, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);

dot("$D$", D, SW, fontsize(12) + penColor);

dot("$M$", M, SE, fontsize(12) + penColor);


draw(segment(Ma, O), penColor);
//draw(segment(Mc, B1), penColor);



draw(segment(A, A1), penColor, StickIntervalMarker(1, 1, 3.5, penColor));
draw(segment(A1, H), penColor, StickIntervalMarker(1, 1, 3.5, penColor));

draw(segment(D, A1), penColor+dashed);

//draw(segment(Mc, O), penColor);
//draw(segment(B1, Ma), penColor);

draw(segment(A, O), penColor, StickIntervalMarker(1, 3, 3.5, 2, penColor));
draw(segment(D, O), penColor, StickIntervalMarker(1, 3, 3.5, 2, penColor));

draw(segment(D, H), penColor);

draw(segment(D, Ma), penColor, StickIntervalMarker(1, 2, 3.5, 2, penColor));
draw(segment(Ma, H), penColor, StickIntervalMarker(1, 2, 3.5, 2, penColor));
draw(segment(O, A1), penColor, StickIntervalMarker(1, 2, 3.5, 2, penColor));


draw(segment(O, H), penColor);
draw(segment(A, Ma), penColor);


//draw(segment(B, Hb), penColor);
draw(segment(A, Ha), penColor);
//draw(segment(C, Hc), penColor);


markrightangle(O, Ma, C, 6, penColor);
markrightangle(A, Ha, C, 6, penColor);

//markrightangle(A, Hc, C, 6, penColor);
//markrightangle(A, Mc, O, 6, penColor);

