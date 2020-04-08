import geometry;

size(10cm);


triangle t = triangleabc(5.3,7,6.3);
//pen thick = cmyk(black) + linewidth(1);
pen thick = black + linewidth(1);

point A = t.C;
point B = t.B;
point C = t.A;

circle w = circle(t);

line t1 = tangent(w, B); 
line t2 = tangent(w, C); 

point T = intersectionpoint(t1, t2);

point H = orthocentercenter(A,B,C);

point B1 = intersectionpoint(line(B,H), line(A,C));
point C1 = intersectionpoint(line(C,H), line(A,B));
point A1 = intersectionpoint(line(A,H), line(C,B));

point Hp = reflect(line(C, B)) * H;
point M = midpoint(segment(B, C));

circle c = circle(A, B1, C1);

point S_ = intersectionpoints(c,w)[0];

point K = intersectionpoint(line(S_, M), line(B1, C1));
point L = intersectionpoint(line(S_, T), line(B, C));

//draw


fill(B1--C1--H--cycle, rgb("0d0dff")+opacity(.4));
fill(B--C--Hp--cycle, rgb("0d0dff")+opacity(.4));


//draw(C--Hp--B^^C1--H--B1--cycle, linewidth(0.7));

//draw(B1--M^^C1--M, linewidth(0.1));
draw(M--T^^A--Hp^^L--K);

draw(B1--C1^^B--Hp--C);
draw(line(K, T), dashed);

draw(t, thick);



dot("$A$", A, NE);
dot("$B$", B);
dot("$C$", C, SW);

draw(Label("$\Gamma$", Relative(0.4)), w, thick);
draw(t1);
draw(t2);

dot("$T$", T);
dot(Label("$H$", UnFill), H, S+W*0.1);

draw(B--B1^^C--C1);
draw(S_--M^^S_--T);

dot(Label("$C_1$", UnFill), C1, S*0.2+E*1.2);
dot("$B_1$", B1, NW);
dot("$A_1$", A1, S+W*1.1);

dot("$H'$", Hp, S*0.1+E);
dot("$M$", M, S+W*0.7);

draw(Label("$\gamma$", Relative(0.4)), c);
dot("$S$", S_);
dot("$K$", K, N*1.5+W*0.5);
dot("$L$", L, S+E*0.5);



markrightangle(C,C1,B,6);
markrightangle(B,B1,C,6);
