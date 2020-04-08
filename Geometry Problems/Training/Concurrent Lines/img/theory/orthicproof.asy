size(6cm);
import geometry;
triangle t=triangleabc(3,4,6);

triangle t=triangle(t.A, t.B, orthocentercenter(t));

draw(t, linewidth(bp));
point hc=intersectionpoint(altitude(t.AB), t.AB);
point hb=intersectionpoint(altitude(t.AC), t.AC);
point ha=intersectionpoint(altitude(t.BC), t.BC); 

//draw(hc);
draw(segment(hb, t.B));
draw(segment(ha, t.A));
draw(segment(hc, t.C));
dot("$H$", orthocentercenter(t), N*1.9+E, fontsize(11));
dot("$C$", t.C, N);
dot("$A$", t.A, SW);
dot("$B$", t.B, SE);
dot("?", hc, N*3+E*3, fontsize(10));
perpendicularmark(line(t.C,hc), t.AB, quarter=-2, dashed);
perpendicularmark(t.AC,line(hb, t.B),quarter=-1);
perpendicularmark(t.BC,line(ha, t.A));
triangle ort=orthic(t);
//draw(ort,bp+0.8*green); dot(ort, 0.8*red);
//addMargins(1cm,1cm);
