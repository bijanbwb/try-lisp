; Snake
;
; NOTE: This program is not fully implemented and will not
; run in its current state.
#lang racket

(require 2htdp/universe 2htdp/image)

(struct pit (snake goos))
(struct snake (dir segs))
(struct posn (x y))
(struct goo (loc expire))

(define snake-example
  (snake "up" (list (posn 1 1) (posn 1 3))))

(define goo-example
  (list (goo (posn 1 0) 3) (goo (posn 5 8) 15)))

(define pit-example
  (pit snake-example goo-example))

(define (start-snake)
  (big-bang (pit (snake "right" (list (posn 1 1)))
                 (list (goo-example)
                       (goo-example)
                       (goo-example)
                       (goo-example)
                       (goo-example)
                       (goo-example)))
            (on-tick next-pit TICK-RATE)
            (on-key direct-snake)
            (to-draw render-pit)
            (stop-when dead? render-end)))