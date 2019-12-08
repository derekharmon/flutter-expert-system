# TREE-WALKING

The **expert system** represents the knowledge it learns from a user as a simple **binary tree**. It furthermore persists this growing knowledge on the Dragonchain, where it MAY be further verified (trainer's reputation, resolving one or more users who have trained the same question, _et al_) as a **map** of key-value pairs (_k_, _v_).

## Why a map?

A **map** (associative array, dictionary) was chosen as the best way to represent what will most likely be a sparse **binary tree**, particularly at greater depths. Some branches may represent detailed knowledge while other branches remain more general, or terminate in a satisfactory answer to the user's problem after fewer rounds of questioning.

![Binary tree 4-levels deep showing the index k uniquely identifying each node in a map representation](https://github.com/derekharmon/flutter_expert_system/raw/master/docs/figures/BinaryTree.png)

### Keys

The keys are represented by an integer, _k_, and the leading 1-bit of this integer always indicates our depth in the **binary tree** (_i.e._, what round of questioning the app is on). Any user run through in the **expert system** can be seen as progressing through a sequence of keys, _k_: _k_ <sub>1</sub>, _k_ <sub>2</sub>, ... _k_ <sub>i</sub>, _k_ <sub>i+1</sub>, ... _k_ <sub>n</sub>.

### Values

The values are represented by text strings. If the value comes from a non-leaf node in the **binary tree**, then it is a Question. A value coming from a leaf node terminates the user's tree-walk with the Answer (or at least a Guess).

## Traversing to the Next Node

### Next Node Function

The next node function, _f_, takes two arguments _k_ <sub>i</sub> and a Boolean value, _b_, equivalent to the integers: 1 or 0. This _b_ comes from the user's response of _Yes_ or _No_ to the Question _v_ <sub>i</sub> at _k_ <sub>i</sub>.

Simply stated, _k_ <sub>i+1</sub> = _f_(_k_ <sub>i</sub>, _b_) = 2 _k_ <sub>i</sub> + _b_.

If this seems surprising, then you can try it out using the figure of key indices shown above. 

### IDK

If the Answer resulting from a tree-walk doesn't satisfy the user's problem, then a Question MUST exist which differentiates the incorrect Guess from the correct Answer. In training, the user provides the **expert system** with these distinguishing Questions, and that is the process by which it learns.

In the "I Don't Know" state, the learning happens by obtaining a new Question which replaces _v_ <sub>i</sub> at _k_ <sub>i</sub>. The user indicates whether a _Yes_ or _No_ answer leads to the correct Answer, so there are two cases for what happens to the incorrect Guess and correct Answer:

1. If user indicates _No_ is correct for the new Answer: _v_ <sub>i+1</sub> becomes the new Answer, and _v_<sub>i+1</sub> + 1 becomes the old Guess.
2. If user indicates _Yes_ is correct for the new Answer: _v_ <sub>i+1</sub> becomes the old Guess, and _v_<sub>i+1</sub> + 1 becomes the new Answer. 

