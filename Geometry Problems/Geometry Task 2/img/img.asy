import geometry;
size(10cm);

draw(box((-1.8,-0.5),(1.2,1.75)), invisible);


//usepackage("mathrsfs"); currentpen=fontsize(9); 
pen bpp=linewidth(0.27mm);
//pen bpp=linewidth(0.01mm);
var Px = -1.7; 
var Py = 0;

point P = (Px, Py);
dot("$P$", P, W, fontsize(8));

var r1 = 0.3;
var r2 = 0.4;

var o1y = 0;
var o1x = 0;

point o1 = (o1x, o1y);
point o2 = ((o1x - Px)*(r2/r1)+Px, 0);

circle c1 = circle(o1, r1);
circle c2 = circle(o2, r2);



//draw(Label("$\omega$", Relative(-0.4), fontsize(9)), c1, W, linewidth(bp)); 
//draw(Label("$\Omega$", Relative(-0.06)), c2, E);

dot("$O_1$", o1, SW, fontsize(7));
dot("$O_2$", o2, SE, fontsize(7));
draw(c1, bpp);
draw(c2, bpp);



line[] T = tangents(c1, P);

line top_tan = T[1];

point T1 = intersectionpoints(top_tan, c1)[0]; 
point T2 = intersectionpoints(top_tan, c2)[0]; 

dot("$T_1$", T1, N, fontsize(7));
dot("$T_2$", T2, N, fontsize(7));


point R = intersectionpoints(T[0], c1)[0];
point Q = intersectionpoints(T[1], c1)[0];

line r = line(P, false, R);
line q = line(P, false, Q);

draw(r, bpp);
draw(q, bpp);

point K = (3, 0.3);

line k = line(P, false, K);

draw(Label("$k$", Relative(0.99), align=N, fontsize(7)), k);
//draw("$l$", l, bpp);
//draw(k, bpp);


point[] AAp = intersectionpoints(k, c1);
point[] BBp = intersectionpoints(k, c2);

point A = AAp[0];
point B = BBp[1];

dot("$A$", AAp[0], NW, fontsize(8));
dot("$A'$", AAp[1], NE, fontsize(8));
dot("$B$", BBp[1], NE, fontsize(8));
dot("$B'$", BBp[0], NW, fontsize(8));

//markangle("$\alpha$", A, P, T1, radius=15mm);


line a = tangent(c1, A);
line b = tangent(c2, B);


//draw(a, bpp);
//draw(b, bpp);


//draw(tangents(W, w));



point[] U = intersectionpoints(c2, c1);
point M  = U[0];
point N_ = U[1];
point C = intersectionpoint(a, b);

dot(M);
dot(N_);

//dot("$M$", M, fontsize(7));
//dot("$N$", N_, fontsize(7));

line l = line(C, false, M);



draw(Label("$l$", Relative(1), align=SE, fontsize(7)), l, dashed);





draw(Label("$a$", Relative(1), 
                  align=NW, fontsize(7)), 
                    line(C,false,A), bpp);
draw(Label("$b$", Relative(1),
                  align=NE, fontsize(7)),
                     line(C, false, B), bpp);
dot(Label("$C$"), C, N, fontsize(8));




