(defun c:door ()
  (while
    (setq p (getpoint "Select door point"))

    (setq arc (entget (ssname (ssget p '((0 . "ARC"))) 0)))

    (setq center (cdr (assoc 10 arc)))

    (command "_line" p center "")

    (setq rad (angle p center))

    (setq start1 center)

    (setq end1 (polar start1 rad 0.4))

    (command "_line" start1 end1 "")

    (setq startpoint (polar (cdr (assoc 10 arc)) (cdr (assoc 50 arc)) (cdr (assoc 40 arc))))
    (setq endpoint (polar (cdr (assoc 10 arc)) (cdr (assoc 51 arc)) (cdr (assoc 40 arc))))
    (if (equal (distance p startpoint) 0) (setq start2 endpoint) (setq start2 startpoint))

    (setq end2 (polar start2 rad 0.4))

    (command "_line" start2 end2 "")
  )
)
