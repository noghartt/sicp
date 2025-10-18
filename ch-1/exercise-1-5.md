In the expression:

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
```

The difference over _normal-order evaluation_  and _applicative-order evaluation_ follows the idea
mentioned in the rule on 1.3 section.

First, for the _applicative-order evaluation_, the evaluation of the arguments happens before doing the
next apply in the procedure, which means that, when applying both arguments `0` and `(p)` into the `test`
function, it'll first evaluate the 0 and, after that, going into an infinite loop trying to evaluate `p`,
which is an infinitely recursive function.

In the other hand, looking into the _normal-order evaluation_, the evaluation of each arguments happens
when the apply of it's argument is needed. In that case, the `p` function would be in fact evaluate only
when applying it into the "else" branch of the `if`.

Doing a mental computation on that scenario:
1. Evaluate the `(test 0 (p))`
2. Expand into the test body with the `if`.
3. Evaluate the argument of `if`, in case, `(= x 0)`, which returns `#t`.
4. Considering that `if` is `#t` then go to the first branch of the conditional.
5. Returns 0.

See that, in that scenario, `p` was completely non-evaluated.

