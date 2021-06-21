clc;
close all;
refimg = imread('onion.png');
nimg = imread('qamM8.png');
x = psnr(refimg,nimg);