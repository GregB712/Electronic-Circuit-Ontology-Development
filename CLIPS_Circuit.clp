;+ Sotiris Ftiakas 3076
;+ Grigoris Barmpas 3108



; Thu Nov 19 04:52:59 EET 2020
; 
;+ (version "3.5")
;+ (build "Build 663")


;+ This below is our Protege Ontology 

(defclass Circuit
	(is-a USER)
	(role abstract)
	(single-slot circuit_name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot circuit_input2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot takes_input_from
		(type INSTANCE)
		(allowed-classes Circuit Cycle)
		(cardinality 1 2)
		(create-accessor read-write))
	(single-slot circuit_input1
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot gives_output_to
		(type INSTANCE)
		(allowed-classes Circuit Cycle)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot circuit_output
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot gives_output_to_sensor
		(type INSTANCE)
		(allowed-classes Sensor)
		(cardinality 1 4)
		(create-accessor read-write)))

(defclass Adder
	(is-a Circuit)
	(role concrete)(pattern-match reactive))

(defclass Multiplier
	(is-a Circuit)
	(role concrete)(pattern-match reactive))

(defclass Sensor
	(is-a USER)
	(role abstract)
	(single-slot takes_sensor_input_from
		(type INSTANCE)
		(allowed-classes Circuit Cycle)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Indicator
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot sensor_name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass InputSensor
	(is-a Sensor)
	(role concrete)(pattern-match reactive)
	(single-slot takes_sensor_input_from
		(type INSTANCE)
		(allowed-classes Cycle)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass MidSensor
	(is-a Sensor)
	(role concrete)(pattern-match reactive)
	(single-slot takes_sensor_input_from
		(type INSTANCE)
		(allowed-classes Circuit)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass OutputSensor
	(is-a Sensor)
	(role concrete)(pattern-match reactive)
	(single-slot takes_sensor_input_from
		(type INSTANCE)
		(allowed-classes Circuit)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Cycle
	(is-a USER)
	(role concrete)
	(multislot takes_input_from
		(type INSTANCE)
		(allowed-classes Circuit Cycle)
		(cardinality 1 2)
		(create-accessor read-write))
	(single-slot out
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot id
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot m2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot gives_output_to
		(type INSTANCE)
		(allowed-classes Circuit Cycle)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot m1
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot gives_output_to_sensor
		(type INSTANCE)
		(allowed-classes Sensor)
		(cardinality 1 4)
		(create-accessor read-write))
	(single-slot in3
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot m3
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot in4
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot in1
		(type INTEGER)
		(range 0 31)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot in2
		(type INTEGER)
		(range 0 31)
		(default 0)
;+		(cardinality 1 1)
		(create-accessor read-write)))


;+ These below are the Ontology facts

(definstances facts


([cycle1] of  Cycle

	(gives_output_to
		[a1])
	(gives_output_to_sensor
		[mid1]
		[mid2]
		[mid3]
		[out])
	(id 1)
	(in1 21)
	(in2 28)
	(in3 10)
	(in4 25)
	(m1 10)
	(m2 24)
	(m3 26)
	(out 18))

([cycle2] of  Cycle

	(id 2)
	(in1 7)
	(in2 25)
	(in3 13)
	(in4 15)
	(m1 0)
	(m2 0)
	(m3 3)
	(out 3))

([cycle3] of  Cycle

	(id 3)
	(in1 11)
	(in2 17)
	(in3 24)
	(in4 31)
	(m1 22)
	(m2 6)
	(m3 8)
	(out 14))

([cycle4] of  Cycle

	(id 4)
	(in1 18)
	(in2 11)
	(in3 28)
	(in4 21)
	(m1 4)
	(m2 12)
	(m3 12)
	(out 0))

([cycle5] of  Cycle

	(id 5)
	(in1 25)
	(in2 24)
	(in3 30)
	(in4 10)
	(m1 18)
	(m2 16)
	(m3 12)
	(out 12))

([cycle6] of  Cycle

	(id 6)
	(in1 12)
	(in2 19)
	(in3 11)
	(in4 19)
	(m1 8)
	(m2 24)
	(m3 17)
	(out 9))

([cycle7] of  Cycle

	(id 7)
	(in1 1)
	(in2 31)
	(in3 7)
	(in4 22)
	(m1 2)
	(m2 0)
	(m3 26)
	(out 26))

([cycle8] of  Cycle

	(id 8)
	(in1 0)
	(in2 31)
	(in3 3)
	(in4 23)
	(m1 0)
	(m2 0)
	(m3 0)
	(out 0))

([cycle9] of  Cycle

	(id 9)
	(in1 31)
	(in2 1)
	(in3 6)
	(in4 8)
	(m1 30)
	(m2 30)
	(m3 0)
	(out 30))

([cycle10] of  Cycle

	(id 10)
	(in1 6)
	(in2 4)
	(in3 25)
	(in4 12)
	(m1 12)
	(m2 31)
	(m3 12)
	(out 28))

([a1] of  Adder

	(circuit_input1 21)
	(circuit_input2 21)
	(circuit_name "adder a1")
	(circuit_output 10)
	(gives_output_to_sensor [mid1])
	(takes_input_from [cycle1]))

([mid1] of  MidSensor

	(sensor_name "sensor m1")
	(takes_sensor_input_from [a1]))

([p1] of  Multiplier

	(circuit_input1 28)
	(circuit_input2 10)
	(circuit_name "multiplier p1")
	(circuit_output 24)
	(gives_output_to_sensor [mid2]))


([mid2] of  MidSensor

	(Indicator 24)
	(sensor_name "sensor m2")
)

([a2] of  Adder

	(circuit_input1 24)
	(circuit_input2 26)
	(circuit_name "adder a2")
	(circuit_output 18)
	(gives_output_to_sensor [output])
)

([output] of  OutputSensor

	(Indicator 18)
	(sensor_name "sensor out")
)

([p2] of  Multiplier

	(circuit_input1 10)
	(circuit_input2 25)
	(circuit_name "multiplier p2")
	(circuit_output 26)
	(gives_output_to_sensor [mid3])
)

([mid3] of  MidSensor

	(Indicator 26)
	(sensor_name "sensor m3")
)

([input1] of  InputSensor

	(Indicator 21)
	(sensor_name "IN1")
)

([input2] of  InputSensor

	(Indicator 28)
	(sensor_name "IN2")
)

([input3] of  InputSensor

	(Indicator 10)
	(sensor_name "IN3")
)

([input4] of  InputSensor

	(Indicator 25)
	(sensor_name "IN4")
)

)



;+ Message-handler for multiplication in Multipliers

(defmessage-handler Multiplier multiply-input primary (?inp1 ?inp2)
	(mod (* ?inp1 ?inp2) 32)
)

;+ Message-handler for addition in Adders

(defmessage-handler Adder add-input primary (?inp1 ?inp2)
	(mod (+ ?inp1 ?inp2) 32)
)

;+ Initial function, which defines our clips strategy, initilizes a clock for
;+ the iterations, and leads to the "binding-values phase"

(defrule begin
	?x <- (initial-fact)
  =>
  	(retract ?x)
  	(set-strategy mea)
  	(assert (goal bind-values))
	(assert (current-clock 1))
)


;+ Below, there is a bind-value rule for every adder, multiplier and sensor
;+ we have, in order to take input from the time cycles, and store them
;+ inside each circuit's input slots (a1, a2, p1, p2)
;+ or inside each sensor's indicator slot (mid1, mid2, mid3, output)

(defrule bind-values-to-a1
  (goal bind-values)
  (current-clock ?id)
  (object (is-a Cycle) (in1 ?in1) (id ?id))
  (object (is-a Circuit) (name ?c) (circuit_name "adder a1"))
=>
  (modify-instance ?c (circuit_input1 ?in1)(circuit_input2 ?in1))
)


(defrule bind-values-to-a2
  (goal bind-values)
  (current-clock ?id)
  (object (is-a Cycle) (m2 ?m2)(m3 ?m3) (id ?id))
  (object (is-a Circuit) (name ?c) (circuit_name "adder a2"))
=>
  (modify-instance ?c (circuit_input1 ?m2)(circuit_input2 ?m3))
)


(defrule bind-values-to-p1
  (goal bind-values)
  (current-clock ?id)
  (object (is-a Cycle) (name ?cy) (in2 ?in2) (m1 ?m1) (id ?id))
  (object (is-a Circuit) (name ?c) (circuit_name "multiplier p1"))
=>
  (modify-instance ?c (circuit_input1 ?in2)(circuit_input2 ?m1))
)


(defrule bind-values-to-p2
  (goal bind-values)
  (current-clock ?id)
  (object (is-a Cycle) (name ?cy) (in3 ?in3) (in4 ?in4) (id ?id))
  (object (is-a Circuit) (name ?c) (circuit_name "multiplier p2"))
=>
  (modify-instance ?c (circuit_input1 ?in3)(circuit_input2 ?in4))
)


(defrule bind-value-to-sensor-mid1
	(goal bind-values)
  	(current-clock ?id)
	(object (is-a Cycle) (name ?cy) (m1 ?m1) (id ?id))
	(object (is-a Sensor) (name ?mid1) (sensor_name "sensor m1"))
  =>
  	(modify-instance ?mid1 (Indicator ?m1))
)


(defrule bind-value-to-sensor-mid2
	(goal bind-values)
  	(current-clock ?id)
	(object (is-a Cycle) (name ?cy) (m2 ?m2) (id ?id))
	(object (is-a Sensor) (name ?mid2) (sensor_name "sensor m2"))
  =>
  	(modify-instance ?mid2 (Indicator ?m2))
)


(defrule bind-value-to-sensor-mid3
	(goal bind-values)
  	(current-clock ?id)
	(object (is-a Cycle) (name ?cy) (m3 ?m3) (id ?id))
	(object (is-a Sensor) (name ?mid3) (sensor_name "sensor m3"))
  =>
  	(modify-instance ?mid3 (Indicator ?m3))
)


(defrule bind-value-to-sensor-output
	(goal bind-values)
  	(current-clock ?id)
	(object (is-a Cycle) (name ?cy) (out ?out) (id ?id))
	(object (is-a Sensor) (name ?output) (sensor_name "sensor out"))
  =>
  	(modify-instance ?output (Indicator ?out))
)

;+ Once the "binding-values phase" is over, we retract it and go on to
;+ the "calculating-output phase"

(defrule change-goal-to-calc-output
  ?x <- (goal bind-values)
=>
  (retract ?x)
  (assert (goal calc-output))
)

;+ In this phase, there is a calc-output rule for every adder and multiplier,
;+ and each of them calculates the output that each of these components gives
;+ when applying their according message-handler
;+ (Adders = add-input, Multiplier = multiply-input)

(defrule calc-output-a1
  (goal calc-output)
  (object (is-a Circuit) 
	   (name ?c) (circuit_name "adder a1") (circuit_input1 ?inp1) 
	   (circuit_input2 ?inp2))
=>
  (modify-instance ?c 
	(circuit_output (send ?c 
	  add-input ?inp1 ?inp2))))


(defrule calc-output-a2
  (goal calc-output)
  (object (is-a Circuit) 
	   (name ?c) (circuit_name "adder a2") (circuit_input1 ?inp1) 
	   (circuit_input2 ?inp2))
=>
  (modify-instance ?c 
	(circuit_output (send ?c 
	  add-input ?inp1 ?inp2))))


(defrule calc-output-p1
  (goal calc-output)
  (object (is-a Circuit) 
	   (name ?c) (circuit_name "multiplier p1") (circuit_input1 ?inp1) 
	   (circuit_input2 ?inp2))
=>
  (modify-instance ?c 
	(circuit_output (send ?c 
	  multiply-input ?inp1 ?inp2))))


(defrule calc-output-p2
  (goal calc-output)
  (object (is-a Circuit) 
	   (name ?c) (circuit_name "multiplier p2") (circuit_input1 ?inp1) 
	   (circuit_input2 ?inp2))
=>
  (modify-instance ?c 
	(circuit_output (send ?c 
	  multiply-input ?inp1 ?inp2))))

;+ After calculating each component's output, we go on to the next phase, which
;+ is "find-discrepacy". In this phase, we try to find which component 
;+ malfunctions, based on their circuit order and their comparison with the 
;+ specific cycle's stored value. 

(defrule change-goal-to-find-discrepancy
  ?x <- (goal calc-output)
=>
  (retract ?x)
  (assert (goal find-discrepancy)))

;+ In order to find which component malfunctions, we perform a series of if 
;+ conditions, based on the sensors' results. 
;+ - If a sensor shows 0 falsely, 
;+   then that means that the previous component malfunctions (Short-circuit!)
;+ - If a sensor shows 16 (2^4) less than the actual calculated value, 
;+   then that means that the previous component has trimmed 
;+   the most significan bit (Most Significant Bit is off!)
;+ - In any other case, the problem is in the sensor (sensor error: Short-Circuit!)

(defrule find-discrepancy
  (goal find-discrepancy)
  (current-clock ?id)
  (object (is-a Circuit) (name ?c) 
		(circuit_output ?out) 
		(circuit_name ?cn) (gives_output_to_sensor ?s))
  (object (is-a Sensor) (name ?s) (sensor_name ?sn)
		(Indicator ?sr&~?out)) 
=>

  (if (= ?sr 0)
  then (printout t "Time: " ?id " --> " ?cn " error: Short-circuit!" crlf)(bind ?temp (- ?out 16))(if (= ?sr ?temp)
      then (printout t "Time: " ?id " --> " ?cn " error: Most Significant Bit is off!" crlf))
  else(bind ?temp (- ?out 16))
      (if (= ?sr ?temp)
      then (printout t "Time: " ?id " --> " ?cn " error: Most Significant Bit is off!" crlf)
      else(if(not(eq ?s [output])) then (printout t "Time: " ?id " --> " ?sn " error: Short-circuit!" crlf))))
)

;+ If all components of the circuit show the same value as the actual calculated 
;+ value, then we have a normal operation without mistakes. (Normal Operation!)

(defrule normal_op
  (goal find-discrepancy)
  (current-clock ?id)
  (object (is-a Circuit) (name ?c1) 
		(circuit_output ?out1) 
		(circuit_name "adder a2") (gives_output_to_sensor ?s1))
  (object (is-a Sensor) (name ?s1) (sensor_name "sensor out")
		(Indicator ?out1))
  (object (is-a Circuit) (name ?c2) 
		(circuit_output ?out2) 
		(circuit_name "adder a1") (gives_output_to_sensor ?s2))
  (object (is-a Sensor) (name ?s2) (sensor_name "sensor m1")
		(Indicator ?out2))
  (object (is-a Circuit) (name ?c3) 
		(circuit_output ?out3) 
		(circuit_name "multiplier p1") (gives_output_to_sensor ?s3))
  (object (is-a Sensor) (name ?s3) (sensor_name "sensor m2")
		(Indicator ?out3))
  (object (is-a Circuit) (name ?c4) 
		(circuit_output ?out4) 
		(circuit_name "multiplier p2") (gives_output_to_sensor ?s4))
  (object (is-a Sensor) (name ?s4) (sensor_name "sensor m3")
		(Indicator ?out4))

=>
(printout t "Time: " ?id " ----> Normal Operation!" crlf))

;+ This is the last rule, which updates our current clock, and moves to the next
;+ round and bind the next cycle's information (e.g. from round 3 -> round 4).
;+ As long as we are below 11 rounds, then we keep on updating our clock.
;+ When we reach our final round (for us, that is 10), then we stop all rules
;+ and our program finishes.
;+ The final results show information about all cycles, which one 
;+ had a mulfunction, and what type of malfunction it was.


(defrule new_cycle
  ?x <- (goal find-discrepancy)
  ?clock <-(current-clock ?id)
=>
      (bind ?temp (+ ?id 1))
      (retract ?x)
      (retract ?clock)
      (if (> 11 ?temp) then
      	(assert (current-clock ?temp))
      	(assert (goal bind-values)))
)
