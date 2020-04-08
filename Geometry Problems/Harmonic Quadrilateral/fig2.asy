import geometry;


size(5cm);

point A = (0,0);
point B = (2.5,7);
point C = (8,0);

line l = bisector(A,C);

point Bp = reflect(l) * B;

point M = midpoint(segment(A,C));

point D = intersectionpoints(line(Bp, M), circle(A,B,C))[0];

line l = bisector(A,C);
point W_ = intersectionpoints(l,circle(A,B,C))[1];
//draw 

dot("$A$", A, SW);
dot("$B$", B, NW);
dot("$C$", C);
dot("$B'$", Bp, NE);
dot("$M$", M, SE);
dot("$D$", D, SW);
dot("$W$", W_, N+E*.7);

//draw(Label("$\ell$", Relative(.5), W, fontsize(11)), line(W_,false, M), dashed);
draw(Label("$\ell$", Relative(.5), W, fontsize(11)), l, dashed);

draw(A--B--C--D--cycle, linewidth(1));
draw(A--Bp--C^^Bp--D^^A--C^^D--B);

draw(circle(A,B,C));

