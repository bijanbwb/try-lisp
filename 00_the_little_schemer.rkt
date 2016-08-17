; The Little Schemer
; Testing ground for code from The Little Schemer.
#lang racket

; Example List
(define cell '(1 2 3))
; > cell
; '(1 2 3)

; car
; > (car cell)
; 1

; cdr
; > (cdr cell)
; '(2 3)

; cons
; > (cons 0 cell)
; '(0 1 2 3)

; null?
; > (null? '())
; #t
; > (null? '(1))
; #f

; atom?
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
; > (atom? 'hello)
; #t
; > (atom? 1)
; #t
; > (atom? '())
; #f

; eq?
; > (eq? 'hello 'hello)
; #t

; lat?
(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
; > (lat? '(one two three))
; #t

; or
; (or #t #f)
; > #t

; member?
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
        (member? a (cdr lat)))))))
; (member? 'dolphins '(dolphins bills))
; > #t
