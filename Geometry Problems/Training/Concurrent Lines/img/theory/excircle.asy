import geometry;
size(6cm);

// currentcoordsys=cartesiansystem((2,1),i=(1,0.5),j=(-0.25,0.75));
// show(currentcoordsys);

point A=(-1,0), B=(2,0), C=(0,2);

triangle t = triangle(A,B,C);

//label("$A$", "$B$", "$C$", t);
label("$A$","$B$","$C$", t, alignFactor=3);

/*
dot("$A$", A, S*1.5+W*2);
label("$B$", t.B);
dot("$C$", C);
*/

draw(line(A,B), linewidth(bp));
draw(line(A,C), linewidth(bp));
draw(line(B,C), linewidth(bp));

/* View the definition of circle circle(point,point,point) */
//circle cc=circle(A,B,C);
//draw(cc, blue);
//dot(cc.C, blue);

/* View the definition of circle incircle(point,point,point) */
circle ic=incircle(A,B,C);
draw(ic);
//dot(ic.C, red);

point Ap = intersectionpoints(ic, t.AB)[0];
dot("$C_1$", Ap, S*1.5+W*0.5, fontsize(11));

draw(segment(A, Ap), StickIntervalMarker(1, 2, 4, 2, linewidth(1)));

/* View the definition of circle excircle(point,point,point) */
circle ec=excircle(A,B,C);
/* View the definition of void clipdraw(picture,Label,path,align,pen,arrowbar,arrowbar,real,real,Label,marker) */
clipdraw(ec);

point A1 = intersectionpoints(ec, t.AB)[0];
dot("$T_C$", A1, S*1.3+E*0.7, fontsize(11));

draw(segment(B, A1), StickIntervalMarker(1, 2, 4, 2, linewidth(1)));

dot(A);
dot(B);
dot(C);
/*
circle ec=excircle(A,C,B);
clipdraw(ec, green);
dot(ec.C, green);

ec=excircle(C,B,A);
clipdraw(ec, green);
dot(ec.C, green);

dot("G",centroid(A,B,C),NE);
*/
// Enlarge the bounding box of the current picture
draw(box((-2,-1.6), (3.3, 2.3)), invisible);
