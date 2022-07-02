(defpackage hello
  (:use :cl)
  (:export :wow))
(in-package :hello)

(defun wow ()
  (print "hello!"))
