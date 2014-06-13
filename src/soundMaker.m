

function z = soundMaker (partiture, fps,bps,period,name)
    frequencies = [27.5000,29.1353,30.8677,32.7032,34.6479,36.7081,38.8909,41.2035,43.6536,46.2493,48.9995,51.9130;
    55.0000,58.2705,61.7354,65.4064,69.2957,73.4162,77.7817,82.4069,87.3071,92.4986,97.9989,103.826;
    110.000,116.541,123.471,130.813,138.591,146.832,155.563,164.814,174.614,184.997,195.998,207.652;
    220.000,233.082,246.942,261.626,277.183,293.665,311.127,329.628,349.228,369.994,391.995,415.305;
    440.000,466.164,493.883,523.251,554.365,587.330,622.254,659.255,698.456,739.989,783.991,830.609;
    880.000,932.328,987.767,1046.50,1108.73,1174.66,1244.51,1318.51,1396.91,1479.98,1567.98,1661.22;
    1760.00,1864.66,1975.53,2093.00,2217.46,2349.32,2489.02,2637.02,2793.83,2959.96,3135.96,3322.44;
    3520.00,3729.31,3951.07,4186.01,-1     ,-1     ,-1     ,-1     ,-1     ,-1     ,-1     ,-1      ];
    
    toneFrequencies=parseNotes(frequencies,partiture);
    toneFrequenciesQty=size(toneFrequencies)(2);
    toneAuxi=toneFrequencies(1);
    L=1;
    
    j=1;
    z=[];
    for i=2:toneFrequenciesQty
        if(toneFrequencies(i)!=toneAuxi)
            %auxi=makeSound(toneAuxi,L,period,fps);
            z=[z makeSound(toneAuxi,L,period,fps)];
            
            j=j+1;
            toneAuxi=toneFrequencies(i);
            L=1;    
        else
          L=L+1; 
       end
    end
    z=[z makeSound(toneAuxi,L,period,fps)];

    # for i=1:toneFrequenciesQty
        # 
       # z(i,:)=makeSound(toneFrequencies(i),L,period,fps); 
        # 
    # end
    
    %z=reshape(z,1,toneFrequenciesQty*size(z)(2));
    
    wavwrite(2*z',fps,bps,name);
    
    
    
endfunction

function array= parseNotes(frequencies,partiture)
    length=size(partiture)(2);
    triplet=3;
    if(mod(length,3)~=0)
        return;
    end
    array=zeros(1,length/3);
    
    for i=1:triplet:length
        pitch=partiture(i);
        switch(pitch)
         case "S"
            pitch=(-1);
         case "A"
            pitch=1;
         case "B"
            pitch=3;
         case "C"
            pitch=4;
         case "D"
            pitch=6;
         case "E"
            pitch=8;
         case "F"
            pitch=9;
         case "G"
            pitch=11;
        end
        
        alteration=partiture(i+1);
        switch(alteration)
        case "-"   
            alteration=0;
        case "b"
            alteration=(-1);
        case "#"
            alteration= 1;
        end    
        
        octave= str2num(partiture(i+2));
        if(pitch<4)
                octave=octave+1;
            
        end 
        
        if(pitch==(-1))
            
            array(floor(i/3)+1)=0;
        else
            mix=pitch+alteration;
            if(pitch+alteration<1)
                mix=12;
            end
            
            array(floor(i/3)+1)= frequencies(octave,mix);
        end    
        
        
    end    
    
    
    
end

function tone=makeSound(toneFrequency,L,period,Fs)
    T = 1/Fs; %Sampling Period
    N = (Fs/1000)*period; % Number of samples to achieve desired duration
    n = @(L) 1:L*N; %the array, n, takes an integer multiplier, L, that can reduce or increase the duration of a note, i.e. 1/2 note, 1/4 note, etc
    
    tone = sin(2*pi*toneFrequency*T*n(L)); %standard note at fund. freq.
    
    
    
    
    
end    
