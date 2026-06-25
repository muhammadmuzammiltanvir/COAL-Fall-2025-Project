# COAL-Fall-2025-Project

## Overview

The Quiz System is a console-based application developed in x86 Assembly Language using the Irvine32 library. The project allows one, two, or three players to participate in a number-series quiz game where players must predict the next number in a sequence. The system automatically evaluates answers, updates scores, and determines the winner at the end of the game.

This project was developed as part of the Computer Organization and Assembly Language (COAL) course to strengthen concepts related to Assembly programming, file handling, procedures, loops, conditional statements, and user interaction.

---

## Features

- Support for 1, 2, or 3 players
- Player registration with custom names
- Randomly generated number-series questions
- Arithmetic progression and decrement-based series
- Automatic answer verification
- Score increment for correct answers
- Score deduction for incorrect answers (score cannot go below zero)
- Real-time score display
- Winner and tie detection for multiplayer mode
- File handling for storing player names and scores
- Game rules loaded from an external text file
- Interactive console-based interface

---

## Technologies Used

- x86 Assembly Language (MASM)
- Irvine32 Library
- File Handling Operations
- Random Number Generation
- Console-Based User Interface

---

## Project Structure

```text
assembly-quiz-system/
│
├── QuizSystem.asm
├── Irvine32.inc
├── game_rules2.txt
├── README.md
└── output files generated during execution
    ├── 1 player.txt
    ├── 2 player.txt
    └── 3 player.txt
```

---

## How the Game Works

1. The user selects the number of players (1, 2, or 3).
2. Each player enters their name.
3. The system generates random number-series questions.
4. Players predict the next number in the sequence.
5. Correct answers increase the score by 1.
6. Incorrect answers decrease the score by 1, but the score cannot become negative.
7. Scores are displayed after each round.
8. Player information and scores are saved to text files.
9. At the end of the game, the system declares the winner or announces a tie.

---

## Sample Gameplay

### Example 1

```text
5 10 15 20
_ : Predict the series
```

**Answer:**

```text
25
```

### Example 2

```text
50 45 40 35 30
_ : Predict the series
```

**Answer:**

```text
25
```

---

## Learning Outcomes

Through this project, we gained practical experience in:

- Assembly Language Programming
- Procedure Creation and Management
- Conditional Statements and Loops
- Random Number Generation
- File Input and Output Operations
- Memory and Register Management
- Console-Based Application Development
- Problem Solving and Debugging

---

## Contributors

- Muhammad Nouman Anwar
- Abdul Samad Lakho
- M. Muzammil Tanvir 

---

## Future Enhancements

- Multiple quiz categories
- Difficulty levels (Easy, Medium, Hard)
- Timer-based challenges
- High-score leaderboard
- More complex number patterns
- Improved user interface

---

## Course Information

**Course:** Computer Organization and Assembly Language (COAL)

**Language:** x86 Assembly (MASM)

**Library:** Irvine32

---

## Note

This project was developed as part of an academic course for learning purposes.
