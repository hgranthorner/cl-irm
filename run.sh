#!/bin/sh

sbcl \
    --eval '(ql:quickload "swank")' \
    --eval '(swank:create-server :dont-close t)' \
    --eval '(ql:quickload "cl-irm")' \
    --eval '(cl-irm::start)' \
    --no-linedit
