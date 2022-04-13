(ns algorithms.fizzbuzz)

(defn div-by [i x]
  (= (mod i x) 0))

(defn div-by-2 [i x y]
  (and (= (mod i x) 0) (= (mod i y) 0)))

(defn get-fizzbuzz [i] ;"Int -> Int -> []"
   (if (div-by-2 i 3 5) "fizzbuzz" 
       (if (div-by i 3) "fizz" 
           (if (div-by i 5) "buzz" i))))

(defn fizz-buzz [i]
  (map #(get-fizzbuzz %) (range i)))

;; -----------------------------------
;; Testing
;; -----------------------------------



(fizz-buzz 15)
(div-by 6 3)

