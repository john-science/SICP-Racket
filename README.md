# SICP-Racket

Reading through the wonderful [SICP Textbook](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html) in [Racket](https://racket-lang.org/) Scheme


### [Chapter 1 - Building Abstractions with Procedures](Chapter_1_Abstractions_with_Procedures)

Truly an introduction to programming. There are broad, philosophical discussions of the differences between data and logic. This chapter is a joy to read, discussing what a program *is* at the most basic levels. While I enjoyed it greatly, the high-minded philosophical talk about programming is completely divorced from the actual machinary of computers themselves. And thus begins the major bias in the rest of this (wonderful) book. The Scheme language is introduced.


### [Chapter 2 - Abstractions with Data](Chapter_2_Abstractions_with_Data)

More waxing philosophic about the nature of data vs code. Very entertaining. A wonderful introduction to data-driven software. Not just a good description of lists and trees, but also the kinds of decisions that need to be made when trying to design code to solve a more general problem. A great introduction to thinking like an engineer. Hell, it even introduces compression algorithms.


### [Chapter 3 - Objects and State](Chapter_3_Objects_and_State)

The Scheme programs get more complex here and programming paradigms are introduced. Modular program design is introduced. List as streams and queues are introduced. And much of the chapter is devoted to discussing stateful programming, which is a no-no in Scheme/LISP. Unlike the first couple chapters, this chapter dragged on and I got bored fast. Whereas the book had been a wonderful introduction to programming concepts, it is now an opinionated soap box lecture about why mutable states are bad. And, in the end, I was unconvinced. It sounds like mutable states are bad because they are more complex for academic researchers who want to pretend that RAM and harddrives don't exist and we can ignore annoying complexities like databases and networking.


### [Chapter 4 - Metalinguistic Abstraction](Chapter_4_Metalinguistic_Abstraction)

This chapter starts out *hard* and fast on the idea that we should write our own (albeit simple) LISP interpreter. While I love the idea for an introdutory textbook, and enjoyed it greatly, this chapter endeavors to cover so much material it is a bit less readable than previous chapters. I think this chapter also serves as one of the most important lessons for someone new to software: not just solving little test problems, but building non-trivially large software projects with many moving pieces.

> Fun Fact: I have written my own LISP [once before](https://github.com/theJollySin/slowloris).


### Chapter 5 - Computing with Register Machines

> TODO: I am expecting to model simple computers (register machines), and maybe touch on compilers.
