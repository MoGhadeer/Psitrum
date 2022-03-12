%-------------------------- Auxilary Function ----------------------------  
% ------- Name: computeBlochVector ---------------------------------------
% ------- Goal: It computes the bloch vector for a quantum state ---------
% ------- Inputs: --------------------------------------------------------
% -------  1. DensityMatrix (Complex 2D-array/Matrix): it represents
%             the density Matrix of certain quantum state (|X><X|).
% ------- Outputs: -------------------------------------------------------
% -------- 1. BlochVector (Double 1D-array/Vector): it represents
%             the projection magnitude of the vector in x-,y-,z-axis.
%-------------------------------------------------------------------------
function BlochVector=computeBlochVector(DensityMatrix)
    dm = DensityMatrix;
    X = [0 1; 1 0]; 
    Z= [1 0; 0 -1];
    Y = 1i* [0 1; 1 0] * [1 0; 0 -1];
    BlochVector = [trace(X *dm ); trace(Y *dm); trace(Z *dm)];
end
