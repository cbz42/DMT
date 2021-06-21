clc;
close all;
clear all;
load('M8.mat', 'mary');
M = 8;         % Modulation order
txsig = qammod(mary,M);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = qamdemod(rxSig,M);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  %ber(%) = 0.000312
save('outM8.mat','dataout');