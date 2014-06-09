function [tone partiture]= partitureMaker(fm,bitsQty,fileName)
    pitches=["C","C#","D","Eb","E","F","F#","G","Ab","A","Bb","B"];
    [audio fs bps]=wavread(fileName);
    tone=max(ifft(audio));
    
endfunction    