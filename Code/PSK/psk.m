clc;
close all;
clear all;
load('M8.mat', 'mary');  % image data as m-ary formatted binary data
M = 8;         % Modulation order
mary = double(mary);
txsig = pskmod(mary,M);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = pskdemod(rxSig,M);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);
save('outM8.mat','dataout');