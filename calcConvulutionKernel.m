
function [ConvulutionKernel] = calcConvulutionKernel(Bandwidth, EdgeLength)

Bandwidth = 5;

x=1:1:EdgeLength; y=x;

[X Y]=meshgrid(x,y);

MittelpunktX = ceil(EdgeLength/2); MittelpunktY = MittelpunktX;

X = (X-MittelpunktX).^2; Y = (Y-MittelpunktY).^2;

Exponent = -((X./(2*Bandwidth^2))+(Y./(2*Bandwidth^2)));

ConvulutionKernel = exp(Exponent);
%e = e.*(1/(2*pi*Bandwidth*Bandwidth));

close all
%imshow(e, [], 'InitialMagnification', 'fit'), colormap 'jet', colorbar

end
