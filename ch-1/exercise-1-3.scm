(display "Exercises 1.3")
(newline)

(define (square n) (* n n))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (prc x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(define (every func lst)
  (for-each (lambda (x)
              (define result (func (eval x (interaction-environment))))
              (if (eq? result #t)
                () ; Do nothing
                (error "There's a false assertion")))
            lst))

(define asserts '(
                  (= (prc 10 10 10) (sum-of-squares 10 10))
                  (= (prc 1 10 10) (sum-of-squares 10 10))
                  (= (prc 10 1 10) (sum-of-squares 10 10))
                  (= (prc 10 10 1) (sum-of-squares 10 10))
                  (= (prc 1 10 100) (sum-of-squares 10 100))
                  (= (prc 1 100 10) (sum-of-squares 10 100))
                  (= (prc 10 1 100) (sum-of-squares 10 100))
                  (= (prc 10 100 1) (sum-of-squares 10 100))
                  (= (prc 100 10 1) (sum-of-squares 10 100))
                  (= (prc 100 1 10) (sum-of-squares 10 100))
                ))

(every (lambda (x) (eq? x #t)) asserts)

