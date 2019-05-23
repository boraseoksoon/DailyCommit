(defn hello [names] (str "hello, " names))

(def x1  (hello ["studentA" " and, ""StudentB!"] ))




(println x1)

;(import '(javax.swing JFrame JLabel JTextField JButton)
;        '(java.awt.event ActionListener)
;        '(java.awt GridLayout))
;
;(defn celsius []
;  (let [frame (JFrame. "Celsius Converter")
;        temp-text (JTextField.)
;        celsius-label (JLabel. "Celsius")
;        convert-button (JButton. "Convert")
;        fahrenheit-label (JLabel. "Fahrenheit")]
;    (.addActionListener
;      convert-button
;      (reify ActionListener
;        (actionPerformed
;          [_ evt]
;          (let [c (Double/parseDouble (.getText temp-text))]
;            (.setText fahrenheit-label
;                      (str (+ 32 (* 1.8 c)) " Fahrenheit"))))))
;    (doto frame
;      (.setLayout (GridLayout. 2 2 3 3))
;      (.add temp-text)
;      (.add celsius-label)
;      (.add convert-button)
;      (.add fahrenheit-label)
;      (.setSize 300 80)
;      (.setVisible true))))
;
;(celsius)


(defn Example []
  (def x 1)
  (def y 1.25)

  (def str1 "Hello")

  (println x)
  (println y)
  (println str1)
  )


(Example)

;(ns test)

;((println (take 10 (range))))


;
;(println (+ 1 2 3 4 5))
;
;(def F1 (+ 1 2 3 4 5))
;
;(def say-hello
;  (fn [name]
;    (str "Hellow!!!" name)))
;
;(println (say-hello " JSS!") )
;
;
;(str "Hello" name)
;
;(def my-val 5)
;
;(println my-val)
;

;
;  ;; The below code declares a float variable
;  (def y 1.25)
;
;  ;; The below code declares a string variable
;  (def str1 "Hello")
;  (println x)
;  (println y)
;  (println str1))
;
;(hello-world)
;
;(println (str x " did you say " "X?" " also, " y " is this value.") )
;
;
;(def vector [1,2,3,4,5])
;
;;; macro for loop.
;(defmacro for-loop [[sym init check change :as params] & steps]
;  `(loop [~sym ~init value# nil]
;     (if ~check
;       (let [new-value# (do ~@steps)]
;         (recur ~change new-value#))
;       value#)))
;
;(println )
;
;(for-loop [i 0 (< i (count vector)) (inc i)]
;          (println i))
;
;
;
;(defn increment-numbers [number-collection]
;  (map inc number-collection)
;  )
;
;(def ans (increment-numbers '(1 2 3 4 5)))
;
;(println ans)