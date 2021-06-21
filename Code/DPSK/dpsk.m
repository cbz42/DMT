clc;
close all;
clear all;
load('m4.mat', 'mary');   % image as the input data of m-ary format
M = 4;         % Modulation order
txsig = dpskmod(mary,M);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = dpskdemod(rxSig,M);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  
save('outM4.mat','dataout');