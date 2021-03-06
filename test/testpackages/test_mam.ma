ClearAll["Global`*"]
AppendTo[$Path,"/home/gabor/github/butools/Mathematica"];
<<BuTools`
Print["---BuTools: MAM package test file---"//OutputForm];
Print["Enable the verbose messages with the BuToolsVerbose flag"//OutputForm];
BuTools`Verbose = True;
Print["Enable input parameter checking with the BuToolsCheckInput flag"//OutputForm];
BuTools`CheckInput = true;
On[Assert];
Print["========================================"]
Print["Testing BuTools function QBDFundamentalMatrices"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
B = {{0., 0.},{3., 4.}};
Print["B = "//OutputForm];
Print[B];
L = {{-6., 5.},{3., -12.}};
Print["L = "//OutputForm];
Print[L];
F = {{1., 0.},{2., 0.}};
Print["F = "//OutputForm];
Print[F];
L0 = {{-6., 5.},{6., -8.}};
Print["L0 = "//OutputForm];
Print[L0];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{R, G, U} = QBDFundamentalMatrices[B, L, F, \"RGU\"];:"//OutputForm];
{R, G, U} = QBDFundamentalMatrices[B, L, F, "RGU"];
Print["R = "//OutputForm];
Print[R];
Print["G = "//OutputForm];
Print[G];
Print["U = "//OutputForm];
Print[U];
Assert[CheckGenerator[U, True], "QBDFundamentalMatrices: matrix U is not a transient generator!"];
Assert[AllTrue[Abs[Eigenvalues[R]],#<=1 &], "QBDFundamentalMatrices: the eigenvalues of matrix R are not inside the unit disc!"];
Assert[CheckProbMatrix[G], "QBDFundamentalMatrices: matrix G is not a transition prob. matrix!"];
Print["========================================"]
Print["Testing BuTools function QBDSolve"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
B = {{0., 0.},{3., 4.}};
Print["B = "//OutputForm];
Print[B];
L = {{-6., 5.},{3., -12.}};
Print["L = "//OutputForm];
Print[L];
F = {{1., 0.},{2., 0.}};
Print["F = "//OutputForm];
Print[F];
L0 = {{-6., 5.},{6., -8.}};
Print["L0 = "//OutputForm];
Print[L0];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{pi0, R} = QBDSolve[B, L, F, L0];:"//OutputForm];
{pi0, R} = QBDSolve[B, L, F, L0];
Print["pi0 = "//OutputForm];
Print[pi0];
Print["R = "//OutputForm];
Print[R];
Assert[CheckGenerator[U, True], "QBDFundamentalMatrices: matrix U is not a transient generator!"];
Assert[Total[pi0]>0&&Total[pi0]<=1&&AllTrue[pi0,#>=-10^-14 &], "QBDSolve: wrong pi0 vector!"];
Assert[AllTrue[Abs[Eigenvalues[R]],#<=1 &], "QBDSolve: the eigenvalues of matrix R are not inside the unit disc!"];
Print["========================================"]
Print["Testing BuTools function QBDStationaryDistr"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
B = {{0., 0.},{3., 4.}};
Print["B = "//OutputForm];
Print[B];
L = {{-6., 5.},{3., -12.}};
Print["L = "//OutputForm];
Print[L];
F = {{1., 0.},{2., 0.}};
Print["F = "//OutputForm];
Print[F];
L0 = {{-6., 5.},{6., -8.}};
Print["L0 = "//OutputForm];
Print[L0];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["pi = QBDStationaryDistr[pi0, R, 5];:"//OutputForm];
pi = QBDStationaryDistr[pi0, R, 5];
Print["pi = "//OutputForm];
Print[pi];
Assert[CheckGenerator[U, True], "QBDFundamentalMatrices: matrix U is not a transient generator!"];
Assert[Total[pi]>0&&Total[pi]<=1&&AllTrue[pi0,#>=-10^-14 &], "QBDStationaryDistr: wrong pi vector!"];
Print["========================================"]
Print["Testing BuTools function MG1FundamentalMatrix"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
A0 = {{0.4, 0.2},{0.3, 0.4}};
Print["A0 = "//OutputForm];
Print[A0];
A1 = {{0., 0.1},{0., 0.}};
Print["A1 = "//OutputForm];
Print[A1];
A2 = {{0., 0.2},{0., 0.2}};
Print["A2 = "//OutputForm];
Print[A2];
A3 = {{0.1, 0.},{0.1, 0.}};
Print["A3 = "//OutputForm];
Print[A3];
Print["A = {A0, A1, A2, A3};:"//OutputForm];
A = {A0, A1, A2, A3};
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["G = MG1FundamentalMatrix[A];:"//OutputForm];
G = MG1FundamentalMatrix[A];
Print["G = "//OutputForm];
Print[G];
Assert[CheckProbMatrix[G], "MG1FundamentalMatrix: matrix G is not a transition prob. matrix!"];
Print["========================================"]
Print["Testing BuTools function MG1StationaryDistr"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
B0 = {{0.1, 0.5},{0.3, 0.4}};
Print["B0 = "//OutputForm];
Print[B0];
B1 = {{0., 0.1},{0., 0.}};
Print["B1 = "//OutputForm];
Print[B1];
B2 = {{0.2, 0.},{0., 0.2}};
Print["B2 = "//OutputForm];
Print[B2];
B3 = {{0., 0.1},{0.1, 0.}};
Print["B3 = "//OutputForm];
Print[B3];
A0 = {{0.4, 0.2},{0.3, 0.4}};
Print["A0 = "//OutputForm];
Print[A0];
A1 = {{0., 0.1},{0., 0.}};
Print["A1 = "//OutputForm];
Print[A1];
A2 = {{0., 0.2},{0., 0.2}};
Print["A2 = "//OutputForm];
Print[A2];
A3 = {{0.1, 0.},{0.1, 0.}};
Print["A3 = "//OutputForm];
Print[A3];
Print["B = {B0, B1, B2, B3};:"//OutputForm];
B = {B0, B1, B2, B3};
Print["A = {A0, A1, A2, A3};:"//OutputForm];
A = {A0, A1, A2, A3};
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["G = MG1FundamentalMatrix[A];:"//OutputForm];
G = MG1FundamentalMatrix[A];
Print["G = "//OutputForm];
Print[G];
Print["pi = MG1StationaryDistr[A, B, G, 300];:"//OutputForm];
pi = MG1StationaryDistr[A, B, G, 300];
Assert[CheckProbMatrix[G], "MG1StationaryDistr: matrix G is not a transition prob. matrix!"];
Assert[Total[pi]>0&&Total[pi]<=1&&AllTrue[pi,#>=-10^-14 &], "MG1StationaryDistr: wrong pi vector!"];
Print["========================================"]
Print["Testing BuTools function GM1FundamentalMatrix"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
A0 = {{0.1, 0.},{0., 0.1}};
Print["A0 = "//OutputForm];
Print[A0];
A1 = {{0., 0.2},{0., 0.2}};
Print["A1 = "//OutputForm];
Print[A1];
A2 = {{0., 0.1},{0., 0.}};
Print["A2 = "//OutputForm];
Print[A2];
A3 = {{0.3, 0.2},{0.3, 0.2}};
Print["A3 = "//OutputForm];
Print[A3];
A4 = {{0., 0.1},{0.2, 0.}};
Print["A4 = "//OutputForm];
Print[A4];
Print["A = {A0, A1, A2, A3, A4};:"//OutputForm];
A = {A0, A1, A2, A3, A4};
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["R = GM1FundamentalMatrix[A];:"//OutputForm];
R = GM1FundamentalMatrix[A];
Print["R = "//OutputForm];
Print[R];
Assert[AllTrue[Abs[Eigenvalues[R]],#<=1 &], "GM1FundamentalMatrix: the eigenvalues of matrix R are not inside the unit disc!"];
Print["========================================"]
Print["Testing BuTools function GM1StationaryDistr"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
B0 = {{0.7, 0.2},{0.3, 0.6}};
Print["B0 = "//OutputForm];
Print[B0];
B1 = {{0.3, 0.4},{0.5, 0.2}};
Print["B1 = "//OutputForm];
Print[B1];
B2 = {{0.2, 0.4},{0.1, 0.6}};
Print["B2 = "//OutputForm];
Print[B2];
B3 = {{0., 0.1},{0.2, 0.}};
Print["B3 = "//OutputForm];
Print[B3];
A0 = {{0.1, 0.},{0., 0.1}};
Print["A0 = "//OutputForm];
Print[A0];
A1 = {{0., 0.2},{0., 0.2}};
Print["A1 = "//OutputForm];
Print[A1];
A2 = {{0., 0.1},{0., 0.}};
Print["A2 = "//OutputForm];
Print[A2];
A3 = {{0.3, 0.2},{0.3, 0.2}};
Print["A3 = "//OutputForm];
Print[A3];
A4 = {{0., 0.1},{0.2, 0.}};
Print["A4 = "//OutputForm];
Print[A4];
Print["B = {B0, B1, B2, B3};:"//OutputForm];
B = {B0, B1, B2, B3};
Print["A = {A0, A1, A2, A3, A4};:"//OutputForm];
A = {A0, A1, A2, A3, A4};
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["R = GM1FundamentalMatrix[A];:"//OutputForm];
R = GM1FundamentalMatrix[A];
Print["R = "//OutputForm];
Print[R];
Print["pi = GM1StationaryDistr[B, R, 300];:"//OutputForm];
pi = GM1StationaryDistr[B, R, 300];
Assert[AllTrue[Abs[Eigenvalues[R]],#<=1 &], "GM1StationaryDistr: the eigenvalues of matrix R are not inside the unit disc!"];
Assert[Total[pi]>0&&Total[pi]<=1&&AllTrue[pi,#>=-10^-14 &], "GM1StationaryDistr: wrong pi vector!"];
Print["========================================"]
Print["Testing BuTools function FluidFundamentalMatrices"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
Fpp = {{-5., 1.},{2., -3.}};
Print["Fpp = "//OutputForm];
Print[Fpp];
Fpm = {{2., 1., 1.},{1., 0., 0.}};
Print["Fpm = "//OutputForm];
Print[Fpm];
Fmm = {{-8., 4., 1.},{2., -12., 3.},{2., 0., -2.}};
Print["Fmm = "//OutputForm];
Print[Fmm];
Fmp = {{3., 0.},{2., 5.},{0., 0.}};
Print["Fmp = "//OutputForm];
Print[Fmp];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{Psi, K, U} = FluidFundamentalMatrices[Fpp, Fpm, Fmp, Fmm, \"PKU\"];:"//OutputForm];
{Psi, K, U} = FluidFundamentalMatrices[Fpp, Fpm, Fmp, Fmm, "PKU"];
Print["Psi = "//OutputForm];
Print[Psi];
Print["K = "//OutputForm];
Print[K];
Print["U = "//OutputForm];
Print[U];
Assert[CheckGenerator[U], "FluidFundamentalMatrices: matrix U is not a generator!"];
Assert[AllTrue[Eigenvalues[K],#<0 &], "FluidFundamentalMatrices: the eigenvalues of matrix K are not negative!"];
Assert[AllTrue[Flatten[Psi],#>=0 &]&&AllTrue[Flatten[Psi],#<=1 &]&&Norm[Total[Psi,{2}]-1]<10^-14, "FluidFundamentalMatrices: matrix Psi is not a transition prob. matrix!"];
Print["========================================"]
Print["Testing BuTools function FluidSolve"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
Fpp = {{-5., 1.},{2., -3.}};
Print["Fpp = "//OutputForm];
Print[Fpp];
Fpm = {{2., 1., 1.},{1., 0., 0.}};
Print["Fpm = "//OutputForm];
Print[Fpm];
Fmm = {{-8., 4., 1.},{2., -12., 3.},{2., 0., -2.}};
Print["Fmm = "//OutputForm];
Print[Fmm];
Fmp = {{3., 0.},{2., 5.},{0., 0.}};
Print["Fmp = "//OutputForm];
Print[Fmp];
x = 0.7;
Print["x = "//OutputForm];
Print[x];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{mass0, ini, K, clo} = FluidSolve[Fpp, Fpm, Fmp, Fmm];:"//OutputForm];
{mass0, ini, K, clo} = FluidSolve[Fpp, Fpm, Fmp, Fmm];
Print["mass0 = "//OutputForm];
Print[mass0];
Print["ini = "//OutputForm];
Print[ini];
Print["K = "//OutputForm];
Print[K];
Print["clo = "//OutputForm];
Print[clo];
Print["pdfAtX = ini.MatrixExponential[K*x].clo;:"//OutputForm];
pdfAtX = ini.MatrixExponential[K*x].clo;
Print["pdfAtX = "//OutputForm];
Print[pdfAtX];
Assert[AllTrue[Eigenvalues[K],#<0 &], "FluidSolve: the eigenvalues of matrix K are not negative!"];
Assert[Abs[1.-Total[mass0]-Total[ini.Inverse[-K].clo]]<10^-14, "FluidSolve: the integral of the fluid density in not one!"];
Print["========================================"]
Print["Testing BuTools function GeneralFluidSolve"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
Q = {{-6., 1., 3., 2., 0., 0.},{6., -10., 2., 0., 2., 0.},{3., 7., -12., 0., 0., 2.},{5., 0., 0., -9., 1., 3.},{0., 5., 0., 6., -13., 2.},{0., 0., 5., 3., 7., -15.}};
Print["Q = "//OutputForm];
Print[Q];
R = {{2., 0., 0., 0., 0., 0.},{0., -4., 0., 0., 0., 0.},{0., 0., -12., 0., 0., 0.},{0., 0., 0., 6., 0., 0.},{0., 0., 0., 0., 0., 0.},{0., 0., 0., 0., 0., -8.}};
Print["R = "//OutputForm];
Print[R];
x = 0.7;
Print["x = "//OutputForm];
Print[x];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{mass0, ini, K, clo} = GeneralFluidSolve[Q, R];:"//OutputForm];
{mass0, ini, K, clo} = GeneralFluidSolve[Q, R];
Print["mass0 = "//OutputForm];
Print[mass0];
Print["ini = "//OutputForm];
Print[ini];
Print["K = "//OutputForm];
Print[K];
Print["clo = "//OutputForm];
Print[clo];
Print["pdfAtX = ini.MatrixExponential[K*x].clo;:"//OutputForm];
pdfAtX = ini.MatrixExponential[K*x].clo;
Print["pdfAtX = "//OutputForm];
Print[pdfAtX];
Assert[AllTrue[Eigenvalues[K],#<0 &], "GeneralFluidSolve: the eigenvalues of matrix K are not negative!"];
Assert[Abs[1.-Total[mass0]-Total[ini.Inverse[-K].clo]]<10^-14, "GeneralFluidSolve: the integral of the fluid density in not one!"];
Print["========================================"]
Print["Testing BuTools function FluidStationaryDistr"]
Print["Input:"//OutputForm];
Print["------"//OutputForm];
Q = {{-6., 1., 3., 2., 0., 0.},{6., -10., 2., 0., 2., 0.},{3., 7., -12., 0., 0., 2.},{5., 0., 0., -9., 1., 3.},{0., 5., 0., 6., -13., 2.},{0., 0., 5., 3., 7., -15.}};
Print["Q = "//OutputForm];
Print[Q];
R = {{2., 0., 0., 0., 0., 0.},{0., -4., 0., 0., 0., 0.},{0., 0., -12., 0., 0., 0.},{0., 0., 0., 6., 0., 0.},{0., 0., 0., 0., 0., 0.},{0., 0., 0., 0., 0., -8.}};
Print["R = "//OutputForm];
Print[R];
x = Range[0.0,30.0,1.0];
Print["x = "//OutputForm];
Print[x];
Print["Test:"//OutputForm];
Print["-----"//OutputForm];
Print["{mass0, ini, K, clo} = GeneralFluidSolve[Q, R];:"//OutputForm];
{mass0, ini, K, clo} = GeneralFluidSolve[Q, R];
Print["mass0 = "//OutputForm];
Print[mass0];
Print["ini = "//OutputForm];
Print[ini];
Print["K = "//OutputForm];
Print[K];
Print["clo = "//OutputForm];
Print[clo];
Print["y = FluidStationaryDistr[mass0, ini, K, clo, x];:"//OutputForm];
y = FluidStationaryDistr[mass0, ini, K, clo, x];
Print["y = "//OutputForm];
Print[y];
pi = CTMCSolve[Q];
Assert[Norm[y[[-1, 1;;-1]]-pi]<10^-5, "FluidStationaryDistr: stationary distribution does not converge to the steady state distribution of the phases!"];
