close all; clc; clear all;
%%%%%%% DAneshzand  spiking neuron model %%%%%%%%%
%%%%%%%%%%%%%%%%%% 10/12/2017 %%%%%%%%%%%%%%
Parameters = [0.02 0.2 -65 6];
V=-70;  u=Parameters(2)*V;
VV=[];  uu=[];
tau = 0.25; tspan = 0:tau:100;
T1=tspan(end)/10;
for t=tspan
    if (t>T1) 
        I=14;
    else
        I=0;
    end;
    V = V + tau*(75000*(cosh((V+62.5)./1000)-1)-16-u+I);
    u = u + tau*Parameters(1)*(Parameters(2)*V-u);
    if V > 30
        VV(end+1)=30;
        V = Parameters(3);
        u = u + Parameters(4);
    else
        VV(end+1)=V;
    end;
    uu(end+1)=u;
end;
plot(tspan,VV,[0 T1 T1 max(tspan)],-90+[0 0 10 10]);
axis([0 max(tspan) -90 30])
xlabel('time');ylabel('membrane potential');
title('tonic spike');
