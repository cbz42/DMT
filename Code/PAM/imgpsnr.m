clc;
close all;
refimg = imread('onion.png');
nimg = imread('pamM8.png');
x = psnr(refimg,nimg);