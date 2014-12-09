#lang typed/racket/base

;; keeps track of time

(require "testing-param.rkt"
         typed/racket/date)

(provide current-timestamp
         increment-test-timestamp!
         EPOCH)

;; when testing, use bogus timestamps starting at EPOCH,
;; and artificially incremented by calls to increment-test-timestamp!

;; return the current timestamp
(define (current-timestamp)
  (cond [(testing?) (unbox testing-timestamp-box)]
        [else (current-seconds)]))

;; the beginning of time for testing
(define EPOCH (find-seconds 0 0 0 1 1 1971))

(: testing-timestamp-box (Boxof Integer))
(define testing-timestamp-box (box EPOCH))

(define (increment-test-timestamp!)
  (set-box! testing-timestamp-box (add1 (unbox testing-timestamp-box))))