clear all, close all, clc

s = tf('s');
G = 1/(s*(s*s+s+1));
options = optimoptions(@ga,'PopulationSize',30,'MaxGenerations',5);
x = ga(@(K)pidtest(G,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);