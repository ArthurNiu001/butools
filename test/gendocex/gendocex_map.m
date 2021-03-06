clear all
run('/home/gabor/github/butools/Matlab/BuToolsInit.m')

disp('---BuTools: MAP package test file---');
disp('Enable the verbose messages with the BuToolsVerbose flag');
global BuToolsVerbose;
BuToolsVerbose = true;
disp('Enable input parameter checking with the BuToolsCheckInput flag');
global BuToolsCheckInput;
BuToolsCheckInput = true;
global BuToolsCheckPrecision;
format short g;
format compact
delete('/home/gabor/github/butools/test/docex/MAP_matlab.docex');
diary('/home/gabor/github/butools/test/docex/MAP_matlab.docex');
disp('=== MarginalDistributionFromMAP ===')
disp('>>> D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];');
D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];
disp('>>> D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];');
D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];
disp('>>> [a, A] = MarginalDistributionFromMAP(D0, D1);');
[a, A] = MarginalDistributionFromMAP(D0, D1);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('=== MarginalMomentsFromMAP ===')
disp('>>> D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];');
D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];
disp('>>> D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];');
D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];
disp('>>> moms = MarginalMomentsFromMAP(D0, D1);');
moms = MarginalMomentsFromMAP(D0, D1);
disp('>>> disp(moms);');
disp(moms);
disp('=== MarginalDistributionFromRAP ===')
disp('>>> H0 = [-2, 0, 0; 0, -3, 1; 0, -1, -2];');
H0 = [-2, 0, 0; 0, -3, 1; 0, -1, -2];
disp('>>> H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1];');
H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1];
disp('>>> [a, A] = MarginalDistributionFromRAP(H0, H1);');
[a, A] = MarginalDistributionFromRAP(H0, H1);
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('=== MarginalMomentsFromRAP ===')
disp('>>> H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];');
H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];
disp('>>> H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];');
H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];
disp('>>> moms = MarginalMomentsFromRAP(H0, H1);');
moms = MarginalMomentsFromRAP(H0, H1);
disp('>>> disp(moms);');
disp(moms);
disp('=== MarginalDistributionFromMMAP ===')
disp('>>> D0 = [-1.78, 0.29; 0.07, -0.92];');
D0 = [-1.78, 0.29; 0.07, -0.92];
disp('>>> D1 = [0.15, 0.49; 0.23, 0.36];');
D1 = [0.15, 0.49; 0.23, 0.36];
disp('>>> D2 = [0.11, 0.2; 0.01, 0];');
D2 = [0.11, 0.2; 0.01, 0];
disp('>>> D3 = [0.14, 0.4; 0.11, 0.14];');
D3 = [0.14, 0.4; 0.11, 0.14];
disp('>>> [a, A] = MarginalDistributionFromMMAP({D0, D1, D2, D3});');
[a, A] = MarginalDistributionFromMMAP({D0, D1, D2, D3});
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('=== MarginalMomentsFromMMAP ===')
disp('>>> D0 = [-1.78, 0.29; 0.07, -0.92];');
D0 = [-1.78, 0.29; 0.07, -0.92];
disp('>>> D1 = [0.15, 0.49; 0.23, 0.36];');
D1 = [0.15, 0.49; 0.23, 0.36];
disp('>>> D2 = [0.11, 0.2; 0.01, 0];');
D2 = [0.11, 0.2; 0.01, 0];
disp('>>> D3 = [0.14, 0.4; 0.11, 0.14];');
D3 = [0.14, 0.4; 0.11, 0.14];
disp('>>> moms = MarginalMomentsFromMMAP({D0, D1, D2, D3});');
moms = MarginalMomentsFromMMAP({D0, D1, D2, D3});
disp('>>> disp(moms);');
disp(moms);
disp('=== MarginalDistributionFromMRAP ===')
disp('>>> x = 0.18;');
x = 0.18;
disp('>>> H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];');
H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];
disp('>>> H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];');
H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];
disp('>>> H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];');
H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];
disp('>>> [a, A] = MarginalDistributionFromMRAP({H0, H1, H2});');
[a, A] = MarginalDistributionFromMRAP({H0, H1, H2});
disp('>>> disp(a);');
disp(a);
disp('>>> disp(A);');
disp(A);
disp('=== MarginalMomentsFromMRAP ===')
disp('>>> x = 0.18;');
x = 0.18;
disp('>>> H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];');
H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];
disp('>>> H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];');
H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];
disp('>>> H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];');
H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];
disp('>>> moms = MarginalMomentsFromMRAP({H0, H1, H2});');
moms = MarginalMomentsFromMRAP({H0, H1, H2});
disp('>>> disp(moms);');
disp(moms);
disp('=== LagCorrelationsFromMAP ===')
disp('>>> D0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];');
D0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];
disp('>>> D1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];');
D1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];
disp('>>> corr = LagCorrelationsFromMAP(D0, D1, 3);');
corr = LagCorrelationsFromMAP(D0, D1, 3);
disp('>>> disp(corr);');
disp(corr);
disp('=== LagCorrelationsFromRAP ===')
disp('>>> H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];');
H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];
disp('>>> H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];');
H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];
disp('>>> corr = LagCorrelationsFromRAP(H0, H1, 3);');
corr = LagCorrelationsFromRAP(H0, H1, 3);
disp('>>> disp(corr);');
disp(corr);
disp('=== LagkJointMomentsFromMAP ===')
disp('>>> D0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];');
D0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];
disp('>>> D1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];');
D1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];
disp('>>> Nm = LagkJointMomentsFromMAP(D0, D1, 4, 1);');
Nm = LagkJointMomentsFromMAP(D0, D1, 4, 1);
disp('>>> disp(Nm);');
disp(Nm);
disp('>>> moms = MarginalMomentsFromMAP(D0, D1, 4);');
moms = MarginalMomentsFromMAP(D0, D1, 4);
disp('>>> disp(moms);');
disp(moms);
disp('>>> cjm = zeros(1,3);');
cjm = zeros(1,3);
disp('>>> for i=1:1:3');
disp('>>>     Nx = LagkJointMomentsFromMAP(D0, D1, 1, i);');
disp('>>>     cjm(i) = (Nx(2, 2)-moms(1)^2)/(moms(2)-moms(1)^2);');
disp('>>> end');
for i=1:1:3
    Nx = LagkJointMomentsFromMAP(D0, D1, 1, i);
    cjm(i) = (Nx(2, 2)-moms(1)^2)/(moms(2)-moms(1)^2);
