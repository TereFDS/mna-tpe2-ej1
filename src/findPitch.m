function [row col]= findPitch(frequencies,toneFreq)
   [rows cols]=size(frequencies);
    for i=1:(rows*cols-1)
        row=floor(i/cols)+1;
        col=mod(i,cols)+1;        
        if(toneFreq<frequencies(row,col))
              
	    rowAuxi=floor((i-1)/cols)+1;
	    colAuxi=mod(i-1,cols)+1;
	    diff=(frequencies(row,col)-frequencies(rowAuxi,colAuxi))/2;
	    frequencies(rowAuxi,colAuxi)+diff;
	    if(toneFreq<frequencies(rowAuxi,colAuxi)+diff)
	     row=rowAuxi;
	     col=colAuxi;
	    end
	    
	    return;
        end
        
    end
    [auxi col]=max(frequencies(rows,:));
    row=rows;
end    