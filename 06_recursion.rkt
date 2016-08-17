; Recursion and Higher-Order Functions
#lang racket

; my-length
; > (my-length '(1 2 3))
; 3
(define (my-length l)
  (if (empty? l)
      0
      (add1 (my-length (rest l)))))

; my-length-2 (same as above using cond)
; > (my-length '(1 2 3))
; 3
(define (my-length-2 l)
  (cond [(empty? l) 0]
        [else (add1 (my-length (rest l)))]))

; my-map
; > (my-map add1 '(1 2 3))
; '(2 3 4)
(define (my-map func l)
  (cond [(empty? l) empty]
        [else (cons (func (first l)) (my-map func (rest l)))]))

; my-filter
; > (my-filter integer? '(1 2 3 "hello"))
; '(1 2 3)
(define (my-filter pred l)
  (cond [(empty? l) empty]
        [(pred (first l)) (cons (first l) (my-filter pred (rest l)))]
        [else (my-filter pred (rest l))]))

; my-ormap (any?)
; > (my-ormap integer? '("hello" "world" 1))
; #t
(define (my-ormap pred l)
  (cond [(empty? l) #f]
        [else (or (pred (first l))
                  (my-ormap pred (rest l)))]))

; my-andmap (all?)
; > (my-ormap integer? '(1 2 3))
; #t
(define (my-andmap pred l)
  (cond [(empty? l) #t]
        [else (and (pred (first l))
                   (my-andmap pred (rest l)))]))

; my-foldr
; > (my-foldr + 0 '(1 2 3))
; 6
; > (my-foldr cons empty '(a b c))
; '(a b c)
(define (my-foldr f base l)
  (cond [(empty? l) base]
        [else (f (first l) (my-foldr f base (rest l)))]))

; my-foldl
; > (my-foldl cons empty '(a b c))
; '(c b a)
(define (my-foldl f base l)
  (cond [(empty? l) base]
        [else (my-foldl f (f (first l) base) (rest l))]))
