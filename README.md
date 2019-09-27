# ctls

Convex Solution to Constrained Total Least Squares

## Description

This function presents a convex solution to the Constrained Total Least Squares Problem

## Install

Add the folder  to the *path* of Matlab.

## Use

Please check the *examples* folder.

#### Example

```matlab
% Generate TRUE POINTS
x=randn(N,1);
y=randn(N,1);
z=2*x+3*y;

% Generate ERROR
v1=randn(N,1);

% Erros affect measurements
xr=x+0.3*v1;
yr=y+0.2*v1;
zr=z+0.4*v1;

Phi=[xr yr];
F = [0.3*ones(N,1) 0.2*ones(N,1) 0.4*ones(N,1)];
kctls = ctls(Phi,zr,F);
```


## Contributors

Diego Eckhard - diegoeck@ufrgs.br - @diegoeck
Cristiane?
