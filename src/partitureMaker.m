function [partiture]= partitureMaker(framentTime,bitsQty,fileName)
    %partitura es un string
    partiture="";
    % notas para hacer la partitura
    pitches=["A-";"A#/Bb";"B-";"C-";"C#/Db";"D-";"D#/Eb";"E-";"F-";"F#/Gb";"G-";"G#/Ab"];
    % frecuencais
    frequencies = [27.5000,29.1353,30.8677,32.7032,34.6479,36.7081,38.8909,41.2035,43.6536,46.2493,48.9995,51.9130;
                   55.0000,58.2705,61.7354,65.4064,69.2957,73.4162,77.7817,82.4069,87.3071,92.4986,97.9989,103.826;
                   110.000,116.541,123.471,130.813,138.591,146.832,155.563,164.814,174.614,184.997,195.998,207.652;
                   220.000,233.082,246.942,261.626,277.183,293.665,311.127,329.628,349.228,369.994,391.995,415.305;
                   440.000,466.164,493.883,523.251,554.365,587.330,622.254,659.255,698.456,739.989,783.991,830.609;
                   880.000,932.328,987.767,1046.50,1108.73,1174.66,1244.51,1318.51,1396.91,1479.98,1567.98,1661.22;
                   1760.00,1864.66,1975.53,2093.00,2217.46,2349.32,2489.02,2637.02,2793.83,2959.96,3135.96,3322.44;
                   3520.00,3729.31,3951.07,4186.01,-1     ,-1     ,-1     ,-1     ,-1     ,-1     ,-1     ,-1      ];
             
             
    
    %lectura archivo
    [audio fs bps] = wavread(fileName);
    
    % el periodo esta dado por el tiempo de 30milisegundos
    % => frecuencia de muestreo dividido el tiempo da el periodo
    % nuestra cuenta primero pasa a milisegundos y depues multiplica x30
    period = floor((fs/1000)*framentTime);
    % get nearest exponent of 2
    exponent2ofPeriod = nextpow2(period)-1;
    exponent2ofPeriod = 2^exponent2ofPeriod;
    % cantidad de muestras del audio esta en rows
    [rows cols] = size(audio);
    % cantidad de periodos a analizar
    amountOfPeriods = floor(rows/period);
    for k=1:amountOfPeriods
        % FFT dentro hace las validaciones necesarias 
        % para que sea % == 0 a una potencia de 2
        % se le pasa un array con todas las muestras que serian los x_{n}
        toneFrequency = abs(fft( [audio((((k-1)*period)+1):((k)*period))], exponent2ofPeriod ));
        
        %toneFrecuency = ourFFT( [audio(((i-1)*period):(i*period))] );
        
        % sumo los valores de fourier para cada valor
        [toneFrequencyMax indexFreq] = max(toneFrequency);
        toneFrequency= (indexFreq/period)*fs
        
        
        % busca la frecuencia
        [row col] = findPitch(frequencies,toneFrequency);
        
        % asocio la frecuencia a un string
        partiture=cstrcat(partiture,[pitches(col,:)],[dec2base(row-1,10)]," ");
        
    end

end

function [row col]= findPitch(frequencies,toneFreq)
   [rows cols]=size(frequencies);
    flag=true;
    for i=1:(rows*cols-1)
        
        row=floor(i/rows)+1;
        col=mod(i,cols)+1;
        if(toneFreq>frequencies(row,col))
            
            return;
        end
        
    end
end    