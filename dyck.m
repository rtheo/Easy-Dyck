function [idx, ip] = dyck( n )
%clc, close all
% Code for finding an indicator function for all Dick Words on an exponential interval
% Dyck words via serial scan of their symbolic string counterparts
% Encoding used ( -> 1, ) -> 0 with left-right priority (only odd indices)
%Exclude 2nd half of string powerset due to LR priority (strings must end with 0)
n = 2*n;dim = 2^(n-1); lex = fliplr( ff2n( n ) ); % use factorial design for ordered string dictionary
valid = sum(2*lex - 1, 2); % isolate subset in the (n n/2) factorial (equal no of L/R parentheses)
idx = zeros(1, dim);ip = idx;
for i=2:2:dim % running on all odd indices in {0,...,dim-1}
    s = lex(i, :); 
    if valid( i )==0, 
        idx(i) = process( s ); 
        if idx(i), ip(i) = isprime(i-1); disp([num2str(i-1),' (primality: ', num2str( ip(i) ),') : ', num2str(s) ]), end 
    end
end
k = sum(idx);
disp(['Total of ',num2str(k),'  Dyck words found: ', num2str( 100*k/choose(n, n/2) ),'% of the factorial'])
end

function ind = process( s )
% All 1-periodic sequences {1, 0}^n collapse to null.
% Applying the nullification operator by a decimation strategy
% should end up with a null sequence for every valid Dyck word.
L0 = length(s); ind=1;
for j=1:length(s) 
    s = strcut( s ); L = length(s); 
    if L < L0,  L0 = L; else if L>0, ind=0;end, break; end
end
end

function snew = strcut( s )
v=find( s(1:end-1).*( 1 - s(2:end) ) ); % identify periodic '10' blocks
snew = s;
for i=1:length(v), 
    snew = [snew( 1:v(i)-1 ), snew( v(i)+2:end )]; v=v-2; % remove inner blocks
end, clear v;
end