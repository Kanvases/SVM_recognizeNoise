function ImgRes=DCTfunc(ImgNoisy)
    [m,n,cc]=size(ImgNoisy);
    ImgRes=ImgNoisy;
    for c=1:cc
        Y=dct2(ImgNoisy(:,:,c)); 
        I=zeros(m,n);
        I(1:round(m/4),1:round(n/4))=1; 
        Ydct=Y.*I;
        ImgRes(:,:,c)=(idct2(Ydct)); 
    end
    disp('DCT done.')
end