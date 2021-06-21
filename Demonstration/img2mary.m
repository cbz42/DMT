clc;
close all;
clear all;
a = imread('onion.png');
R = a(:,:,1);
G = a(:,:,2);
B = a(:,:,3);
a = [];
s = de2bi(R(1,1),8,'left-msb');
[row,column] = size(R);
%a = [a,s];
%a = [a,s];
%-- image to digital  ---
for m = 1:row
    for n = 1:column
        a = [a,de2bi(R(m,n),8,'left-msb')];
        a = [a,de2bi(G(m,n),8,'left-msb')];
        a = [a,de2bi(B(m,n),8,'left-msb')];
    end
end
% --- mary encoding --
mary = [];
M = 3;
[row,column] = size(a);
st = column-rem(column,M);

% --- mary encoding --
if st < column
    for m = 1:M:column
        if m == st+1
            s = a(1,m:column);
            mary = [mary,bi2de(s,'left-msb',2)];
        else
            s = a(1,m:m+(M-1));
            mary = [mary,bi2de(s,'left-msb',2)];
        end
    end
else
    for m = 1:M:column
        s = a(1,m:m+(M-1));
        mary = [mary,bi2de(s,'left-msb',2)];
    end
end
save('M8.mat','mary');
