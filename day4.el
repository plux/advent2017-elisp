(require 'dash)
(require 's)
(require 'f)

(defun parse-file (filename)
  (-map 's-split-words (s-lines (s-trim (f-read-text filename)))))

(defun parse-file-part2 (filename)
  (--map (--map (-sort '> (string-to-list it)) (s-split-words it))
         (s-lines (s-trim (f-read-text filename)))))

(defun solve (input)
  (length (--filter (eq (length (-distinct it)) (length it)) input)))

(message
 "part1: %s, part2: %s"
 (solve (parse-file "input/day4.txt"))
 (solve (parse-file-part2 "input/day4.txt")))
