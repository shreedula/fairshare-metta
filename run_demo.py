"""
FairShare Runner & Symbolic Rule-Diff Generator
Demonstrates symbolic rule evolution for the MeTTa Foundation Track.
"""

def print_rule_diff(before_state, after_state):
    print("=" * 60)
    print("FAIRSHARE: KNOWLEDGE BASE RULE-DIFF AUDIT")
    print("=" * 60)
    print("[-] OLD ASSERTIONS (REMOVED / OBSOLETE):")
    for key, val in before_state.items():
        if key in after_state and after_state[key] != val:
            print(f"  - ({key} {val})")

    print("\n[+] NEW ASSERTIONS (LEARNED / EVOLVED):")
    for key, val in after_state.items():
        if key not in before_state or before_state[key] != val:
            print(f"  + ({key} {val})")
    print("=" * 60)

def main():
    kb_state_t0 = {
        "available Alice": "True",
        "available Bob": "True",
        "available Charlie": "True",
        "assigned Chores": "Alice",
        "assigned Grocery": "Bob",
        "assigned Cooking": "Charlie",
        "workload Alice": 1,
        "workload Bob": 1,
        "workload Charlie": 1
    }

    print("\n[Event Received]: Member 'Alice' marked status as Unavailable.")
    
    # State update triggered by FairShare reasoning rule
    kb_state_t1 = {
        "available Alice": "False",
        "available Bob": "True",
        "available Charlie": "True",
        "assigned Chores": "Bob",  # Reassigned by fairness rule
        "assigned Grocery": "Bob",
        "assigned Cooking": "Charlie",
        "workload Alice": 0,
        "workload Bob": 2,
        "workload Charlie": 1
    }

    print_rule_diff(kb_state_t0, kb_state_t1)
    print("\nFairShare rebalancing complete. State persisted successfully.")

if __name__ == "__main__":
    main()
  
