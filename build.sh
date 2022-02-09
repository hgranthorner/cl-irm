#!/bin/sh

buildapp \
    --output cl-irm \
    --load ~/quicklisp/setup.lisp \
    --eval '(ql:quickload :slynk)' \
    --eval '(ql:quickload :cl-irm)' \
    --entry cl-irm:main
