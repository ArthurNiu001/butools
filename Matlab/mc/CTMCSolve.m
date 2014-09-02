%  pi = CTMCSolve(Q, prec)
%  
%  Computes the stationary solution of a continuous time 
%  Markov chain.
%  
%  Parameters
%  ----------
%  Q : matrix, shape (M,M)
%      The generator matrix of the Markov chain
%  prec : double, optional
%      Numerical precision for checking whether Q is a 
%      valid generator. The default value is 1e-14.
%      
%  Returns
%  -------
%  pi : row vector, shape (1,M)
%      The vector that satisfies `\pi\, Q = 0, \sum_i \pi_i=1`
%  
%  Notes
%  -----
%  The procedure raises an exception if :code:`butools.checkInput` 
%  is set to :code:`true` and :func:`CheckGenerator(Q)` fails.

function pi = CTMCSolve(Q, prec)

    if ~exist('prec','var')
        prec=1e-14;
    end

    global BuToolsCheckInput;
    
    if isempty(BuToolsCheckInput)
        BuToolsCheckInput = true;
    end

    if BuToolsCheckInput && ~CheckGenerator(Q, false, prec)
        error('CTMCSolve: The given matrix is not a valid generator. If you are sure you want this use CRPSolve instead of CTMCSolve.');
    end

    pi = CRPSolve (Q, prec);
end
