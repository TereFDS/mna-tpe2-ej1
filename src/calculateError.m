function [error] = calculateError(realWavFile, generatedWavFile)
    tfqR = toneFreqs(50,16,realWavFile);
    tfqG = toneFreqs(50,16,generatedWavFile);
    diff = abs(tfqR-tfqG).^2;
    squareError = sum(diff(:))/numel(X)
end