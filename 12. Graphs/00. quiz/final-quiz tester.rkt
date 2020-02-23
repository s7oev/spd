;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |final-quiz tester|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Slot is Natural
;; interp. each TA slot has a number, is the same length, and none overlap

(define-struct ta (name max avail))
;; TA is (make-ta String Natural (listof Slot))
;; interp. the TA's name, number of slots they can work, and slots they're available for
(define TA1 (make-ta "Harry"    1 (list 1   3)))
(define TA2 (make-ta "Ron"      1 (list   2 3)))
(define TA3 (make-ta "Hermione" 2 (list   2    4)))

(define TAS (list TA1 TA2 TA3))


(define-struct assignment (ta slot))
;; Assignment is (make-assignment TA Slot)
;; interp. the TA is assigned to work the slot

;; Schedule is (listof Assignment)


;; TANAssignments is (make-tana TA (listof Natural))
;; interp. the number of assignments recorded for a given user
(define-struct tana (ta n))

;; (listof TA) Slot -> (listof Schedule|false)
;; produce all possible schedules where each slot is assigned and no TA is working more than their availability;
;;         if there are no possible ones, produce false
(check-expect (all-schedules TAS 4)
               (list (make-assignment TA1 1)
                     (make-assignment TA3 2)
                     (make-assignment TA2 3)
                     (make-assignment TA3 4)))

;(define (all-schedules tas slots) false)

(define (all-schedules tas slots)
  (local [(define (all-schedules--s schedule)
            (if (schedule-filled? schedule slots)
                schedule
                (all-schedules--los (next-schedule schedule tas slots))))

          (define (all-schedules--los los)
            (cond [(empty? los) false]
                  [else
                   (local [(define try (all-schedules--s (first los)))] ;try first child
                     (if (not (false? try))                             ;successful?
                         try                                            ;if so produce that
                         (all-schedules--los (rest los))))]))]          ;or try rest of children

    (all-schedules--s empty)))



;; Schedule (listof TA) (listof Slot) -> (listof Schedule)
;; produce list of valid next schedules from schedule
;; finds first empty slot, fills it with a TA, keep only valid assignments
(define (next-schedule schedule tas slots)
  (keep-only-valid (fill-with-tas (find-empty-slot schedule slots) schedule tas)))

;; Schedule (listof Slot) -> Slot
;; produces the position of the first empty slot
;; ASSUME: the schedule has at least one empty slot
(check-expect (find-empty-slot empty 4) 1)
(check-expect (find-empty-slot (list (make-assignment TA1 1)) 4) 2)
(check-expect (find-empty-slot (list (make-assignment TA1 1)
                                     (make-assignment TA3 2)) 4) 3)

(define (find-empty-slot schedule slots)
  (cond [(empty? schedule) 1]
         [else
          (+ (length schedule) 1)]))




;; Schedule -> Boolean
;; produce a list of TANAssignments, or false if a TA is assigned to a slot they are unavailable for
(check-expect (valid-schedule? (list (make-assignment TA1 1)
                                     (make-assignment TA3 2)
                                     (make-assignment TA2 3)
                                     (make-assignment TA3 4))) true)
(check-expect (valid-schedule? (list (make-assignment TA1 2))) false)
(check-expect (valid-schedule? (list (make-assignment TA1 1)
                                     (make-assignment TA3 3))) false)
(check-expect (valid-schedule? (list (make-assignment TA1 1)
                                     (make-assignment TA2 2)
                                     (make-assignment TA2 3)
                                     (make-assignment TA3 4))) false)


(define (valid-schedule? s)
  (local [
          ;; together, the two functions below return a list of TANAssignments,
          ;;   unless a TA is seen that is assigned to unavailable for them slot;
          ;;   in this case, false is produced
          ;; rsf is (listof TANAssignments); the number of assignments to TAs so far
          (define (valid-schedule?--ta assnm todo rsf)
            (if (member (assignment-slot assnm) (ta-avail (assignment-ta assnm)))
                (valid-schedule?--s todo (merge-ta (assignment-ta assnm) rsf))
                false))
          (define (valid-schedule?--s todo rsf)
            (cond [(empty? todo) rsf]
                  [else
                   (valid-schedule?--ta (first todo)  
                                        (rest todo)
                                        rsf)]))

          ;; add one new ta to rsf
          (define (merge-ta ta rsf)
            (foldr merge-assignments rsf (list ta)))
          ;; add one new assignment to rsf
          (define (merge-assignments ta lotana)
            (cond [(empty? lotana) (list (make-tana ta 1))]
                  [else
                   (if (string=? (ta-name ta) (ta-name (tana-ta (first lotana))))
                       (cons (make-tana ta
                                        (add1 (tana-n (first lotana))))
                             (rest lotana))
                       (cons (first lotana)
                             (merge-assignments ta (rest lotana))))]))
          ;; check if no TA is assigned to more than their max availability
          (define (not-more-than-max lotana)
            (cond [(empty? lotana) true]
                  [else
                   (if (> (tana-n (first lotana)) (ta-max (tana-ta (first lotana))))
                       false
                       (not-more-than-max (rest lotana)))]))]

    (local [(define try (valid-schedule?--ta (first s) (rest s) empty))] 
      (if (not (false? try))                             
          (not-more-than-max try)
          false))))


