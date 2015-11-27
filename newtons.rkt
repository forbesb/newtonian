#lang racket
(provide newtons)


(define (newtons lvl seed f df)
  (cond [(equal? lvl 0) seed]
        [else
         (display seed)
         (display ", ")
         (newtons
          (- lvl 1)
          (- seed (/ (f seed) (df seed)))
          f df)]))

(define (tokenize val)
  ...)