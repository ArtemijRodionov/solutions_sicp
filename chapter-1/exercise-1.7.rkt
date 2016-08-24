#lang racket

(define PRECISION 0.000000000000001)

(define (enough? guess improve-guess)
  (< (abs (- guess improve-guess)) PRECISION))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))



(define first_test_result (sqrt 0.00000001))
(define second_test_result (sqrt 100000000))

(define (test test_result expected_result) (if (< (- test_result expected_result) PRECISION)
                  "Test OK"
                  "Test failed"))

(test first_test_result 0.0001)
first_test_result

(test second_test_result 10000)
second_test_result
