clear all
close all
clc

model = 'ass5_workspace';
eta = 1;

v_0 = [0; 0];
v_dot_0 = [0; 0];

t_max = 25;
dt_max = t_max/1000;
simdata = sim(model,'StopTime',string(t_max),'MaxStep',string(dt_max));

t = simdata.tout;
v = simdata.v;
v_dot = simdata.v_dot;
v_ddot = simdata.v_ddot;
tau = simdata.tau;
vd = simdata.vd;

subplot(2,2,1)
hold on
plot(t,v(:,1))
plot(t,vd(:,1))
legend('Actual','Desired')
xlabel('Time [s]');
ylabel('Position [rad]');
title('Joint 1');
axis([-inf inf -1.8 1.8])
hold off

subplot(2,2,2)
hold on
plot(t,v(:,2))
plot(t,vd(:,2))
legend('Actual','Desired')
xlabel('Time [s]');
ylabel('Position [rad]');
title('Joint 2');
axis([-inf inf -1.8 1.8])
hold off

subplot(2,2,3)
plot(t,tau(:,1))
xlabel('Time [s]');
ylabel('Torque [N*m]');
axis([-inf inf -200 900])

subplot(2,2,4)
plot(t,tau(:,2))
xlabel('Time [s]');
ylabel('Torque [N*m]');
axis([-inf inf -200 900])
