function contour_bdf(filename='stability-bdf.png')
t = linspace(0,2*pi,300);
e0 = 1-exp(-i*t);

z1 = e0;
z2 = e0+0.5*e0.^2;
z3 = e0+0.5*e0.^2+1./3.*e0.^3;
z4 = e0+0.5*e0.^2+1./3.*e0.^3+0.25*e0.^4;
z5 = e0+0.5*e0.^2+1./3.*e0.^3+0.25*e0.^4+0.2*e0.^5;
z6 = e0+0.5*e0.^2+1./3.*e0.^3+0.25*e0.^4+0.2*e0.^5+1./6.*e0.^6;

figure
plot(z1, "k-", z2, "k-", z3, "k-", z4, "k-", z5, "k-", z6, "k-");
% plot(real(z1),imag(z1));
axis([-1.5 0.5 0 2],"square");
grid on
colormap(colormap_br);
caxis([-4 4]);
%contour(x,y,zlevel,[0 0]);
print(filename,'-dpng')
return


%% Nested functions

function map=colormap_br(n=64)
map=ones(n,3);
map(1:n/2,:)=colormap_blue(n/2);
map((n/2+1):n,:)=colormap_red(n/2);
return


function map=colormap_blue(n=64)
h=1/(n-1);
x=0:h:1;
x=1-0.6.*x;
map=ones(n,3);
map(:,1)=x(:);
map(:,2)=x(:);
return

function map=colormap_red(n=64)
h=1./(n-1);
x=0:h:1;
x=0.3+0.7.*x;
map=ones(n,3);
map(:,2)=x(:);
map(:,3)=x(:);
return
