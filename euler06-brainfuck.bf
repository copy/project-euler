[
  Projekt Euler Problem 6
  Requires interpreter with 32 bit cells (tested with http://copy.sh/brainfuck/)
  The result is written to cell 5, not printed
]

generate 100 in cell 2
++++++++++
[>++++++++++<-]>

generate sum of the first 100 digits in cell 4
[
  [->+>+<<]
  >>
  [->+<]
  <
  [-<+>]
  <
  -
]
>>>

square the sum in cell 5
[-<+<+>>]
<<
[
  -
  >
  [->+>+<<]
  >
  [-<+>]
  <<
]
>
[-]
<<

generate 100 in cell 0
++++++++++
[<++++++++++>-]<

loop from 100 to 1
[
  [->+>+>+<<<]
  >
  [-<+>]
  >
  subtract i*i from the result
  [
    -
    >
    [->+>-<<]
    >
    [-<+>]
    <<
  ]
  >
  [-]
  <<<
  -
]


