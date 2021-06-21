clc;
close all;
clear all;
load('outm8.mat', 'dataout');
[row,column] = size(dataout);
a = [];
M=3;
cl = column*M;
st = rem(cl,24);
if st > 0
    for m = 1:1:column
        d = dataout(1,m);
        if m == column
            a = [a,de2bi(d,M-st,'left-msb')];
        else
            a = [a,de2bi(d,M,'left-msb')];
        end
    end
else    
    for m = 1:1:column
        d = dataout(1,m);
        a = [a,de2bi(d,M,'left-msb')];
    end
end
[row,column] = size(a);
img = [];
R = [];
G = [];
B = [];
for m = 1:24:column
    %temp = 'R';
    d1 = bi2de(a(1,m:m+7),'left-msb');
    d2 = bi2de(a(1,m+8:m+15),'left-msb');
    d3 = bi2de(a(1,m+16:m+23),'left-msb');
    R = [R;d1];
    G = [G;d2];
    B = [B;d3];
end
R1 = uint8([]);
G1 = uint8([]);
B1 = uint8([]);
j = 1;
for m = 1:1:135
    for n = 1:1:198
        R1(m,n) = R(j,1);
        G1(m,n) = G(j,1);
        B1(m,n) = B(j,1);
        j = j+1;
    end
end
img = cat(3,R1,G1,B1);
imwrite(img,'fskm8.png')