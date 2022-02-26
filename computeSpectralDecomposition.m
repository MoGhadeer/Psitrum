function DecomposedVector= computeSpectralDecomposition(DensityMatrix)
    [EigenVectors,EigenValues]=eig(DensityMatrix);
    DecomposedVector= EigenVectors(:,end).*EigenValues(end,end);
end