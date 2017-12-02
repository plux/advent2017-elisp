(require 'dash)
(require 's)
(require 'f)

(defun parse-file (filename)
  (--map (-map 'string-to-int (s-split "\t" it))
         (s-lines (s-trim (f-read-text filename)))))

(defun solve-part1 (input)
  (-sum (--map (- (-max it) (-min it)) input)))

(defun solve-part2 (input)
  (-sum (-map 'find-divisor input)))

(defun find-divisor (row)
  (-max (-table-flat
         (lambda (num denom)
           (if (eq (% num denom) 0) (/ num denom) 0))
                 row row)))

(message
 "part1: %s, part2: %s"
 (solve-part1 (parse-file "input/day2.txt"))
 (solve-part2 (parse-file "input/day2.txt")))
