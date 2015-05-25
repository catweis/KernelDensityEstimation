function [ Distribution ] = getDistribution(Xyz, ConvulutionKernel)

%% precalculations 
EdgeLength = ConvulutionKernel.EdgeLength;
[Nrounds NonUsed1 NonUsed2]=size(Xyz);
Distribution = zeros(EdgeLength);

%% printing of the matrix

for n = 1:Nrounds
    
    Ycoord=round(Xyz(n,1)); 
    Xcoord=round(Xyz(n,2));
    Distribution(Ycoord, Xcoord)= Xyz(n,3);
    
end

end

