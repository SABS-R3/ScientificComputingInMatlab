---
title: "Starting MATLAB"
date: 2020-11-24T16:52:22Z
draft: false
---

## Windows
![Windows Logo](/ScientificComputingInMatlab/logos/windows.svg?classes=os-logos)

{{%expand "Expand for Windows instructions"%}}

1. In the File Explorer, right-click and select 'New' then 'Folder', and call this new folder 'MatlabCourse'.
1. To start MATLAB click on the 'MATLAB' icon, and change the 'Current Directory' to the one you just created.
1. You may wish to create some appropriately named sub-directories to store separately the files from each unit of the course, for example 'Unit1'.

{{% /expand%}}


## macOS
![Apple Logo](/ScientificComputingInMatlab/logos/apple.svg?classes=os-logos)


{{%expand "Expand for macOS instructions"%}}

1. In Finder, right-click and select 'New' then 'Folder', and call this new folder 'MatlabCourse'.
1. To start MATLAB click on the 'MATLAB' icon, and change the 'Current Directory' to the one you just created.
1. You may wish to create some appropriately named sub-directories to store separately the files from each unit of the course, for example 'Unit1'.

{{% /expand%}}


## Linux
![Linux Logo](/ScientificComputingInMatlab/logos/linux.svg?classes=os-logos)

{{%expand "Expand for Linux instructions"%}}

1. Open a terminal and type

    ```bash
    mkdir MatlabCourse
    cd MatlabCourse
    ```

    to make a directory and switch to it.

1. From within the directory you just created, type

    ```bash
    matlab &
    ```

    A MATLAB window should now open.
    Any files created and saved will now be saved within this directory.
    Note that the '&' will free the MATLAB window from the terminal; otherwise, if you close the terminal you close MATLAB.

1. You may wish to create some appropriately named sub-directories to store separately the files from each unit of the course, for example 'Unit1'.
   Note that you can use the `mkdir` command from within the MATLAB command window.

{{% /expand%}}
