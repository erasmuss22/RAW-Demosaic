%Erin Rasmussen
%rasmusse
%Fall 2011
clc; 
clear;
img = imread('P2-crayons-raw.bmp');
J = demosaic(img);
figure;
imshow(J);
imwrite(J, 'crayons_demo.jpg', 'jpg');
img = imread('P2-union-south-raw.bmp');
J = demosaic(img);
figure;
imshow(J);
imwrite(J, 'union_demo.jpg', 'jpg')