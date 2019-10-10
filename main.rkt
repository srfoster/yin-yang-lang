#lang racket

(provide yin-yang
         dot)

(require 2htdp/image "./assets.rkt")

(define (yin-yang #:black
                  (i1 (dot 'white))
                  #:white
                  (i2 (dot 'black))
                  #:rotation (r 0))

  (rotate r (place-left-side
             (rotate (- r) i2)
             (place-right-side
              (rotate (- r) i1)
              blank-yin-yang))))

(define (place-right-side i base)
  (place-image
   i
   (- 900 225) 450
   base))

(define (place-left-side i base)
  (place-image
   i
   225 450
   base))

(define (pad n i)
  (overlay i
           (rectangle (+ n (image-width i))
                      (+ n (image-height i))
                      'solid 'transparent)))

(define (dot color)
  (circle 75 'solid color))

(module+ test
  (yin-yang #:black (dot 'white)
            #:white (dot 'black))

  (yin-yang #:rotation -90
            #:black (text "Story" 60 'white)
            #:white (text "Meta-Story" 60 'black)))

