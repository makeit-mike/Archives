(ns algorithms.phone
    (:require [clojure.test :refer :all]))

;; brute force
(defn create-phone-number [pn]
  (str "(" (collapse-to-str (slice pn 0 3)) ") "
       (collapse-to-str (slice pn 3 3)) "-"
       (collapse-to-str (slice pn 6 4))))

;; cleaner, simpler, better
(defn create-phone-number2 [nums]
    (apply format "(%d%d%d) %d%d%d-%d%d%d%d" nums))

;; ------------------
;; Helpers
;; ------------------

;; Takes a list and s mooshes it into a string.
(defn collapse-to-str [xs]
  (clojure.string/join "" xs))

;; I am new to clojure, there is probably an easier way to get slices of a list.
(defn slice [xs a b]
  (take b (drop a xs)))

;; ------------------
;; TESTS
;; ------------------

(defn tester [arr exp]
  (testing (str "Testing for " arr)
    (is (= (create-phone-number arr) exp))))

  (tester [1 2 3 4 5 6 7 8 9 0] "(123) 456-7890") ;; => true
  (tester [1 1 1 1 1 1 1 1 1 1] "(111) 111-1111") ;; => true
  (tester [4 7 8 1 5 7 9 9 7 1] "(478) 157-9971") ;; => true
  (tester [7 8 0 2 2 1 7 5 1 3] "(780) 221-7513") ;; => true