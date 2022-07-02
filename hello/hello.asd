(defsystem "hello"
  :version "0.1.0"
  :author "aaa"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "hello/tests"))))

(defsystem "hello/tests"
  :author "aaa"
  :license ""
  :depends-on ("hello"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for hello"
  :perform (test-op (op c) (symbol-call :rove :run c)))
