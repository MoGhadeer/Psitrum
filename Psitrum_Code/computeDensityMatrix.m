%-------------------------- Auxilary Function ----------------------------  
% ------- Name: computeDensityMatrix -------------------------------------
% ------- Goal: It compute the density matrix for quantum state ----------
% ------- Inputs: --------------------------------------------------------
% -------  1. State (Complex 1D-array/Vector): it represents
%             the input quantum state .
% ------- Outputs: -------------------------------------------------------
% -------- 1. DensityMatrix (Complex 2D-array/Matrix): it represents
%             the density Matrix of certain quantum state (|X><X|).
%-------------------------------------------------------------------------
function DensityMatrix= computeDensityMatrix(State)
    DensityMatrix = State * State';
end