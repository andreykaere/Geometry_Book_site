import geometry;
size(10cm);

pen penColor = rgb("333333");

triangle t = triangleabc(4, 6, 2.5);
point J  = t.B;
point R  = t.C;
point _S = t.A;

triangle t = triangle(R, J, _S);

point T = -1*R;

circle w = circle(t);

line l = tangents(w, R)[0];

circle G = circle(T, _S, J);

point A = intersectionpoints(G, l)[1];

point K = intersectionpoints(w, line(J, A))[1];

inversion I = inversion(circle(R, sqrt(2)*length(segment(R, _S))));//sqrt(2) * length(segment(R, _S)));

//draw(segment(R, _S), bp+red*1.2);
//draw(circle(R, length(segment(R, _S))), bp+red*1.2);

point Kp = I * K;
point Tp = I * T;
point Sp = I * _S;
point Ap = I * A;
point Jp = I * J;


//draw(circle(I), dashed);
//dot("$Q$", Kp, N*1.3+W);
//dot("$J'$", Jp);
//dot(Tp, linewidth(4)+red);
//dot(Sp, linewidth(4)+green);
//draw(segment(Kp, A), linewidth(0.3));
//draw(I * w, linewidth(0.3));
//draw(line(R, false, J), linewidth(0.3));

//draw(segment(K, Kp), dashed+linewidth(0.3));
//draw(segment(A, T), linewidth(0.3));



//clipdraw(Label("$\gamma$"), circle(Kp, _S, R), dashed+linewidth(0.3));
//draw(I * G, linewidth(5)+blue);
//draw(I * line(K, T), linewidth(5)+orange);
//draw(circle(R, K, T));

//draw
//draw(t);
draw(segment(_S, J), linewidth(0.3) + penColor);
//draw(segment(_S, J));

clipdraw(Label("$\Omega$", Relative(-0.47), W), w, penColor);
clipdraw(Label("$D$", Relative(0.01)), w, invisible);
//draw(arc(G, A, Jp));
clipdraw(Label("$\Gamma$", Relative(0.155), NE), G, penColor);
draw(Label("$\ell$", Relative(1), E,  fontsize(10.5) + penColor), line(A, false, R), linewidth(0.4) + penColor);


draw(segment(_S, R), penColor, StickIntervalMarker(1, 1, 3.5, linewidth(0.5) + penColor));
draw(segment(_S, T), penColor, StickIntervalMarker(1, 1, 3.5, linewidth(0.5) + penColor));

draw(line(T, K, false), dashed + linewidth(0.4) + penColor);

draw(segment(A, K), penColor);
//draw(segment(Ap, T));

draw(segment(K, R), linewidth(0.3) + penColor);

dot("$A$", A, NE, penColor);
//dot(Label("$K$", UnFill), K, S+W*2);
dot(Label("$K$"), K, N*2+E, penColor);

dot("$T$", T, W, penColor);
dot(Label("$J$", UnFill), J, S*1.16+E*0.5, penColor);
dot("$R$", R, SE, penColor);
dot("$S$", _S, S+W*0.2, penColor);

//markangle(A, T, R,  Fill(black), n=1, radius=5mm);
//markangle(K, J, _S, Fill(black), n=1, radius=5mm);
//markangle(K, R, _S, Fill(black), n=1, radius=5mm);


addMargins(cm/5, 0);
