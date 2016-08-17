; Conditionals
#lang racket

; if
(if (= 1 1)
    "Apparently 1 is equal to 1."
    "Math doesn't seem to work in this world.")

; cond
(define x 5)
(cond [(= x 5) "The number is 5."]
      [(odd? x) "The number is odd."]
      [(even? x) "The number is even."]
      [else "The number is weird."])

; logic
(if (and 1 1)
    "Both of these are true."
    "At least one of theses is not true.")
(if (or 0 1)
    "At least one of these is true."
    "Neither of these is true.")
