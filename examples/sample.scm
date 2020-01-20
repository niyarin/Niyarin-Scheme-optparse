(include "../niyarin_optparse/niyarin_optparse.scm")

(import (scheme base)
        (scheme write)
        (niyarin optparse))

(define (print-help option)
  (display  (niyarin-optparse/generate-help-text option '(program-name "test program"))))

(define (run option)
  (display "do something")
  (newline)
  (write option)
  (newline))

(define (main)
   (let ((cmd-option
           '(("--help" "-h" (help "Display a help message and exit."))
             ("--foo" "-f" (destination "INPUT") (nargs 1) (help "foooooooooooooo"))
             ("--foo2" (destination "INPUT") (nargs *))
             ("--foo3 " (nargs 3))
             ("files" (nargs *)))))
     (let ((parsed-option (niyarin-optparse/optparse cmd-option '("--help"))))
       (if (assoc "--help" parsed-option string=?)
         (print-help cmd-option)
         (run parsed-option)))))

(main)
