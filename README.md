# FairShare: Intelligent Task & Responsibility Rotator

Built for the **SingularityNET x Omega x BASIX.Market Hackathon (MeTTa Foundation Track 02: The Agent That Grows Up)**.

## Problem Statement
Shared responsibilities in homes, clubs, and classrooms are distributed unevenly, leading to confusion and burnout. Static rotation systems break as soon as someone's availability changes.

## Solution Architecture
FairShare uses **MeTTa's symbolic reasoning** to maintain an active knowledge space of member availability, preferences, and workloads. Rather than using static algorithmic loops, FairShare executes symbolic assertions and retractions to dynamically evolve task allocation rules when constraints change.

### Key Features
- **Stateful Symbolic Memory:** Tracks dynamic task history and member states in MeTTa spaces.
- **Self-Evolving Knowledge:** When member availability shifts, old assignment rules are purged and balanced reassignments are asserted live.
- **Visible Rule Diff:** Produces an auditable before-and-after diff of internal MeTTa space atoms.

## How to Run
```bash
# Run with Hyperon / MeTTa CLI
metta fairshare.metta

# Run the Python verification & Rule-Diff output
python3 run_demo.py
