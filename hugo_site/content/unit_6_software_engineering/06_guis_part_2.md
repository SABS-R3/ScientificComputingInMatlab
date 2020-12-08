---
title: "GUIs: part 2"
date: 2020-11-21T16:52:22Z
draft: false
pre: "6. "
---


In the previous screens we have created the figure for the GUI and added some controls.
We now need to get the GUI to do something.
In the command to create the push button we called a function named `PlotGUI !nc`, which is where the MATLAB code to be controlled by the GUI will go.


### The plot function

We now define the function `PlotGUI !nc` which is called by the push button.

```matlab
%% Called by SimpeGUI to do the plotting
% hObject is the button and eventdata is unused.
function PlotGUI(hObject,eventdata)

    % Gets the value of the parameter from the slider.
    Param = get(Slider,'Value');

    % Puts the value of the parameter on the GUI.
    uicontrol('Style', 'text', 'String', num2str(Param),...
    'Position', [460 55 60 20]);

    % Plots the Graph.
    x=linspace(0,10,1000);
    k = Param;
    y = sin(k*x);
    plot(x,y);
end
```

The function 'PlotGUI' takes in two input arguments:

- `hObject !nc`, the handle of the button which enables the state of the uicontrol to be accessed from `PlotGUI !nc`. (Note: this is not used here as we are using global functions but is used in the code given below.)
- `eventdata !nc`, unused here but included for use with the `Callback !nc` command.

This function can be modified so that it runs the code you wish the GUI to control.


### The whole thing

Brought together, the entire GUI is defined by the following code:

```matlab
%% Simple GUI
function SimpleGUI()
    close all
    
    global Slider; %Define this to be global so subfunction can see slider
    
    % Make a large figure.
    figure('position',[0 0 700 500], 'name', 'SimpleGUI', 'NumberTitle', 'off');
    
    % Make subplot to hold plot.
    h = subplot('position',[0.1 0.3 0.8 0.6]);
    
    % Just some descriptive text.
    uicontrol('Style', 'text', 'String', 'Parameter Value',...
        'Position', [150 50 90 30]);
    
    % A slider for varying the parameter.
    Slider = uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
        'Position', [250 50 200 30]);
    
    % A button to run the sims.
    Button = uicontrol('Style', 'pushbutton', 'String', 'Run',...
        'Position', [530 50 100 30],'Callback', @PlotGUI);
    
    %% Called by SimpeGUI to do the plotting
    % hObject is the button and eventdata is unused.
    function PlotGUI(hObject,eventdata)
        
        % Gets the value of the parameter from the slider.
        Param = get(Slider,'Value');
        
        % Puts the value of the parameter on the GUI.
        uicontrol('Style', 'text', 'String', num2str(Param),...
            'Position', [460 55 60 20]);
        
        % Plots the Graph.
        x=linspace(0,10,1000);
        k = Param;
        y = sin(k*x);
        plot(x,y);
    end
end
```

Copy this into a new M-file in your working directory named `SimpleGUI.m`, and run it with the command:

```matlab
SimpleGui
```

Move the slider and press the 'Run' button see the plot change.
The working GUI is shown in the following figure:

![GUI with UI controls](/ScientificComputingInMatlab/images/unit_06/6_06_1.svg?classes=matlab-screenshot-40)


While this is a very simple application, the methods used here can be extended to more general GUIs.


### Alternative GUI example

Another version of this GUI is given below, which automatically updates the plot after the slider is moved:

```matlab
%% Simple GUI
function SimpleGUIWithoutButton()
    close all
    
    % Make a large figure.
    figure('position',[0 0 700 500], 'name', 'SimpleGUI', 'NumberTitle', 'off');
    
    % Make subplot to hold plot.
    h = subplot('position',[0.1 0.3 0.8 0.6]);
    
    % Just some descriptive text.
    uicontrol('Style', 'text', 'String', 'Parameter Value',...
        'Position', [150 50 90 30]);
    
    % A slider for varying the parameter.
    uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
        'Position', [250 50 200 30],'Callback', @PlotGUI);
    
    %% Called by SimpleGUI to do the plotting
    % hObject is the slider and eventdata is unused.
    function PlotGUI(hObject,eventdata)
        
        % Gets the value of the parameter from the slider.
        Param = get(hObject,'Value');
        
        % Puts the value of the parameter on the GUI.
        uicontrol('Style', 'text', 'String', num2str(Param),...
            'Position', [460 55 60 20]);
        
        % Plots the Graph.
        x=linspace(0,10,1000);
        k = Param;
        y = sin(k*x);
        plot(x,y);
    end
end
```

Copy this into a new M-file in your working directory named `SimpleGUIWithoutButton.m`, and run it with the command:

```matlab
SimpleGuiWithoutButton
```

There are various other ways of constructing the GUI, and by now you will be sufficiently familiar with functions used in MATLAB to modify the files you have to experiment with this.
