

function prueba()
Fs1 = 44100; %Set Sampling Frequency
Fr = Fs1; %Set Reconstruction Frequency
Fs = Fs1; % The multiple of the sampling frequency to be used
T = 1/Fs; %Sampling Period

N = 0.2*Fs1; % Number of samples to achieve desired duration
L = 1; % default value for L (L=1 => no duration change)
n = @(L) 1:L*N; %the array, n, takes an integer multiplier, L, that can reduce or increase the duration of a note, i.e. 1/2 note, 1/4 note, etc
m = 0; %default input for oct, the octave shift function (using downsampling)

%Generate General Sinusoid
%m is the desired octave, which is transformed into the appropriate multiplier by the oct function
%L is the desired length of the note (in quarter notes)
%fN is the frequncy of the note 
note = @(m, L, fN) sin(2*pi*oct(m)*fN*T*n(L)); %standard note at fund. freq.

fA = 440.00; % Master Tuned to A 440
fGS = fA*2^(-1/12);
fG = fGS*2^(-1/12);
fFS = fG*2^(-1/12);
fF = fFS*2^(-1/12);
fE = fF*2^(-1/12);
fDS = fE*2^(-1/12);
fD = fDS*2^(-1/12);
fCS = fD*2^(-1/12);
fC = fCS*2^(-1/12);
fAS = fA*2^(1/12);
fB = fAS*2^(1/12);

namp = 1; % set the amplitude for the natural freq
hamp = 0.8; % set the amplitude for the overtones

%each note passes m and L to the note function above
%two overtones are added to each note
C = @(m, L) namp*note(m, L, fC) + hamp*note(m, L, 0.5*fC) + hamp*note(m, L, 2*fC); 
CS = @(m, L) namp*note(m, L, fCS) + hamp*note(m, L, 0.5*fCS) + hamp*note(m, L, 2*fCS); 
D = @(m, L) namp*note(m, L, fD) + hamp*note(m, L, 0.5*fD) + hamp*note(m, L, 2*fD); 
DS = @(m, L) namp*note(m, L, fDS) + hamp*note(m, L, 0.5*fDS) + hamp*note(m, L, 2*fDS); 
E = @(m, L) namp*note(m, L, fE) + hamp*note(m, L, 0.5*fE) + hamp*note(m, L, 2*fE);
F = @(m, L) namp*note(m, L, fF) + hamp*note(m, L, 0.5*fF) + hamp*note(m, L, 2*fF); 
FS = @(m, L) namp*note(m, L, fFS) + hamp*note(m, L, 0.5*fFS) + hamp*note(m, L, 2*fFS); 
G = @(m, L) namp*note(m, L, fG) + hamp*note(m, L, 0.5*fG) + hamp*note(m, L, 2*fG); 
GS = @(m, L) namp*note(m, L, fGS) + hamp*note(m, L, 0.5*fGS) + hamp*note(m, L, 2*fGS); 
A = @(m, L) namp*note(m, L, fA) + hamp*note(m, L, 0.5*fA)+ hamp*note(m, L, 2*fA); 
AS = @(m, L) namp*note(m, L, fAS) + hamp*note(m, L, 0.5*fAS) + hamp*note(m, L, 2*fAS); 
B = @(m, L) namp*note(m, L, fB) + hamp*note(m, L, 0.5*fB) + hamp*note(m, L, 2*fB); 

%Define Rests
er = zeros(1, .125*N); % eigth rest
qr = zeros(1, .25*N); % quarter rest
hr = zeros(1, .5*N); % half rest
tr = zeros(1, .75*N); % three-quarter rest
wr = zeros(1, N); % whole rest

