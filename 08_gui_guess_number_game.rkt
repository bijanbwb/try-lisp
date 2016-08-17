; GUI Guessing Game
;
; NOTE: This program is not fully implemented and will not
; run in its current state.
;
; The user will start with a number, and then the game will
; make guesses as to what that number is. The user should
; be able to indicate whether the current guess is higher
; or lower.
#lang racket

; Require "How to Design Programs" Libraries
; Allows us to use big-bang to create a world.
; The world will contain the state and the view.
(require 2htdp/universe 2htdp/image)

; Struct
; Track lower and upper bounds.
(struct interval (small big))

; Constants
(define SIZE 100)
(define TEXT-SIZE 12)
(define TEXT-X 15)
(define TEXT-Y 15)
(define TEXT-UPPER-Y 15)
(define TEXT-LOWER-Y 30)
(define HELP-TEXT
  (text "Use the UP key for larger numbers, DOWN key for smaller ones."
        TEXT-SIZE
        "blue"))
(define HELP-TEXT-2
  (text "Press the = key when your number is guessed; Q to quit."
        TEXT-SIZE
        "blue"))
(define COLOR "red")
(define WIDTH 500)
(define HEIGHT 500)
(define MT-SC
  (place-image/align
   HELP-TEXT TEXT-X TEXT-UPPER-Y "left" "top"
   (place-image/align
    HELP-TEXT-2 TEXT-X TEXT-LOWER-Y "left" "bottom"
    (empty-scene WIDTH HEIGHT))))

; Functions
(define (smaller w)
  (interval (interval-small w)
            (max (interval-small w) (sub1 (guess w)))))

(define (bigger w)
  (interval (min (interval-big w) (add1 (guess w)))
            (interval-big w)))

(define (guess w)
  (quotient (+ (interval-small w) (interval-big w)) 2))

(define (deal-with-guess w key)
  (cond [(key=? key "up") (bigger w)]
        [(key=? key "down") (smaller w)]
        [(key=? key "q") (stop-with w)]
        [(key=? key "=") (stop-with w)]
        [else w]))

(define (render w)
  (overlay (text (number->string (guess w)) SIZE COLOR) MT-SC))

(define (render-last-scene w)
  (overlay (text "End" SIZE COLOR) MT-SC))

(define (single? w)
  (= (interval-small w) (interval-big w)))

; Start
(define (start lower upper)
  (big-bang (interval lower upper)
            (on-key deal-with-guess)
            (to-draw render)
            (stop-when single? render-last-scene)))
