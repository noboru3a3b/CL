;;;; clack-server.lisp

(in-package :cl-user)
(defpackage :clack-server
  (:use cl)
  (:use clack))
(in-package :clack-server)

;; アプリの動作を記述
(defvar app
  #'(lambda (env)
      ;; "envを宣言だけで使ってない"という警告を止めるためと思う．たぶん
      (declare (ignore env))
      ;; 200の時の処理
      '(200
        ;; header
        (:content-type "text/plain")
        ;; body
        ;; 要するにここに処理を書けばwebアプリになる
        ;; envにクライアント側の情報とか入ってる
        ;; http://clacklisp.org/doc/#The%20Environment 参照
        ("Hello, Clack!"))))

;; 上で書いたアプリをclackupで起動する
(defvar *handler*
  (clackup app
           ;; ;; apacheとmod_lispで会話する時はコメントアウトをはずす
           ;; ;; ローカルで試すだけならコメントのまま
           ;; :server :apache
           :port 5000
           :debug t))

;; *handler*にハンドラが入ったので
;; (clack:stop *handler*)
;; で止められる
