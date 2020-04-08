import geometry;
size(7cm);

pen penColor = rgb("c5c5c5");

triangle t = triangleabc(4, 6, 5.5);

point A = t.C;
point B = t.A;
point C = t.B;

circle w = circle(t);

point O = w.C;
point H = orthocentercenter(t);
point _E = midpoint(segment(O, H));

point Ma = midpoint(segment(C, B));
point Mc = midpoint(segment(A, B));
point Mb = midpoint(segment(C, A));

point Ha = intersectionpoint(line(A, H), line(B, C));
point Hb = intersectionpoint(line(B, H), line(A, C));
point Hc = intersectionpoint(line(C, H), line(B, A));

point A1 = midpoint(segment(A, H));
point C1 = midpoint(segment(C, H));
point B1 = midpoint(segment(B, H));



circle e = circle(_E, w.r/2);



//draw

dot("$A$", A, N+E, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);

draw(t, penColor);
draw(w, penColor);
draw(e, penColor+dashed);


dot("$E$", _E, N+E, fontsize(12) + penColor);
dot("$O$", O, NE, fontsize(12) + penColor);
dot("$H$", H, NE, fontsize(12) + penColor);



dot("$C_1$", C1, S+E*0.5, fontsize(11) + penColor);
dot("$B_1$", B1, SW, fontsize(11) + penColor);
dot("$A_1$", A1, N+E*0.2, fontsize(11) + penColor);

dot("$H_b$", Hb, S+E, fontsize(11) + penColor);
dot("$H_c$", Hc, NW, fontsize(11) + penColor);
dot("$H_a$", Ha, SE, fontsize(11) + penColor);

dot("$M_b$", Mb, N*0.5+E, fontsize(11) + penColor);
dot("$M_c$", Mc, NW, fontsize(11) + penColor);
dot("$M_a$", Ma, S*1.5, fontsize(11) + penColor);
