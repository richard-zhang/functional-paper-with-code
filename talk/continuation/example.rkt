#lang racket
(define q 200)
(define z
  (if (> q 100) (+ 5 4) (* 2 2)))

(define fact
  (lambda (x)
    (if (< x 1)
        1
        (* x (fact (- x 1)))
        )))

(let (
      (my-val (call/cc
               (lambda (cont)
                 (display "This will be executed\n")
                 (cont 5)
                 (display "This will not be executed\n")
                 )
               ))
      )
  (display (* 2 my-val))
  )

(let (
      (my-val (call/cc
               (lambda (cont)
                 cont)))
      )
  (if (procedure? my-val)
      (begin
        (display "First time through\n")
        (my-val 5)
        (display "Second time through\n")
        )
      (begin
        (display "Third time through\n")
        (display (* 3 my-val))
        )
      )
  )

;;; cooperative multithread
