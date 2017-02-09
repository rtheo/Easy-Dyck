# Easy-Dyck
Arithmetized filter for Dyck Words on an Inductive Combinatorial Hierarchy

Two different approaches to the construction of an efficient filter for identifying 
<a href="https://en.wikipedia.org/wiki/Dyck_language">Dyck Words</A> of the same equivalence class (constant string length).
The result is given as an indicator function over an exponential interval {0,...,2^(2n-1)} which always axhibits an arithmetic
fractal structure, a result which is ubiquitous in combinatorial hierarchies of this type.

#1st approach: dyck.m
This is a simple decimation algorithm. It uses an internal factorial design algorithm ("ff2n") to produce the lexicographically
ordered powerset of binary strings (ordered dictionary) for any constant string length 2n containing the subset of Dyck words. 
Using the correspondence [ -> 1 and ] -> 0, any repetition of {1,0} equivalent to an inner bracket [] can be eliminated recursively. Applying this elimination procedure to all odd positions (starting with a left [ bracket) allows checking them for
membership in the Dyck set of constant length which is necessarilly a subset of the (2n n)-factorial. Enumeration of the resulting sets gives also the well known<a href="http://mathworld.wolfram.com/CatalanNumber.html">Catalan Sequence</a> as expected.

#2nd approach: altdyck.m + {S2.m. bitblocks.m}
This is an entirely different approach, based solely on the use of characteristic functions filtering out finer properties of subsets to converge to the final result. Their use justifies the extraction of certain indicator functions as compositions of
simpler or more fundamental ones in which case their fractality can bereduced into their composites. The decomposition is given
as follows:
A. For any interval {0,...,2^n} we isolate the subset of n 1s by the use of the <a href="http://mathworld.wolfram.com/DigitSum.html">Digit-Sum function</a> S2(i) which contains (2n n) elements from the general decomposition of powers of two into factorials. The S2 function is naturally self-similar and uniformly computable in any exp. interval.
B. We further isolate all odd members of the previous class and use a binary decoder to extract the pattern. This is then passed through another special encoder performing a lossless encoding of any bit sequence into its bitblock structure. This is represented as a set of coefficients of an alternating polynomial, or "Cluster polynomial" with "+" for 1s and "-" for 0s. The set of all such
polynomials / integer also has a naturally self-similar, recursive structure inside any exponential interval and it could have been constructed from the beginning without any binary decoder but this would make the example more complex.
C. The final indicator is given as the condition that no partial sum of the resulting coefficients should be negative.

The two programs give identical results tested upto 32 bits precision. The particular 'bitblock' function is a generic utility for further analyzing the inherent fractality of indicator functions. If the output of any of the two programs is again anlyzed its cluster structure is revealed to have islands of 0s with a characteristically self-similar scaling as in the below example from dyck(6)