end
disp('>>> disp(cjm);');
disp(cjm);
disp('>>> corr = LagCorrelationsFromMAP(D0, D1, 3);');
corr = LagCorrelationsFromMAP(D0, D1, 3);
disp('>>> disp(corr);');
disp(corr);
mNm1 = reshape(Nm(1, 2:end),1,numel(Nm(1, 2:end)));
mNm2 = reshape(Nm(2:end, 1),1,numel(Nm(2:end, 1)));
disp('=== LagkJointMomentsFromRAP ===')
disp('>>> H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];');
H0 = [-2., 0, 0; 0, -3., 1.; 0, -1., -2.];
disp('>>> H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];');
H1 = [1.8, 0.2, 0; 0.2, 1.8, 0; 0.2, 1.8, 1.];
disp('>>> Nm = LagkJointMomentsFromRAP(H0, H1, 4, 1);');
Nm = LagkJointMomentsFromRAP(H0, H1, 4, 1);
disp('>>> disp(length(Nm));');
disp(length(Nm));
disp('>>> moms = MarginalMomentsFromRAP(H0, H1, 4);');
moms = MarginalMomentsFromRAP(H0, H1, 4);
disp('>>> disp(moms);');
disp(moms);
disp('>>> cjm = zeros(1,3);');
cjm = zeros(1,3);
disp('>>> for i=1:1:3');
disp('>>>     Nx = LagkJointMomentsFromRAP(H0, H1, 1, i);');
disp('>>>     cjm(i) = (Nx(2, 2)-moms(1)^2)/(moms(2)-moms(1)^2);');
disp('>>> end');
for i=1:1:3
    Nx = LagkJointMomentsFromRAP(H0, H1, 1, i);
    cjm(i) = (Nx(2, 2)-moms(1)^2)/(moms(2)-moms(1)^2);
