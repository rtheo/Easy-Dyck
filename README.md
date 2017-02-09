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
membership in the Dyck set of constant length which is necessarilly a subset of the (2n n)-factorial.

#2nd approach: altdyck.m + {S2.m. bitblocks.m}
