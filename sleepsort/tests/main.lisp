#|
  This file is a part of sleepsort project.
  Copyright (c) 2011 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage sleepsort/tests/main
  (:use :cl
        :sleepsort
        :rove))
(in-package :sleepsort/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :sleepsort)' in your Lisp.

(deftest test-target-1
  (testing "Testing 'sleepsort'. Wait some seconds..."
    (ok (equal (sleepsort 5 3 6 3 6 3 1 4 7) '(1 3 3 3 4 5 6 6 7)))))
