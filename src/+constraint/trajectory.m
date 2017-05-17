%=============================== trajectory ==============================
%
% @class    trajectory
%
% @brief    Implements abstraction of an optimal control constraint.
%
% 
%=============================== trajectory ==============================

%
% @file     trajectory.m
%
% @author   Raktim Bhattacharya,        raktim@ae.tamu.edu  [author]
%           Patricio A. Vela,           pvela@gatech.edu    [modify]
% @date     2017/05/17                  [refactored]
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
%=============================== trajectory ==============================

%(
classdef trajectory < constraint.basic


%============================= Public Methods ============================
%

methods

  %============================= trajectory ============================
  %
  % @brief      Define trajectory constraint for optimal control probles.
  %
  % TODO: Redo documentation.
  % This function defines the initial cost function
  % func definition can be either
  %           a. Character string containing the function
  %           b. mFunction object
  %           c. cFunction object
  %
  function this = trajectory(lb, func, ub, xVars)

  %-- Error checking for input data. 
  if (nargin ~= 4)
    error('Usage: constrObj = constraint.trajectory(lb, func, ub, xVars);');
  end

  this@constraint.basic(lb, func, ub, 'trajectory', xVars);

  end

end

%
%============================= Static Methods ============================
%

methods(Static)

  %=============================== limits ==============================
  %
  % @brief  Specify known limits on optimization variables.
  %
  % @param[in]  vSym    Symbolic variable to limit/constraint.
  % @param[in]  bLims   Scalar or 2-vector specifying lower/upper limits.
  %
  function lc = limits(vSym, bLimits)
  lc = constraint.trajectory(bLimits(1), vSym, bLimits(2), vSym);
  end

  %============================= obsCircle =============================
  %
  % @brief  Create a circular (obstacle) constraint.
  %
  % @param[in]  xSym    Symbolic description of state vector.
  % @param[in]  xCent   Center of circle (same dimensions as xSym).
  % @param[in]  rad     Radius constraint (must be greater than).
  %
  function oc = obsCircle(xSym, xCent, rad)
  nSqStr = [];
  for ii = 1:length(xSym)
    nSqStr = [nSqStr , ['(' xSym{ii} '- (' num2str(xCent(ii)) ') )^2'] ];
    if (ii < length(xSym))
      nSqStr = [nSqStr  ' + '];
    end
  end
  oc = constraint.trajectory(rad^2 , nSqStr, Inf, xSym);

  end

  %========================== obsSquareApprox ==========================
  %
  % @brief  Create an approximately square obstacle constraint.
  %
  % @param[in]  xSym    Symbolic description of state vector.
  % @param[in]  xCent   Center of square/rectangular object.
  % @param[in]  rad     Radius constraint (scalar or 2-vector).
  % @param[in]  order   Order of Lp constraint approximating the sqyare.
  %
  function oc = obsSquareApprox(xSym, xCent, rad, order)
  nLpStr = [];

  order = round(order);         % Force to be natural.
  if (mod(order,2) == 1)        % Force to be even.
    order = order + 1;
  end
  oStr = num2str(order);

  for ii = 1:length(xSym)
    nLpStr = [nLpStr , ['( (' xSym{ii} '- (' num2str(xCent(ii)) ') )/' ...
              '(' num2str(rad) ') )^' oStr] ];
    if (ii < length(xSym))
      nLpStr = [nLpStr  ' + '];
    end
  end
  oc = constraint.trajectory(1, nLpStr, Inf, xSym);

  end

end

%--)
%

end
%)
%
%=============================== trajectory ==============================
