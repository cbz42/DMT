clc;
close all;
refimg = imread('onion.png');
nimg = imread('');
x = psnr(refimg,nimg);