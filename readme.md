Copyright Raducanu George-Cristian 311CA 2021-2022

------------------------------------------------------------------------------------------------------------------------------------
Homework no. 3 - PCLP2

------------------------------------------------------------------------------------------------------------------------------------
Task 1

------------------------------------------------------
"SORTARE"
For task 1, the inplace sort, I first determined with a loop the address of element '1' and stored it in eax
Then with 2 imbricated loops, one for x(esi) = n:1 and the second for searching the address of x i solved the problem
In terms of pseudocode my idea can be written as
d = 0;
for i = n:1
	a = search(i); an address
	[a + 4] = d; ;; i->next = d
	d = a;
endfor
Although this algorithm has O(n^2) it proves to be relatively efficient and easy to implement

-------------------------------------------------------------------------------------------------------------------------------------
Task 2

-------------------------------------------------------
"CMMMC"
Firstly using Euclid's algorithm with substractions I determined the gcd of a and b:
while a != b
	if a > b
		a = a - b;
	endif
	if a < b
		b = b - a;
	endif
endwhile
result in a (in my program it is stored in ecx)
Now cmmmc(a, b) = (a * b) / cmmdc(a, b); operations which are with mul and div functions

-------------------------------------------------------
"PARANTEZE"
As the problem only requires the parantezation of '(' and ')' type it is enough to do a simple algorithm, not requiring stack
The idea is at each time in the vector to keep track of the number of '(' and ')', if the number of open paranthesis is greater
then the closed ones continue, else break and return 0. If we have reached the end and the number of '(' and ')' are equal then
the string is ok, else return 0
