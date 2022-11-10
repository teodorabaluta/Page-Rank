function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Algoritmul este preluat din pdf ul unui laborator
      
    [x,y] = size(A);
    Q = zeros(x,y);
    R = zeros(x);
  
   % conform formulelor, scoatem Q si R
   for i = 1 : x
    R(i,i) = norm(A(:,i),2);
    Q(:,i) = A(:,i)/R(i,i);
    
    for j = i + 1 : x
      R(i,j) = Q(:,i)'*A(:,j);
      A(:,j) = A(:,j)-Q(:,i)*R(i,j);
    end
   end

   % dupa ce am scos Q si R, avem: A = Q * R ceea ce inseamna ca I(n) = Q * R * A-1
   % deci  Qt * I(n) = R * A-1 deoarece Q = Qt si R superior triunghiulara
   % si rezulta R * x = Qt * I(n) unde x = matricea pe care o cautam

   Q_trans = Q';
   In = eye(x);
   final = Q_trans * In;
   
   % scoatem matricea X (matricea inversa) din relatia A * x = B
   inversa = mldivide(R,final);
   % setam output ul sa fie inversa
   B = inversa;

end
