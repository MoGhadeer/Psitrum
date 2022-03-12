%-------------------------- Auxiliary Function --------------------------- 
% ------- Name: PreparingQuAlgorithm -------------------------------------
% ------- Goal: This function is for replacing Toffoli and SWAP gates with
%           simplier gates of controlled NOT, Hadamard and T gates.
% ------- Inputs: --------------------------------------------------------
% -------  1. QuAlgorithm (String 2D-array/Matrix): it represents
%             the circuit model of the simualtor.
% ------- Outputs: -------------------------------------------------------
% -------- 1. PreparedQuAlgorithm (String 2D-array/Matrix): it represents
%             the Quantum Algorithm After Replacing SWAP and Toffoli.
%-------------------------------------------------------------------------
function PreparedQuAlgorithm = PreparingQuAlgorithm(QuAlgorithm)   
    %%
    PreparedQuAlgorithm = upper(QuAlgorithm);                           % Gates are expressed in upper case    
    NumberToffolis = sum(sum(PreparedQuAlgorithm == "TF",1)>0);         % Number of steps including Toffoli gates
    NumberSwaps    = sum(sum(PreparedQuAlgorithm == "SWP",1)>0);        % Number of steps including SWAP
    % Number of steps including swap or Toffoli 
    NumberToffolisSwaps = sum((sum(PreparedQuAlgorithm == "TF",1).*sum(PreparedQuAlgorithm == "SWP",1))>0);
    %%
    if NumberSwaps + NumberToffolis > 0                               % At least one Toffoli or swap gate is used => algorithm will be modified                        
        qubits = size(QuAlgorithm,1);
        steps = size(QuAlgorithm,2);
        AlgorithmPreparing(1:qubits,1:(steps + 13*NumberToffolis + 4 *(NumberSwaps - NumberToffolisSwaps))) = "I"; 
        %%
        pn = 1;
        for N = 1:steps
            AlgorithmPreparing(:,pn) = PreparedQuAlgorithm(:,N);          % Copy algorithm
            NumberStepsToff = sum(PreparedQuAlgorithm(:,N) == "TF",1);
            NumberStepsSwap = sum(PreparedQuAlgorithm(:,N) == "SWP",1)/2;
            %%
            if NumberStepsToff == 0 && NumberStepsSwap == 0           % Neither Toffoli nor swap in k-th step, continue                
                pn = pn + 1;
            else                
                if NumberStepsToff ~= 0                               % Toffoli processing
                    ToffoliIndexes = 1:qubits;                        % Positions of Toffoli gates
                    ToffoliIndexes = ToffoliIndexes(PreparedQuAlgorithm(:,N) == "TF"); 
                    %%
                    for V = 1:size(ToffoliIndexes,2)       
                        ToffoliBit = ToffoliIndexes(V); 
                        Z =  ToffoliBit - 1;
                        while PreparedQuAlgorithm(Z,N) ~= "."
                            Z = Z - 1;
                        end                    
                        SecondControlBit = Z;

                        Z = Z - 1;                    
                        while PreparedQuAlgorithm(Z,N) ~= "."
                            Z = Z - 1;
                        end
                        FirstControlBit = Z;
                        % Replace TF with its implementation by simpler single-qubit gates and CNOTs
                        AlgorithmPreparing(ToffoliBit,pn:pn+13) = ["H" "X" "DT" "X" "T" "X" "DT" "X" "T" "H" "I" "I" "I" "I"];
                        AlgorithmPreparing(SecondControlBit,pn:pn+13) = ["I" "." "I" "" "I" "." "I" "" "I" "I" "T" "X" "DT" "X"];
                        AlgorithmPreparing(FirstControlBit,pn:pn+13) = ["I" "I" "I" "." "I" "I" "I" "." "I" "I" "I" "." "T" "."];

                        % Make sure proper syntax of algorithm - empty strings
                        % == among controlled and target q-bits for CNOTs, no empty 
                        % == spaces among non-controlled gates => I operator is inserted
                        AlgorithmPreparing((FirstControlBit):(ToffoliBit-1),pn) = "I";
                        AlgorithmPreparing((FirstControlBit+1):(ToffoliBit-1),[pn+3 pn+7]) = "";
                        AlgorithmPreparing((SecondControlBit+1):(ToffoliBit-1),[pn+1 pn+5]) = "";
                        AlgorithmPreparing((FirstControlBit+1):(SecondControlBit-1),[pn+11 pn+13]) = "";                                     
                    end
                end
                %%
                if NumberStepsSwap ~= 0                                % Perform swap preprocessing
                    swapsIndexes = 1:qubits;                           % Positions of swap gates
                    swapsIndexes = swapsIndexes(PreparedQuAlgorithm(:,N) == "SWP");
                    for V = 1:2:size(swapsIndexes,2)
                        AlgorithmPreparing(swapsIndexes(V),pn:pn+4) = ["." "H" "." "H" "."];
                        AlgorithmPreparing(swapsIndexes(V+1),pn:pn+4) = ["X" "H" "X" "H" "X"];
                        AlgorithmPreparing((swapsIndexes(V)+1):(swapsIndexes(V+1)-1),[pn pn+2 pn+4]) = "";
                    end
                end
                if NumberStepsToff ~= 0
                    pn = pn + 14;
                else
                    pn = pn + 5;
                end
            end
        end
        PreparedQuAlgorithm = AlgorithmPreparing;
    end
end

