(display "Exercise 1.8")
(newline)

; x/y^2 + 2y
; ----------
;      3

(define (square n)
  (* n n))

(define (cube n)
  (* n n n))

(define (good-enough? guess x)
  (define result (abs (- (cube guess) x)))
  (display
    (string-append
      "[good-enough] Result: " 
      (number->string result)
      " (X: " (number->string x) ")"
      " (Guess: " (number->string guess) ")"))
  (newline)
  (< result 0.00000000001))

(define (average-fn x y)
  (/ (+ (/ x (square y)) (* 2 y))
     3))

(define (average x y)
  (define result (average-fn x y))
  (display
    (string-append
      "[average] Result: "
      (number->string result)
      " (x: " (number->string x) ", "
      "y: " (number->string y) ")"))
  (newline)
  result)

(define (improve guess x)
  (display
    (string-append
      "[improve] "
      " (x: " (number->string x) ", "
      "guess: " (number->string guess) ")"))
  (newline)
  (average x guess))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (cbrt-iter (improve guess x)
               x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(display (cbrt 27))
(newline)
