function array= parseNotes(frequencies,partiture)
    length=size(partiture)(2);
    triplet=3;
    if(mod(length,3)~=0)
        return;
    end
    array=zeros(1,length/3);
    
    for i=1:triplet:length
        pitch=partiture(i)
        switch(pitch)
         case "S"
            pitch=(-1);
         case "A"
            pitch=1
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
        
        alteration=partiture(i+1)
        switch(alteration)
        case "-"   
            alteration=0
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
            array(i/3)=0;
        else
            mix=pitch+alteration;
            if(pitch+alteration<1)
                mix=12;
            end
            
            array(floor(i/3)+1)= frequencies(octave,mix);
        end    
        
        
    end    
    
    
    
end
