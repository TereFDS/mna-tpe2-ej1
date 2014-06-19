function [error] = calculateError(realWavFile, generatedWavFile)
    tfqR = toneFreqs(50,16,realWavFile);
    [rowR colR] = size(tfqR);
    tfqG = toneFreqs(50,16,generatedWavFile);
    [rowG colG] = size(tfqG);
    minCol = min(colR,colG);
    tfqR = tfqR(1,1:minCol);
    tfqG = tfqG(1,1:minCol);
    diff = abs(tfqR-tfqG).^2;
    error = sum(diff(:))/numel(tfqR);
end