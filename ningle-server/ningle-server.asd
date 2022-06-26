;;; ningle-server.asd
(in-package :cl-user)    ; どのパッケージにいるかわからないのでCL-USERパッケージにする
(defpackage :ningle-server-asd  ; ASDFのシステム定義用のパッケージをつくる
  (:use :cl :asdf))      ; 標準関数とASDFの関数をパッケージ修飾なしで呼べるようにする
(in-package :ningle-server-asd) ; 作ったパッケージにする

(defsystem :ningle-server
  :class :package-inferred-system   ; システム定義のスタイルをpackage-inferred-systemにする
  :description "Ningle Server test on Roswell"
  :version "0.1"
  :author "t-sin"
  :license "Public Domain"
  :depends-on ("ningle-server/ningle-server"))  ; ソースファイルを相対パスで指定する
