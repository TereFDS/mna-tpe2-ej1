function tone=makeSound(toneFrequency,L,period,Fs)
    T = 1/Fs; %Sampling Period
    N = (Fs/1000)*period; % Number of samples to achieve desired duration
    n = @(L) 1:L*N; %the array, n, takes an integer multiplier, L, that can reduce or increase the duration of a note, i.e. 1/2 note, 1/4 note, etc
    
    tone = sin(2*pi*toneFrequency*T*n(L)); %standard note at fund. freq.
    
    
end  