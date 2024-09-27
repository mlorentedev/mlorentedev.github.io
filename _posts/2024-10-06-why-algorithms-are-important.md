---
layout: post
title: Why Algorithms are important
date: "2024-08-25"
categories: 
  - "Data Structures"
  - "Algorithms"
tags: 
  - "data structures"
  - "algorithms"
readtime: true
language: en
lang-ref: intro
---

Some posts ago, we talked about the importance of data structures. Now, we are going to discover that even if we decide on a particular data structure, another major factor that affects the efficiency of a program is the algorithm to use.

Although the word algorithm is often associated with computer science, it is not exclusive to it. An algorithm is a set of instructions that describe how to perform a task. For example, a recipe is an algorithm that describes how to cook a dish. In computer science, an algorithm is a set of instructions that describe how to solve a problem.

Sometimes, we'll encounter several algorithms that solve the same problem. In today's post, we'll discuss how one algorithm can be faster than other by orders of magnitude. To explore this, we'll use the example of sorting algorithms and introduce the concept of ordered arrays.

## Ordered arrays

An ordered array is almost identical to the classic array, but with one key difference: the elements are sorted in ascending order. That is, every time a value is added, it gets placed in the correct position so that the values in the array are always sorted.

For example, if we have an array with the following values: [1, 3, 5, 7, 9], and we want to add the value 4. If this array were a classic array, we could inser the 4 at the end of the array, and the computer can do this in a single step. However, if the array is ordered, we'd have no coice but to insert the 4 in the correct position, which would require shifting the 5, 7, and 9 one position to the right.

Now, this is easier said than done. The computer cannot simply drop the 4 into the right slot in a sicle stepbecause it fist has to find the right place, and the shift the other values to make room for it. This is where the algorithm comes in and let's break down the process step by step.

Let's start with our originial ordered array: [1, 3, 5, 7, 9]. We want to add the value 4. The algorithm to insert the value 4 in the correct position would be as follows:

1. We check the value at index 0 (1) and compare it to the value we want to insert (4). Since 1 < 4, we move to its left or to its right.
Because 4 is greater than 1, we know that the 4 will be inserted somewhere to the right of 1. However, we don't know yet exactly which cell it should be inserted into. So we need to check the next cell.
2. We inspect the value at the next index (3) and since 4 is greater than 3, we move to the right again.
3. We inspect the value at the next index (5) whici is greater than the 4 we wish to insert. Since we've reached the first value that is greater than the value we want to insert, we can conclude tha the 4 must be place immediately to the left of this 5 to maintain the order. To do this, we need to shift data to make room for the 4.
4. We shift the 5, 7, and 9 one position to the right to make room for the 4.

``` text
[1, 3, 5, 7, 9] -> [1, 3, 5, 7, , 9] -> [1, 3, 5, , 7, 9] -> [1, 3, , 5, 7, 9] -> [1, 3, 4, 5, 7, 9] -> Done!
```

It seems that when inserting into an ordered array, we need to always perform a search before the actual insertion to determine the correct spot. This is one difference in performance between ordered and classic arrays. In a classic array, we can insert a value in a single step, but in an ordered array, we need to perform a search before the insertion.

We can see in the exaple that there were initially 5 elements in the array, and that insertion took 7 steps. In terms of N, we can say that for N elementes in an ordered array, the insertion took N+2 steps. Interestingly, the number of steps for insertion is the same no matter where in the ordered array we insert the value. If our value ends up toward the beginning of the ordered array, we have fewer comparisons and more shifts. If it ends up toward the end, we have more comparisons and fewer shifts. But the total number of steps is always N+2. The fewest steps we can take is N+1 and occurs when we insert the value at the end of the array since we take N steps to compare and 1 step to insert. The most steps we can take is N+2 and occurs when we insert the value at the beginning of the array since we take N+1 steps to compare and 1 step to insert.

## Searching in an ordered array