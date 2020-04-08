import geometry;
size(15cm);

//triangle t = triangleabc(7,8,5);
triangle t = triangleabc(13, 17, 8);
circle c = circle(t);

line t1 = tangent(c, t.A);
line t2 = tangent(c, t.B);


point s1 = intersectionpoint(t1, line(t.C, false, t.B));
point s2 = intersectionpoint(t2, line(t.C, false, t.A));


point t1 = midpoint(segment(t.A, s1));
point t2 = midpoint(segment(t.B, s2));


line hb = segment(altitude(t.AC)); 
line ha = segment(altitude(t.BC)); 
line hc = segment(altitude(t.BA)); 

point h1 = intersectionpoint(ha, t.CB);
point h2 = intersectionpoint(hb, t.CA);
point h3 = intersectionpoint(hc, t.BA);

point p = intersectionpoint(line(t2, t1), line(h1, h2));

draw(segment(t.C, s1), linewidth(0.27mm));
draw(segment(t.C, s2), linewidth(0.27mm));
draw(line(t.A, false, t.B), linewidth(0.27mm));

draw(c, linewidth(0.1mm));


draw(ha^^hb^^hc);

draw(line(h2, h1), dashed);

dot("$H_1$", h1, NE, fontsize(12));
dot("$H_2$", h2, N*1.7+W*0.7, fontsize(12));
dot("$H_3$", h3, SW, fontsize(12));
dot(h1, UnFill);
dot(h2, UnFill);
dot(h3, UnFill);



dot("$T_1$", t1, S*1.3, fontsize(12));
dot("$T_2$", t2, S*1.3 + E*0.3, fontsize(12));

draw(line(t2, t1));


dot("$P$", p, S, fontsize(12));
dot("$S_1$", s1, SE, fontsize(12));
dot("$S_2$", s2, SW, fontsize(12));


draw(segment(s1, t.A), linewidth(0.15mm));
draw(segment(s2, t.B), linewidth(0.15mm));


dot(t1, UnFill);
dot(t2, UnFill);

dot(s1, UnFill);
dot(s2, UnFill);

dot("$A$", t.A, S*0.7+W*1.5, fontsize(12));
dot("$B$", t.B, SE, fontsize(12));
dot("$C$", t.C, N, fontsize(12));

dot(t.A, UnFill);
dot(t.B, UnFill);
dot(t.C, UnFill);
perpendicularmark(t.AC,hb,quarter=-1);
perpendicularmark(t.BC,ha,quarter=-2);

draw(line(h2, h3), dashed);
draw(line(h1, h3), dashed);

draw(box((-5, -8), (8, 7.5)), invisible);
//draw(box((-15, -15), (15, 15)), invisible);
