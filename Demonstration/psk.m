clc;
close all;
clear all;
load('inputdata.mat', 'mary');  % image data as m-ary formatted binary data
M = 2;         % Modulation order
mary = double(mary);
txsig = pskmod(mary,M,pi/4);
rxSig  = awgn(txsig,11,'measured',[],'dB');
dataOut = pskdemod(rxSig,M,pi/4);   
[num,BER] = biterr(mary,dataOut);
dataout = uint8(dataOut);
save('pskoutput.mat','dataout');