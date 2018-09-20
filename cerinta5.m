function cerinta5()

  % citire A
  A = imread('in/images/image1.gif');
  A = double(A);
  [m n] = size(A);
  
  [U, S, V] = svd(A);
  
   % grafic 1
  subplot(2, 2, 1);
  plot(diag(S));
  
  PGP = zeros(1, 19);
  PGP2 = zeros(1, 19);
  for k = 1:19
  
    % matricea A_k de la cerinta 3
    A_k = cerinta3('in/images/image1.gif', k);
    
     % subplot 2
    s1(1:k) = diag(S(1:k, 1:k));
    s2 = diag(S);
    PGP(k) = sum(s1) / sum(s2);
    
    % subplot 3
    for i = 1:m
      for j = 1:n
        PGP2(k) += (A(i,j) - A_k(i,j))^2;
      endfor
    endfor
    PGP2(k) /= m*n;    
    
    % subplot 4 
    PGP3(k) = (2*k + 1) / n;
  endfor
  
  % grafic 2
  subplot(2, 2, 2);
  plot([1:19], PGP);
  
  % grafic 3  
  subplot(2, 2, 3);
  plot([1:19], PGP2);  
  
  % grafic 4
  subplot(2, 2, 4);
  plot([1:19], PGP3);  
    
endfunction