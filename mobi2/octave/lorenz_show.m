tmax = 20;

[t1,x1] = ode45(@lorenz, [0,tmax],[12;17;25]);
[t2,x2] = ode45(@lorenz, [0,tmax],[12;17;24.99]);
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-7);
[t3,x3] = ode45(@lorenz, [0,tmax],[12;17;25],options);
options = odeset('RelTol', 1e-5, 'AbsTol', 1e-8);
[t4,x4] = ode45(@lorenz, [0,tmax],[12;17;25],options);

plot(t1,x1);
print("lorenz-all.pdf","-dpdf");

plot(t1,x1(:,1),t2,x2(:,1));
print("lorenz-initial.pdf","-dpdf");
plot(t1,x1(:,1),t3,x3(:,1));
print("lorenz-accuracy1.pdf","-dpdf");
hold on;
plot(t4,x4(:,1));
print("lorenz-accuracy2.pdf","-dpdf");
hold off;

