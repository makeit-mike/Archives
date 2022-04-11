(ns algorithms.richest)

;; Given a list of customers, return the customer with the most wealth.
;; c1 - 1 2 3 == 6
;; c2 - 5 5 5 == 15
;; c3 - 3 1 4 == 8
;; c2 has the most wealth.

(defn richest-cust [c] "[[Int]] -> Int"
  (->>
   (map-sum c)
   (max-at-index)))

(defn max-at-index [c] "[Int] -> Int"
  (->>
   (apply max c)
   (.indexOf c)))

(defn map-sum [c] "[[Int]] -> [Int]"
  (map #(reduce + %) c))

;; -------------- TESTING ----------------
(def x [[1 2 3] [5 5 5] [3 1 4]]) 
(richest-cust x)