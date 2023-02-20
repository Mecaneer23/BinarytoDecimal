#lang racket

(define (error)
    (display "Make sure you only input binary values") (newline)
    (exit)
)

(define (BinarytoDecimal binaryNumber)
    (define value (number->string binaryNumber))
    (define len (string-length value))
    (define output 0)
    (define position 0)
    (define chr #\0)
    (let loop ((times len))
        (set! chr (string-ref value position))
        (if (eq? chr #\1)
            (set! output (+ output (expt 2 (- (- len 1) position))))
            (if (eq? chr #\0)
                (set! output (+ output 0))
                (error)
            )
        )
        (set! position (+ position 1))
        (if (> times 1)
            (loop (- times 1))
            output
        )
    )
)

(display "Binary Number: ")
(display (number->string (BinarytoDecimal (read)))) (newline)