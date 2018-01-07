function E = myEnergyFunc(img)

%% First mirror padding the input image, with half filter size r
% r = 3;
% paddedImg = padarray(img,[r r],'symmetric','both');

%% Apply gaussian filter to the padded image
gaussianFilter = fspecial('gaussian',3,1);
img_smooth = imfilter(img,gaussianFilter,'symmetric','same');
img_d = im2double(rgb2gray(img_smooth)); 

%% Horizontal gradient 
hor_gradient = abs(img_d(:,3:end) - img_d(:,1:end-2));

%% Vertical gradient 
ver_gradient = abs(img_d(3:end,:) - img_d(1:end-2,:));

%% Combine horizontal and vertical gradient
gradient_map = hor_gradient(2:end-1,:) + ver_gradient(:,2:end-1);
[m,n] = size(gradient_map);

%% generate the energy map from gradient map
energyMap = gradient_map;
for i = 2:m
    row = energyMap(i-1,:);
    for j = 1:n
        if j == 1
            %candidates = [row(j),row(j+1)];
            energyMap(i,j) = energyMap(i,j) + min(row(j),row(j+1));
        elseif j == n
            %candidates = [row(j-1),row(j)];
            energyMap(i,j) = energyMap(i,j) + min(row(j-1),row(j));
        else
            candidates = [row(j-1),row(j),row(j+1)];
            energyMap(i,j) = energyMap(i,j) + min(candidates);
        end
    end
end

max_energy = max(max(energyMap));
energyMap = energyMap / max_energy;

energyMap = padarray(energyMap,[1 1],'symmetric','both');

E = energyMap;

%%

%function rImg = mySeamCarveResize(Img,rC,rR)
%rC: number of columns to be removed 100
%rR: number of row to be removed 100

% newImg = [];
% [m,n] = size(energyMap);
% 
% for c = 1:5
%     removeC = [];
%     for i = m:-1:1
%         newRow = img(i,:,:);
%         if i == m
%             candidates = energyMap(i,:);
%             [minValue, minIndex] = min(candidates);
%             newRow(minIndex) = [];
%         else
%             if minIndex == 1
%                 candidates = [energyMap(i,minIndex),energyMap(i,minIndex+1)];
%                 [minValue, minIndex] = min(candidates);
%                 newRow(minIndex) = [];
%             elseif minIndex == n;
%                 candidates = [energyMap(i,minIndex-1),energyMap(i,minIndex)];
%                 [minValue, minIndex] = min(candidates);
%                 newRow(minIndex) = [];
%             else
%                 candidates = [energyMap(i,minIndex-1),energyMap(i,minIndex),energyMap(i,minIndex+1)];
%                 [minValue, minIndex] = min(candidates);
%                 newRow(minIndex) = [];
%             end
%             newImg = vertcat(newRow, newImg);
%         end
%     end
% end
% 
% figure
% imshow(img);
% figure
% imshow(newImg);

%% 

%% apply bilaterial filter to the padded image
% % conform the gaussian filter first
% % sigma_d = 3;
% % sigma_r = 30;
% 
% [x,y] = meshgrid(-w:w,-w:w);
% wd = exp(-(x.^2 + y.^2)/(2 * sigma_d^2)); % gaussian filter based on distance
% % x^2 + y^2 is the distance to center
% 
% %% now calculate the range difference
% 
% outImage = zeros(size(An));
% 
% for i = w+1 : m+w
%     for j = w+1 : n+w
%         wr = exp(-((An(i-w:i+w,j-w:j+w) - An(i,j)).^2) / (2 * sigma_r^2));
%         % gaussian filter based on range of sorrunding pixels
%         wb = wd .* wr;
%         s = An(i-w:i+w, j-w:j+w) .* wb;
%         outImage(i,j) = sum(s(:)) / sum(wb(:));
%     end
% end
% 
% outImage=uint8(outImage(w+1:w+m,w+1:w+n));



%end