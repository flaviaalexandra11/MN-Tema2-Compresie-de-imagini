function A_k = cerinta1 (image, k)

  % citire imagine
  A_k = imread(image);
  A_k = double(A_k);
  [m n] = size(A_k);

  % descompunere matrice pixeli in svd
  [U, S, V] = svd(A_k);
  
  % selectare linii&coloane pentru compresie 
  A_k = U(1:m, 1:k)*S(1:k,1:k)*V'(1:k, 1:n);
    
endfunction