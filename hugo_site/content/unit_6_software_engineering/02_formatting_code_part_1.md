---
title: "Formatting code: part 1"
date: 2020-11-25T16:52:22Z
draft: false
pre: "2. "
---


This section is based on the https://software-carpentry.org/ course and the article on coding style https://queue.acm.org/detail.cfm?id=1039535.
Emphasis has been put on how you use these ideas in MATLAB, however, a lot of the ideas you will see here are applicable in any programming language.


## Why we write code

The main reasons we write code are:

- to design solutions to problems;
- to communicate our designs to people; and
- to get a computer to implement our design.


## Good design

Source code is written for humans to read – and not for computers, which only care about 0s and 1s.
Therefore we want to provide as much information as possible to the next person who reads the code – even if that person is you.
Code you wrote more than about three weeks ago may as well have been written by somebody else.

Consistency, in the form of conventions, gives lots of extra information.
Always try to use descriptive names for functions and variables as the names given to things are the most visible clue to their purpose.
Make them both meaningful and readable.

You should aim to be as clear as you can, even if it takes more lines of code.
