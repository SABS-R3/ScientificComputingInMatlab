---
title: "Analytical methods: 2nd order"
date: 2020-11-24T16:52:22Z
draft: false
pre: "3. "
---

After dealing with first-order equations, we now look at the simplest type of second-order differential equation, with linear coefficients of the form  
`$$ a\frac{d^2y}{dx^2} + b\frac{dy}{dx} + cy = 0 \,. $$`  
To solve this we look at the solutions to the auxiliary equation, given by  
`$$ ak^2 + bk + c = 0 \,. $$`  
Based on the solutions of the auxiliary equation, the solution takes the following forms:   

- If the solutions are `$k=\alpha,\beta$` where `$\alpha,\beta \in \Re$`, with `$\alpha \neq \beta$` then the solutions to the original equation are of the form `$y=Ae^{\alpha x}+Be^{\beta x}$`, where `$A,B \in \Re$` are constants of integration to be determined by initial or boundary conditions.

- If the solutions are both `$k=\alpha$` where `$\alpha \in \Re$` then the solutions to the original equation are of the form `$y=(A+Bx)e^{\alpha x}$`, where `$A,B \in \Re$` are constants of integration to be determined by initial or boundary conditions.  

- If the solutions are `$k=\pm \beta i$` where `$\beta \in \Re$` then the solutions to the original equation are of the form `$y=A\sin(\beta x)+B\cos(\beta x)$`, where `$A,B \in \Re$` are constants of integration to be determined by initial or boundary conditions.  

- If the solutions are `$k=\alpha\pm\beta i$` where `$\alpha,\beta \in \Re$` then the solutions to the original equation are of the form `$y=e^{\alpha x}[A\sin(\beta x)+B\cos(\beta x)]$`, where `$A,B \in \Re$` are constants of integration to be determined by initial or boundary conditions.   


## Walkthrough  

We wish to solve  
`$$ \frac{d^2y}{dx^2}+2\frac{dy}{dx}+y=0 $$`  
subject to  
`$$ y(0)=0 \quad \textrm{and} \quad y'(1)=1 \,.$$`  
The solutions of the auxiliary equation are both `$k=−1$`, therefore the general solution is  
`$$ y=(A+Bx)e^{−x} \,,$$`  
Applying the boundary conditions `$y(0)=0,y'(1)=1$` gives `$B=e^1, A=0$`, and the solution is therefore  
`$$ y(x)=xe^{1−x} \,. $$`
