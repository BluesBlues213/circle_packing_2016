function h = circle(x,r)

hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x(1);
yunit = r * sin(th) + x(2);
h = plot(xunit, yunit);
hold off