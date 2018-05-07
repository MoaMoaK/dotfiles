This document describes how the if conditions were done
to choose wich output to display in `motd.sh` depending on
the available width and height of the terminal


## Conditions

```
A = There is enough WIDTH for BOTH OUTPUTS and the separator
B = There is enough WIDTH for OUTPUT 1
C = There is enough WIDTH for OUTPUT 2
D = There is enough HEIGHT for OUTPUT 1
E = There is enough HEIGHT for OUTPUT 1
F = The OUTPUT 2 is PRIORITIZED
```


## Constraints

```
A => B
A => C
```


## Outputs

```
R1 = print BOTH OUTPUTS and the separator
R2 = print only OUTPUT 1
R3 = print only OUTPUT 2
R4 = print OUTPUT DEFAULT
```


## Truth table with 6 variables

| A | B | C | D | E | F |   | R |
|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 0 |   | 4 |
| 0 | 0 | 0 | 0 | 0 | 1 |   | 4 |
| 0 | 0 | 0 | 0 | 1 | 0 |   | 4 |
| 0 | 0 | 0 | 0 | 1 | 1 |   | 4 |
| 0 | 0 | 0 | 1 | 0 | 0 |   | 4 |
| 0 | 0 | 0 | 1 | 0 | 1 |   | 4 |
| 0 | 0 | 0 | 1 | 1 | 0 |   | 4 |
| 0 | 0 | 0 | 1 | 1 | 1 |   | 4 |
| 0 | 0 | 1 | 0 | 0 | 0 |   | 4 |
| 0 | 0 | 1 | 0 | 0 | 1 |   | 4 |
| 0 | 0 | 1 | 0 | 1 | 0 |   | 3 |
| 0 | 0 | 1 | 0 | 1 | 1 |   | 3 |
| 0 | 0 | 1 | 1 | 0 | 0 |   | 4 |
| 0 | 0 | 1 | 1 | 0 | 1 |   | 4 |
| 0 | 0 | 1 | 1 | 1 | 0 |   | 3 |
| 0 | 0 | 1 | 1 | 1 | 1 |   | 3 |
| 0 | 1 | 0 | 0 | 0 | 0 |   | 4 |
| 0 | 1 | 0 | 0 | 0 | 1 |   | 4 |
| 0 | 1 | 0 | 0 | 1 | 0 |   | 4 |
| 0 | 1 | 0 | 0 | 1 | 1 |   | 4 |
| 0 | 1 | 0 | 1 | 0 | 0 |   | 2 |
| 0 | 1 | 0 | 1 | 0 | 1 |   | 2 |
| 0 | 1 | 0 | 1 | 1 | 0 |   | 2 |
| 0 | 1 | 0 | 1 | 1 | 1 |   | 2 |
| 0 | 1 | 1 | 0 | 0 | 0 |   | 4 |
| 0 | 1 | 1 | 0 | 0 | 1 |   | 4 |
| 0 | 1 | 1 | 0 | 1 | 0 |   | 3 |
| 0 | 1 | 1 | 0 | 1 | 1 |   | 3 |
| 0 | 1 | 1 | 1 | 0 | 0 |   | 2 |
| 0 | 1 | 1 | 1 | 0 | 1 |   | 2 |
| 0 | 1 | 1 | 1 | 1 | 0 |   | 2 |
| 0 | 1 | 1 | 1 | 1 | 1 |   | 3 |
| 1 | 0 | 0 | 0 | 0 | 0 |   | x |
| 1 | 0 | 0 | 0 | 0 | 1 |   | x |
| 1 | 0 | 0 | 0 | 1 | 0 |   | x |
| 1 | 0 | 0 | 0 | 1 | 1 |   | x |
| 1 | 0 | 0 | 1 | 0 | 0 |   | x |
| 1 | 0 | 0 | 1 | 0 | 1 |   | x |
| 1 | 0 | 0 | 1 | 1 | 0 |   | x |
| 1 | 0 | 0 | 1 | 1 | 1 |   | x |
| 1 | 0 | 1 | 0 | 0 | 0 |   | x |
| 1 | 0 | 1 | 0 | 0 | 1 |   | x |
| 1 | 0 | 1 | 0 | 1 | 0 |   | x |
| 1 | 0 | 1 | 0 | 1 | 1 |   | x |
| 1 | 0 | 1 | 1 | 0 | 0 |   | x |
| 1 | 0 | 1 | 1 | 0 | 1 |   | x |
| 1 | 0 | 1 | 1 | 1 | 0 |   | x |
| 1 | 0 | 1 | 1 | 1 | 1 |   | x |
| 1 | 1 | 0 | 0 | 0 | 0 |   | x |
| 1 | 1 | 0 | 0 | 0 | 1 |   | x |
| 1 | 1 | 0 | 0 | 1 | 0 |   | x |
| 1 | 1 | 0 | 0 | 1 | 1 |   | x |
| 1 | 1 | 0 | 1 | 0 | 0 |   | x |
| 1 | 1 | 0 | 1 | 0 | 1 |   | x |
| 1 | 1 | 0 | 1 | 1 | 0 |   | x |
| 1 | 1 | 0 | 1 | 1 | 1 |   | x |
| 1 | 1 | 1 | 0 | 0 | 0 |   | 4 |
| 1 | 1 | 1 | 0 | 0 | 1 |   | 4 |
| 1 | 1 | 1 | 0 | 1 | 0 |   | 3 |
| 1 | 1 | 1 | 0 | 1 | 1 |   | 3 |
| 1 | 1 | 1 | 1 | 0 | 0 |   | 2 |
| 1 | 1 | 1 | 1 | 0 | 1 |   | 2 |
| 1 | 1 | 1 | 1 | 1 | 0 |   | 1 |
| 1 | 1 | 1 | 1 | 1 | 1 |   | 1 |


## Results 

Those results come from http://www.32x8.com/var6.html
```
R1 = A.D.E
R2 = B./C.D + B.D./E + /A.B.D./F
R3 = /B.C.E + C.D./E + /A.C.E.F
R4 = /B./C + /C./D + /B./E + /D./E
```
