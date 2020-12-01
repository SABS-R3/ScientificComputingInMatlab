---
title: "Complex numbers"
date: 2020-11-19T16:52:22Z
draft: false
pre: "8. "
---


{{% notice info %}}
MATLAB can also handle complex numbers.
If you have never heard of these before, then look them up in:

- an A-level textbook,
- on [the Wolfram MathWorld pages](https://mathworld.wolfram.com/ComplexNumber.html),
- or on [Wikipedia](https://en.wikipedia.org/wiki/Complex_number)

before you continue.
{{% /notice %}}

### Walkthrough

Complex numbers may be entered as, for example,

```matlab
z=3+4i
```

The real part, imaginary part, magnitude, argument (in radians) and complex conjugate of z may be evaluated using the following commands:

```matlab
real(z)
imag(z)
abs(z)
angle(z)
conj(z)
```

{{% notice question %}}
Question: What are the results of the above operations?

{{%expand "Expand for solution"%}}
- `real(z)` = 3.
- `imag(z)` = 4.
- `abs(z)` = 5.
- `angle(z)` = 0.9273.
- `conj(z)` = 3-4i.
{{% /expand%}}

{{% /notice %}}
