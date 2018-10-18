clear;clc;
DataHist=zeros(3,256);
Labels=zeros(3,1);
ImgIdx=1;
for ABCDIdex=1:3
    I=(imread(['./DataSet/oriImg',num2str(ABCDIdex),'.jpg']));
    Isp=rgb2gray(imnoise(I,'salt & pepper'));
    Iga=rgb2gray(imnoise(I,'gaussian',0,0.05));
    Ipo=rgb2gray(imnoise(I,'poisson'));
    [H,W,~]=size(I);
    for px=101:50:H-100
        for py=101:50:W-100
            I_sp=Isp(px-100:px+100,py-100:py+100);
            I_ga=Iga(px-100:px+100,py-100:py+100);
            I_po=Ipo(px-100:px+100,py-100:py+100);
            DataHist(ImgIdx,:)=hist(double(reshape(I_sp,201^2,1)),256);
            Labels(ImgIdx)=0;
            DataHist(ImgIdx+1,:)=hist(double(reshape(I_ga,201^2,1)),256);
            Labels(ImgIdx+1)=1;
            DataHist(ImgIdx+2,:)=hist(double(reshape(I_po,201^2,1)),256);
            Labels(ImgIdx+2)=2;
            ImgIdx=ImgIdx+3;
        end
    end
end
save('./DataSet/DataSet.mat','DataHist','Labels');
