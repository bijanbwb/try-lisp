; Hello World
; Prints "Hello World" to the screen using strings and
; lists with car and cdr.
#lang racket

; Variables
(define h "Hello")
(define w "World")

; List
(define helloworld (list h w))

; Use car and cdr to find Strings in List
(define hello (car helloworld))
(define world (car (cdr helloworld)))

; Print String
(string-append hello " " world)
