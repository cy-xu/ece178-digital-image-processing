function rImg = mySeamCarveResize(Img,rC,rR)
%rC: number of columns to be removed
%rR: number of row to be removed

rImg = Img;
temImg = [];
while rC >= 0
    EMap = myEnergyFunc(rImg);
    [E,S] = mySeamCarve_H(EMap);
    S = fliplr(S);
    [m,n,z] = size(rImg);
    for i = 1:m
        row = rImg(i,:,:);
        %newRow = row(1,[[1:S(i)-1],[S(i)+1:n]],:); % each new row equals pixels before S(i) plus after S(i), S(i) is the least energy pixel of this row
        newRow = [row(1,1:S(i)-1,:),row(1,S(i)+1:n,:)];
        temImg = vertcat(temImg, newRow);
    end
    rImg = temImg;
    rC = rC - 1;
    temImg = [];
end