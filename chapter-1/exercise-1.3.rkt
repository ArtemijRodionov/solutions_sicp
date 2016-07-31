#lang racket
(define (compare-numbers x y)
  (if (> x y) x y))

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-larger-square x y z)
  (if (= x (compare-numbers x y))
         (sum-of-squares x (compare-numbers y z))
         (sum-of-squares y (compare-numbers x z))))

(if (=
     (+
      (sum-of-larger-square 1 5 10)
      (sum-of-larger-square 5 1 10)
      (sum-of-larger-square 5 10 1))
     375)
    "Test OK"
    "Test fail")
