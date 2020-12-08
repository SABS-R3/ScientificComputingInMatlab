---
title: "Making movies in MATLAB"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


{{% notice warning %}}
Page under construction.
{{% /notice %}}

```matlab
Z = peaks(50);
surf(Z); 
axis tight manual 
set(gca,'nextplot','replacechildren'); 

v = VideoWriter('peaks.mp4', 'MPEG-4');
open(v);

for k = 1:80
   surf((1 + cos(6*pi*k/80) + cos(2*pi*k/80))* 0.3333 * Z,Z)
   frame = getframe(gcf);
   writeVideo(v,frame);
end

close(v);
```

<div class=videoContainer>
    <video width="50%" controls loop autoplay preload="auto">
        <source src="/ScientificComputingInMatlab/images/unit_06/6_08_1.mp4" type="video/mp4">
    </video>
</div>