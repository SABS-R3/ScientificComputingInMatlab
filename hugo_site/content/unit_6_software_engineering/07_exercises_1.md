---
title: "Exercises 1"
date: 2020-11-20T16:52:22Z
draft: false
pre: "7. "
---


Using the GUI provided in the previous section as a guide, create a GUI for the system of differential equations given by:

`$$\frac{dN}{dt}=N(1-P)$$`
`$$\frac{dP}{dt}=P(N-1),$$`

with initial conditions `$N(0)=\alpha$` and `$P(0)=\beta$`.
If you're interested in the biological background for this problem (which is known as a 'Predator–Prey system'), then see Chapter 3 of [*Mathematical Biology* by J. D. Murray](http://solo.bodleian.ox.ac.uk/permalink/f/n28kah/oxfaleph021829964).

Your GUI should plot both the solutions, `$N !nc$` and `$P !nc$` over time, together with the phase plane (how `$P !nc$` varies with `$N !nc$`).
It should include two inputs (sliders) in order to vary the initial conditions, `$\alpha !nc$` and `$\beta !nc$`, and a button that is used to start the simulations.

Solution reveal
The following file, PredPreyGUI.m, presents a suitable GUI for the predator– prey system described in the problem.

```matlab
% GUI for the Predator Prey System
function PredPreyGUI()
    %
    global Slider1 Slider2; %Define these to be global so subfunction can see slider
    %
    close all
    %
    % Make a large figure.
    figure('position',[0 0 1000 600],'name','PredatorPreyGUI','NumberTitle','off');
    %
    % Make subplots to hold plots
    h_1 = subplot('position',[0.05 0.25 0.4 0.65]);
    h_2 = subplot('position',[0.55 0.25 0.4 0.65]);
    %
    % Just some descriptive text.
    uicontrol('Style', 'text', 'String', 'Alpha',...
        'Position', [50 55 90 20]);
    %
    % A slider for varying the first parameter.
    Slider1 = uicontrol('Style', 'slider', 'Min',0,'Max', 2,...
        'Position', [150 55 200 20]);
    %
    % Just some descriptive text.
    uicontrol('Style', 'text', 'String', 'Beta',...
        'Position', [450 55 90 20]);
    %
    % A slider for varying the second parameter.
    Slider2 = uicontrol('Style', 'slider', 'Min',0,'Max', 2,...
        'Position', [550 55 200 20]);
    %
    % A button to run the simulations.
    Button = uicontrol('Style', 'pushbutton', 'String', 'Run',...
        'Position', [850 50 100 30],'Callback', @PlotGUI);
    %
    %% Called by PredPreyGUI to do the solving and plotting
    % hObject is the button and eventdata is unused.
    function PlotGUI(hObject,eventdata)
        %
        % Gets the value of the parameters from the sliders.
        alpha = get(Slider1,'Value');
        beta = get(Slider2,'Value');
        %
        % Puts the value of the parameters on the GUI.
        uicontrol('Style', 'text', 'String', num2str(alpha),...
            'Position', [360 55 60 20]);
        %
        % Puts the value of the parameters on the GUI.
        uicontrol('Style', 'text', 'String', num2str(beta),...
            'Position', [760 55 60 20]);
        %
        % Solves the ODEs
        EndTime = 20;
        [t,Y] = ode45(@PredPrey,[0,EndTime],[alpha,beta]);
        %
        % Plot the Solutions
        h_1 = subplot('position',[0.05 0.25 0.4 0.65]);
        plot(t,Y(:,1),'b',t,Y(:,2),'r');
        legend('Prey (N)','Predator (P)');
        h_2 = subplot('position',[0.55 0.25 0.4 0.65]);
        plot(Y(:,1),Y(:,2),'b');
        xlabel('N');
        ylabel('P');
        %
        %% Function defining the Predator Prey System.
        function dYdt = PredPrey(t,Y)
            %
            dYdt = [ Y(1)*(1-Y(2));
                Y(2)*(Y(1)-1)];
        end
    end
end
```

Copy this into a new M-file in your working directory named `PredPreyGUI.m`, and run it with the command:

```matlab
PredPreyGUI
```

Move the sliders and press the 'Run' button see the plot change. The working GUI is shown in the following figure:

![GUI with UI controls](/ScientificComputingInMatlab/images/unit_06/6_07_1.svg?classes=matlab-screenshot)

Now that you understand the basics of making GUIs in MATLAB, you can use the inbuilt 'App Designer' development environment to make GUIs using a graphical interface.
See [Create and Run a Simple App Using App Designer](https://uk.mathworks.com/help/matlab/creating_guis/create-a-simple-app-or-gui-using-app-designer.html) for more information.
You will not be required to use App Designer for this course but you may find it useful if you need to make a complicated GUI in the future.
