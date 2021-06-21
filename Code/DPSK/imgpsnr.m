clc;
close all;
refimg = imread('onion.png');
nimg = imread('dpskM8.png');
x = psnr(refimg,nimg);