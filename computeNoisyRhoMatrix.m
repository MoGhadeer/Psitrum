function NoisyRhoMatrix = computeNoisyRhoMatrix(NumOfQubits, TypeOfNoise, NoiseFactor, RhoMatrix)
    switch TypeOfNoise
        case 'Dep'   % Depolarizing noise
            NoisyRhoMatrix= (1-NoiseFactor)*RhoMatrix + (1/(2^NumOfQubits))*(RhoMatrix)*NoiseFactor*eye(2^NumOfQubits); 
        otherwise
            error  'Noise Type is not Available'
    end
end