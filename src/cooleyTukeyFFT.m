function X = cooleyTukeyFFT(x,N,s)
    X = zeros(1,N);
    if(N==1)
        X=x(1);
        return 
    else
        X(1,1:(N/2)) = cooleyTukeyFFT(x,N/2,2*s);
        [r c] = size(x);
        X(1,((N/2)+1):N) = cooleyTukeyFFT(x(1,1:s:c),N/2,2*s);
        for k=1:N/2
           t = x(k); 
           X(k) = t + exp(-2*pi*1i*k/N) * X(k+(N/2));
           X(k+N/2) = t - exp(-2*pi*1i*k/N) * X(k+(N/2)); 
        end   
    end
end