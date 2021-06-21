clc;
close all;
clear all;
load('inputdata2.mat', 'mary');
M = 4;         % Modulation order
txsig = pammod(mary,M);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = pamdemod(rxSig,M);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  % 0%  and 1.35%
save('pamoutput.mat','dataout')