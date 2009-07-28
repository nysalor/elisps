  ;; 10 �󤴤Ȥ˲�®
(defvar scroll-speedup-count 5)
;; 10 �󲼥�����������Ϥ���ȡ�������� 1+1 �� 2 �Ԥ��Ĥ�
;; ��ư�ˤʤ�
(defvar scroll-speedup-rate 1)
;; 800ms �вᤷ�����̾�Υ���������᤹
(defvar scroll-speedup-time 800)

;; �ʲ��������ѿ�
(defvar scroll-step-default 1)
(defvar scroll-step-count 1)
(defvar scroll-speedup-zero (current-time))

(defun scroll-speedup-setspeed ()
  (let* ((now (current-time))
         (min (- (car now) (car scroll-speedup-zero)))
         (sec (- (car (cdr now)) (car (cdr scroll-speedup-zero))))
         (msec (/ (- (car (cdr (cdr now)))
                     (car (cdr (cdr scroll-speedup-zero))))
                     1000))
         (lag (+ (* 60000 min) (* 1000 sec) msec)))
    (if (> lag scroll-speedup-time)
        (progn
          (setq scroll-step-default 1)
          (setq scroll-step-count 1))
      (setq scroll-step-count (+ 1 scroll-step-count)))
    (setq scroll-speedup-zero (current-time))))

(defun scroll-speedup-next-line (arg)
  (if (= (% scroll-step-count scroll-speedup-count) 0)
      (setq scroll-step-default
            (+ scroll-speedup-rate scroll-step-default)))
  (if (string= arg 'next)
      (line-move scroll-step-default)
    (line-move (* -1 scroll-step-default))))

(defadvice next-line
  (around next-line-speedup activate)
  (if (and (string= last-command 'next-line)
           (interactive-p))
      (progn
        (scroll-speedup-setspeed)
        (scroll-speedup-next-line 'next))
    (setq scroll-step-default 1)
    (setq scroll-step-count 1)
    ad-do-it))

(defadvice previous-line
  (around previous-line-speedup activate)
  (if (and (string= last-command 'previous-line)
           (interactive-p))
      (progn
        (scroll-speedup-setspeed)
        (scroll-speedup-next-line 'previous))
    (setq scroll-step-default 1)
    (setq scroll-step-count 1)
    ad-do-it))
