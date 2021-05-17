clear all
close all
clc

%% Hybrid Controller

model = 'ass6_workspace';

% Define the variables (they're getting mad) (Hybrid controller)
x_0 = -0.05;
x_dot_0 = 0; %(starts at rest)

x_d = 0.15;
x_d_dot = 0;
f_d = 0.1;

k_e = 1;
m = 1;
t_max = 10;

% Simulation
t_max = 25;
dt_max = t_max/1000;
simdata = sim(model,'StopTime',string(t_max),'MaxStep',string(dt_max));

time = simdata.tout;
position = simdata.position;
%desired_position = simdata.desired_position;
control_force = simdata.control_force;
environment_force = simdata.environment_force;
%desired_force = simdata.desired_force;

%plot(time, position, time, desired_position, 'k--')
% Plots
desired_position = 1:1006;
desired_force = 1:1006;
for i = 1:1006
   desired_position(i) = x_d;
   desired_force(i) = f_d;
end

figure;
subplot(3,1,1)
plot(time, position, time, desired_position, 'k--');
hold on
%plot(time, desired_position);
axis([0 10 -0.1 0.55]);
grid on
xlabel("Time (s)")
ylabel("Position (m)")

subplot(3,1,2);
plot(time, control_force);
axis([0 10 -0.35 2])
grid on
xlabel("Time (s)")
ylabel("Force (N)")

subplot(3,1,3);
plot(time, environment_force, time, desired_force, 'k--')
axis([0 10 0 0.6])
grid on
xlabel("Time (s)")
ylabel("Force (N)")

%% Impedance Controller

figure(2)
model = "ass6_workspace_2"

k_pi = 52.9;
k_di = 46;
M_t = 1;
B_t = 2;
x_t_dot_0 = 0;
