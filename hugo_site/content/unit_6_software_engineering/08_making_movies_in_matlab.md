---
title: "Making movies in MATLAB"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


If you are going to make a presentation then you may want to make a movie that you can include within it. The following example will show how to use the commands

- `getframe`
- `VideoWriter`
- `writeVideo`

to make a movie in MATLAB.
Before going through the walkthrough look at the help files for the above commands.


### Walkthrough

Here we are going to make a movie of an oscillating surface.

The full code looks like this:

```matlab
clear; close all;

% Create a video writer object, set to create an mp4
v = VideoWriter('peaks.mp4', 'MPEG-4');
open(v);

% Create a 3D surface for the video
Z = peaks(50);
surf(Z);
axis tight manual
set(gca,'nextplot','replacechildren');

% Create 80 frames where the surface oscillates
for k = 1:80
   surf((1 + cos(6*pi*k/80) + cos(2*pi*k/80))* 0.3333 * Z,Z)
   frame = getframe(gcf);
   writeVideo(v,frame);
end

close(v);
```

It produces the following video:

<div class=videoContainer>
    <video width="50%" controls loop autoplay preload="auto">
        <source src="/ScientificComputingInMatlab/images/unit_06/6_08_1.mp4" type="video/mp4">
    </video>
</div>

First, let's look at the `VideoWriter` object:

```matlab
v = VideoWriter('peaks.mp4', 'MPEG-4');
open(v);
...
close(v);
```

Here, we create a VideoWriter, set the filename of the resulting video to 'peaks.mp4', and set the video format to 'MPEG-4'.
We also have to open the video writer, execute the code we need to, and then close it again.

To generate the surface for our video, we are using the inbuilt MATLAB `peaks` command.
To make things look nice in the resulting figures, we add the lines:

```matlab
axis tight manual
set(gca,'nextplot','replacechildren');
```

Look at `doc axis`, and [Prepare Figures and Axes for Graphs](https://uk.mathworks.com/help/matlab/creating_plots/preparing-figures-and-axes-for-graphics.html) to understand exactly what these commands are doing.

Finally, the loop itself:

```matlab
for k = 1:80
   surf((1 + cos(6*pi*k/80) + cos(2*pi*k/80))* 0.3333 * Z,Z)
   frame = getframe(gcf);
   writeVideo(v,frame);
end
```

We have a loop that is plotting a surface for each of 80 frames, and the surface is being manipulated slightly in each successive frame.
The command `getframe` will save the content of the currently selected figure as a frame, which is then added to the video with the call to `writeVideo`, that takes as parameters the video writer object `v !nc` and the frame to add to the video.

To alter parameters about the generated video file, including things like the frame rate or the type of compression used, look at the help files for `VideoWriter`.
