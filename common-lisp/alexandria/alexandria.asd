(defsystem "alexandria"
  :version "1.0.1"
  :licence "Public Domain / 0-clause MIT"
  :description "Alexandria is a collection of portable public domain utilities."
  :author "Nikodemus Siivola and others."
  :long-description
  "Alexandria is a project and a library.

As a project Alexandria's goal is to reduce duplication of effort and improve
portability of Common Lisp code according to its own idiosyncratic and rather
conservative aesthetic.

As a library Alexandria is one of the means by which the project strives for
its goals.

Alexandria is a collection of portable public domain utilities that meet
the following constraints:

 * Utilities, not extensions: Alexandria will not contain conceptual
   extensions to Common Lisp, instead limiting itself to tools and utilities
   that fit well within the framework of standard ANSI Common Lisp.
   Test-frameworks, system definitions, logging facilities, serialization
   layers, etc. are all outside the scope of Alexandria as a library, though
   well within the scope of Alexandria as a project.

 * Conservative: Alexandria limits itself to what project members consider
   conservative utilities. Alexandria does not and will not include anaphoric
   constructs, loop-like binding macros, etc.
   Also, its exported symbols are being imported by many other packages
   already, so each new export carries the danger of causing conflicts.

 * Portable: Alexandria limits itself to portable parts of Common Lisp. Even
   apparently conservative and useful functions remain outside the scope of
   Alexandria if they cannot be implemented portably. Portability is here
   defined as portable within a conforming implementation: implementation bugs
   are not considered portability issues.

 * Team player: Alexandria will not (initially, at least) subsume or provide
   functionality for which good-quality special-purpose packages exist, like
   split-sequence. Instead, third party packages such as that may be
   \"blessed\"."
  :components
  ((:static-file "LICENCE")
   (:module "alexandria-1"
            :components ((:static-file "tests.lisp")
                         (:file "package")
                         (:file "definitions" :depends-on ("package"))
                         (:file "binding" :depends-on ("package"))
                         (:file "strings" :depends-on ("package"))
                         (:file "conditions" :depends-on ("package"))
                         (:file "io" :depends-on ("package" "macros" "lists" "types"))
                         (:file "macros" :depends-on ("package" "strings" "symbols"))
                         (:file "hash-tables" :depends-on ("package" "macros"))
                         (:file "control-flow" :depends-on ("package" "definitions" "macros"))
                         (:file "symbols" :depends-on ("package"))
                         (:file "functions" :depends-on ("package" "symbols" "macros"))
                         (:file "lists" :depends-on ("package" "functions"))
                         (:file "types" :depends-on ("package" "symbols" "lists"))
                         (:file "arrays" :depends-on ("package" "types"))
                         (:file "sequences" :depends-on ("package" "lists" "types"))
                         (:file "numbers" :depends-on ("package" "sequences"))
                         (:file "features" :depends-on ("package" "control-flow"))))
   (:module "alexandria-2"
            :components ((:static-file "tests.lisp")
                         (:file "package")
                         (:file "arrays" :depends-on ("package"))
                         (:file "control-flow" :depends-on ("package"))
                         (:file "sequences" :depends-on ("package"))
                         (:file "lists" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "alexandria/tests"))))

(defsystem "alexandria/tests"
  :licence "Public Domain / 0-clause MIT"
  :description "Tests for Alexandria, which is a collection of portable public domain utilities."
  :author "Nikodemus Siivola <nikodemus@sb-studio.net>, and others."
  :depends-on (:alexandria #+sbcl :sb-rt #-sbcl :rt)
  :components ((:file "alexandria-1/tests")
               (:file "alexandria-2/tests"))
  :perform (test-op (o c)
                    (let ((unexpected-failure-p nil))
                      (flet ((run-tests (&rest args)
                               (unless (apply (intern (string '#:run-tests) '#:alexandria/tests) args)
                                 (setf unexpected-failure-p t))))
                        (run-tests :compiled nil)
                        (run-tests :compiled t))
                      (when unexpected-failure-p
                        (error "Unexpected test failure")))))
