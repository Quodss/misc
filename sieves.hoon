:-  %say  |=  *  :-  %noun
::
::
|^
=+  n=500
=+  ~>  %bout
  (erastothenes-sieve-simple n)
=>  +
=+  ~>  %bout
  (erastothenes-sieve-binary n)
~
::
++  erastothenes-sieve-binary
  |=  n-max=@
  ^-  @ub
  ::  0 means prime, 1 means not a prime, in order of significance
  ::
  =/  out=@ub  0b11
  =/  cursor=@  2
  |-  ^-  @ub
  =*  outer-loop  $
  ?:  =(cursor n-max)
    out
  ::  update sieve if cursor points at a prime
  ::
  =?  out  =(0 (cut 0 [cursor 1] out))
    =/  index=@  (mul cursor cursor)
    |-  ^-  @ub
    =*  inner-loop  $
    ?:  (gth index n-max)
      out
    inner-loop(index (add index cursor), out (con out (bex index)))
  outer-loop(cursor +(cursor))
::
++  erastothenes-sieve-simple
  |=  n-max=@
  ^-  (list ?)
  ::  0 and 1 are not primes, test the rest
  ::
  =/  out=(list ?)  [| | (reap (dec n-max) &)]
  =/  cursor=@  2
  |-  ^-  (list ?)
  =*  outer-loop  $
  ?:  =(cursor n-max)
    out
  ::  update sieve if cursor points at a prime
  ::
  =?  out  (snag cursor out)
    =/  index=@  (mul cursor cursor)
    |-  ^-  (list ?)
    =*  inner-loop  $
    ?:  (gth index n-max)
      out
    inner-loop(index (add index cursor), out (snap out index |))
  outer-loop(cursor +(cursor))
::
--
