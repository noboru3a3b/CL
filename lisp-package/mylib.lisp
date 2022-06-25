;; mylib.lisp

(provide 'mylib)

(defpackage mylib
  (:use common-lisp)
  (:export hello))

(in-package mylib)

(defvar hello "Hello, My Library!")
