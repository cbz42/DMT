clc;
close all;
clear all;
load('M2.mat', 'mary');
M = 2;         % Modulation order
txsig = pammod(mary,M);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = pamdemod(rxSig,M);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  
save('outM2.mat','dataout')