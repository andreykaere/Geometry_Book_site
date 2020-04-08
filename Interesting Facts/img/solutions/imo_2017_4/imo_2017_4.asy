import geometry;
size(10cm);


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
dot("$Q$", Kp, N*1.3+W);
dot("$J'$", Jp);
//dot(Tp, linewidth(4)+red);
//dot(Sp, linewidth(4)+green);
draw(segment(Kp, A), linewidth(0.3));
draw(I * w, linewidth(0.3));
draw(line(R, false, J), linewidth(0.3));

draw(segment(K, Kp), dashed+linewidth(0.3));
draw(segment(A, T), linewidth(0.3));



clipdraw(Label("$\gamma$"), circle(Kp, _S, R), dashed+linewidth(0.3));
//draw(I * G, linewidth(5)+blue);
//draw(I * line(K, T), linewidth(5)+orange);
//draw(circle(R, K, T));

//draw
//draw(t);
draw(segment(_S, J), linewidth(0.3));
//draw(segment(_S, J));

draw(Label("$\Omega$", Relative(0.1)), w);
//draw(arc(G, A, Jp));
clipdraw(Label("$\Gamma$"), G);
draw(Label("$\ell$", fontsize(9.5)), l, linewidth(0.4));


draw(segment(_S, R), StickIntervalMarker(1, 1, 3.5, linewidth(0.5)));
draw(segment(_S, T), StickIntervalMarker(1, 1, 3.5, linewidth(0.5)));

draw(line(T, K, false), dashed + linewidth(0.4));

draw(segment(A, K));
//draw(segment(Ap, T));

draw(segment(K, R), linewidth(0.3));

dot("$A$", A, NE);
//dot(Label("$K$", UnFill), K, S+W*2);
dot(Label("$K$"), K, N*2);

dot("$T$", T, W);
dot(Label("$J$", UnFill), J, S*1.16+E*0.5);
dot("$R$", R);
dot("$S$", _S, S+W*0.2);

markangle(A, T, R,  Fill(black), n=1, radius=5mm);
markangle(K, J, _S, Fill(black), n=1, radius=5mm);
markangle(K, R, _S, Fill(black), n=1, radius=5mm);


addMargins(cm/5, 0);
