(require 'dash)
(require 's)
(require 'f)

(defun parse-file (filename)
  (vconcat (-map 'string-to-int (s-lines (s-trim (f-read-text filename))))))

(defun solve (v n pos add-offset)
  (while (and (>= pos 0) (< pos (length v)))
    (let ((offset (elt v pos)))
      (eval add-offset)
      (setq pos (+ pos offset))
      (setq n (1+ n))))
  n)

(message
 "part1: %s, part2: %s"
 (solve (parse-file "input/day5.txt") 0 0 '(aset v pos (1+ offset)))
 (solve (parse-file "input/day5.txt") 0 0 '(if (>= offset 3)
                                               (aset v pos (1- offset))
                                             (aset v pos (1+ offset)))))
