T = readtable('BER.xlsx');
method = table2array(T(1:15,1));
errper = table2array(T(1:15,5));
labels1 = string(errper);

bar(errper);
set(gca,'XtickLabel',method)
ylim([0 0.01])