(display "Exercise 1.6")
(newline)

(define (square n) (* n n))
(define (good-enough? guess x)
  (display guess) (display " ") (display x)
  (newline)
  (define result (abs (- (square guess) x)))
  (display "Good-enough ") (display result)
  (newline)
  (< result 0.001))

(define (average x y)
  (display "Averageee ") (display x) (display " ") (display y)
  (newline)
  (/ (+ x y) 2))

(define (improve guess x)
  (display "Improve ") (display guess) (display "/") (display x)
  (newline)
  (average guess (/ x guess)))

(define (new-if predicate if-then else-then)
  (cond (predicate if-then)
        (else else-then)))

(define (sqrt-iter guess x)
  (newline)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter-new-if (improve guess x)
                      x)))

(define (sqrt fn x)
  (fn 1.0 x))

(define (iterate-iter func i max)
  (if (= max 0)
    'done
    (let ((new-i (+ i 1))
          (new-max (- max 1)))
        (func new-i)
        (iterate-iter func new-i new-max))))

(define (iterate max-iterations procedure)
  (iterate-iter procedure 0 max-iterations))

(define max-iterations 10)

(display (sqrt sqrt-iter 9))

;
; (display "Square Root (if):")
; (newline)
; (iterate max-iterations
;          (lambda (x)
;            (define result (sqrt sqrt-iter x))
;            (display (string-append "SQRT" "(" (number->string x) ") = " (number->string result)))
;            (newline)))
;
; (newline)
; (display "Square Root (new-if):")
; (newline)
; (iterate max-iterations
;          (lambda (x)
;            (define result (sqrt sqrt-iter-new-if x))
;            (display (string-append "SQRT" "(" (number->string x) ") = " (number->string result)))
;            (newline)))

