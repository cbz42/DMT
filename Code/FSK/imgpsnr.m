clc;
close all;
refimg = imread('onion.png');
nimg = imread('fskM4.png');
x = psnr(refimg,nimg);