#lang racket

(define PRECISION 0.000001)

(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (enough? guess improved-guess)
  (< (abs (- guess improved-guess)) PRECISION))

(define (coob-root-iter guess x)
  (if (enough? guess (improve guess x))
      guess
      (improve guess x)))

(define (coob-root x)
  (coob-root-iter 1.0 x))

(coob-root 27)