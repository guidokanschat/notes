function contour_stefan(filename='stability-radau1.png')
[x,y] = meshgrid(-10:0.01:10,-10:0.01:10);
z = x+i*y;
%R = 1.+z; % Euler
%R = 1 + z.*(1+ 0.5.*z); % Mod Euler
%R = 1 + z.*(1+ 0.5.*z.*(1.+1./3.*z.*(1+0.25.*z)));
%R = 1 + z.*(1+0.5.*z.*(1.+1./3.*z.*(1+0.25.*z.*(1.+.2.*z.*(1.+.2*z))))); % DOPRI5
R = 1./(1-z); % impl. Euler
%R = (1.+z./3)./(1.-2/3.*z + 1/6.*z.*z); % Radau 2
%R = (1+2/5.*z+1/20.*z.*z)./(1-3/5.*z+3/20.*z.*z-1/60.*z.*z.*z); %
                                                              % Radau 3
%R = (1.+.4.*z)./(1.-.6.*z);
% zlevel = abs(R);
zlevel = log2(abs(R)+1.e-12);
figure
[c,h]=contourf(x,y,zlevel,[-4:0.25:4]);
set(h,"linecolor","none");
axis("square");
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
