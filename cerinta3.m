function [A_k S] = cerinta3(image, k)

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
  Z = A';
  Z ./= sqrt(n-1);
  
  % pas4
  [U, S, V] = svd(Z);
 
  % pas5
  [m n] = size(V); 
  W = V(1:m, 1:k);

  % pas6
  Y = W'*A;

  % pas7
  A_k = W*Y + miu;

endfunction 