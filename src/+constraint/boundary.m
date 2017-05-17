%================================ boundary ===============================
%
% @class    constraint.boundary
%
% @brief    A boundary constraint (or boundary condition) specification.
%
% 
%================================ boundary ===============================

%
% @file     boundary.m
%
% @author   Raktim Bhattacharya,        raktim@ae.tamu.edu  [author]
%           Patricio A. Vela,           pvela@gatech.edu    [modify]
% @date     2017/05/17                  [refactor]
%
% @note
%   indent is 2 spaces.
%   tab is aligned- and converted to- 4 spaces.
%
% Original text in header:
%   Nonlinear Path Planning Toolbox v 1.0
%   Copyright (c) 2004 by                
%   Raktim Bhattacharya, (raktim@cds.caltech.edu)
%   California Institute of Technology               
%   Control and Dynamical Systems 
%   All right reserved.                
%
% @classf   constraint
%================================ boundary ===============================
classdef boundary < constraint.base
%(

%============================= Public Methods ============================
%

methods

  %============================= constraint ============================
  %
  % @brief      Define a constraint for inclusion into optimal control problems.
  %
  % This function defines the initial cost function
  % func definition can be either
  %           a. Character string containing the function
  %           b. mFunction object
  %           c. cFunction object
  %
  %TODO: Should move different types to their own classes?
  %
  function this = constraint(lb,func,ub,type, xVars)

  %================== Error Checking for Input Data ==================
  if nargin~=5
    error('Usage: constrObj = constraint.boundary(lb,func,ub,type);');
  end

  if ~isa(type,'char')
    error('Expecting character array for type');
  end

  TYPES = {'initial','final'};
  ii = strmatch(lower(type),TYPES,'exact');
  if isempty(ii)
    error(['Constraint <type> must be one of the following: ' ...
           'initial, final']);
  end

  %===================================================================

  this@constraint.base(lb, func, ub, type, xVars);

  end

end

%)
end
%
%================================ boundary ===============================
