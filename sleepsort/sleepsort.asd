(defsystem "sleepsort"
  :version "0.1.0"
  :author "Eitarow Fukamachi"
  :license "LLGPL"
  :depends-on ("bordeaux-threads"
               "cl-annot")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "sleepsort/tests"))))

(defsystem "sleepsort/tests"
  :author "Eitarow Fukamachi"
  :license "LLGPL"
  :depends-on ("sleepsort"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for sleepsort"
  :perform (test-op (op c) (symbol-call :rove :run c)))
