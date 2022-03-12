%-------------------------- Auxilary Function ----------------------------  
% ------- Name: computeSpectralDecomposition -------------------------------------
% ------- Goal: It computes the spectral decomposition of a density matrix -------
% ------- Inputs: --------------------------------------------------------
% -------  1. DensityMatrix (Complex 2D-array/Matrix): it represents
%             the density matrix of a quantum state.
% ------- Outputs: -------------------------------------------------------
% -------- 1. DecomposedVector (Complex 1D-array/Vector): it represents
%             the Quantum State of the given rho matrix.
%-------------------------------------------------------------------------
function DecomposedVector= computeSpectralDecomposition(DensityMatrix)
    [EigenVectors,EigenValues]=eig(DensityMatrix);
    DecomposedVector= EigenVectors(:,end).*EigenValues(end,end);
end
