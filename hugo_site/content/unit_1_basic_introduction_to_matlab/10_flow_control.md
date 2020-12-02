---
title: "Flow control"
date: 2020-11-17T16:52:22Z
draft: false
pre: "10. "
---


## For loops

If a collection of statements need to be executed a fixed number of times, a for loop may be used.

### Walkthrough

For example, the following commands print out the integers between 1 and 10 inclusive:

```matlab
for i=1:10
     i
end
```


## While loops

If a collection of statements need to be executed until a stopping criteria is reached a while loop may be used.

### Walkthrough

For example the following commands print out the integers between 1 and 10 inclusive:

```matlab
i=1;
while ( i <= 10 )
    i
    i=i+1;
end
```

Operators that may be useful when using while loops are

- `==` – equal to (note that this is not the same as a single ‘=’ which is used to assign variables)
- `~=` – not equal to
- `<` – less than
- `>` – greater than
- `<=` – less than or equal to
- `>=` – greater than or equal to


## If statements

If a given statement only needs to be executed under a given condition, an if statement may be used.

### Walkthrough

For example, the following statements print out the variable `x !nc` if `x !nc` is negative:

```matlab
if (x<0)
    x
end
```
