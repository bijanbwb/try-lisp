; Structs
#lang racket

; Definition
(struct person (name age))

; Instances
(define bijan (person 'Bijan 32))
(define joel (person 'Joel 28))
(define nick (person 'Nick 28))

; Accessors
(string-append "Names:")
(person-name bijan)
(person-name joel)
(person-name nick)

(string-append "Ages:")
(person-age bijan)
(person-age joel)
(person-age nick)

; List
(define employees (list bijan joel nick))
(person-name (first employees))
