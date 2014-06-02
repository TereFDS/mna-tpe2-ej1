function X=cooleyTukeyFFT(x,N,s)
    X=zeros(N);
    if(N==1)
        X=x(1);
        return 
    end
        X(1:(N/2))=cooleyTukeyFFT(x,N/2,2*s);
        X((N/2+1):N)=cooleyTukeyFFT(x(s:end),N/2,2*s);
        for k=1:N/2
           t=x(k); 
           X(k)=t+exp(-2*pi*i/N)*X(k+N/2);
           X(k+N/2)=t+exp(-2*pi*i/N)*X(k+N/2); 
        end    
end    