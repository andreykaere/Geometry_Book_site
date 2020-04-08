import geometry;
//import fontsize;

size(4.5cm, 5cm);usepackage("mathrsfs"); currentpen=fontsize(8); 
pen bpp=linewidth(bp);



circle w1 = circle((point)(-0.4,0), 1.2);
circle w2 = circle((point)(1.4, 0.2), 1.5);

draw("$\omega_1$", w1); 
draw(Label("$\omega_2$", Relative(1.045)), w2, NE);

point [] P = intersectionpoints(w1, w2);

var A = P[1];
var B = P[0];

dot(Label("$B$", fontsize(9)), B, S, 0.9mm+black);
dot(Label("$A$", fontsize(9)), A, N, 0.9mm+black);


line[] l = tangents(w1, A);
line[] k = tangents(w2, A);

var l = l[0];
var k = k[0];


point D = intersectionpoints(l, w2)[0];
point C = intersectionpoints(k, w1)[0];

//var C = T[1];

dot(Label("$C$", fontsize(9)), C, W,  0.9mm+black);
dot(Label("$D$", fontsize(9)), D, NE, 0.9mm+black);

var ad = segment(A, D);
var da = segment(D, A);
var ac = segment(A, C);
var ab = segment(A, B);


draw(Label("$k$", Relative(0)), k);
draw(Label("$l$", Relative(1)), l);
draw(ab);


//var BC = segment(B, C);
//var BD = segment(B, D);

line BC = line(B, C);
line BD = line(B, D);

point Cp = intersectionpoints(BC, w2)[0];
point Dp = intersectionpoints(BD, w1)[0];



dot(Label("$C'$", fontsize(9)), Cp, SE,0.9mm+black);
dot(Label("$D'$", fontsize(9)), Dp, S, 0.9mm+black);


var CCp = segment(C, Cp);
var DDp = segment(D, Dp);

draw(DDp);
draw(CCp);


markangle(Label("$\alpha$", Relative(0.59), fontsize(8), UnFill), 
                      (line)ac, 
                      (line)ab, 
                      radius=0.5cm);

markangle("$\beta$", n=2,
                      (line)ab, 
					  (line)ad, 
					  radius=0.3cm);

markangle("$\beta$", n=2,
					  (line)CCp, 
                      (line)ac, 
					  radius=0.3cm);


markangle("$\alpha$", (line)da, 
                      (line)DDp, 
                      radius=0.5cm);
//triangle t=triangle((-1,0), (2,0), (0,2));
//circle cc=circle(t);
//draw(cc);
//dot(cc.C);
