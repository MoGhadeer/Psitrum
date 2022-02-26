%-------------------------- Auxilary Function ----------------------------  
% ------- Name: QuantumOperator ------------------------------------------
% ------- Goal: It return the matrix fro a certain quantum gate ----------
% ------- Inputs: --------------------------------------------------------
% -------  1. GateName (String): The specified gate name.
% -------- 2. Theta (Double): gate parameter.
% -------- 3. Phi (Double): gate parameter.
% -------- 4. Lambda (Double): gate parameter.
% ------- Outputs: -------------------------------------------------------
% -------- 1. Qoperator (Complex 2D-array/Matrix): Matrix of the operator.
%-------------------------------------------------------------------------
function Qoperator = QuantumOperator(GateName, Theta, Phi, Lambda)  
    switch GateName
        case 'I' 
            Qoperator = [1 0; 0 1];
        case 'X' 
            Qoperator = [0 1; 1 0];
        case 'Y'
            Qoperator = [0 -1i; 1i 0];
        case 'Z'
            Qoperator = [1 0; 0 -1];
        case 'H'    
            Qoperator = (1/sqrt(2))*[1 1; 1 -1];
        case 'S'
            Qoperator = [1 0; 0 1i];
        case 'T'
            Qoperator = [1 0; 0 exp(1i*pi/4)];
        case 'DS'
            Qoperator = [1 0; 0 -1i];
        case 'DT'
            Qoperator = [1 0; 0 exp(-1i*pi/4)];
        case 'U1'
            Qoperator = [1 0; 0 exp(1i*Theta)];
        case 'U2'
            Qoperator = (1/sqrt(2))*[1 -exp(1i*Theta); exp(1i*Phi) exp(1i*(Theta + Phi))];
        case 'U3'
            Qoperator = [cos(Theta/2) -exp(1i*Lambda)*sin(Theta/2); exp(1i*Phi)*sin(Theta/2) exp(1i*(Lambda + Phi))*cos(Theta/2)];
        case 'RX'
            Qoperator = [cos(Theta/2) -1i*sin(Theta/2); -1i*sin(Theta/2) cos(Theta/2)];
        case 'RY'
            Qoperator = [cos(Theta/2) -sin(Theta/2); sin(Theta/2) cos(Theta/2)];
        case 'RZ'
            Qoperator = [exp(-1i*Theta/2) 0; 0 exp(1i*Theta/2)];
        case 'SX'            
            Qoperator = (1/2)*[ (1+1i) (1-1i); (1-1i) (1+1i)];
        case 'DSX'            
            Qoperator = (1/2)*[ (1-1i) (1+1i); (1+1i) (1-1i)];
        otherwise
            error 'Uknown operator!'
    end
end