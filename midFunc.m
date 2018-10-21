function ResImg=midFunc(Img)
    [~,~,cc]=size(Img);
    for c=1:cc
        ResImg(:,:,c)=medfilt2(Img(:,:,c));
    end
end