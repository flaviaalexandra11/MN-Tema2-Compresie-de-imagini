function [A_k S] = cerinta4(image, k)

  % citire A
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  
  % pas1
  miu = zeros(m, 1);
  for i = 1:m
    miu(i) = sum(A(i, 1:n));
  endfor
  miu ./= n;
 
  % pas2
  for i = 1:m
   A(i, 1:n) -=  miu(i);
  endfor
   
   % pas3
   Z = 1/(n-1)*A*A';
   
   % pas4
   [V S] = eig(Z);
   
  % pas5
  [p q] = size(V); 
  W = zeros(m, k);
  W(1:p, 1:k) = V(1:p, 1:k);
   
  % pas6
  Y = W'*A;

  % pas7
  A_k = W*Y + miu;

endfunction 