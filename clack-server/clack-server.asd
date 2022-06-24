;;; clack-server.asd
(in-package :cl-user)    ; どのパッケージにいるかわからないのでCL-USERパッケージにする
(defpackage :clack-server-asd  ; ASDFのシステム定義用のパッケージをつくる
  (:use :cl :asdf))      ; 標準関数とASDFの関数をパッケージ修飾なしで呼べるようにする
(in-package :clack-server-asd) ; 作ったパッケージにする

(defsystem :clack-server
  :class :package-inferred-system   ; システム定義のスタイルをpackage-inferred-systemにする
  :description "Clack Server test on Roswell"
  :version "0.1"
  :author "t-sin"
  :license "Public Domain"
  :depends-on ("clack-server/clack-server"))  ; ソースファイルを相対パスで指定する
