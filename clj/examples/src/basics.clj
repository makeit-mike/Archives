(ns examples.basics
  (:gen-class))

;; -main is the entry point to the program, if you were to RUN the app
(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))

;; Basic function that takes 2 parameters, returns 1 output
(defn add-two-numbers [a b]
  (+ a b))
;; Calling the function above
(add-two-numbers 2 3)
;; Doing the same thing, but outside the context of functions
(+ 1 1)

;; declaring a variable
(def nums [0 1 2 3 4 5 6 7 8 9])
(println nums)

(def nums2 (range 10))
(println nums2)

;; basic filter methods
(defn filterEven [ns]
  (filter even? ns))

(filterEven nums)
(filterEven nums2)

;; check equality
(= (filterEven nums) (filterEven nums2))

(defn filterOdd [ns]
  (filter odd? ns))

(filterOdd nums)
