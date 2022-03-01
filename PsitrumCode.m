
clc
close all


% Quantum Algorithm: 
QuAlgorithm     = ["." "X"; "." "X";"X" "X"];

steps          = size(QuAlgorithm,2);                         % Number of steps  in QAlgorithm
qubits         = size(QuAlgorithm,1) ;                        % Number of qubits in QAlgorithm
Mqubits        = 1:qubits;
        
QubitsToBeMeasured  = [Mqubits];                              % [1], [1,2 ...] or [Mqubits]
InputStateVector  = InitializeInt2Qstates(qubits ,0);         % [0;0;0;0] or [1;1;0;0]   [0;0;0;0;0;0;1;0]

TypeOfNoise =  'Dep';
param = [0.05 0.05];
n = qubits;

 P = param;
 P = param*rand(1)
 NoiseFactor = P*4^n/(4^n-1);                                  %   0 ≤ NoisePar ≤ 4^n/(4^n−1) , probability for an error


% 1st iteration
[OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, TypeOfNoise, NoiseFactor)

Out1stIt = OutputVector;
%% 2nd iteration
InputStateVector=Out1stIt;
[OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, TypeOfNoise, NoiseFactor)
Out2ntIt = OutputVector;
%% 3rd iteration
InputStateVector=Out2ntIt;
[OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, TypeOfNoise, NoiseFactor)
Out3ntIt = OutputVector;
%% 4th iteration
InputStateVector=Out3ntIt;
[OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, TypeOfNoise, NoiseFactor)
Out4thIt = OutputVector;
%% 5th iterationOut4thIt;
InputStateVector=Out4thIt;
[OutputVector, OutputNoisyVector, OutputVectorPropability, OutputNoisyVectorPropability, OutputMatrix, OutputRhoMatrix, OutputNoisyRhoMatrix, StageTraceVector, StageTraceNoisyVector] = PsitrumMainFunction(QuAlgorithm, QubitsToBeMeasured, InputStateVector, TypeOfNoise, NoiseFactor)
Out5thIt = OutputVector;
