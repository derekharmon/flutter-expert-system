# State Transition Model

This table describes the transitions that occur between the **expert system**'s screen layouts,
and at a conceptual-level the state accompanying those transitions.  At its core, the
**expert system** operates as a rudimentary **state transition machine** (STM).  The decision to model
it after a STM was largely predicated on the Flutter size constraint for Dragonchain's
Flutter bounty program, which limits the total .dart source file length to 5 KB.

## Table: State Transitions

| ID | Layout | State | Next on Yes | Next on No |
| --- | --- | --- | --- | --- |
| 0 | n/a | *App starts* | 1 | 1 |
| 1 | `YesNoLayout` | Question | 1,2 <sup>1</sup> | 1,2 <sup>1</sup> |
| 2 | `YesNoLayout` | Guess | 3 | 3 |
| 3 | `TypeInLayout` <sup>2</sup> | IDK <sup>3</sup> | 4 | 4 |
| 4 | `YesNoLayout` | Confirm, Candidate Guess | 5 | 3 |
| 5 | `TypeInLayout` | Train Question, Correct Guess, Wrong Guess | 6 | 6 |
| 6 | `YesNoLayout` | Confirm, Train Question | 7 | 5 |
| 7 | `YesNoLayout` | Train Answer, Correct Guess | 8 | 8 |
| 8 | `YesNoLayout` | Learn Fact <sup>4</sup>, Leaf Count | 1 | 9 |
| 9 | n/a | *App saves and quits* |   |   |

### Footnotes for State Transitions Table

1. When asking the user a Question with key, *k* <sub>i</sub>, the **expert system** must determine whether *k* <sub>i+1</sub> exists, and if it does whether it is a leaf (Guess) or not (follow-up Question which means the state goes back to itself). See the [tree-walking document](https://github.com/derekharmon/flutter_expert_system/raw/master/docs/TREEWALKING.md) for further explanation of *k* <sub>i</sub> and *k* <sub>i+1</sub>.
2. `TypeInLayout` is only meant for prototyping purposes. Time-permitting, `SpeechLayout` will replace it to improve the user's training experience.
3. **IDK** is short for the "I don't know" state in which the **expert system** does not have an answer for the user, *i.e.*, *k* <sub>i+1</sub> does not exist yet in the binary tree. It needs a new question to learn the fact that the user is looking for.
4. When a new fact is learned, the **expert system** MAY register the new fact immediately by contacting the Dragonchain or (for performance reasons TBD) it may batch facts together and update the Dragonchain less frequently. It MUST always save any unsaved facts to the Dragonchain before exiting. 

