clc,clf,close all,clear all;
I=imread('Leopard.jpg');
subplot(2,2,1),imshow(I),title('original image');

H1=[1 4 7 4 1;4 16 26 16 4;7 26 47 26 7;4 16 26 16 4; 1 4 7 4 1]/273.0;

[r,c]=size(I);
[r1,c1]=size(H1);
Pzone=zeros(r+r1-1,c+c1-1);
m_start=floor(r1/2)+1;%???
c_start=floor(c1/2)+1;%???
m_end=r+r1-floor(r1/2)-1;%???
c_end=c+c1-floor(c1/2)-1;%???

Pzone(m_start:m_end,c_start:c_end)=double(I);
%Z1=zeros(r+r1-1,c+c1-1);%???????Z1

  for i=m_start:m_end
        for j=c_start:c_end
        sumz=0;
        for p=-floor(r1/2):floor(r1/2)
            for q=-floor(c1/2):floor(c1/2)
                sumz=sumz+H1(floor(r1/2)+1+p,floor(c1/2)+1+q).*Pzone(i+p,j+q);
            end
        end
        Z1(i,j)=sumz;
        end
 end
P1=mat2gray(Z1(m_start:m_end,c_start:c_end));

 mask=Pzone(m_start:m_end,c_start:c_end)-Z1(m_start:m_end,c_start:c_end);
 P2=mat2gray(mask);
 image=Pzone(m_start:m_end,c_start:c_end)-mask;
 %??mask?Pzone?Z1?m_start:m_end,c_start:c_end???????????floor(r1)/2?
 P3=mat2gray(image);
 
  subplot(2,2,2),imshow(P1);title('smoothing image');
  subplot(2,2,3),imshow(P2);title('unsharp mask');
  subplot(2,2,4),imshow(P3);title('unsharp masking image');
