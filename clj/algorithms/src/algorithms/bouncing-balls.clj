(ns bouncing-balls.core)

(comment
    Given a ball is dropped from height 'h':
    when the ball hits the ground with a bounce of 'bounce'
    how many times would you see the ball if you had a viewing window 
    'window'.
  
      [ex] h 3, bounce 0.66, window 1.5
        bounce 1: (height 3)
        bounce 2: (height 1.98)
        bounce 3: (height 1.3)
        bounce 4: (height 0.8) ; CAN NOT SEE IN WINDOW.
        result : 3
)

; read, if the parameters are valid, count the number of bounces, else -1.
(defn bouncing-balls [h b w]
  (if (validate-bounce h b w)
    (count-num-bounces h b w 0)
    (-1)))

;; a valid bouncing ball has the following characteristics
;;   h > 0,  0 < b < 1,  w < h
(defn validate-bounce [h b w]
  (not (or (<= h 0) (<= b 0) (>= b 1) (>= w h))))

; read, calculate bounce height. If within the window, calculate the next 
; bounce. else, return the count of total bounces
(defn count-num-bounces [h b w c]
   (let [h2 (* h b)]
     (if (>= h2 b) 
       (count-num-bounces h2 b w (+ c 1))
       (c) )))


;; ----------------------
;; TEST 
;; ----------------------

(= (validate-bounce 3 0.65 1.5) true)
(= (validate-bounce 3 1 1.5) false)
;; (bouncing-balls 30 0.66 1.5)
(= (bouncing-balls 3 0.66 1.5) 3)
(= (bouncing-balls 30 0.66 1.5) 15)
(= (bouncing-balls 3 1 1.5) -1)
