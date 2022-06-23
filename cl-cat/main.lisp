;;; main.lisp
(in-package :cl-user)
(defpackage :cl-cat
  (:use cl)
  (:export :cat))  ; 今回作成する関数(まだない)をパッケージ外部に公開
(in-package :cl-cat)

(defun cat (input-stream output-stream)
  (loop
     for line = (read-line input-stream nil :eof)
     until (eq line :eof)
     do (write-line line output-stream)))
