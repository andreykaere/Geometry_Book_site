import geometry;

size(10cm);

currentpen = fontsize(10);

//pen bpp = linewidth(0.01mm);
point Ka = (-2, 0);
point Kb = (5, 5);
point Kc = (8, -1);

dot(Label("$K_a$",fontsize(10)), Ka, SW, 0.9mm+black);
dot(Label("$K_b$",fontsize(10)), Kb, NE, 0.9mm+black);
dot(Label("$K_c$",fontsize(10)), Kc, SE, 0.9mm+black);

triangle t = triangle(Ka, Kb, Kc);

draw(t, linewidth(0.27mm));

circle w = incircle(t);

draw(Label("$\omega$", Relative(0.6), fontsize(10)), w, linewidth(0.1mm));

triangle itr = intouch(t);
//dot(circumcenter(itr), 0.9mm+black);

draw(itr, linewidth(0.2mm));

label("$A$", "$B$", "$C$", itr);


point La = bisectorpoint(itr.BC);
draw(segment(itr.A, La), linewidth(0.1mm));

dot(Label("$L_a$",fontsize(10)), La, N*0.7+W*0.8, 0.9mm+black);


point Lb = bisectorpoint(itr.AC);
draw(segment(itr.B, Lb), linewidth(0.1mm));

dot(Label("$L_b$",fontsize(10)), Lb, N*0.5+E*0.7, 0.9mm+black);


point Lc = bisectorpoint(itr.BA);
draw(segment(itr.C, Lc), linewidth(0.1mm));
dot(Label("$L_c$",fontsize(10)), Lc, N*0.2+E*1.2, 0.9mm+black);



draw(line(Ka, false, La));
draw(line(Kb, false, Lb));
draw(line(Kc, false, Lc));

dot(intersectionpoint(line(Ka, false, La),
                      line(Kb, false, Lb)), 0.7mm+black);

dot(incenter(itr), 0.5mm+black);
label(Label("$I$", fontsize(8)), incenter(itr), N*1.3+E*0.9);

markangle(itr.C, itr.A, La, radius=5.5mm, fontsize(8));
markangle(La, itr.A, itr.B, radius=6mm, fontsize(8.5));

markangle(n=2, itr.A, itr.B, Lb, radius=4.5mm, fontsize(8));
markangle(n=2, Lb, itr.B, itr.C, radius=6mm, fontsize(8));

markangle(n=3, Lc, itr.C, Lb, radius=3.5mm, fontsize(8));
markangle(n=3, itr.B, itr.C, Lc, radius=3mm, fontsize(8));

/*

markangle("$\alpha$", itr.C, itr.A, La, radius=5.5mm, fontsize(8));
markangle(Label("$\alpha$", Relative(0.55)), 
La, itr.A, itr.B, radius=6mm, fontsize(8.5));

markangle("$\beta$", n=2, itr.A, itr.B, Lb, radius=4.5mm, fontsize(8));
markangle("$\beta$", n=2, Lb, itr.B, itr.C, radius=6mm, fontsize(8));

markangle("$\gamma$", n=3, Lc, itr.C, Lb, radius=3.5mm, fontsize(8));
markangle("$\gamma$", n=3, itr.B, itr.C, Lc, radius=3mm, fontsize(8));
*/


/*
point Kcp = bisectorpoint(t.BA);

point Kbp = bisectorpoint(t.CA);


dot(Kcp);
dot(Kbp);

draw(segment(Kbp, Kb));
*/


//draw(box((-10, -10), (10,10)), invisible);
