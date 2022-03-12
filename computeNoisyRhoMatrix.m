%-------------------------- Auxilary Function ----------------------------  
% ------- Name: computeNoisyRhoMatrix -------------------------------------
% ------- Goal: It computes the rho matrix after adding noise ----------
% ------- Inputs: --------------------------------------------------------
% -------  1. NumOfQubits (Integer): number of qubits.
% -------- 2. TypeOfNoise (String): type of noise used (e.g. Depolarizing).
% -------- 3. NoiseFactor (Double): The factor of noise affection.
% -------- 4. RhoMatrix (Complex 2D-array/Matrix): state density matrix.
% ------- Outputs: -------------------------------------------------------
% -------- 1. NoisyRhoMatrix (Complex 2D-array/Matrix): Noisy density matrix.
%-------------------------------------------------------------------------
function NoisyRhoMatrix = computeNoisyRhoMatrix(NumOfQubits, TypeOfNoise, NoiseFactor, RhoMatrix)
    switch TypeOfNoise
        case 'Dep'   % Depolarizing noise
            NoisyRhoMatrix= (1-NoiseFactor)*RhoMatrix + (1/(2^NumOfQubits))*(RhoMatrix)*NoiseFactor*eye(2^NumOfQubits); 
        otherwise
            error  'Noise Type is not Available'
    end
end
