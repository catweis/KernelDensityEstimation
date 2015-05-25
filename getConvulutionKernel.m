function [ConvulutionKernel] = getConvulutionKernel(XyzData)


%% precalculation

XyData = XyzData(:,1:2); % hier sind nur die Kantenlängen interessant
EdgeLength = max(XyData(:));
    
% calculate odd EdgeLength / der cloue

if rem(EdgeLength,2) == 1 % odd
    
elseif rem(EdgeLength,2) == 0 % even
        
    EdgeLength = EdgeLength+1;

end

%% Bivariate Gaussian Kernel Density Estimation
% ob und warum das die richtige ist / wäre ist noch unklar

p=gkde2(XyData);

Bandwidth = round(mean(p.h));


%% calculation of the convulution kernel
% due to usage of meshgrid dramtic reduction of calculation time
% lookup-table is not needed any more

[ConvulutionKernel] = calcConvulutionKernel(Bandwidth, EdgeLength);

Nonsense = ConvulutionKernel; % hier wird nur eine Fehlermeldung ignoriert;
clear ConvulutionKernel

ConvulutionKernel.Kernel = Nonsense;
ConvulutionKernel.Bandwidth= Bandwidth;
ConvulutionKernel.EdgeLength= EdgeLength;

figure(1), imagesc(ConvulutionKernel.Kernel), colormap 'jet', colorbar, title('convulution kernel according to bivariate kernel density estimation')


end

