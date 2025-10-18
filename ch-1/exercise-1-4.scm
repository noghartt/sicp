(display "Exercise 1.4")
(newline)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(display (a-plus-abs-b 10 12))
(newline)

(display (a-plus-abs-b 10 -12))
(newline)

