
import geometry;

size(6.5cm);

currentpen = fontsize(12);

    
point C = (0, 1);
point Kb  = (5, 5);
point A  = (7, 1);

dot(Label("$A$",fontsize(12)), A, SE, 0.9mm+black);
dot(Label("$K_b$",fontsize(12)), Kb, N, 0.9mm+black);
dot(Label("$C$",fontsize(12)), C, SW, 0.9mm+black);

triangle t = triangle(A, Kb, C);

draw(t, linewidth(0.27mm));

point Lb = (4.3, 1);
dot("$L_b$", Lb, SE);

draw(line(Kb, false, Lb), linewidth(0.2mm));


markangle("$\alpha$", C, Kb, Lb, radius=5mm);
markangle(Label("$\beta$", Relative(0.6)), n=2, Lb, Kb, A, radius=6mm);

line hb = altitude(t.AC);

draw(Label("$h$", Relative(0.55), E, fontsize(12)), segment(hb), dashed);
perpendicularmark(t.AC,hb, quarter=-1, fontsize(2));
