import geometry;
size(6cm);

triangle t = triangleabc(5, 6, 7);

point A = t.A;
point B = t.B;
point C = t.C;


point C1 = 0.7*t.B;
point B1 = 0.6*t.C;


line b = line(B, false, B1);
line c = line(C, false, C1);

point Q = intersectionpoint(c, b);

line a = line(A, false, Q);

triangle t1 = cevian(t, Q);
triangle t2 = isotomic(t, Q);

point Qp = isotomicconjugate(t, Q); 

line Ap = line(A, false, Qp);
line Bp = line(B, false, Qp);
line Cp = line(C, false, Qp);

point Ma=midpoint(t.BC), Mb=midpoint(t.AC), Mc=midpoint(t.BA);

//draw all figures

draw(t, linewidth(bp));
dot("\(A\)", A, SW);
dot("\(B\)", B, SE);
dot("\(C\)", C, N);

draw(segment(isotomic(t.VA,Q))^^segment(isotomic(t.VB,Q))^^segment(isotomic(t.VC,Q)));
draw(segment(cevian(t.VA,Q))^^segment(cevian(t.VB,Q))^^segment(cevian(t.VC,Q)));

dot(Label("\(Q\)", fontsize(11)), Q, E*0.98+N*1.5);
dot(Label("\(Q'\)", fontsize(11)), Qp, W*0.2+N*1.3);

label("$A_1$", "$B_1$", "$C_1$", t1, fontsize(10));
label("$A_2$", "$B_2$", "$C_2$", t2, fontsize(10));

//draw(t1.A--t2.A, 0.8*black, StickIntervalMarker(2,1,0.8*black));
//draw(t1.B--t2.B, 0.8*black, StickIntervalMarker(2,2,0.8*black));
//draw(t1.C--t2.C, dashed+black,//% 0.8*black, 
//StickIntervalMarker(2,3));




dot(Ma);
dot(Mb);
dot(Mc);

//dot("$M_a$",Ma,-dir(t.VA), fontsize(10));
//dot("$M_b$",Mb,-dir(t.VB), fontsize(10)); 
//dot("$M_c$",Mc,-dir(t.VC), fontsize(10));


/*
draw(Label("\(a\)", Relative(1), fontsize(10)), a);
draw(Label("\(b\)", Relative(1), fontsize(10)), b);
draw(Label("\(c\)", Relative(1), fontsize(10)), c);



draw(Label("\(a'\)", Relative(1), fontsize(10)), Ap);
draw(Label("\(b'\)", Relative(0.98), fontsize(10), align=N), Bp);
draw(Label("\(c'\)", Relative(1), fontsize(10)), Cp);
*/


//unfill dots
dot(A);
dot(B);
dot(C);