;; ----------------------------------------------------------------------------------

;; Slot Schedule (listof TA) -> (listof Schedule)
;; produce the next schedule where the first empty slot is filled with a TA
(check-expect (fill-with-tas 3 (list (make-assignment TA1 1)
                                     (make-assignment TA3 2)) TAS)
              (list
               (list (make-assignment (make-ta "Harry" 1 (list 1 3))    1)
                     (make-assignment (make-ta "Hermione" 2 (list 2 4)) 2)
                     (make-assignment (make-ta "Harry" 1 (list 1 3))    3))

               (list (make-assignment (make-ta "Harry" 1 (list 1 3))    1)
                     (make-assignment (make-ta "Hermione" 2 (list 2 4)) 2)
                     (make-assignment (make-ta "Ron" 1 (list 2 3))      3))

               (list (make-assignment (make-ta "Harry" 1 (list 1 3))    1)
                     (make-assignment (make-ta "Hermione" 2 (list 2 4)) 2)
                     (make-assignment (make-ta "Hermione" 2 (list 2 4)) 3))))

(define (fill-with-tas slot schedule tas)
  (local [(define (fill-with-tas slot schedule tas all-next-schedules)
            (cond [(empty? tas) all-next-schedules]
                  [else
                   (fill-with-tas slot schedule (rest tas)
                                  (append all-next-schedules
                                          (list (append schedule
                                                        (list (make-assignment (first tas) slot))))))]))]
          
    (fill-with-tas slot schedule tas empty)))

;; ----------------------------------------------------------------------------------

;; (listof Schedule) -> (listof Schedule)
;; produce list containing only valid schedules
(check-expect (keep-only-valid (fill-with-tas 3 (list (make-assignment TA1 1)
                                                      (make-assignment TA3 2)) TAS))
              (list (list (make-assignment (make-ta "Harry" 1 (list 1 3)) 1)
                          (make-assignment (make-ta "Hermione" 2 (list 2 4)) 2)
                          (make-assignment (make-ta "Ron" 1 (list 2 3)) 3))))

(define (keep-only-valid los)
  (filter valid-schedule? los))

;; ----------------------------------------------------------------------------------

;; Schedule (listof Slot) -> Boolean
;; produce true if the schedule fills all slots, else false
;; Assume: schedule is valid, so it is solved if it is full
(check-expect (schedule-filled? (list (make-assignment TA1 1)
                                      (make-assignment TA3 2)) 4) false)
(check-expect (schedule-filled? (list (make-assignment TA1 1)
                                      (make-assignment TA3 2)
                                      (make-assignment TA2 3)
                                      (make-assignment TA3 4)) 4) true)

(define (schedule-filled? schedule slots)
  (= (length schedule) slots))

;; ----------------------------------------------------------------------------------

(define TA-1 (make-ta "Erika"     1 (list 1   3       7   9)))
(define TA-2 (make-ta "Ryan"      1 (list 1             8  10)))
(define TA-3 (make-ta "Reece"     1 (list         5 6)))
(define TA-4 (make-ta "Gordon"    2 (list   2 3           9)))
(define TA-5 (make-ta "David"     2 (list   2           8 9)))
(define TA-6 (make-ta "Katie"     1 (list       4   6)))
(define TA-7 (make-ta "Aashish"   2 (list 1                 10)))
(define TA-8 (make-ta "Grant"     2 (list 1                    11)))
(define TA-9 (make-ta "Raeanne"   2 (list 1                    11 12)))

(define TA-X1 (make-ta "Alex"     1 (list             7)))
(define TA-X2 (make-ta "Erin"     1 (list       4)))

(define TA-Q1 (list TA-1 TA-2 TA-3 TA-4 TA-5 TA-6 TA-7 TA-8 TA-9))
(define TA-Q2 (list TA-1 TA-2 TA-3 TA-4 TA-5 TA-6 TA-7 TA-8 TA-9 TA-X1))
(define TA-Q3 (list TA-1 TA-2 TA-3 TA-4 TA-5 TA-6 TA-7 TA-8 TA-9 TA-X2))

(all-schedules TA-Q1 12)
(all-schedules TA-Q2 12)
(all-schedules TA-Q3 12)
