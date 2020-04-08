import geometry;
size(7cm);


pen penColor = rgb("333333");

point B=(-1,0), C=(2,0), A=(0,2);



triangle t = triangle(A,B,C);
label("$A$", A, N*1.5+W*0.7, fontsize(11) + penColor);
label("$B$", B, S*0.4+W*1.5, fontsize(11) + penColor);
label("$C$", C, S*0.4+E*2, fontsize(11) + penColor);


//label("$A$", "$B$", "$C$", t);
//label("$A$","$B$","$C$", t, alignFactor=1);

/*
dot("$A$", A, S*1.5+W*2);
label("$B$", t.B);
dot("$C$", C);
*/

draw(line(A, false, B), linewidth(0.5) + penColor);
draw(line(A, false, C), linewidth(0.5) + penColor);
draw(segment(B,C), linewidth(0.5) + penColor);

/* View the definition of circle circle(point,point,point) */
//circle cc=circle(A,B,C);
//draw(cc, blue);
//dot(cc.C, blue);

/* View the definition of circle incircle(point,point,point) */
circle ic=incircle(A,B,C);
draw(Label("$\omega$", Relative(0.57), fontsize(9.3) + penColor), ic, penColor);
//dot(ic.C, red);

point Ap = intersectionpoints(ic, t.BC)[0];
dot("$A_0$", Ap, S*1.5+W*0.5, fontsize(11) + penColor);

//draw(segment(A, Ap), StickIntervalMarker(1, 2, 4, 2, linewidth(1)));

/* View the definition of circle excircle(point,point,point) */
circle ec=excircle(C, B, A);
/* View the definition of void clipdraw(picture,Label,path,align,pen,arrowbar,arrowbar,real,real,Label,marker) */
clipdraw(Label("$\Gamma$", Relative(0.4), penColor), ec, penColor);

point Q = intersectionpoints(ec, t.BC)[0];
dot("$Q$", Q, S*1.3+E*0.7, fontsize(11) + penColor);


point F = intersectionpoints(line(A, Q), ic)[1];
dot("$F$", F, S*1.5+W, fontsize(11) + penColor);
//draw(segment(B, A1), StickIntervalMarker(1, 2, 4, 2, linewidth(1)));

draw(segment(A, Q), dashed+linewidth(0.3) + penColor);
dot(A, penColor);
//dot(B);
//dot(C);
/*
circle ec=excircle(A,C,B);
clipdraw(ec, green);
dot(ec.C, green);

ec=excircle(B, A, C);
clipdraw(ec, green);
dot(ec.C, green);

dot("G",centroid(A,B,C),NE);
*/
// Enlarge the bounding box of the current picture
draw(box((-2,-1.6), (3.3, 2.3)), invisible);
