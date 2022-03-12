%--------------------------The Main Function -----------------------------  
% ------- Name: PsitrumMainFunction (Quantum Computer Simulator) -----------------
% ------- Goal: it simulate the functionality of quantum computers -------
% ------- Inputs: --------------------------------------------------------
% -------  1. QuAlgorithm (String 2D-array/Matrix): it represents
%             the circuit model of the simualtor.
% -------  2. QubitsToBeMeasured (Integer 1D-array/Vector): it represents
%             the qubits that the user wants to measure.
% -------  3. InputStateVector (Complex 1D-array/Vector): it represents
%             the initial state of the Qubits.
% ------- Outputs: -------------------------------------------------------
% -------- 1. OutputVector (Complex 1D-array/Vector): it represents
%             the final state of the Qubits.
% -------  2. OutStatePropability (Double 1D-array/Vector): it 
%             represents probability of each state.
% -------  3. OutputMatrix (Complex 2D-array/Matrix): it represents
%             the real representation of the algorithm used.
% -------  4. StageTraceMatrix (Complex 3D-array/Matrix): it represents
%             the resulting algorithm after each stage M.
%-------------------------------------------------------------------------
function [OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, NoiseType, NoiseVector)
    %% SECTION #01 (Algorithm Preparation)
    % Preparing the quantum algorithm by replacing Toffoli and Swap gates 
    % --> with simpler gates
    %QuAlgorithm = PreparingQuAlgorithm(QuAlgorithm); 

    %% SECTION #02 (Parameters Initialization)
    % Setting controling parameters
    NumOfStages = size(QuAlgorithm,2);    % # of Stages/Columns in Algorithm
    NumOfQubits = size(QuAlgorithm,1);    % # of Qubits/Rows in Algorithm
    OutputMatrix = eye(2^NumOfQubits);    % Initialize with Identity
    OutputMatrix= sparse(OutputMatrix);
    OperationString= zeros(1,4);          % 1D-array contains the operation name and Parameters 
    
    %% SECTION #03 (Input State Initialization)
    % Initializing code inputs depending on number of input arguments      
    if  nargin == 2
        InputStateVector = InitializeInt2Qstates(NumOfQubits,0);  % If InputStateVector is empty: set it to |0...0>        
    elseif nargin == 1        
        QubitsToBeMeasured = 1:NumOfQubits;                 % If QubitsToBeMeasured is empty, then measure all qubits
        InputStateVector = InitializeInt2Qstates(NumOfQubits,0);  % If InputStateVector is empty: set it to |0...0>                                 
    end
    
    %% SECTION #04 (QubitsToBeMeasured Format Checking)
    % Check if the number of QubitsToBeMeasured is more than NumOfQubits
    if nargin == 2 || nargin >= 3
        if size(QubitsToBeMeasured,2) > NumOfQubits
            error 'The Number of Measured Qubits is Higher than The Number of Qubits used in The Algorithm.'
        end
    end
    
    %% SECTION #05 (Main Simulation Function)
    % Computing the Matrix representing the Quantum Algorithm
    if NumOfQubits == log(size(InputStateVector,1))/log(2)        % Check if QubitsToBeMeasured is equal to number of qubits in InputStateVector
        
        %% SECTION #06 (Initializing Tracing Variables)
        StageTraceVector= zeros(size(InputStateVector,1),NumOfStages+1);
        StageTraceVector= sparse(StageTraceVector);
        StageTraceVector(:,1)= InputStateVector;
        StageTraceNoisyVector= zeros(size(InputStateVector,1),NumOfStages+1);
        StageTraceNoisyVector= sparse(StageTraceNoisyVector);
        StageTraceNoisyVector(:,1)= InputStateVector;
        
        %% SECTION #07 (Iterating over each stage/column)
        for st = 1:NumOfStages                              % iterate over each stage M in the algorithm    
            %% SECTION #08 (Iterating over each qubit/line/row)
            StageMatrix = sparse(eye(1));                             % Initialize identity operator I for each step
            N = 1;
            while N <= NumOfQubits                                  % iterate over each operation in the algorithm 
                if QuAlgorithm(N,st) ~= "."                         % if the operation is not a control qubit "."                    
                %% SECTION #09 (Computing Gates Not Control)
                    OperationString = split(QuAlgorithm(N,st),'|');        % Spliting the operation string into 1D-array                 
                    OperationString(2:end) = lower(OperationString(2:end));       % All the parameters except the operation name should be in lowercase
                    while size(OperationString) < 4                        % changing the size of the string to 4 (number of parameters)
                          OperationString(end + 1) = 0;                    % Setting Unfilled Parameters to Zero
                    end
                    
                    %% SECTION #10 (Tensor Product with Previous Gates)
                    % Applying the tensor/kronecker product between the operation in same stage
                    StageMatrix = kron(StageMatrix, QuantumOperator(OperationString(1),str2num(char(OperationString(2))),str2num(char(OperationString(3))),str2num(char(OperationString(4)))));
                
                else                                                    % if the operation is a control qubit "." 
                %% SECTION #11 (Computing Controlled Gates)    
                    CCFlag =0;                                          % Flag for checking if there is another control bit
                    RefLocation = 0;                                    % RefLocation is the reference location of the first controlled qubit
                    while QuAlgorithm(N+1 +RefLocation,st) == ""        % Skipping the empty locations                   
                        RefLocation = RefLocation + 1;
                    end
                    N = (N+1) +RefLocation;                             % The location of the controlled gate
                    RefLocation2 = 0;                                   % RefLocation is the reference location of the first controlled qubit
                    %% SECTION #12 (Gates with Two Controls)
                    if QuAlgorithm(N,st) == "."                         % If the there is another control bit
                        while QuAlgorithm(N+1 + RefLocation2,st) == ""  % Skipping the empty locations                   
                            RefLocation2 = RefLocation2 + 1;
                        end
                        N = N + RefLocation2 + 1;
                        CCFlag =1;
                    end
                    %%
                    OperationString = split(QuAlgorithm(N,st),'|');            % Seprate Gate name & parameters
                    OperationString(2:end) = lower(OperationString(2:end));           % All the parameters except the operation name should be in lowercase
                    while size(OperationString) < 4                            % changing the size of the string to 4 (# of parameters)
                        OperationString(end + 1) = "0";                      % Setting Unfilled Parameters to Zero
                    end
                    
                    %% SECTION #13 (Tensor Product with Previous Gates)
                    StageMatrix = kron(StageMatrix, QuantumControlOperator(OperationString(1), RefLocation,RefLocation2,CCFlag, str2num(char(OperationString(2))), str2num(char(OperationString(3))), str2num(char(OperationString(4)))));
                end
                N = N + 1;
            end
            
            %% SECTION #14 (Computing Perfect Matrices and Vectors)
            OutputMatrix = StageMatrix*OutputMatrix;     
            StageTraceVector(:,st+1)= OutputMatrix*InputStateVector;    
            
            %% SECTION #15 (Computing Noisy Matrices and Vectors)
            StageNoisyVector= StageMatrix*StageTraceNoisyVector(:,st);
            StageNoisyRhoMatrix= computeNoisyRhoMatrix(NumOfQubits, NoiseType, NoiseVector(st), computeDensityMatrix(StageNoisyVector));
            StageTraceNoisyVector(:,st+1)= computeSpectralDecomposition(StageNoisyRhoMatrix);
            
        end
        %% SECTION #16 (Applying Sparsity and Approximation)
        M=OutputMatrix;
        M(abs(M)<1e-14)=0;                          % Deleting all the entities that is bellow (1e-14)
        OutputMatrix = sparse(M);                   % Using sparse function that squeeze out any zero element
    else
        error 'Number of Qubits in the Algorithm is not equal to that in the input state';
    end
    
    %% SECTION #17 (Calculating Output Vector)
    % Calculating the Output of the algorithm
    OutputVector = StageTraceVector(:,NumOfStages+1);  
    OutputNoisyVector= StageTraceNoisyVector(:,NumOfStages+1);
    OutputRhoMatrix = computeDensityMatrix(OutputVector);
    OutputNoisyRhoMatrix = computeDensityMatrix(OutputNoisyVector);
    
    %% SECTION #18 (Measurment/Calculating the probabilities)
    % Measuring Quantum states
    Probability = abs(OutputVector).^2;                  % Calculate the probability state (|a+bi|^2 for each entity)
    NoisyProbability = abs(OutputNoisyVector).^2;                  % Calculate the probability state (|a+bi|^2 for each entity)
    M = size(QubitsToBeMeasured,2);                     % Number of Qubits To be Measured
    if M == NumOfQubits                                 % if all qubits are measured
        OutputVectorPropability = Probability;           % == Then Do Nothing
        OutputNoisyVectorPropability = NoisyProbability;           % == Then Do Nothing
    else                                                % If only particular qubits are measured
        OutputVectorPropability = zeros(2^M,1);          % Initialize it Zero vector
        OutputNoisyVectorPropability = zeros(2^M,1);          % Initialize it Zero vector
        for pz = 1:2^NumOfQubits
            BinaryRep = dec2bin(pz-1, NumOfQubits);         % Set Q state in binary representation
            BinaryRep = BinaryRep(QubitsToBeMeasured);      % Select measured qubits
            % Convert measured qubits to decimal, in order to find the vector of probabilities
            OutputVectorPropability(bin2dec(BinaryRep)+1) = OutputVectorPropability(bin2dec(BinaryRep)+1) + Probability(pz);
            OutputNoisyVectorPropability(bin2dec(BinaryRep)+1) = OutputNoisyVectorPropability(bin2dec(BinaryRep)+1) + NoisyProbability(pz);
        end
    end
end