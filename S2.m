function s = S2( xp )
% Constructs the Sum-of-Digits sequence
% xp --> Exponent for pow2 interval
s = 0; for i=1:xp,  s = [s, s+1]; end
end