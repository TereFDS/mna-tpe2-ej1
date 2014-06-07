function [tone partiture]= partitureMaker(fm,bitsQty,fileName)
    
    [audio fs bps]=wavread(fileName);
    tone=max(fft(audio));
    
endfunction    