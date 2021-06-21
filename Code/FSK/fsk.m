clc;
close all;
clear all;
load('M4.mat', 'mary');
M = 4;         % Modulation order
Fs = 32;       % Sample rate (Hz)
nsamp = 2;     % Number of samples per symbol
freqsep = 10;  % Frequency separation (Hz)
txsig = fskmod(mary,M,freqsep,nsamp,Fs);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = fskdemod(rxSig,M,freqsep,nsamp,Fs);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);  %ber(%) = 0.000312
save('outM4.mat','dataout');