%Jingle Bells
%note(octave, duration in 1/4 note) example: A=C(1,1) = 1/4 note middle C
jbseq1 = [A(0,1) qr A(0,1) qr A(0,2) qr]; 
jbseq2 = [A(0,1) qr C(1,1) qr F(0,1) qr G(0,1) qr A(0,4) qr]; 
jbseq3 = [AS(0,1) qr AS(0,1) qr AS(0,1) qr AS(0,0.5) qr AS(0,1) qr A(0,1) qr A(0,1) qr A(0,0.5) er A(0,0.5) qr A(0,1) qr G(0,1) qr G(0,1) qr A(0,1) qr G(0,2) qr C(1,2) qr]; 
jbseq4 = [AS(0,1) qr AS(0,1) qr AS(0,1) qr AS(0,1) qr AS(0,1) qr A(0,1) qr A(0,1) qr A(0,0.5) er A(0,0.5) qr C(1,1) qr C(1,1) qr AS(0,1) qr G(0,1) qr F(0,4)]; 
jbseq5 = [C(0,1) qr A(0,1) qr G(0,1) qr F(0,1) qr C(0,3) qr C(0,0.5) er C(0,0.5) qr C(0,1) qr A(0,1) qr G(0,1) qr F(0,1) qr D(0,4) qr];
jbseq6 = [D(0,1) qr AS(0,1) qr A(0,1) qr G(0,1) qr E(0,4) qr C(1,1) qr C(1,1) qr AS(0,1) qr G(0,1) qr A(0,4) qr];
jbseq7 = [C(0,1) qr A(0,1) qr G(0,1) qr F(0,1) qr C(0,4) qr C(0,1) qr A(0,1) qr G(0,1) qr F(0,1) qr D(0,4) qr];
jbseq8 = [D(0,1) qr AS(0,1) qr A(0,1) qr G(0,1) qr C(1,1) qr C(1,1) qr C(1,1) qr C(1,0.5) er C(1,0.5) qr D(1,1) qr C(1,1) qr AS(0,1) qr G(0,1) qr F(0,1) wr C(1,2) qr];
jbseq9 = [AS(0,1) qr AS(0,1) qr AS(0,1) qr AS(0,1) qr AS(0,1) qr A(0,1) qr A(0,1) qr A(0,0.5) er A(0,0.5) qr C(1,1) qr C(1,1) qr AS(0,1) qr G(0,1) qr F(0,4) qr ];

%Song constructed from several, sometimes repeating, jbsequences
jbells = [jbseq1 jbseq1 jbseq2 jbseq3 jbseq1 jbseq1 jbseq2 jbseq4 jbseq5 jbseq6 jbseq7 jbseq8 jbseq1 jbseq1 jbseq2 jbseq3 jbseq1 jbseq1 jbseq2 jbseq3 jbseq9];

octm2 = [C(-2, 0.5) qr CS(-2, 0.5) qr D(-2, 0.5) qr DS(-2, 0.5) qr E(-2, 0.5) qr F(-2, 0.5) qr FS(-2, 0.5) qr G(-2, 0.5) qr GS(-2, 0.5) qr A(-2, 0.5) qr AS(-2, 0.5) qr B(-2, 0.5) qr];
octm1 = [C(-1, 0.5) qr CS(-1, 0.5) qr D(-1, 0.5) qr DS(-1, 0.5) qr E(-1, 0.5) qr F(-1, 0.5) qr FS(-1, 0.5) qr G(-1, 0.5) qr GS(-1, 0.5) qr A(-1, 0.5) qr AS(-1, 0.5) qr B(-1, 0.5) qr];
oct0 = [C(0, 0.5) qr CS(0, 0.5) qr D(0, 0.5) qr DS(0, 0.5) qr E(0, 0.5) qr F(0, 0.5) qr FS(0, 0.5) qr G(0, 0.5) qr GS(0, 0.5) qr A(0, 0.5) qr AS(0, 0.5) qr B(0, 0.5) qr];
oct1 = [C(1, 0.5) qr CS(1, 0.5) qr D(1, 0.5) qr DS(1, 0.5) qr E(1, 0.5) qr F(1, 0.5) qr FS(1, 0.5) qr G(1, 0.5) qr GS(1, 0.5) qr A(1, 0.5) qr AS(1, 0.5) qr B(1, 0.5) qr];
oct2 = [C(2, 0.5) qr CS(2, 0.5) qr D(2, 0.5) qr DS(2, 0.5) qr E(2, 0.5) qr F(2, 0.5) qr FS(2, 0.5) qr G(2, 0.5) qr GS(2, 0.5) qr A(2, 0.5) qr AS(2, 0.5) qr B(2, 0.5) qr];

superoct = [octm2 octm1 oct0 oct1 oct2];

polytest1 = [C(0,4)+ E(1,4) C(0, 2) C(0,4)+ E(1,4) C(0, 2) C(0,4)+ F(1,4) C(0, 2) C(0,4)+ D(1,4)];
polytest = [polytest1 polytest1 polytest1 C(0,8) + C(-1,8)];
wavwrite((0.5*jbells)',Fr,16,"jinglebells.wav");

end