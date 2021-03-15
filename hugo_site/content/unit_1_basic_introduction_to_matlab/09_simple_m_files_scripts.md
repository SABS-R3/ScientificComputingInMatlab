---
title: "Simple M-files: scripts"
date: 2020-11-18T16:52:22Z
draft: false
pre: "9. "
---

Instead of typing the commands into the Command Window, they may be typed into a file with a `.m` extension, which allows commands to be built up into a high-level computer program.

{{% notice info %}}
Most of the time when you use MATLAB, you will write scripts, which are just text files with a `.m` extension, rather than typing commands directly into the Command Window.
{{% /notice %}}

## Opening a new M-file

From the 'Home' tab, click 'New Script', or, from the 'Editor' tab, select 'New' and then 'Script'.

This will open a new window that is a text editor.
You can also type the following command in the Command Window:

```matlab
edit
```

to open the MATLAB editor.


## Writing an M-file

In a MATLAB script, you can type exactly the commands that you type into the Command Window, but you can write and run multiple commands at once.
In the text editor type the following lines of code:

```matlab
A=[1 2; 3 4]
B=[5 6; 7 8]
C=A+B
```

Click on the 'Save' button on the toolbar and save the file as

```plaintext
mymfile.m
```


## Running the M-file

Return to the Command Window and type

```matlab
mymfile
```

This has the same output as if you had entered the three lines of the M-file in the Command Window.

{{% notice warning %}}
You must make sure not to name your file the same as a pre-existing MATLAB function.
You can use the `exist` command (see `doc exist`) to find out if your function name is being used for an existing function.
{{% /notice %}}


## Breaking code across multiple lines

While writing M-files you will often have to write long lines of code like:

```matlab
A=2*eye(500)-diag(ones(499,1),1)-diag(ones(499,1),-1);
```

In order to make it easier to see what the code is doing and to prevent artificial line breaks (where the editor decides where to break the code across multiple lines) you can use the following:

```matlab
A=2*eye(500) ... ;
-diag(ones(499,1),1) ... ;
-diag(ones(499,1),-1);
```

The dots `...` indicate that we wish to continue the current line of code on the next line of the file, when you run the file it is as if all the commands are on the same line.


## Comments

If you are writing lots of different M-files it is handy to insert comments into the code.
Anything in the M-file preceded by a `%` will be ignored when the M-file is executed.
For example, the following code runs exactly the same commands as the mymfile.m file we created earlier.

```matlab
%%% Code to add two matrices together %%%

A=[1 2; 3 4] % the first matrix

B=[5 6; 7 8] % the second matrix

% The sum of the two matrices
C=A+B
```