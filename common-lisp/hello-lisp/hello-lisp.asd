(defsystem "hello-lisp"
  :description "hello-lisp: a sample Lisp system."
  :version "0.0.1"
  :author "Joe User <joe@example.com>"
  :licence "Public Domain"
;  :depends-on ("optima.ppcre" "command-line-arguments")
  :depends-on ("optima.ppcre") ; command-line-arguments は SBCL の uiopライブラリに含まれるので省略
  :components ((:file "packages")
               (:file "macros" :depends-on ("packages"))
               (:file "hello" :depends-on ("macros"))))
