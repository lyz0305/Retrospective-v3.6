function  res = TVOP()

%res = TVOP()
%
% Implements a spatial finite-differencing operator.
%
% (c) Michael Lustig 2007

% changes made by Gustav Strijkers, 2019
% see D.m and AdjD.m files

res.adjoint = 0;
res = class(res,'TVOP');

