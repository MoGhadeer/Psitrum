%-------------------------- Auxilary Function ----------------------------  
% ------- Name: QuantumControlOperator -----------------------------------
% ------- Goal: It returns the matrix for Controlled gates ---------------
% ------- Inputs: --------------------------------------------------------
% -------  1. GateName (String): The specified gate name.
% -------- 2. Reference1 (Integer): reference to first control bit. 
%             Number of inbetween lines           
% -------- 3. Reference2 (Integer): reference to first control bit.
%             Number of inbetween lines     
% -------- 4. NumOfReferencesFlag (Boolean): '0' if number of references is 1
%             otherwise '1'
% -------- 5. Theta (Double): gate parameter.
% -------- 6. Phi (Double): gate parameter.
% -------- 6. Lambda (Double): gate parameter.
% ------- Outputs: -------------------------------------------------------
% -------- 1. Qoperator (Complex 2D-array/Matrix): Matrix of the operator.
%-------------------------------------------------------------------------
function Qoperator = QuantumControlOperator(GateName, Reference1, Reference2, NumOfReferencesFlag, Theta, Phi, Lambda)
    if NumOfReferencesFlag == 0
        baseOp = QuantumOperator(GateName, Theta, Phi, Lambda); 
        N = 2^(Reference1+2);   
        Qoperator = [eye(N/2) zeros(N/2); zeros(N/2) kron(eye(N/4), baseOp)];  
    else
        baseOp = QuantumOperator(GateName, Theta, Phi, Lambda);    
        N2 = 2^(Reference2+2);   
        Qoperator1 = [eye(N2/2) zeros(N2/2); zeros(N2/2) kron(eye(N2/4), baseOp)];
        N1 = 2^(Reference1+Reference2+3);    
        Qoperator = [eye(N1/2) zeros(N1/2); zeros(N1/2) kron(eye(N1/(2^(Reference2+3))), Qoperator1)];
    end
end