end
disp('>>> disp(cjm);');
disp(cjm);
disp('>>> corr = LagCorrelationsFromRAP(H0, H1, 3);');
corr = LagCorrelationsFromRAP(H0, H1, 3);
disp('>>> disp(corr);');
disp(corr);
mNm1 = reshape(Nm(1, 2:end),1,numel(Nm(1, 2:end)));
mNm2 = reshape(Nm(2:end, 1),1,numel(Nm(2:end, 1)));
disp('=== LagkJointMomentsFromMMAP ===')
disp('>>> D0 = [-1.78, 0.29; 0.07, -0.92];');
D0 = [-1.78, 0.29; 0.07, -0.92];
disp('>>> D1 = [0.15, 0.49; 0.23, 0.36];');
D1 = [0.15, 0.49; 0.23, 0.36];
disp('>>> D2 = [0.11, 0.2; 0.01, 0];');
D2 = [0.11, 0.2; 0.01, 0];
disp('>>> D3 = [0.14, 0.4; 0.11, 0.14];');
D3 = [0.14, 0.4; 0.11, 0.14];
disp('>>> Nm = LagkJointMomentsFromMMAP({D0, D1, D2, D3}, 3, 1);');
Nm = LagkJointMomentsFromMMAP({D0, D1, D2, D3}, 3, 1);
disp('>>> disp(Nm{1});');
disp(Nm{1});
disp('>>> disp(Nm{2});');
disp(Nm{2});
disp('>>> disp(Nm{3});');
disp(Nm{3});
disp('=== LagkJointMomentsFromMRAP ===')
disp('>>> x = 0.18;');
x = 0.18;
disp('>>> H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];');
H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];
disp('>>> H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];');
H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];
disp('>>> H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];');
H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];
disp('>>> Nm = LagkJointMomentsFromMRAP({H0, H1, H2}, 3, 2);');
Nm = LagkJointMomentsFromMRAP({H0, H1, H2}, 3, 2);
disp('>>> disp(Nm{1});');
disp(Nm{1});
disp('>>> disp(Nm{2});');
disp(Nm{2});
disp('=== RandomMAP ===')
disp('>>> [D0, D1] = RandomMAP(4, 1.62, 10);');
[D0, D1] = RandomMAP(4, 1.62, 10);
disp('>>> disp(D0);');
disp(D0);
disp('>>> disp(D1);');
disp(D1);
disp('>>> m = MarginalMomentsFromMAP(D0, D1, 1);');
m = MarginalMomentsFromMAP(D0, D1, 1);
disp('>>> disp(m);');
disp(m);
disp('=== RandomMMAP ===')
disp('>>> Dm = RandomMMAP(4, 3, 1.62, 10);');
Dm = RandomMMAP(4, 3, 1.62, 10);
disp('>>> disp(Dm{1});');
disp(Dm{1});
disp('>>> disp(Dm{2});');
disp(Dm{2});
disp('>>> disp(Dm{3});');
disp(Dm{3});
disp('>>> disp(Dm{4});');
disp(Dm{4});
disp('>>> m = MarginalMomentsFromMMAP(Dm, 1);');
m = MarginalMomentsFromMMAP(Dm, 1);
disp('>>> disp(m);');
disp(m);
disp('=== CheckMAPRepresentation ===')
disp('>>> D0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];');
D0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];
disp('>>> D1 = [-1., 0, 1., 0; 0, -2., 0, 1.; 1., 0, -3., 0; 1., 2., 2., 1.];');
D1 = [-1., 0, 1., 0; 0, -2., 0, 1.; 1., 0, -3., 0; 1., 2., 2., 1.];
disp('>>> flag = CheckMAPRepresentation(D0, D1);');
flag = CheckMAPRepresentation(D0, D1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> D0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];');
D0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];
disp('>>> D1 = [1., 0, 1.; 0, 2., 0; 1., 0, 3.];');
D1 = [1., 0, 1.; 0, 2., 0; 1., 0, 3.];
disp('>>> flag = CheckMAPRepresentation(D0, D1);');
flag = CheckMAPRepresentation(D0, D1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> D0 = [-3., 0, 1.; 0, -2., 0; 1., 0, -5.];');
D0 = [-3., 0, 1.; 0, -2., 0; 1., 0, -5.];
disp('>>> D1 = [1., 0, 1.; 0, 2., 0; 1., 0, 3.];');
D1 = [1., 0, 1.; 0, 2., 0; 1., 0, 3.];
disp('>>> flag = CheckMAPRepresentation(D0, D1);');
flag = CheckMAPRepresentation(D0, D1);
disp('>>> disp(flag);');
disp(flag);
disp('=== CheckRAPRepresentation ===')
disp('>>> H0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.; 1., 2., 2.];');
H0 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.; 1., 2., 2.];
disp('>>> H1 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.; 1., 2., 2.];');
H1 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.; 1., 2., 2.];
disp('>>> flag = CheckRAPRepresentation(H0, H1);');
flag = CheckRAPRepresentation(H0, H1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> H0 = [-1., 0, 2.; 0, 2., 0; 1., 0, -3.];');
H0 = [-1., 0, 2.; 0, 2., 0; 1., 0, -3.];
disp('>>> H1 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];');
H1 = [-1., 0, 1.; 0, -2., 0; 1., 0, -3.];
disp('>>> flag = CheckRAPRepresentation(H0, H1);');
flag = CheckRAPRepresentation(H0, H1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> H0 = [-1., 0, 0; 0, -2., 2.; 0, 3., -3.];');
H0 = [-1., 0, 0; 0, -2., 2.; 0, 3., -3.];
disp('>>> H1 = [0, 0, 1.; 0, -1., 1.; 1., 0, -1.];');
H1 = [0, 0, 1.; 0, -1., 1.; 1., 0, -1.];
disp('>>> flag = CheckRAPRepresentation(H0, H1);');
flag = CheckRAPRepresentation(H0, H1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> H0 = [-2., 0, 0; 0, -1., 1.; 0, -1., -1.];');
H0 = [-2., 0, 0; 0, -1., 1.; 0, -1., -1.];
disp('>>> H1 = [1., 0, 1.; 0, 1., -1.; 1., 0, 1.];');
H1 = [1., 0, 1.; 0, 1., -1.; 1., 0, 1.];
disp('>>> flag = CheckRAPRepresentation(H0, H1);');
flag = CheckRAPRepresentation(H0, H1);
disp('>>> disp(flag);');
disp(flag);
disp('>>> H0 = [-1., 0, 0; 0, -2., 1.; 0, -1., -2.];');
H0 = [-1., 0, 0; 0, -2., 1.; 0, -1., -2.];
disp('>>> H1 = [1., 0, 0; 0, 1., 0; 1., 1., 1.];');
H1 = [1., 0, 0; 0, 1., 0; 1., 1., 1.];
disp('>>> flag = CheckRAPRepresentation(H0, H1);');
flag = CheckRAPRepresentation(H0, H1);
disp('>>> disp(flag);');
disp(flag);
disp('=== CheckMMAPRepresentation ===')
disp('>>> D0 = [-1.05, 0.03, 0.07; 0.19, -1.63, 0.06; 0, 0.2, -1.03];');
D0 = [-1.05, 0.03, 0.07; 0.19, -1.63, 0.06; 0, 0.2, -1.03];
disp('>>> D1 = [0.16, 0.11, 0; 0.1, 0.16, 0; 0.27, 0, 0.19];');
D1 = [0.16, 0.11, 0; 0.1, 0.16, 0; 0.27, 0, 0.19];
disp('>>> D2 = [0.01, 0.09, 0.13; 0.26, 0.21, 0.05; 0, 0.16, 0.07];');
D2 = [0.01, 0.09, 0.13; 0.26, 0.21, 0.05; 0, 0.16, 0.07];
disp('>>> D3 = [0.19, 0.06, 0.2; 0.17, 0.16, 0.27; 0, 0, 0.14];');
D3 = [0.19, 0.06, 0.2; 0.17, 0.16, 0.27; 0, 0, 0.14];
disp('>>> flag = CheckMMAPRepresentation({D0, D1, D2, D3});');
flag = CheckMMAPRepresentation({D0, D1, D2, D3});
disp('>>> disp(flag);');
disp(flag);
disp('=== CheckMRAPRepresentation ===')
disp('>>> x = 0.18;');
x = 0.18;
disp('>>> H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];');
H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];
disp('>>> H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];');
H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];
disp('>>> H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];');
H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];
disp('>>> flag = CheckMRAPRepresentation({H0, H1, H2});');
flag = CheckMRAPRepresentation({H0, H1, H2});
disp('>>> disp(flag);');
disp(flag);
disp('=== RAPFromMoments ===')
disp('>>> G0 = [-6.2, 2., 0.; 2., -9., 1.; 1., 0, -3.];');
G0 = [-6.2, 2., 0.; 2., -9., 1.; 1., 0, -3.];
disp('>>> G1 = [2.2, -2., 4.; 2., 2., 2.; 1., 0, 1.];');
G1 = [2.2, -2., 4.; 2., 2., 2.; 1., 0, 1.];
disp('>>> moms = MarginalMomentsFromRAP(G0, G1, 5);');
moms = MarginalMomentsFromRAP(G0, G1, 5);
disp('>>> disp(moms);');
disp(moms);
disp('>>> Nm = LagkJointMomentsFromRAP(G0, G1, 2, 1);');
Nm = LagkJointMomentsFromRAP(G0, G1, 2, 1);
disp('>>> disp(Nm);');
disp(Nm);
disp('>>> [H0, H1] = RAPFromMoments(moms, Nm);');
[H0, H1] = RAPFromMoments(moms, Nm);
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> rmoms = MarginalMomentsFromRAP(H0, H1, 5);');
rmoms = MarginalMomentsFromRAP(H0, H1, 5);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rNm = LagkJointMomentsFromRAP(H0, H1, 2, 1);');
rNm = LagkJointMomentsFromRAP(H0, H1, 2, 1);
disp('>>> disp(rNm);');
disp(rNm);
disp('>>> G0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];');
G0 = [-5., 0, 1., 1.; 1., -8., 1., 0; 1., 0, -4., 1.; 1., 2., 3., -9.];
disp('>>> G1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];');
G1 = [0, 1., 0, 2.; 2., 1., 3., 0; 0, 0, 1., 1.; 1., 1., 0, 1.];
disp('>>> moms = MarginalMomentsFromRAP(G0, G1, 7);');
moms = MarginalMomentsFromRAP(G0, G1, 7);
disp('>>> disp(moms);');
disp(moms);
disp('>>> Nm = LagkJointMomentsFromRAP(G0, G1, 3, 1);');
Nm = LagkJointMomentsFromRAP(G0, G1, 3, 1);
disp('>>> disp(Nm);');
disp(Nm);
disp('>>> [H0, H1] = RAPFromMoments(moms, Nm);');
[H0, H1] = RAPFromMoments(moms, Nm);
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> BuToolsCheckPrecision = 10.^-8;');
BuToolsCheckPrecision = 10.^-8;
disp('>>> rmoms = MarginalMomentsFromRAP(H0, H1, 7);');
rmoms = MarginalMomentsFromRAP(H0, H1, 7);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rNm = LagkJointMomentsFromRAP(H0, H1, 3, 1);');
rNm = LagkJointMomentsFromRAP(H0, H1, 3, 1);
disp('>>> disp(rNm);');
disp(rNm);
disp('=== MRAPFromMoments ===')
disp('>>> G0 = [-1.05, 0.03, 0.07; 0.19, -1.63, 0.06; 0, 0.2, -1.03];');
G0 = [-1.05, 0.03, 0.07; 0.19, -1.63, 0.06; 0, 0.2, -1.03];
disp('>>> G1 = [0.16, 0.11, 0; 0.1, 0.16, 0; 0.27, 0, 0.19];');
G1 = [0.16, 0.11, 0; 0.1, 0.16, 0; 0.27, 0, 0.19];
disp('>>> G2 = [0.01, 0.09, 0.13; 0.26, 0.21, 0.05; 0, 0.16, 0.07];');
G2 = [0.01, 0.09, 0.13; 0.26, 0.21, 0.05; 0, 0.16, 0.07];
disp('>>> G3 = [0.19, 0.06, 0.2; 0.17, 0.16, 0.27; 0, 0, 0.14];');
G3 = [0.19, 0.06, 0.2; 0.17, 0.16, 0.27; 0, 0, 0.14];
disp('>>> G = {G0, G1, G2, G3};');
G = {G0, G1, G2, G3};
disp('>>> moms = MarginalMomentsFromMRAP(G, 5);');
moms = MarginalMomentsFromMRAP(G, 5);
disp('>>> disp(moms);');
disp(moms);
disp('>>> Nm = LagkJointMomentsFromMRAP(G, 2, 1);');
Nm = LagkJointMomentsFromMRAP(G, 2, 1);
disp('>>> [Nm1, Nm2, Nm3] = Nm{:};');
[Nm1, Nm2, Nm3] = Nm{:};
disp('>>> disp(Nm1);');
disp(Nm1);
disp('>>> disp(Nm2);');
disp(Nm2);
disp('>>> disp(Nm3);');
disp(Nm3);
disp('>>> H = MRAPFromMoments(moms, Nm);');
H = MRAPFromMoments(moms, Nm);
disp('>>> disp(H{1});');
disp(H{1});
disp('>>> disp(H{2});');
disp(H{2});
disp('>>> disp(H{3});');
disp(H{3});
disp('>>> disp(H{4});');
disp(H{4});
disp('>>> BuToolsCheckPrecision = 10.^-10;');
BuToolsCheckPrecision = 10.^-10;
disp('>>> rmoms = MarginalMomentsFromMRAP(H, 5);');
rmoms = MarginalMomentsFromMRAP(H, 5);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rNm = LagkJointMomentsFromMRAP(H, 2, 1);');
rNm = LagkJointMomentsFromMRAP(H, 2, 1);
disp('>>> [rNm1, rNm2, rNm3] = rNm{:};');
[rNm1, rNm2, rNm3] = rNm{:};
disp('>>> disp(rNm1);');
disp(rNm1);
disp('>>> disp(rNm2);');
disp(rNm2);
disp('>>> disp(rNm3);');
disp(rNm3);
disp('=== RAPFromMomentsAndCorrelations ===')
disp('>>> H0 = [-6.2, 2., 0; 2., -9., 1.; 1., 0, -3.];');
H0 = [-6.2, 2., 0; 2., -9., 1.; 1., 0, -3.];
disp('>>> H1 = [2.2, 0, 2.; 0, 4., 2.; 0, 1., 1.];');
H1 = [2.2, 0, 2.; 0, 4., 2.; 0, 1., 1.];
disp('>>> mom = MarginalMomentsFromRAP(H0, H1);');
mom = MarginalMomentsFromRAP(H0, H1);
disp('>>> disp(mom);');
disp(mom);
disp('>>> corr = LagCorrelationsFromRAP(H0, H1, 3);');
corr = LagCorrelationsFromRAP(H0, H1, 3);
disp('>>> disp(corr);');
disp(corr);
disp('>>> [G0, G1] = RAPFromMomentsAndCorrelations(mom, corr);');
[G0, G1] = RAPFromMomentsAndCorrelations(mom, corr);
disp('>>> disp(G0);');
disp(G0);
disp('>>> disp(G1);');
disp(G1);
disp('>>> rmom = MarginalMomentsFromRAP(G0, G1);');
rmom = MarginalMomentsFromRAP(G0, G1);
disp('>>> disp(rmom);');
disp(rmom);
disp('>>> rcorr = LagCorrelationsFromRAP(G0, G1, 3);');
rcorr = LagCorrelationsFromRAP(G0, G1, 3);
disp('>>> disp(rcorr);');
disp(rcorr);
disp('=== MAP2FromMoments ===')
disp('>>> D0 = [-14., 1.; 1, -25.];');
D0 = [-14., 1.; 1, -25.];
disp('>>> D1 = [6., 7.; 3., 21.];');
D1 = [6., 7.; 3., 21.];
disp('>>> moms = MarginalMomentsFromMAP(D0, D1, 3);');
moms = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(moms);');
disp(moms);
disp('>>> corr = LagCorrelationsFromMAP(D0, D1, 1);');
corr = LagCorrelationsFromMAP(D0, D1, 1);
disp('>>> disp(corr);');
disp(corr);
disp('>>> [D0, D1] = MAP2FromMoments(moms, corr);');
[D0, D1] = MAP2FromMoments(moms, corr);
disp('>>> disp(D0);');
disp(D0);
disp('>>> disp(D1);');
disp(D1);
disp('>>> rmoms = MarginalMomentsFromMAP(D0, D1, 3);');
rmoms = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rcorr = LagCorrelationsFromMAP(D0, D1, 1);');
rcorr = LagCorrelationsFromMAP(D0, D1, 1);
disp('>>> disp(rcorr);');
disp(rcorr);
disp('=== MAP2CorrelationBounds ===')
disp('>>> D0 = [-14., 1.; 1., -25.];');
D0 = [-14., 1.; 1., -25.];
disp('>>> D1 = [6., 7.; 3., 21.];');
D1 = [6., 7.; 3., 21.];
disp('>>> moms = MarginalMomentsFromMAP(D0, D1, 3);');
moms = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(moms);');
disp(moms);
disp('>>> [lb, ub] = MAP2CorrelationBounds(moms);');
[lb, ub] = MAP2CorrelationBounds(moms);
disp('>>> disp(lb);');
disp(lb);
disp('>>> disp(ub);');
disp(ub);
disp('=== MAPFromFewMomentsAndCorrelations ===')
disp('>>> moms = [1.1, 6.05];');
moms = [1.1, 6.05];
disp('>>> corr1 = -0.17;');
corr1 = -0.17;
disp('>>> [D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);');
[D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);
disp('>>> disp(D0);');
disp(D0);
disp('>>> disp(D1);');
disp(D1);
disp('>>> rmoms = MarginalMomentsFromMAP(D0, D1, 2);');
rmoms = MarginalMomentsFromMAP(D0, D1, 2);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);');
rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);
disp('>>> disp(rcorr1);');
disp(rcorr1);
disp('>>> moms = [1.2, 4.32, 20.];');
moms = [1.2, 4.32, 20.];
disp('>>> corr1 = -0.4;');
corr1 = -0.4;
disp('>>> [D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);');
[D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);
disp('>>> disp(D0);');
disp(D0);
disp('>>> disp(D1);');
disp(D1);
disp('>>> BuToolsCheckPrecision = 10.^-12;');
BuToolsCheckPrecision = 10.^-12;
disp('>>> rmoms = MarginalMomentsFromMAP(D0, D1, 3);');
rmoms = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);');
rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);
disp('>>> disp(rcorr1);');
disp(rcorr1);
disp('>>> moms = [1.2, 4.32, 20.];');
moms = [1.2, 4.32, 20.];
disp('>>> corr1 = 0.4;');
corr1 = 0.4;
disp('>>> [D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);');
[D0, D1] = MAPFromFewMomentsAndCorrelations(moms, corr1);
disp('>>> disp(D0);');
disp(D0);
disp('>>> disp(D1);');
disp(D1);
disp('>>> rmoms = MarginalMomentsFromMAP(D0, D1, 3);');
rmoms = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);');
rcorr1 = LagCorrelationsFromMAP(D0, D1, 1);
disp('>>> disp(rcorr1);');
disp(rcorr1);
disp('=== CanonicalFromMAP2 ===')
disp('>>> D0 = [-14., 1.; 1., -25.];');
D0 = [-14., 1.; 1., -25.];
disp('>>> D1 = [6., 7.; 3., 21.];');
D1 = [6., 7.; 3., 21.];
disp('>>> [H0, H1] = CanonicalFromMAP2(D0, D1);');
[H0, H1] = CanonicalFromMAP2(D0, D1);
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> Cm = SimilarityMatrix(H0, D0);');
Cm = SimilarityMatrix(H0, D0);
disp('>>> err1 = norm(H0*Cm-Cm*D0);');
err1 = norm(H0*Cm-Cm*D0);
disp('>>> err2 = norm(H1*Cm-Cm*D1);');
err2 = norm(H1*Cm-Cm*D1);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== MAPFromRAP ===')
disp('>>> D0 = [-2., 2.; 2., -9.];');
D0 = [-2., 2.; 2., -9.];
disp('>>> D1 = [-2., 2.; 3., 4.];');
D1 = [-2., 2.; 3., 4.];
disp('>>> [H0, H1] = MAPFromRAP(D0, D1);');
[H0, H1] = MAPFromRAP(D0, D1);
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> err = norm(LagkJointMomentsFromRAP(D0, D1, 3, 1)-LagkJointMomentsFromRAP(H0, H1, 3, 1));');
err = norm(LagkJointMomentsFromRAP(D0, D1, 3, 1)-LagkJointMomentsFromRAP(H0, H1, 3, 1));
disp('>>> disp(err);');
disp(err);
disp('>>> D0 = [-2.4, 2.; 2., -9.];');
D0 = [-2.4, 2.; 2., -9.];
disp('>>> D1 = [-1.6, 2.; 3., 4.];');
D1 = [-1.6, 2.; 3., 4.];
disp('>>> [H0, H1] = MAPFromRAP(D0, D1);');
[H0, H1] = MAPFromRAP(D0, D1);
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> err = norm(LagkJointMomentsFromRAP(D0, D1, 3, 1)-LagkJointMomentsFromRAP(H0, H1, 3, 1));');
err = norm(LagkJointMomentsFromRAP(D0, D1, 3, 1)-LagkJointMomentsFromRAP(H0, H1, 3, 1));
disp('>>> disp(err);');
disp(err);
disp('=== MMAPFromMRAP ===')
disp('>>> x = 0.18;');
x = 0.18;
disp('>>> H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];');
H0 = [-5., 0.1+x, 0.9, 1.; 1., -8., 0.9, 0.1; 0.9, 0.1, -4., 1.; 1., 2., 3., -9.];
disp('>>> H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];');
H1 = [0.1-x, 0.7, 0.1, 0.1; 0.1, 1., 1.8, 0.1; 0.1, 0.1, 0.1, 0.7; 0.7, 0.1, 0.1, 0.1];
disp('>>> H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];');
H2 = [0.1, 0.1, 0.1, 1.7; 1.8, 0.1, 1., 0.1; 0.1, 0.1, 0.7, 0.1; 0.1, 1., 0.1, 0.8];
disp('>>> H = {H0, H1, H2};');
H = {H0, H1, H2};
disp('>>> moms = MarginalMomentsFromMRAP(H);');
moms = MarginalMomentsFromMRAP(H);
disp('>>> disp(moms);');
disp(moms);
disp('>>> jmom = LagkJointMomentsFromMRAP(H, 3, 1);');
jmom = LagkJointMomentsFromMRAP(H, 3, 1);
disp('>>> G = MMAPFromMRAP(H);');
G = MMAPFromMRAP(H);
disp('>>> disp(G{1});');
disp(G{1});
disp('>>> disp(G{2});');
disp(G{2});
disp('>>> disp(G{3});');
disp(G{3});
disp('>>> rmoms = MarginalMomentsFromMMAP(G);');
rmoms = MarginalMomentsFromMMAP(G);
disp('>>> disp(rmoms);');
disp(rmoms);
disp('>>> rjmom = LagkJointMomentsFromMMAP(G, 3, 1);');
rjmom = LagkJointMomentsFromMMAP(G, 3, 1);
disp('>>> err = norm(rjmom{1}-jmom{1})+norm(rjmom{2}-jmom{2});');
err = norm(rjmom{1}-jmom{1})+norm(rjmom{2}-jmom{2});
disp('>>> disp(err);');
disp(err);
disp('=== MinimalRepFromRAP ===')
disp('>>> D0 = [-5., 1., 0; 3., -3., 0; 1., 1., -5.];');
D0 = [-5., 1., 0; 3., -3., 0; 1., 1., -5.];
disp('>>> D1 = [0, 0, 4.; 0, 0, 0; 1., 1., 1.];');
D1 = [0, 0, 4.; 0, 0, 0; 1., 1., 1.];
disp('>>> [H0, H1] = MinimalRepFromRAP(D0, D1, ''cont'');');
[H0, H1] = MinimalRepFromRAP(D0, D1, 'cont');
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> Cm = SimilarityMatrix(H0, D0);');
Cm = SimilarityMatrix(H0, D0);
disp('>>> err1 = norm(H0*Cm-Cm*D0);');
err1 = norm(H0*Cm-Cm*D0);
disp('>>> err2 = norm(H1*Cm-Cm*D1);');
err2 = norm(H1*Cm-Cm*D1);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('>>> [H0, H1] = MinimalRepFromRAP(D0, D1, ''obs'');');
[H0, H1] = MinimalRepFromRAP(D0, D1, 'obs');
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> Cm = SimilarityMatrix(H0, D0);');
Cm = SimilarityMatrix(H0, D0);
disp('>>> err1 = norm(H0*Cm-Cm*D0);');
err1 = norm(H0*Cm-Cm*D0);
disp('>>> err2 = norm(H1*Cm-Cm*D1);');
err2 = norm(H1*Cm-Cm*D1);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('>>> [H0, H1] = MinimalRepFromRAP(D0, D1, ''obscont'');');
[H0, H1] = MinimalRepFromRAP(D0, D1, 'obscont');
disp('>>> disp(H0);');
disp(H0);
disp('>>> disp(H1);');
disp(H1);
disp('>>> Cm = SimilarityMatrix(H0, D0);');
Cm = SimilarityMatrix(H0, D0);
disp('>>> err1 = norm(H0*Cm-Cm*D0);');
err1 = norm(H0*Cm-Cm*D0);
disp('>>> err2 = norm(H1*Cm-Cm*D1);');
err2 = norm(H1*Cm-Cm*D1);
disp('>>> disp(max(err1, err2));');
disp(max(err1, err2));
disp('=== MinimalRepFromMRAP ===')
disp('>>> D0 = [-5., 1., 0; 3., -3., 0; 1., 1., -5.];');
D0 = [-5., 1., 0; 3., -3., 0; 1., 1., -5.];
disp('>>> D1 = [0, 0, 0.8; 0, 0, 0; 0.2, 0.2, 0.2];');
D1 = [0, 0, 0.8; 0, 0, 0; 0.2, 0.2, 0.2];
disp('>>> D2 = [0, 0, 3.2; 0, 0, 0; 0.8, 0.8, 0.8];');
D2 = [0, 0, 3.2; 0, 0, 0; 0.8, 0.8, 0.8];
disp('>>> Dm = {D0, D1, D2};');
Dm = {D0, D1, D2};
disp('>>> H = MinimalRepFromMRAP(Dm, ''cont'');');
H = MinimalRepFromMRAP(Dm, 'cont');
disp('>>> disp(H{1});');
disp(H{1});
disp('>>> disp(H{2});');
disp(H{2});
disp('>>> disp(H{3});');
disp(H{3});
disp('>>> Cm = SimilarityMatrix(H{1}, Dm{1});');
Cm = SimilarityMatrix(H{1}, Dm{1});
disp('>>> err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});');
err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});
disp('>>> disp(err);');
disp(err);
disp('>>> H = MinimalRepFromMRAP(Dm, ''obs'');');
H = MinimalRepFromMRAP(Dm, 'obs');
disp('>>> disp(H{1});');
disp(H{1});
disp('>>> disp(H{2});');
disp(H{2});
disp('>>> disp(H{3});');
disp(H{3});
disp('>>> Cm = SimilarityMatrix(H{1}, Dm{1});');
Cm = SimilarityMatrix(H{1}, Dm{1});
disp('>>> err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});');
err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});
disp('>>> disp(err);');
disp(err);
disp('>>> H = MinimalRepFromMRAP(Dm, ''obscont'');');
H = MinimalRepFromMRAP(Dm, 'obscont');
disp('>>> disp(H{1});');
disp(H{1});
disp('>>> disp(H{2});');
disp(H{2});
disp('>>> disp(H{3});');
disp(H{3});
disp('>>> Cm = SimilarityMatrix(H{1}, Dm{1});');
Cm = SimilarityMatrix(H{1}, Dm{1});
disp('>>> err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});');
err = norm(H{1}*Cm-Cm*Dm{1})+norm(H{2}*Cm-Cm*Dm{2})+norm(H{3}*Cm-Cm*Dm{3});
disp('>>> disp(err);');
disp(err);
disp('=== SamplesFromMAP ===')
disp('>>> D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];');
D0 = [-0.17, 0, 0, 0.07; 0.01, -0.78, 0.03, 0.08; 0.22, 0.17, -1.1, 0.02; 0.04, 0.12, 0, -0.42];
disp('>>> D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];');
D1 = [0, 0.06, 0, 0.04; 0.04, 0.19, 0.21, 0.22; 0.22, 0.13, 0.15, 0.19; 0.05, 0, 0.17, 0.04];
disp('>>> x = SamplesFromMAP(D0, D1, 10000);');
x = SamplesFromMAP(D0, D1, 10000);
disp('>>> mt = MarginalMomentsFromTrace(x, 3);');
mt = MarginalMomentsFromTrace(x, 3);
disp('>>> disp(mt);');
disp(mt);
disp('>>> mm = MarginalMomentsFromMAP(D0, D1, 3);');
mm = MarginalMomentsFromMAP(D0, D1, 3);
disp('>>> disp(mm);');
disp(mm);
disp('=== SamplesFromMMAP ===')
disp('>>> D0 = [-1.78, 0.29; 0.07, -0.92];');
D0 = [-1.78, 0.29; 0.07, -0.92];
disp('>>> D1 = [0.15, 0.49; 0.23, 0.36];');
D1 = [0.15, 0.49; 0.23, 0.36];
disp('>>> D2 = [0.11, 0.2; 0.01, 0];');
D2 = [0.11, 0.2; 0.01, 0];
disp('>>> D3 = [0.14, 0.4; 0.11, 0.14];');
D3 = [0.14, 0.4; 0.11, 0.14];
disp('>>> Dm = {D0, D1, D2, D3};');
Dm = {D0, D1, D2, D3};
disp('>>> x = SamplesFromMMAP(Dm, 10000);');
x = SamplesFromMMAP(Dm, 10000);
disp('>>> mt = MarginalMomentsFromTrace(x(1:end, 1), 3);');
mt = MarginalMomentsFromTrace(x(1:end, 1), 3);
disp('>>> disp(mt);');
disp(mt);
disp('>>> mm = MarginalMomentsFromMMAP(Dm, 3);');
mm = MarginalMomentsFromMMAP(Dm, 3);
disp('>>> disp(mm);');
disp(mm);

