;;;; cl-irm.asd

(asdf:defsystem #:cl-irm
  :description "Describe cl-irm here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :build-operation "program-op"
  :build-pathname "cl-irm"
  :entry-point "cl-irm:start"
  :depends-on (#:alexandria
               #:cl-tui)
  :components ((:file "package")
               (:file "cl-irm")))
