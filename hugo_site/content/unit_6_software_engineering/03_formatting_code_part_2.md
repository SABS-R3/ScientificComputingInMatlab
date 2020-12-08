---
title: "Formatting code: part 2"
date: 2020-11-24T16:52:22Z
draft: false
pre: "3. "
---


Comments help to describe the intent of the programmer and document tricky sections of the program.
Comments also provide a way of adding metadata, such as physical units.
The aim is to describe, rather than duplicate.

For example:

```matlab
% Initialise voltage to zero
voltage = 0.0;
```

just repeats the information in the code, whereas:

```matlab
% Transmembrane potential (units - mV)
voltage = 0.0;
```

provides more important information.

When writing code, it is good practice to use comments first to lay out a skeleton for the code.
This helps to solidify the algorithm in your mind and also means that there is often no need to write more comments afterwards!

You can start off with something like

```matlab
%% Initialise stiffness matrix

% Add boundary conditions

%% Assemble linear system

% Set initial conditions in Solution vector

%% Solve linear system
```

where comments on the main steps are marked `%% !nc` while those on sub-steps are marked `% !nc`. This is only one example of using the `% !nc` to signify parts of your code, and you may wish to use your own, for example

```matlab
%%%%%%%%%%
%% Main Step %%
%%%%%%%%%%

%% Sub Step %%
```

Any method you choose is fine as long as you are consistent.

{{% notice info %}}
In MATLAB, a comment starting with a double percent (`%% !nc`) starts a new 'section' in a script, that is marked by a light yellow background.

This can be very useful for structuring code as it is possible to run just a section of your script.
{{% /notice %}}


## Creating automatic documentation

You can use comments in functions to provide automatic documentation (or help) for your functions.

### Walkthrough

For example, if you create an M-file with the following:

```matlab
function y = average(x)
    % AVERAGE Mean of vector elements.
    % Further documentation
    y = sum(x)/length(x); % Actual computation
end
```


Running the command

```matlab
help average
```

will now produce

```plaintext
>> help average
  average Mean of vector elements.
  Further documentation
```

More help on this functionality can be found [here](https://uk.mathworks.com/help/matlab/matlab_prog/add-help-for-your-program.html).
