This document describes how the if conditions were done
to choose wich output to display in `motd.sh` depending on
the available width and height of the terminal


## Conditions

```
A = There is enough **width** for **both** output and the separator
B = There is enough **width** for output **1**
C = There is enough **width** for output **2**
D = There is enough **height** for output **1**
E = There is enough **height** for output **1**
F = The output **2** is **prioritized**
```


## Constraints

```
A => B
A => C
```


## Outputs

```
R1 = print **both** outputs and the separator
R2 = print only output **1**
R3 = print only output **2**
R4 = print output **default**
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
