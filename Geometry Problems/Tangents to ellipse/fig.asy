
settings.outformat = "pdf";

import geometry;

size(6cm);

point S_ = (5,5);

point A = (0,0); 
point D = (6,0);
point B = (2.3,2);

ellipse el = ellipse(A,D,B);  

line[] t = tangents(el,S_);
line l1 = line(t[0].A, false, t[0].B, true);
line l2 = line(t[1].A, false, t[1].B, true);

line l3 = line(S_, false, B, true);
//point A  

line bis = bisector(l1,l2);
line bis = line(bis.A, false, bis.B, true);


line l4 = reflect(bis)*l3;

point C = intersectionpoints(l4,el)[0];


line t1 = tangents(el,C)[0];
line t2 = tangents(el,B)[0];

point I_ = intersectionpoint(t1,t2);

//write(I_ @ bis);

//draw
dot("$A$", A, W);
dot("$D$", D);
dot("$B$", B, NW);
dot("$C$", C, NE);
dot("$S$", S_);
dot("$I$", I_, N+E*1.5);
draw(el,linewidth(1.3));

draw(l1);
draw(l2);
draw(l3);
draw(l4);

draw(bis, dashed);

draw(t1);
draw(t2);

markangle(l4,l2, radius=7.5mm);
markangle(l1,l3, radius=7.5mm);

//------------------------

draw(A--I_--D);
