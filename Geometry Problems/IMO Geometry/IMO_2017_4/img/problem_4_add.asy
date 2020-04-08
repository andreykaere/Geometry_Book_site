import geometry;
size(20cm);


triangle t = triangleabc(sqrt(5*5-4.5*4.5), 5, 4.5);
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

draw(line(Ap, J));

//draw(circle(I), dashed);
dot("$Q$", Kp, N*1.3+W);
dot("$J'$", Jp);
//dot(Tp, linewidth(4)+red);
//dot(Sp, linewidth(4)+green);
draw(line(Kp, _S));
draw(I * w);
draw(line(R, false, J));

draw(segment(K, Kp), dashed);
draw(segment(A, T));

clipdraw(Label("$\gamma$"), circle(Kp, _S, R), dashed);
//draw(I * G, linewidth(5)+blue);
//draw(I * line(K, T), linewidth(5)+orange);
//draw(circle(R, K, T));



//draw
draw(t);
draw(Label("$\Omega$", Relative(0.1)), w);

draw(line(Ap, S));
//draw(arc(G, A, Jp));
draw(Label("$\Gamma$"), G);
draw(Label("$\ell$"), l);


draw(segment(_S, T));

draw(line(T, K), dashed);

draw(segment(A, K));
//draw(segment(Ap, T));

draw(segment(K, R));

dot("$A$", A, NE);
dot(Label("$K$", UnFill), K, S+W*2);

dot("$T$", T, W);
dot(Label("$J$", UnFill), J, S*1.16+E*0.5);
dot("$R$", R);
dot("$S$", _S, S+W*0.2);

markangle(A, T, R,  Fill(black), n=1, radius=5mm);
markangle(K, J, _S, Fill(black), n=1, radius=5mm);
markangle(K, R, _S, Fill(black), n=1, radius=5mm);


addMargins(cm/5, 0);
