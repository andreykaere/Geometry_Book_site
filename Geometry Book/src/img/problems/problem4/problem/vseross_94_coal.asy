//import "/home/andrey/Geometry Problems/tangents.asy" as tangents;
import tangents;
import geometry;
size(7cm);


pen penColor = rgb("98a3ad");

var r = 1;
circle w = circle((point)(0, 0), r);

var x1 = 0.8;
var x2 = -0.7;
var x3 = 0.3;

var y1 = -sqrt(r*r - x1*x1);
var y2 = -sqrt(r*r - x2*x2);
var y3 = sqrt(r*r - x3*x3);

var r1 = 0.9;
var r2 = 0.8;
var r3 = 0.7;

point o1 = (point)(x1*(r+r1)/r, y1*(r+r1)/r);
point o2 = (point)(x2*(r+r2)/r, y2*(r+r2)/r);
point o3 = (point)(x3*(r+r3)/r, y3*(r+r3)/r);


circle w1 = circle(o1, r1);
circle w2 = circle(o2, r2);
circle w3 = circle(o3, r3);


//line a = tangents(w1)[0];
//line b = tangents(w1)[1];

//var d = w1.r;
//var c = w1.;

line AC = out_tangents(w2, w1)[0];
line BC = out_tangents(w1, w3)[1];
line AB = out_tangents(w2, w3)[1];

point A = intersectionpoint(AC, AB);
point B = intersectionpoint(BC, AB);
point C = intersectionpoint(AC, BC);


point A1 = intersectionpoints(w2, w)[0];
point B1 = intersectionpoints(w3, w)[0];
point C1 = intersectionpoints(w1, w)[0];

point P = intersectionpoint(line(C, C1), line(A, A1));

//draw

draw(segment(A, B), penColor);
draw(segment(C, B), penColor);
draw(segment(A, C), penColor);

label(Label("$A$"), A, SW, fontsize(13.5) + penColor);
label(Label("$B$"), B, N, fontsize(13.5) + penColor);
label(Label("$C$"), C, SE, fontsize(13.5) + penColor);


dot(P, penColor);

draw(segment(A, P), penColor);
draw(segment(B, P), penColor);
draw(segment(C, P), penColor);
//draw(out_tangents(w1, w2));
//draw(out_tangents(w3, w2));
//draw(out_tangents(w1, w3));



draw(w, linewidth(1.2) + penColor);
draw(w1, penColor);
draw(w2, penColor);
draw(w3, penColor);


dot(Label("$A_1$"), A1, S+W*0.1, fontsize(13.5) + penColor);
dot(Label("$B_1$"), B1, N*1+E, fontsize(13.5) + penColor);
dot(Label("$C_1$"), C1, fontsize(13.5) + penColor);
//dot(Label("$C_1$"), C1, S*1.2+E*0.3);

/*
draw(Label("$\omega_1$"), w1);
draw(Label("$\omega_2$"), w2);
draw(Label("$\omega_3$"), w3);

*/
//addMargins(2cm, 2cm);
