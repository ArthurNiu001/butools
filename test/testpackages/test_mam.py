import sys
sys.path.append("/home/gabor/github/butools/Python")
import math
import numpy as np
import numpy.matlib as ml
import matplotlib.pyplot as plt
import butools
from butools.utils import *
from butools.ph import *
from butools.dph import *
from butools.map import *
from butools.moments import *
from butools.reptrans import*
from butools.mc import *
from butools.dmap import *
from butools.trace import *
from butools.mam import *
from butools.queues import *
from butools.fitting import *
from contextlib import redirect_stdout
import os


print('---BuTools: MAM package test file---')
print('Enable the verbose messages with the BuToolsVerbose flag')
butools.verbose = True
print('Enable input parameter checking with the BuToolsCheckInput flag')
butools.checkInput = True
np.set_printoptions(precision=5,linewidth=1024)
print('========================================')
print('Testing BuTools function QBDFundamentalMatrices')
print('Input:')
print('------')
B = ml.matrix([[0., 0.],[3., 4.]])
print('B = ')
print(B)
L = ml.matrix([[-6., 5.],[3., -12.]])
print('L = ')
print(L)
F = ml.matrix([[1., 0.],[2., 0.]])
print('F = ')
print(F)
L0 = ml.matrix([[-6., 5.],[6., -8.]])
print('L0 = ')
print(L0)
print('Test:')
print('-----')
print('R, G, U = QBDFundamentalMatrices(B, L, F, "RGU"):')
R, G, U = QBDFundamentalMatrices(B, L, F, "RGU")
print('R = ')
print(R)
print('G = ')
print(G)
print('U = ')
print(U)
assert CheckGenerator(U, True), "QBDFundamentalMatrices: matrix U is not a transient generator!"
assert np.all(np.abs(la.eigvals(R))<=1), "QBDFundamentalMatrices: the eigenvalues of matrix R are not inside the unit disc!"
assert CheckProbMatrix(G), "QBDFundamentalMatrices: matrix G is not a transition prob. matrix!"
print('========================================')
print('Testing BuTools function QBDSolve')
print('Input:')
print('------')
B = ml.matrix([[0., 0.],[3., 4.]])
print('B = ')
print(B)
L = ml.matrix([[-6., 5.],[3., -12.]])
print('L = ')
print(L)
F = ml.matrix([[1., 0.],[2., 0.]])
print('F = ')
print(F)
L0 = ml.matrix([[-6., 5.],[6., -8.]])
print('L0 = ')
print(L0)
print('Test:')
print('-----')
print('pi0, R = QBDSolve(B, L, F, L0):')
pi0, R = QBDSolve(B, L, F, L0)
print('pi0 = ')
print(pi0)
print('R = ')
print(R)
assert CheckGenerator(U, True), "QBDFundamentalMatrices: matrix U is not a transient generator!"
assert np.sum(pi0)>0 and np.sum(pi0)<=1 and np.all(pi0>=0), "QBDSolve: wrong pi0 vector!"
assert np.all(np.abs(la.eigvals(R))<=1), "QBDSolve: the eigenvalues of matrix R are not inside the unit disc!"
print('========================================')
print('Testing BuTools function QBDStationaryDistr')
print('Input:')
print('------')
B = ml.matrix([[0., 0.],[3., 4.]])
print('B = ')
print(B)
L = ml.matrix([[-6., 5.],[3., -12.]])
print('L = ')
print(L)
F = ml.matrix([[1., 0.],[2., 0.]])
print('F = ')
print(F)
L0 = ml.matrix([[-6., 5.],[6., -8.]])
print('L0 = ')
print(L0)
print('Test:')
print('-----')
print('pi = QBDStationaryDistr(pi0, R, 5):')
pi = QBDStationaryDistr(pi0, R, 5)
print('pi = ')
print(pi)
assert CheckGenerator(U, True), "QBDFundamentalMatrices: matrix U is not a transient generator!"
assert np.sum(pi)>0 and np.sum(pi)<=1 and np.all(pi0>=0), "QBDStationaryDistr: wrong pi vector!"
print('========================================')
print('Testing BuTools function MG1FundamentalMatrix')
print('Input:')
print('------')
A0 = ml.matrix([[0.4, 0.2],[0.3, 0.4]])
print('A0 = ')
print(A0)
A1 = ml.matrix([[0., 0.1],[0., 0.]])
print('A1 = ')
print(A1)
A2 = ml.matrix([[0., 0.2],[0., 0.2]])
print('A2 = ')
print(A2)
A3 = ml.matrix([[0.1, 0.],[0.1, 0.]])
print('A3 = ')
print(A3)
print('A = [A0, A1, A2, A3]:')
A = [A0, A1, A2, A3]
print('Test:')
print('-----')
print('G = MG1FundamentalMatrix(A):')
G = MG1FundamentalMatrix(A)
print('G = ')
print(G)
assert CheckProbMatrix(G), "MG1FundamentalMatrix: matrix G is not a transition prob. matrix!"
print('========================================')
print('Testing BuTools function MG1StationaryDistr')
print('Input:')
print('------')
B0 = ml.matrix([[0.1, 0.5],[0.3, 0.4]])
print('B0 = ')
print(B0)
B1 = ml.matrix([[0., 0.1],[0., 0.]])
print('B1 = ')
print(B1)
B2 = ml.matrix([[0.2, 0.],[0., 0.2]])
print('B2 = ')
print(B2)
B3 = ml.matrix([[0., 0.1],[0.1, 0.]])
print('B3 = ')
print(B3)
A0 = ml.matrix([[0.4, 0.2],[0.3, 0.4]])
print('A0 = ')
print(A0)
A1 = ml.matrix([[0., 0.1],[0., 0.]])
print('A1 = ')
print(A1)
A2 = ml.matrix([[0., 0.2],[0., 0.2]])
print('A2 = ')
print(A2)
A3 = ml.matrix([[0.1, 0.],[0.1, 0.]])
print('A3 = ')
print(A3)
print('B = [B0, B1, B2, B3]:')
B = [B0, B1, B2, B3]
print('A = [A0, A1, A2, A3]:')
A = [A0, A1, A2, A3]
print('Test:')
print('-----')
print('G = MG1FundamentalMatrix(A):')
G = MG1FundamentalMatrix(A)
print('G = ')
print(G)
print('pi = MG1StationaryDistr(A, B, G, 300):')
pi = MG1StationaryDistr(A, B, G, 300)
assert CheckProbMatrix(G), "MG1StationaryDistr: matrix G is not a transition prob. matrix!"
assert np.sum(pi)>0 and np.sum(pi)<=1 and np.all(pi>=0), "MG1StationaryDistr: wrong pi vector!"
print('========================================')
print('Testing BuTools function GM1FundamentalMatrix')
print('Input:')
print('------')
A0 = ml.matrix([[0.1, 0.],[0., 0.1]])
print('A0 = ')
print(A0)
A1 = ml.matrix([[0., 0.2],[0., 0.2]])
print('A1 = ')
print(A1)
A2 = ml.matrix([[0., 0.1],[0., 0.]])
print('A2 = ')
print(A2)
A3 = ml.matrix([[0.3, 0.2],[0.3, 0.2]])
print('A3 = ')
print(A3)
A4 = ml.matrix([[0., 0.1],[0.2, 0.]])
print('A4 = ')
print(A4)
print('A = [A0, A1, A2, A3, A4]:')
A = [A0, A1, A2, A3, A4]
print('Test:')
print('-----')
print('R = GM1FundamentalMatrix(A):')
R = GM1FundamentalMatrix(A)
print('R = ')
print(R)
assert np.all(np.abs(la.eigvals(R))<=1), "GM1FundamentalMatrix: the eigenvalues of matrix R are not inside the unit disc!"
print('========================================')
print('Testing BuTools function GM1StationaryDistr')
print('Input:')
print('------')
B0 = ml.matrix([[0.7, 0.2],[0.3, 0.6]])
print('B0 = ')
print(B0)
B1 = ml.matrix([[0.3, 0.4],[0.5, 0.2]])
print('B1 = ')
print(B1)
B2 = ml.matrix([[0.2, 0.4],[0.1, 0.6]])
print('B2 = ')
print(B2)
B3 = ml.matrix([[0., 0.1],[0.2, 0.]])
print('B3 = ')
print(B3)
A0 = ml.matrix([[0.1, 0.],[0., 0.1]])
print('A0 = ')
print(A0)
A1 = ml.matrix([[0., 0.2],[0., 0.2]])
print('A1 = ')
print(A1)
A2 = ml.matrix([[0., 0.1],[0., 0.]])
print('A2 = ')
print(A2)
A3 = ml.matrix([[0.3, 0.2],[0.3, 0.2]])
print('A3 = ')
print(A3)
A4 = ml.matrix([[0., 0.1],[0.2, 0.]])
print('A4 = ')
print(A4)
print('B = [B0, B1, B2, B3]:')
B = [B0, B1, B2, B3]
print('A = [A0, A1, A2, A3, A4]:')
A = [A0, A1, A2, A3, A4]
print('Test:')
print('-----')
print('R = GM1FundamentalMatrix(A):')
R = GM1FundamentalMatrix(A)
print('R = ')
print(R)
print('pi = GM1StationaryDistr(B, R, 300):')
pi = GM1StationaryDistr(B, R, 300)
assert np.all(np.abs(la.eigvals(R))<=1), "GM1StationaryDistr: the eigenvalues of matrix R are not inside the unit disc!"
assert np.sum(pi)>0 and np.sum(pi)<=1 and np.all(pi>=0), "GM1StationaryDistr: wrong pi vector!"
print('========================================')
print('Testing BuTools function FluidFundamentalMatrices')
print('Input:')
print('------')
Fpp = ml.matrix([[-5., 1.],[2., -3.]])
print('Fpp = ')
print(Fpp)
Fpm = ml.matrix([[2., 1., 1.],[1., 0., 0.]])
print('Fpm = ')
print(Fpm)
Fmm = ml.matrix([[-8., 4., 1.],[2., -12., 3.],[2., 0., -2.]])
print('Fmm = ')
print(Fmm)
Fmp = ml.matrix([[3., 0.],[2., 5.],[0., 0.]])
print('Fmp = ')
print(Fmp)
print('Test:')
print('-----')
print('Psi, K, U = FluidFundamentalMatrices(Fpp, Fpm, Fmp, Fmm, "PKU"):')
Psi, K, U = FluidFundamentalMatrices(Fpp, Fpm, Fmp, Fmm, "PKU")
print('Psi = ')
print(Psi)
print('K = ')
print(K)
print('U = ')
print(U)
assert CheckGenerator(U), "FluidFundamentalMatrices: matrix U is not a generator!"
assert np.all(la.eigvals(K)<0), "FluidFundamentalMatrices: the eigenvalues of matrix K are not negative!"
assert np.all(Psi>=0) and np.all(Psi<=1) and la.norm(np.sum(Psi,1)-1)<10**-14, "FluidFundamentalMatrices: matrix Psi is not a transition prob. matrix!"
print('========================================')
print('Testing BuTools function FluidSolve')
print('Input:')
print('------')
Fpp = ml.matrix([[-5., 1.],[2., -3.]])
print('Fpp = ')
print(Fpp)
Fpm = ml.matrix([[2., 1., 1.],[1., 0., 0.]])
print('Fpm = ')
print(Fpm)
Fmm = ml.matrix([[-8., 4., 1.],[2., -12., 3.],[2., 0., -2.]])
print('Fmm = ')
print(Fmm)
Fmp = ml.matrix([[3., 0.],[2., 5.],[0., 0.]])
print('Fmp = ')
print(Fmp)
x = 0.7
print('x = ')
print(x)
print('Test:')
print('-----')
print('mass0, ini, K, clo = FluidSolve(Fpp, Fpm, Fmp, Fmm):')
mass0, ini, K, clo = FluidSolve(Fpp, Fpm, Fmp, Fmm)
print('mass0 = ')
print(mass0)
print('ini = ')
print(ini)
print('K = ')
print(K)
print('clo = ')
print(clo)
print('pdfAtX = ini*la.expm(K*x)*clo:')
pdfAtX = ini*la.expm(K*x)*clo
print('pdfAtX = ')
print(pdfAtX)
assert np.all(la.eigvals(K)<0), "FluidSolve: the eigenvalues of matrix K are not negative!"
assert np.abs(1.-np.sum(mass0)-np.sum(ini*la.inv(-K)*clo))<10**-14, "FluidSolve: the integral of the fluid density in not one!"
print('========================================')
print('Testing BuTools function GeneralFluidSolve')
print('Input:')
print('------')
Q = ml.matrix([[-6., 1., 3., 2., 0., 0.],[6., -10., 2., 0., 2., 0.],[3., 7., -12., 0., 0., 2.],[5., 0., 0., -9., 1., 3.],[0., 5., 0., 6., -13., 2.],[0., 0., 5., 3., 7., -15.]])
print('Q = ')
print(Q)
R = ml.matrix([[2., 0., 0., 0., 0., 0.],[0., -4., 0., 0., 0., 0.],[0., 0., -12., 0., 0., 0.],[0., 0., 0., 6., 0., 0.],[0., 0., 0., 0., 0., 0.],[0., 0., 0., 0., 0., -8.]])
print('R = ')
print(R)
x = 0.7
print('x = ')
print(x)
print('Test:')
print('-----')
print('mass0, ini, K, clo = GeneralFluidSolve(Q, R):')
mass0, ini, K, clo = GeneralFluidSolve(Q, R)
print('mass0 = ')
print(mass0)
print('ini = ')
print(ini)
print('K = ')
print(K)
print('clo = ')
print(clo)
print('pdfAtX = ini*la.expm(K*x)*clo:')
pdfAtX = ini*la.expm(K*x)*clo
print('pdfAtX = ')
print(pdfAtX)
assert np.all(la.eigvals(K)<0), "GeneralFluidSolve: the eigenvalues of matrix K are not negative!"
assert np.abs(1.-np.sum(mass0)-np.sum(ini*la.inv(-K)*clo))<10**-14, "GeneralFluidSolve: the integral of the fluid density in not one!"
print('========================================')
print('Testing BuTools function FluidStationaryDistr')
print('Input:')
print('------')
Q = ml.matrix([[-6., 1., 3., 2., 0., 0.],[6., -10., 2., 0., 2., 0.],[3., 7., -12., 0., 0., 2.],[5., 0., 0., -9., 1., 3.],[0., 5., 0., 6., -13., 2.],[0., 0., 5., 3., 7., -15.]])
print('Q = ')
print(Q)
R = ml.matrix([[2., 0., 0., 0., 0., 0.],[0., -4., 0., 0., 0., 0.],[0., 0., -12., 0., 0., 0.],[0., 0., 0., 6., 0., 0.],[0., 0., 0., 0., 0., 0.],[0., 0., 0., 0., 0., -8.]])
print('R = ')
print(R)
x = np.arange(0.0,31.0,1.0)
print('x = ')
print(x)
print('Test:')
print('-----')
print('mass0, ini, K, clo = GeneralFluidSolve(Q, R):')
mass0, ini, K, clo = GeneralFluidSolve(Q, R)
print('mass0 = ')
print(mass0)
print('ini = ')
print(ini)
print('K = ')
print(K)
print('clo = ')
print(clo)
print('y = FluidStationaryDistr(mass0, ini, K, clo, x):')
y = FluidStationaryDistr(mass0, ini, K, clo, x)
print('y = ')
print(y)
pi = CTMCSolve(Q)
assert la.norm(y[-1, :]-pi)<10**-5, "FluidStationaryDistr: stationary distribution does not converge to the steady state distribution of the phases!"

