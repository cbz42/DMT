clc;
close all;
clear all;
load('m8.mat', 'mary');
M = 8;         % Modulation order
Fs =32;       % Sample rate (Hz)
nsamp = 2;     % Number of samples per symbol
freqsep = 2;  % Frequency separation (Hz)
txsig = fskmod(mary,M,freqsep,nsamp,Fs);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = fskdemod(rxSig,M,freqsep,nsamp,Fs);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  %ber(%) = 0.000312
save('outm8.mat','dataout');