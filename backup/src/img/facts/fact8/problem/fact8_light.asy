import geometry;
size(7cm);


pen penColor = rgb("333333");

triangle t = triangleabc(4, 5.5, 6);

point A = t.C;
point B = t.A;
point C = t.B;


circle ic = incircle(t);
circle w = circle(t);

point I = ic.C;
point O = w.C;

//draw


draw(t, penColor);
draw(ic, penColor);
draw(w, penColor);

dot("$A$", A, N+E*0.5, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);


dot(Label("$I$"), I, fontsize(12) + penColor);
dot(Label("$O$"), O, SE, fontsize(12) + penColor);

draw(Label("?", Relative(0.5)), segment(I, O), fontsize(10)+penColor);
