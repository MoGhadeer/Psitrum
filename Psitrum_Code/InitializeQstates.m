%-------------------------- Auxiliary Function --------------------------- 
% ------- Name: InitializeQstates -------------------------------------
% ------- Goal: This function returns state coresponding to independently 
%           set of qubits.
% ------- Inputs: --------------------------------------------------------
% -------  1. ListOfQubits (Complex 2D-array/Matrix): it represents
%             the list of vectors for independent qubits (1-by-2).
% ------- Outputs: -------------------------------------------------------
% -------- 1. OutQState (Complex 1D-array/Vector): it represents
%             the Quantum State for combinig the independent qubits.
% ------- Example: -------------------------------------------------------
%           InitializeQstates([0 1], [1 0]) returns (0 0 1 0)'
%           since [0 1] = |1> and [1 0] = |0>, hence state is |10>
%-------------------------------------------------------------------------
function OutQState = InitializeQstates(ListOfQubits)    
    NormalizedQState = zeros(nargin,2);             % Initial configuration - all bits set to |0>
    NormalizedQState(:,1) = ones(nargin,1);
    for k = 1:nargin
        QState = cell2mat(ListOfQubits(k));               % Qubits normalization
        NormalizedQState(k,:) = QState/norm(QState);
    end
    QState = (NormalizedQState(1,:))';
    for k = 2:nargin
        QState = kron(QState,(NormalizedQState(k,:))');     % Tensor product to get final Q state
    end
    OutQState = QState;
end

