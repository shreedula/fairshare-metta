;; ==========================================
;; FairShare: Knowledge Base & State Space
;; ==========================================

;; Member definitions
(: Alice Member)
(: Bob Member)
(: Charlie Member)

;; Task definitions
(: Chores Task)
(: Grocery Task)
(: Cooking Task)

;; Dynamic availability and state space
!(bind! &space (new-space))

;; Initial States
!(add-atom &space (available Alice True))
!(add-atom &space (available Bob True))
!(add-atom &space (available Charlie True))

;; Workload Counter: (workload $member $count)
!(add-atom &space (workload Alice 0))
!(add-atom &space (workload Bob 0))
!(add-atom &space (workload Charlie 0))

;; Assignment tracking: (assigned $task $member)
!(add-atom &space (assigned Chores Alice))
!(add-atom &space (assigned Grocery Bob))
!(add-atom &space (assigned Cooking Charlie))

;; ==========================================
;; Dynamic Learning & Adaptation Logic
;; ==========================================

;; Rule: Update member availability dynamically
(= (set-availability $member $status)
   (let () (match &space (available $member $old)
      (let () (remove-atom &space (available $member $old))
              (add-atom &space (available $member $status))))))

;; Rule: Identify available candidate for reassignment
(= (find-available-backup $candidate)
   (match &space (, (available $candidate True)
                    (workload $candidate $w))
          $candidate))

;; Rule: Rebalance Task if Assignee is Unavailable
(= (rebalance-task $task)
   (match &space (assigned $task $assignee)
          (match &space (available $assignee False)
                 (let $new-assignee (find-available-backup $other)
                      (if (== $new-assignee $assignee)
                          (No-Backup-Available)
                          (let () (remove-atom &space (assigned $task $assignee))
                                  (add-atom &space (assigned $task $new-assignee))
                                  (reassigned $task from $assignee to $new-assignee)))))))

;; ==========================================
;; Live Execution Demo
;; ==========================================

;; 1. Check current status of Alice
!(match &space (available Alice $status) (Alice is $status))

;; 2. Simulate Alice becoming unavailable (State Mutation)
!(set-availability Alice False)

;; 3. Check updated availability rule (Diff Demonstration)
!(match &space (available Alice $status) (Alice is now $status))

;; 4. Run dynamic task rebalancing on Alice's task
!(rebalance-task Chores)

;; 5. Verify the updated assignment knowledge base
!(match &space (assigned Chores $who) (Chores now assigned to $who))
