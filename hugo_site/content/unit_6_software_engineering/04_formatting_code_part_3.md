---
title: "Formatting code: part 3"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---


## Whitespace

Whitespace is generally not significant to the computer, but it makes a big difference to code's readability to humans.
Take a look at the following examples.

```plaintext
Can(you, tell, at + a, glance, which * of, these,
parameters, is(the, eighth), one);
```

```plaintext
This(is, ...
     much, ...
     nicer);
```

```plaintext
This=is+almost*(as-annoying);
```

```plaintext
This = is + much * (more - readable);
```


## Nested functions

You can define functions inside other functions – known as 'nested' functions – which can improve the readability of the code and save you from having to use multiple files.
In the following example of nested functions, note how indentation helps to distinguish functions from each other.
(This can be done automatically within the MATLAB editor by using the smart indent command in the 'Text' menu or the 'Ctrl-I' command in Windows.)

```matlab
function A(x, y) % Primary function
    B(x, y);
    D(y);
    function B(x, y) % Nested in A
        C(x);
        D(y);
        function C(x) % Nested in B
            D(x);
        end
    end
    function D(x) % Nested in A
        z = x + y;
    end
end
```

Look up [nested functions](https://uk.mathworks.com/help/matlab/matlab_prog/nested-functions.html) in the MATLAB help system.
