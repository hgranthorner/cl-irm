;;;; cl-irm.lisp

(in-package #:cl-irm)

(defvar *roster* '("Bob"
                   "Alice"
                   "Peter"
                   "Lisper 313373"))

(defun draw-roster (&key frame)
  (draw-box frame)
  (put-text frame 0 3 "Online")

  (loop for name in *roster*
        for row upfrom 1
        do (put-text frame row 1 name)))

(define-frame main (container-frame :split-type :horizontal) :on :root)

(define-frame roster (simple-frame :render #'draw-roster) :on main :w 20)

(define-frame chat (container-frame :split-type :vertical) :on main)

(define-frame log (log-frame) :on chat)

;; Edit-frame implements a single-line text editor.
;; It will misbehave if its height is not 1.
(define-frame input (edit-frame :prompt "> ") :on chat :h 1)

(defun finish-input ()
  ;; Get text from edit-frame
  (let ((text (get-text 'input)))
    ;; Append it to the log-frame
    (append-line 'log text)
    ;; And clear the text in edit-frame
    (clear-text 'input)))


(defun start (&rest args)
  (with-screen ()
    (append-line 'log "Enter some text.")
    (append-line 'log "Esc to quit")
    (loop
      (refresh)
      (let ((key (read-key)))
        (case key
          ;; Esc and Newline are handled here
          (#\Esc (return))
          (#\Newline (finish-input))
          (:key-up (cl-tui:scroll-log 'log 1))
          (:key-down (cl-tui:scroll-log 'log -1))
          ;; Everything else is sent to the edit-frame.
          (t (handle-key 'input key)))))))
