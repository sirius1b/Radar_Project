%%
clc 
clear 
close all

%% Consants
K2a = 0.01; %Nm/A
K3a = 0.01; %V/rad/s
Ra  = 1; %ohm 
La  = 0.5;%H
Ja  = 500; %kgm^2
ba = 0.1; %Nms

K2e = 0.01; %Nm/A
K3e = 0.01; %V/rad/s
Re  = 1; %ohm 
Le  = 0.5;%H
Je = 600; %kgm^2
be = 0.1;%Nms

%educated guess:
M_e = 60; %kg
Len_e = sqrt(300); %m

g = 9.81; %m/s^2 
%% State vector 
%% Matrices (state space)

A = [0, 1, 0, 0, 0, 0;
     0, 0, 1, 0, 0, 0;
     0, -((Ra*ba)/(La*Ja) + (K3a *K2a)/(La*Ja)), -((Ra/La) + (ba/Ja)), 0 , 0 , 0 ;
     0, 0, 0, 0, 1, 0;
     0, 0, 0, 0, 0, 1;
     0, 0, 0, 0, -((Re*be)/(Le*Je) + (K3e *K2e)/(Le*Je)), -((Re/Le) + (be/Je));
    ];
B = [0, 0;
     0, 0;
     K2a/(La*Ja), 0;
     0, 0;
     0, 0;
     0, K2e/(Le*Je);];

%% output C, D
C = [1, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 0, 0;];
D = 0;
Cr = C;
%% Build system
sys = ss(A,B,C,D);
ctr = ctrb(sys);
obs = obsv(sys);
% min(size(sys)) == rank(ctr); %full rank
% min(size(sys)) == rank(obs); %full rank
x0 = [0, 0, 0, 0, 0, 0]';

%% Controller
des_poles_ctrb = [-9, -9, -10, -10, -11, -11]';
des_poles_obsv = [-12,-12,-13,-13,-14,-14];
K = place(A, B, des_poles_ctrb);
L = place(A',C',des_poles_obsv)';

%% some reference state 
x_r = [pi/6 , 0, 0, pi/4, 0, 0]';

%% for integrator
n = 6;
m = 2;

A1 = [A , zeros(n,m) ; 
      -Cr ,zeros(m,m);];
B1 = [B;zeros(m,m)];
% rank(ctrb(A1,B1))
des_poles_Int = [des_poles_ctrb; -12; -12];
K_Int = place(A1,B1,des_poles_Int);
K = K_Int(:,1:n);
Ki = K_Int(:,n+1:end);

xr = zeros(n,1);
ref_state = [pi/6;pi/4];

%% Object tracking

%---------- 2 unit => 17.32m
%---------- 1 unit => 8.6603

%----- As per real world
v = 50 ; %m/s
z = 1e4; %m
% Scale for 3D model
radar_pos = [0;0;0.96] ; % x,y,z ; Values are as per model
v = v/8.6603;
z = z/8.6603;
r = 0.55;
