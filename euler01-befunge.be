v Invoke with 
  fungi euler01-befunge.be
  http://hackage.haskell.org/package/Fungi

  line 1 creates 1000 on the stack and writes 0 to cell 0,0
  line 2 calculates mod 5
  line 3 is the decrement loop; it also calculates mod 3
  line 4 tests the mod 5, on the right side is the code that increments the result in cell 0,0 by the current n
  line 6 prints the result and quits

>52*::**000pv
 v%5<
    |%3:::-1<< 
v_: >00g+00p|
>$           ^
       @.g00<
