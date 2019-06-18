clear all
markers_cam = zeros(3,2);
centroids = zeros(3,2);

centroids2=[546 728;548 424; 966 729]

tmp1 = 0;
for i=1:3
    if (centroids2(i,1)>tmp1)
        tmp1 = centroids2(i,1);
        num1 = i;
    end
end
centroids(3,:) = centroids2(num1,:);

tmp2 = 10000;
for i=1:3
    if (centroids2(i,2)<tmp2)
        tmp2 = centroids2(i,2);
        num2 = i;
    end
end
centroids(1,:) = centroids2(num2,:);

for i=1:3
    if (num1 ~= i && num2 ~= i)
        num3 = i;
    end
end
centroids(2,:) = centroids2(num3,:);

