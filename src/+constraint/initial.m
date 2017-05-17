%================================ initial ================================
%
% @class    constraint.initial
%
% @brief    A boundary constraint (or boundary condition) specification.
%
% 
%================================ initial ================================

%
% @file     initial.m
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
%================================ initial ================================
classdef initial < constraint.boundary
%(

%============================ Member Variables ===========================
%

%
%============================= Public Methods ============================
%

methods

  %============================== initial ==============================
  %
  % @brief  Define initial constraint for optimal control problem.
  %
  % This function defines the initial cost function
  %
  % func definition can be either
  %           a. Character string containing the function
  %           b. mFunction object
  %           c. cFunction object
  %
  function this = initial(lb,func,ub,xVars)

  if (nargin ~= 4)
    error('Usage: constrObj = constraint.initial(lb,func,ub,vars);');
  end

  this@constraint.base(lb, func, ub, 'initial', xVars);

  end

end

%
%============================= Static Methods ============================
%

methods (Static)

  %=============================== exact ===============================
  %
  % @brief  Specify an exact or exact w/slack initial condition constraint.
  %
  % @param[in]  func    Equation specification to be met.
  % @param[in]  vVal    Numerical value of initial condition.
  % @param[in]  vSym    Symbolic string of variable.
  % @param[in]  epS     Small slack around exact value [optional].
  %
  function ic = exact(func, vVal, vSym, epS)

  if (nargin < 4)
    ic = constraint.initial(vVal, func, vVal, vSym);
  else
    ic = constraint.initial(vVal - epS, func, vVal + epS, vSym);
  end

  end

end

%
%============================= -------------- ============================

%)
end
%
%================================ initial ================================
