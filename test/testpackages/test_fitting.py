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


print('---BuTools: Fitting package test file---')
print('Enable the verbose messages with the BuToolsVerbose flag')
butools.verbose = True
print('Enable input parameter checking with the BuToolsCheckInput flag')
butools.checkInput = True
np.set_printoptions(precision=5,linewidth=1024)
print('========================================')
print('Testing BuTools function EmpiricalSquaredDifference')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50):')
intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50)
print('pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds):')
pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds)
print('cdfTrX, cdfTrY = CdfFromTrace(tr):')
cdfTrX, cdfTrY = CdfFromTrace(tr)
print('step = math.ceil(Length(tr)/2000):')
step = math.ceil(Length(tr)/2000)
print('cdfTrX = cdfTrX[0:Length(tr):step]:')
cdfTrX = cdfTrX[0:Length(tr):step]
print('cdfTrY = cdfTrY[0:Length(tr):step]:')
cdfTrY = cdfTrY[0:Length(tr):step]
print('alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3)):')
alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3))
print('pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds):')
pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds)
print('cdfPHY = CdfFromPH(alpha, A, cdfTrX):')
cdfPHY = CdfFromPH(alpha, A, cdfTrX)
print('Test:')
print('-----')
print('sqPdf = EmpiricalSquaredDifference(pdfTrY, pdfPHY, intBounds):')
sqPdf = EmpiricalSquaredDifference(pdfTrY, pdfPHY, intBounds)
print('sqPdf = ')
print(sqPdf)
print('sqCdf = EmpiricalSquaredDifference(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX):')
sqCdf = EmpiricalSquaredDifference(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX)
print('sqCdf = ')
print(sqCdf)
assert sqPdf>=0, "Empirical squared difference is negative!"
assert sqCdf>=0, "Empirical squared difference is negative!"
print('========================================')
print('Testing BuTools function EmpiricalRelativeEntropy')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50):')
intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50)
print('pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds):')
pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds)
print('cdfTrX, cdfTrY = CdfFromTrace(tr):')
cdfTrX, cdfTrY = CdfFromTrace(tr)
print('step = math.ceil(Length(tr)/2000):')
step = math.ceil(Length(tr)/2000)
print('cdfTrX = cdfTrX[0:Length(tr):step]:')
cdfTrX = cdfTrX[0:Length(tr):step]
print('cdfTrY = cdfTrY[0:Length(tr):step]:')
cdfTrY = cdfTrY[0:Length(tr):step]
print('alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3)):')
alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3))
print('pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds):')
pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds)
print('cdfPHY = CdfFromPH(alpha, A, cdfTrX):')
cdfPHY = CdfFromPH(alpha, A, cdfTrX)
print('Test:')
print('-----')
print('rePdf = EmpiricalRelativeEntropy(pdfTrY, pdfPHY, intBounds):')
rePdf = EmpiricalRelativeEntropy(pdfTrY, pdfPHY, intBounds)
print('rePdf = ')
print(rePdf)
print('reCdf = EmpiricalRelativeEntropy(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX):')
reCdf = EmpiricalRelativeEntropy(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX)
print('reCdf = ')
print(reCdf)
assert rePdf>=0, "Empirical relative entropy is negative!"
assert reCdf>=0, "Empirical relative entropy is negative!"
print('========================================')
print('Testing BuTools function LikelihoodFromTrace')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3)):')
alpha, A = APHFrom3Moments(MarginalMomentsFromTrace(tr, 3))
print('D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), LagCorrelationsFromTrace(tr, 1)[0]):')
D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), LagCorrelationsFromTrace(tr, 1)[0])
print('Test:')
print('-----')
print('logliPH = LikelihoodFromTrace(tr, alpha, A):')
logliPH = LikelihoodFromTrace(tr, alpha, A)
print('logliPH = ')
print(logliPH)
print('logliMAP = LikelihoodFromTrace(tr, D0, D1):')
logliMAP = LikelihoodFromTrace(tr, D0, D1)
print('logliMAP = ')
print(logliMAP)
print('========================================')
print('Testing BuTools function SquaredDifference')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('trAcf = LagCorrelationsFromTrace(tr, 10):')
trAcf = LagCorrelationsFromTrace(tr, 10)
print('trAcf = ')
print(trAcf)
print('D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), trAcf[0]):')
D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), trAcf[0])
print('mapAcf = LagCorrelationsFromMAP(D0, D1, 10):')
mapAcf = LagCorrelationsFromMAP(D0, D1, 10)
print('mapAcf = ')
print(mapAcf)
print('Test:')
print('-----')
print('sqAcf = SquaredDifference(mapAcf, trAcf):')
sqAcf = SquaredDifference(mapAcf, trAcf)
print('sqAcf = ')
print(sqAcf)
assert sqAcf>=0, "Squared difference is negative!"
print('========================================')
print('Testing BuTools function RelativeEntropy')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('trAcf = LagCorrelationsFromTrace(tr, 10):')
trAcf = LagCorrelationsFromTrace(tr, 10)
print('trAcf = ')
print(trAcf)
print('D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), trAcf[0]):')
D0, D1 = MAPFromFewMomentsAndCorrelations(MarginalMomentsFromTrace(tr, 3), trAcf[0])
print('mapAcf = LagCorrelationsFromMAP(D0, D1, 10):')
mapAcf = LagCorrelationsFromMAP(D0, D1, 10)
print('mapAcf = ')
print(mapAcf)
print('Test:')
print('-----')
print('reAcf = RelativeEntropy(mapAcf, trAcf):')
reAcf = RelativeEntropy(mapAcf, trAcf)
print('reAcf = ')
print(reAcf)
assert reAcf>=0, "Relative entropy is negative!"
print('========================================')
print('Testing BuTools function PHFromTrace')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('Test:')
print('-----')
print('alpha, A, logli = PHFromTrace(tr, 5):')
alpha, A, logli = PHFromTrace(tr, 5)
print('alpha = ')
print(alpha)
print('A = ')
print(A)
print('logli = ')
print(logli)
print('logli = LikelihoodFromTrace(tr, alpha, A):')
logli = LikelihoodFromTrace(tr, alpha, A)
print('logli = ')
print(logli)
print('intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50):')
intBounds = np.linspace(0, MarginalMomentsFromTrace(tr, 1)[0]*4, 50)
print('pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds):')
pdfTrX, pdfTrY = PdfFromTrace(tr, intBounds)
print('pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds):')
pdfPHX, pdfPHY = IntervalPdfFromPH(alpha, A, intBounds)
print('sqPdf = EmpiricalSquaredDifference(pdfTrY, pdfPHY, intBounds):')
sqPdf = EmpiricalSquaredDifference(pdfTrY, pdfPHY, intBounds)
print('sqPdf = ')
print(sqPdf)
print('rePdf = EmpiricalRelativeEntropy(pdfTrY, pdfPHY, intBounds):')
rePdf = EmpiricalRelativeEntropy(pdfTrY, pdfPHY, intBounds)
print('rePdf = ')
print(rePdf)
print('cdfTrX, cdfTrY = CdfFromTrace(tr):')
cdfTrX, cdfTrY = CdfFromTrace(tr)
print('step = math.ceil(Length(tr)/2000):')
step = math.ceil(Length(tr)/2000)
print('cdfTrX = cdfTrX[0:Length(tr):step]:')
cdfTrX = cdfTrX[0:Length(tr):step]
print('cdfTrY = cdfTrY[0:Length(tr):step]:')
cdfTrY = cdfTrY[0:Length(tr):step]
print('cdfPHY = CdfFromPH(alpha, A, cdfTrX):')
cdfPHY = CdfFromPH(alpha, A, cdfTrX)
print('sqCdf = EmpiricalSquaredDifference(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX):')
sqCdf = EmpiricalSquaredDifference(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX)
print('sqCdf = ')
print(sqCdf)
print('reCdf = EmpiricalRelativeEntropy(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX):')
reCdf = EmpiricalRelativeEntropy(cdfTrY[0:-1], cdfPHY[0:-1], cdfTrX)
print('reCdf = ')
print(reCdf)
print('========================================')
print('Testing BuTools function MAPFromTrace')
print('Input:')
print('------')
print('tr = np.loadtxt("/home/gabor/github/butools/test/data/bctrace.iat"):')
tr = np.loadtxt('/home/gabor/github/butools/test/data/bctrace.iat')
print('tr = tr[0:10000]:')
tr = tr[0:10000]
print('Test:')
print('-----')
print('D0, D1, logli = MAPFromTrace(tr, 5):')
D0, D1, logli = MAPFromTrace(tr, 5)
print('D0 = ')
print(D0)
print('D1 = ')
print(D1)
print('logli = ')
print(logli)
print('logli = LikelihoodFromTrace(tr, D0, D1):')
logli = LikelihoodFromTrace(tr, D0, D1)
print('logli = ')
print(logli)
print('trAcf = LagCorrelationsFromTrace(tr, 10):')
trAcf = LagCorrelationsFromTrace(tr, 10)
print('trAcf = ')
print(trAcf)
print('mapAcf = LagCorrelationsFromMAP(D0, D1, 10):')
mapAcf = LagCorrelationsFromMAP(D0, D1, 10)
print('mapAcf = ')
print(mapAcf)
print('sqAcf = SquaredDifference(mapAcf, trAcf):')
sqAcf = SquaredDifference(mapAcf, trAcf)
print('sqAcf = ')
print(sqAcf)
print('reAcf = RelativeEntropy(mapAcf, trAcf):')
reAcf = RelativeEntropy(mapAcf, trAcf)
print('reAcf = ')
print(reAcf)

