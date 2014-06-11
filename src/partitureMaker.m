function [partiture]= partitureMaker(fm,bitsQty,fileName)
    
    % notas para hacer la partitura
    pitches=["A-","Bb","B-","C-","C#","D-","Eb","E-","F-","F#","G-","Ab"];
    % frecuencais
    frequencies=[27.5,29.135,30.867,32.7032,34.6479,36.7081,38.8909,41.2035,43.6536,46.2493,48.9995,51.9130;55.0000,58.2705,61.7354,65.4064,69.2957,73.4162,77.7817,82.4069,87.3071,92.4986,97.9989,103.826;110.000,116.541,123.471,130.813,138.591,146.832,155.563,164.814,174.614,;;;];
    
    %lectura archivo
    [audio fs bps] = wavread(fileName);
    
    % el periodo esta dado por el tiempo de 30milisegundos
    % => frecuencia de muestreo dividido el tiempo da el periodo
    % nuestra cuenta primero pasa a milisegundos y depues multiplica x30
    period = floor((fs/1000)*30);
    
    % cantidad de muestras del audio esta en rows
    [rows cols] = size(audio);
    
    for i=1:period:(rows/period)
        % FFT dentro hace las validacioens necesarias 
        % para que sea % == 0 a una potencia de 2
        % se le pasa un array con todas las muestras que serian los x_{n}
        toneFrequency = fft( [audio(((i-1)*period):(i*period))] );	
        %toneFrecuency = ourFFT( [audio(((i-1)*period):(i*period))] );
        % busca la frecuencia
        [row col shouldTrue] = find(frequencies==toneFrecuency);
        % asocio la frecuencia a un string
        % ni idea
    end

end