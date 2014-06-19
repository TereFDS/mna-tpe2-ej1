function X = cooleyTukeyFFT(x,N)
    X = zeros(N,1);
    if(N==1)
        X=x(1);
        return 
    else
        X(1:(N/2)) = cooleyTukeyFFT(x(1:2:N),N/2);
        X(((N/2)+1):N) = cooleyTukeyFFT(x(2:2:N),N/2);
        k=(1:N/2)';
        t = X(k); 
        X(k) = t + exp(-2*pi*1i*(k-1)/N) .* X(k+(N/2));
        X(k+N/2) = t - exp(-2*pi*1i*(k-1)/N) .* X(k+(N/2)); 
    end
    X = X';
end