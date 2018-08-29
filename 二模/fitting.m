function [x,fval,exitflag,output,lambda,grad,hessian] = fitting(x0,Aeq,beq,lb)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@(x)(x1-x(1))^2/x1+(x2-x(2))^2/x2+(x3-x(3))^2/x3+(x4-x(4))^2/x4+(x5-x(5))^2/x5+(x6-x(6))^2/x6,x0,[],[],Aeq,beq,lb,[],[],options);
