
function [Pdf] =  calcOfPdf(Distribution, ConvulutionKernel);

%% preparing steps
Kernel= ConvulutionKernel.Kernel;
EdgeLength= ConvulutionKernel.EdgeLength;
Matrix2Convulute = Distribution;

%% 2D-convuluion
%Matrix2Convulute = fft2(Matrix2Convulute);
%Kernel = fft2(Kernel);
%Pdf = Matrix2Convulute.*Kernel;
%Pdf = ifft2(Pdf)

% application of padding / was soll das denn?
[m,n] = size(Distribution);
mm = 2*m - 1;
nn = 2*n - 1;

Pdf = (ifft2(fft2(Matrix2Convulute,mm,nn).* fft2(Kernel,mm,nn)));

%%

%Pdf = conv2(Matrix2Convulute, Kernel);
%Pdf = imresize(Pdf, [EdgeLength EdgeLength]);

PQ1 = (size(Matrix2Convulute,1)*2)-1; % paddsize / warum und wieso ist mir nicht klar
Matrix2Convulute = fft2(Matrix2Convulute,PQ1,PQ1); Kernel = fft2(Kernel,PQ1,PQ1); % jeder der beiden Partner wird gepadded

Pdf = Matrix2Convulute.*Kernel; % die eigentliche Faltung
Pdf = ifft2(Pdf);

PQ2 = floor(PQ1/4); 
Pdf=Pdf((PQ2+1):(PQ1-PQ2),(PQ2+1):(PQ1-PQ2));


end