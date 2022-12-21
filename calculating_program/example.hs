
-- define fold on int
foldInt _ init 0 = init
foldInt f init n = f n (foldInt f init (n - 1))

fac = foldInt (*) 1

facTail' 0 acc = acc
facTail' n acc = facTail' (n-1) (n*acc)

facTail n = facTail' n 1

-- fibonaci
--
-- specification
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- new definition
-- twoFib n = (fib n, fib (n + 1))
