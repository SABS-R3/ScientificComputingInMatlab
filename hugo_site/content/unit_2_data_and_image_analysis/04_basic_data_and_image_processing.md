---
title: "Basic data and image processing"
date: 2020-11-23T16:52:22Z
draft: false
pre: "4. "
---

MATLAB has many powerful tools to read in files and manipulate data, and we will use this functionality here to read in some data and image files to undertake some basic processing.

There are many MATLAB commands that are used to read in data from files and write data to files, for example

- `load`
- `save`
- `imread`
- `imwrite`

{{% notice info %}}
Before you continue, take a look at the help files for these commands.
{{% /notice %}}


## Loading and saving data files

In the following example we will load in data from one file and write out the data to a different file.


### Walkthrough

Download the [Data1.txt](/ScientificComputingInMatlab/docs/unit_02/Data1.txt) to the current working directory.

To load in data from the file 'Data1.txt' we use the load command

```matlab
load Data1.txt
``` 

which creates the variable Data1.txt which is a `$10000\times1$` vector (seen by using the `whos` command).

Alternatively, you could load the file by using the following

```matlab
data = load('Data1.txt');
``` 

which allows you to specify the variable name.
If you want to load a file in a different directory, then you need to use the second command as you can pass the file location as a string.
If, for example, you were storing your data in a different directory (in the current working directory) called 'Data', you could use the command

```matlab
data = load('Data/Data1.txt');
``` 

To save data to a file you use the `save` command, which works in a similar way.
The following command will save the variable `data` as a file 'TestSave.txt' in plain text as specified by the `–ascii` option.

```matlab
save 'TestSave.txt' data -ascii
```


## Loading and saving the whole workspace

You can also use `save` and `load` to save all the variables in your workspace as a `.mat` file.
Note that this file can only be read by MATLAB, unlike the `.txt` files we made in the previous example. 

### Walkthrough

We begin with an empty workspace 

```matlab
clear
```

and define some variables

```matlab
x=rand(10);
y=rand(10,1);
whos
```

To save all these variables we use the command

```matlab
save AllVariables.mat;
```

Now if we clear all the variables 

```matlab
clear;
whos
```

you can see the workspace is now empty.
The command 

```matlab
load AllVariables.mat;
```

will load back all the saved variables, as can be seen by typing 

```matlab
whos
```

You can also load image files using the 'imread' command as shown in the following example. 


## Loading and saving images

### Walkthrough

Download the file [TestImage.png](/ScientificComputingInMatlab/docs/unit_02/TestImage.png) to the current working directory. 

This is the image you are saving:

![TestImage.png](/ScientificComputingInMatlab/docs/unit_02/TestImage.png)

The following command will load the image into MATLAB and store it as a matrix in which each entry is a number between 0 and 255 that represents the intensity of that pixel.
Note that this is a black-and-white image so there is only one intensity value for each pixel.
If the image were in colour then there would be three such matrices (one for each base colour).

```matlab
A=imread('TestImage.png');
```

You can view the image in MATLAB by typing the command

```matlab
image(A)
```

Suppose we had made some modifications to the image, for example by cropping the image

```matlab
A(:,[1:18, 114:end])=[];
image(A);
```

The matrix `A` could be saved as an image by using the command

```matlab
imwrite(A,'TestCroppedImage.png');
```

which produces a file 'TestCroppedImage.png' which looks like the following figure

![TestCroppedImage.png](/ScientificComputingInMatlab/images/unit_02/2_04_TestCroppedImage.png)
 
