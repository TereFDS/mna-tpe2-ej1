function [partiture]= partitureMaker(fm,bitsQty,fileName)
    pitches=["A-","Bb","B-","C-","C#","D-","Eb","E-","F-","F#","G-","Ab"];
    frequencies=[27.5,29.135,30.867,32.7032,34.6479,36.7081,38.8909,41.2035,43.6536,46.2493,48.9995,51.9130;55.0000,58.2705,61.7354,65.4064,69.2957,73.4162,77.7817,82.4069,87.3071,92.4986,97.9989,103.826;110.000,116.541,123.471,130.813,138.591,146.832,155.563,164.814,174.614,;;;];
    [audio fs bps]=wavread(fileName);
    period=floor((fs/1000)*30)
    
    for i=1:period:size(audio)(1)
	toneFrequency=tone=max(fft(audio(((i-1)*period):(i*period))));	
	[octave pitch]=find(frequencies==toneFrecuency);
	
    end
    
    
    
    
endfunction    