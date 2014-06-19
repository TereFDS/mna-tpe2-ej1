function [error] = calculateError(realWavFile, generatedWavFile)
    tfqR = toneFreqs(50,1,realWavFile);
    tfqG = toneFreqs(50,1,generatedWavFile);
    diff = abs(tfqR-tfqG).^2;
    squareError = sum(diff(:))/numel(X)
end