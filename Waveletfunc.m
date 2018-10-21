function [I1]=Waveletfunc(I)
[~,~,cc]=size(I);
I=im2double(I);
for c=1:cc
    [c1,s1]=wavedec2(I(:,:,c),2,'coif2');
    n=[1,2];
    p=[10.28,24.08];
    nc=wthcoef2('h',c1,s1,n,p,'s');
    mc=wthcoef2('v',nc,s1,n,p,'s');
    I1(:,:,c)=waverec2(mc,s1,'coif2');
end
I1=uint8(I1.*255);