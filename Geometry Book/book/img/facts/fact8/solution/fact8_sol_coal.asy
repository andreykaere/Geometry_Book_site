import geometry;
size(7cm);


pen penColor = rgb("98a3ad");

triangle t = triangleabc(4, 5.5, 6);

point A = t.C;
point B = t.A;
point C = t.B;


circle ic = incircle(t);
circle w = circle(t);

point I = ic.C;
point O = w.C;


point M = intersectionpoints(line(I, O), w)[0];
point _N = intersectionpoints(line(I, O), w)[1];

point L = intersectionpoints(line(A, I), w)[0];

point Ip = projection(line(A, C))*I;

//draw
draw(t, penColor);
draw(ic, penColor);
draw(w, penColor);

dot("$A$", A, N+E*0.5, fontsize(12) + penColor);
dot("$B$", B, SW, fontsize(12) + penColor);
dot("$C$", C, SE, fontsize(12) + penColor);


dot(Label("$I$"), I, SE, fontsize(12) + penColor);
dot(Label("$O$"), O, S*0.7+E*0.5, fontsize(12) + penColor);


dot(Label("$N$"), _N, fontsize(12) + penColor);
dot(Label("$M$"), M, SW, fontsize(12) + penColor);

dot(Label("$L$"), L, S+E*0.7, fontsize(12) + penColor);

draw(segment(M, _N), penColor);
draw(segment(A, I), penColor);
draw(segment(C, L), penColor, StickIntervalMarker(1, 1, 4, penColor));
draw(segment(I, L), penColor, StickIntervalMarker(1, 1, 4, penColor));


draw(Label("$r$", Relative(0.5)), segment(I, Ip), fontsize(11) + penColor);

markangle(Label("$\alpha$", fontsize(10) + penColor), I, A, C, penColor, n=1, radius=4.5mm);
markangle(Label("$\alpha$", fontsize(10) + penColor), B, A, I, penColor, n=1, radius=5.3mm);
markrightangle(I, Ip, A, 6, penColor);
