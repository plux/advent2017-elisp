(require 'dash)
(require 's)
(require 'f)

(defun parse-file (filename)
  (--map (- it ?0) (s-trim (f-read-text filename))))

(defun solve (input n)
  (-sum (--map (if (eq (car it) (cdr it)) (car it) 0)
               (-zip input (-rotate n input)))))

(defun solve-part1 (input)
  (solve input 1))

(defun solve-part2 (input)
  (solve input (/ (length input) 2)))

(message
 "part1: %s, part2: %s"
 (solve-part1 (parse-file "input/day1.txt"))
 (solve-part2 (parse-file "input/day1.txt")))
