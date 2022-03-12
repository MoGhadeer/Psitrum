%-------------------------- Auxilary Function ----------------------------  
% ------- Name: InitializeInt2Qstates ------------------------------------
% ------- Goal: It Initialize quantum state to an integer representation -
% ------- Inputs: --------------------------------------------------------
% -------  1. NumOfQubits (Integer): it represents the Number of Qubits
%             in the system .
% -------- 2. IntegerRepresentaion (Double): it represents the integer
%             representaion of the state.
% ------- Outputs: -------------------------------------------------------
% -------- 1. OutQuState (Complex 1D-array/Vector): it represents
%             the resulted quantum state.
%-------------------------------------------------------------------------
% ------- Example: -------------------------------------------------------
%           InitializeInt2Qstates(3, 4), the state |011> is returned,
%           expresed in vector: (0 0 0 0 1 0 0 0)'.
%-------------------------------------------------------------------------
function OutQuState = InitializeInt2Qstates(NumOfQubits, IntegerRepresentaion)
    N = 2^NumOfQubits;
    if IntegerRepresentaion + 1 <= N
        OutQuState = zeros(N,1);
        OutQuState(IntegerRepresentaion + 1,1) = 1;  
    else    
        error (['Required number (', num2str(IntegerRepresentaion),') is higher than maximal range for current number of q-bits: ', num2str(N - 1), '.']);
    end
end