;;; artem-factorial.el ---  -*- lexical-binding: t; -*-

(defun art-fact-on-return (n)
  "Calculate factorial on recursive return"
  (if (= n 1)
      1
    (* n (art-fact-on-return (- n 1)))))

;; { art-fact-on-return args: (7)
;; :{ art-fact-on-return args: (6)
;; ::{ art-fact-on-return args: (5)
;; :::{ art-fact-on-return args: (4)
;; ::::{ art-fact-on-return args: (3)
;; :::::{ art-fact-on-return args: (2)
;; ::::::{ art-fact-on-return args: (1)
;; ::::::} art-fact-on-return result: 1
;; :::::} art-fact-on-return result: 2
;; ::::} art-fact-on-return result: 6
;; :::} art-fact-on-return result: 24
;; ::} art-fact-on-return result: 120
;; :} art-fact-on-return result: 720
;; } art-fact-on-return result: 5040


(cl-defun art-fact-on-descent (&optional (n 1) (fact 1))
  "Calculate factorial on recursive descent"
  (if (= n 1)
      fact
    (art-fact-on-descent (- n 1) (* fact n))))

;; { art-fact-on-descent args: nil
;; } art-fact-on-descent result: 1
;; { art-fact-on-descent args: (7 1)
;; :{ art-fact-on-descent args: (6 7)
;; ::{ art-fact-on-descent args: (5 42)
;; :::{ art-fact-on-descent args: (4 210)
;; ::::{ art-fact-on-descent args: (3 840)
;; :::::{ art-fact-on-descent args: (2 2520)
;; ::::::{ art-fact-on-descent args: (1 5040)
;; ::::::} art-fact-on-descent result: 5040
;; :::::} art-fact-on-descent result: 5040
;; ::::} art-fact-on-descent result: 5040
;; :::} art-fact-on-descent result: 5040
;; ::} art-fact-on-descent result: 5040
;; :} art-fact-on-descent result: 5040
;; } art-fact-on-descent result: 5040

(ert-deftest art-fact-on-return ()
  "Test my factorial on return is trustworthy"
  (should (equal (fact-on-return 7) 5040)))

(ert-deftest art-fact-on-descent ()
  "Test my factorial on descent is trustworthy"
  (should (equal (fact-on-descent 7) 5040)))
