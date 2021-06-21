clc;
close all;
refimg = imread('onion.png');
nimg = imread('pskM8.png');
x = psnr(refimg,nimg);