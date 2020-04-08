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


point MaW = intersectionpoints(w, line(H, false, Ma))[0];
point MbW = intersectionpoints(w, line(H, false, Mb))[0];
point McW = intersectionpoints(w, line(H, false, Mc))[0];


point HaW = intersectionpoints(w, line(H, false, Ha))[0];
point HbW = intersectionpoints(w, line(H, false, Hb))[0];
point HcW = intersectionpoints(w, line(H, false, Hc))[0];


circle e = circle(_E, w.r/2);



//draw


draw(t, penColor);
draw(w, penColor);
draw(e, penColor+dashed);


draw(segment(H, HcW), 0.5 + rgb("FF0000"));
draw(segment(H, HbW), 0.5 + rgb("FF5D00"));
draw(segment(H, HaW), 0.5 + rgb("00C8FF"));


draw(segment(H, MaW), 0.5 + rgb("9BFF00"));
draw(segment(H, MbW), 0.5 + rgb("272BA9"));
draw(segment(H, McW), 0.5 + rgb("2788A9"));

draw(segment(H, A), 0.5 + rgb("00FF44"));
draw(segment(H, B), 0.5 + rgb("FF0074"));
draw(segment(H, C), 0.5 + rgb("D4FF00"));


dot(Label("$E$", UnFill), _E, N+E, fontsize(12) + penColor);
dot(Label("$O$", UnFill), O, NE, fontsize(12) + penColor);
dot(Label("$H$", UnFill), H, 1.5*NE, fontsize(12) + penColor);

dot("$A$", A, N+E, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);



dot(Label("$C_1$"), C1, S*2+E*0.3, fontsize(11) + penColor);
dot(Label("$B_1$"), B1, S*1.2+W*0.5, fontsize(11) + penColor);
dot(Label("$A_1$"), A1, N*2.2+W*1.1, fontsize(11) + penColor);

dot(Label("$H_b$"), Hb, S+E, fontsize(11) + penColor);
dot(Label("$H_c$"), Hc, N*2.5+E*0.2, fontsize(11) + penColor);
dot(Label("$H_a$"), Ha, S*2.5+W*1.2, fontsize(11) + penColor);

dot(Label("$M_b$"), Mb, N*0.3+E, fontsize(11) + penColor);
dot(Label("$M_c$"), Mc, N*1.6+W*0.7, fontsize(11) + penColor);
dot(Label("$M_a$"), Ma, S*1.5, fontsize(11) + penColor);



dot(MbW, 1.2mm+penColor);
dot(MaW, 1.2mm+penColor);
dot(McW, 1.2mm+penColor);

dot(HbW, 1.2mm+penColor);
dot(HaW, 1.2mm+penColor);
dot(HcW, 1.2mm+penColor);


draw(segment(H, _E), penColor, StickIntervalMarker(1, 1, 3.5, penColor));
draw(segment(O, _E), penColor, StickIntervalMarker(1, 1, 3.5, penColor));


/*
dot("$M_b^{\Omega}$", MbW, N*0.5+E, fontsize(11) + penColor);
dot("$M_c^{\Omega}$", McW, NW, fontsize(11) + penColor);
dot("$M_a^{\Omega}$", MaW, S*1.5, fontsize(11) + penColor);


dot("$H_b^{\Omega}$", HbW, N*0.5+E, fontsize(11) + penColor);
dot("$H_c^{\Omega}$", HcW, NW, fontsize(11) + penColor);
dot("$H_a^{\Omega}$", HaW, S*1.5, fontsize(11) + penColor);
*/
