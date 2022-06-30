#|
  This file is a part of sleepsort project.
  Copyright (c) 2011 Eitarow Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage sleepsort
  (:use :cl)
  (:import-from :bordeaux-threads
;                :make-thread
;                :join-thread
  ))
(in-package :sleepsort)

(cl-annot:enable-annot-syntax)

@export
(defun sleepsort (&rest args)
  "A function to do 'sleep sort' arguments."
  (let* (result
         (threads (mapcar (lambda (arg)
                            (bordeaux-threads:make-thread
                             (lambda ()
                               (sleep arg)
                               (push arg result))))
                          args)))

    (dolist (thread threads)
      (bordeaux-threads:join-thread thread))

    (nreverse result)))

