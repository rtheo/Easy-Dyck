function altdyck(n)
m = 2*n; k = 0;
w = find( S2( m )==n ); % Isolate group of integers of Digit-Sum = n (no. of L/R parentheses )
id = find( mod( w(1:length(w)/2 )-1, 2) );w = w( id )-1; % isolate odd subset (starting with parenthesis)
for i=1:length(w)
    s = ceil( mod( log2( bitxor( w(i), w(i)+2.^(0:m-1) ) ), 1) ); %Division-free Binary Decoder    
    [cd cv] = bitblocks( s ); 
    f = sum( cumsum( cv ) < 0 ) == 0;
    if  f, 
         k = k + 1; ip = isprime( w(i) );
        disp([num2str( w(i) ),' (primality: ', num2str( ip ),') : ', num2str(s) ]), 
    end 
end
disp(['Total of ',num2str(k),' Dyck words found: ', num2str( 100*k/choose(m, n) ),'% of the factorial'])
end