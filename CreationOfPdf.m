
function [Pdf] = CreationOfPdf(XyzData, Parameter)

%% calculation of the convulution kernel
[ConvulutionKernel] = getConvulutionKernel(XyzData);

%% calculation of the distribution
% hier wird eine neue Matrix mit den gewünschten Zahlenwerten
% zussammgestellt

switch Parameter
    
    case 'CellCoordinates'
        
        Colum1=XyzData(:,1); Colum2=XyzData(:,2); % coordinates
        [SizeY SizeX]=size(Colum1); Colum3=ones(SizeY,1);
        Xyz=[Colum1, Colum2, Colum3];
        [Distribution] = getDistribution(Xyz, ConvulutionKernel); % plot a matrix
        
    case 'CellSize'

        Colum1=XyzData(:,1); Colum2=XyzData(:,2); % coordinates
        Colum3 = XyzData(:,3); % cell size
        Xyz=[Colum1, Colum2, Colum3];
        [Distribution] = getDistribution(Xyz, ConvulutionKernel); % plot a matrix
        
    otherwise
        
        print('Not defined yet')

end

%% convolution
[Pdf] =  calcOfPdf(Distribution, ConvulutionKernel);

%% Darstellung der Ergebnisse
close all
figure(2), imagesc(flipud(Pdf)), colormap 'hot', colorbar, title('kernel density estimate')
figure(1), scatter(XyzData(:,2), XyzData(:,1)), ylim([0 size(Pdf,1)]), xlim([0 size(Pdf,1)]), title('original position')



end

