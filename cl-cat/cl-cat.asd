;;; cl-cat.asd
(in-package :cl-user)    ; どのパッケージにいるかわからないのでCL-USERパッケージにする
(defpackage :cl-cat-asd  ; ASDFのシステム定義用のパッケージをつくる
  (:use :cl :asdf))      ; 標準関数とASDFの関数をパッケージ修飾なしで呼べるようにする
(in-package :cl-cat-asd) ; 作ったパッケージにする

(defsystem :cl-cat
  :class :package-inferred-system   ; システム定義のスタイルをpackage-inferred-systemにする
  :description "cat command implemented with Common Lisp"
  :version "0.1"
  :author "t-sin"
  :license "Public Domain"
  :depends-on ("cl-cat/main"))  ; ソースファイルを相対パスで指定する
