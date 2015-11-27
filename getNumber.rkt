#lang racket
(provide getNumber)


(define (getNumberb lst)
  (if (empty? lst) (list empty empty)
      (match (first lst)
        [(? char-numeric?) (let ([b (getNumberb (rest lst))])
                             (list (first b) (cons (first lst) (second b))))]
        [else (list lst empty)])))

(define (getNumberh lst acc)
  (if (empty? lst) (list empty (list->string acc))
  (match (first lst)
    [(? char-numeric?) (getNumberh (rest lst) (cons (first lst) acc))]
    [else (list lst (list->string acc))])))

(define (getNumber lst)
  (let ([l (getNumberb lst)])
    (list (first l) (list->string (second l)))))

;(check-eq? (getNumber (string->list "345")) '(() "345"))
;(check-eq? (getNumber (string->list "123+456")) (list (string->list "+456") "123"))