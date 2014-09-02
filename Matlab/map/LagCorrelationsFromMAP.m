%  acf = LagCorrelationsFromMAP(D0, D1, L, prec)
%  
%  Returns the lag autocorrelations of a Markovian arrival
%  process.
%  
%  Parameters
%  ----------
%  D0 : matrix, shape (M,M)
%      The D0 matrix of the Markovian arrival process
%  D1 : matrix, shape (M,M)
%      The D1 matrix of the Markovian arrival process
%  L : double, optional
%      The number of lags to compute. The default value is 1
%  prec : double, optional
%      Numerical precision to check if the input is valid. 
%      The default value is 1e-14
%  
%  Returns
%  -------
%  acf : column vector of doubles, length (L)
%      The lag autocorrelation function up to lag L
%      

function acf = LagCorrelationsFromMAP (D0, D1, L, prec)

    if ~exist('prec','var')
        prec = 1e-14;
    end

    global BuToolsCheckInput;

    if isempty(BuToolsCheckInput)
        BuToolsCheckInput = true;
    end   

    if BuToolsCheckInput && ~CheckMAPRepresentation(D0,D1,prec)
        error('LagCorrelationsFromMAP: input isn''t a valid MAP representation!');
    end

    if ~exist('L','var')
        L=1;
    end

    acf = LagCorrelationsFromRAP(D0, D1, L, prec);
end