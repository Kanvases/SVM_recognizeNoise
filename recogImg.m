function [Result]=recogImg(Img)
label=string({'salt & pepper','gaussian','possion'});
load('./DataSet/params.mat');
load('./DataSet/NormParams.mat');

Img=rgb2gray(Img);
[H,W]=size(Img);
smpX=round(unifrnd(102,H-102,100,1));
smpY=round(unifrnd(102,W-102,100,1));
testHist=zeros(100,256);
X=zeros(100,256);

for ImgIdx=1:100
    patchI=Img(smpX(ImgIdx)-100:smpX(ImgIdx)+100,smpY(ImgIdx)-100:smpY(ImgIdx)+100,:);
%     imshow(patchI);
    testHist(ImgIdx,:)=hist(double(reshape(patchI,201^2,1)),256);
end

for i=1:256
    X(:,i)=(testHist(:,i)-Mx0(i))/(Sx0(i));
end
LabelList=[mean(X*W_sp-CC_sp),mean(X*W_ga-CC_ga),mean(X*W_po-CC_po)];
Result=label(find(LabelList==(max(LabelList))));