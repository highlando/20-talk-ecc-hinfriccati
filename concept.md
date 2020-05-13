---
title: Riccati-based $\mathcal H _ \infty$-control for DAEs
author: 
- Jan Heiland
- Peter Benner
date: \today
bibliography: 
- hinf-ric-talk.bib
# - bib-dae-hinf.bib
# - mor.bib
---

# Introduction

## Descriptor systems

$$
\def\pd{^{\mathsf{d}}}
\def\pa{^{\mathsf{a}}}
\def\Hinf{\mathcal{H} _ \infty}
\def\indoe{\begin{bmatrix}I&0\\0&0\end{bmatrix}}
\def\indoa{\begin{bmatrix}A&0\\0&I\end{bmatrix}}
\def\genbobt{\begin{bmatrix}B_1 & B_2\end{bmatrix}}
\def\gencoct{\begin{bmatrix}C_1 \\ C_2\end{bmatrix}}
\def\tgenbobt{\begin{bmatrix}\tilde B_1 & \tilde B_2\end{bmatrix}}
\def\tgencoct{\begin{bmatrix}\tilde C_1 \\ \tilde  C_2\end{bmatrix}}
\def\mybobt{\begin{bmatrix}B_1\pd & B_2\pd \\ B_1\pa & 0\end{bmatrix}}
\def\mycoct{\begin{bmatrix}C_1\pd & C_1\pa \\ C_2\pd & 0\end{bmatrix}}
\def\mybo{\begin{bmatrix}B_1\pd \\ B_1\pa \end{bmatrix}}
\def\mybt{\begin{bmatrix}B_2\pd \\ 0 \end{bmatrix}}
\def\myco{\begin{bmatrix}C_1\pd & C_1\pa \end{bmatrix}}
\def\myct{\begin{bmatrix}C_2\pd & 0 \end{bmatrix}}
\def\gpmt{\gamma^{-2}}
\newcommand\tnsqrd[1]{ \| #1 \| _ 2^2}
\def\sqrod{\tilde D^{\frac{1}{2}}}
\def\msqrod{\tilde D^{-\frac{1}{2}}}
\def\Xinf{\mathcal X _ \infty}
\def\xinf{X _ \infty}
$$

Descriptor systems have an ODE part and an algebraic part

$$
\begin{split}
 \begin{bmatrix}
 I & 0 \\ 0 & N
 \end{bmatrix} \dot x 
 & = 
 \begin{bmatrix}
 A & 0 \\ 0 & I
 \end{bmatrix} x +
 \begin{bmatrix}
 B^{\mathsf{d}}  \\ B^{\mathsf{a}}
 \end{bmatrix}u \\
 y  & =
 \begin{bmatrix}
 C^{\mathsf{d}}  & C^{\mathsf{a}}
 \end{bmatrix}x 
\end{split}
$$

(Note that $N$ is nilpotent and not invertible)

## Transfer functions

$$
\begin{split}
 G(s) &=  \begin{bmatrix}
    C^{\mathsf{d}}  & C^{\mathsf{a}}
  \end{bmatrix}
  \begin{bmatrix}
    sI-A & 0 \\ 0 & sN-I
  \end{bmatrix}^{-1} 
   \begin{bmatrix}
    B\pd  \\ B\pa
  \end{bmatrix}\\
  & \quad = C\pd(sI-A)^{-1}B\pd + C\pa\sum _ {i=0}^{\nu}(sN)^iB\pa \\
  & \quad = G\pd(s) + G\pa(s)
\end{split}
$$

* ODE part $G\pd$ -- the strictly proper part

* algebraic part $G\pa$ -- polynomial part <!--(only proper ($\nu=1$) and more)-->

## Control with DAE-Riccati

* Typically done: control the ODE part, keep the polynomial part

* for control -- OK, as long as the polynomial part is zero

    + in fact, in Benner, Heiland, Weichelt: $B\pa=0$
    + if not, the Riccatis need to consider the algebraic part
    + see, e.g., @MoeRS11

# $\Hinf$-control 

## The basic equations

\begin{align*}
\mathcal E\dot{x} &= \mathcal Ax\phantom{_1} + B_1w\phantom{_1} + B_2 u, \\
  z &= C_1 x + D_{11} w + D_{12} u, \\
  y &= C_2 x + D_{21} w + D_{22} u.
\end{align*}

* generally written as $\Sigma \sim (\mathcal E,\mathcal A,[B_1,B_2],[C_1,C_2],D)$

## The $\mathcal H _ \infty$ control problem

* For now, we assume that we can do state-feedback.

* Then the suboptimal $\Hinf$ control problem reads

    1. find $\gamma$ and $K$ such that $(\mathcal E,\mathcal A-B_2K)$ is admissible^[i.e. *index-1* and stable in the ODE part]

    2. and such that, with $u=-B_2Kx$, the map of the perturbance to the performance output is bounded, i.e. $$\|z\|_2 < \gamma \|w\|_2$$

-----

* **Assumption**: $(\mathcal E, \mathcal A)$ is of index 1

* **wlog**: Weierstra&szlig; Canonical Form
$$
\Sigma\sim \bigl(\indoe,\indoa,\genbobt,\gencoct,D\bigr)
$$


* **wlog**: $D=0$:
$$
\Sigma\sim \bigl(\indoe,\indoa,\tgenbobt,\tgencoct,0 \bigr)
$$

-----

* **Assumption**: $B_2\pa=0$, $C_2\pa=0$
$$
\Sigma\sim \bigl(\indoe,\indoa,\mybobt,\mycoct,0 \bigr)
$$

* **Equivalence**: to a standard LTI system with feedthrough
$$
\Sigma\sim \bigl(I,A,\begin{bmatrix}B_1\pd&B_2\pd\end{bmatrix},\begin{bmatrix}C_1\pd\\C_2\pd\end{bmatrix},
  \begin{bmatrix}D_{11}&0\\0&0\end{bmatrix}
  \bigr)
$$

# Equivalence of DAE and ODE Riccati Feedback


## Main results

In this *index-1* case,

1. Non-symmetric Riccati Feedback is the standard $\Hinf$-Riccati-Feedback for the equivalent ODE system with feedthrough $D_{11}$.

3. The (projected) symmetric DAE Riccati simply neglects the feedthrough.

## LTI with feedthrough

Consider 

$$\dot x = Ax + B_1w + B_2u, \quad x(0)=0$$

and 
$$
z = \begin{bmatrix} C_1 x + D _ {11}w \\ u \end{bmatrix}.
$$

## The modified Hamiltonian

With $X _ \infty$ being a stabilizing solution to the Riccati equation associated with the Hamiltonian pencil^[see, e.g., @ZhoDG96, Ch. 17.4]
$$
\small
\begin{split}
&\begin{bmatrix}
-sI+A & 0 \\
{C_1\pd}^*{C_1\pd} & -sI - A^*
\end{bmatrix} \\
&-\begin{bmatrix}
- B_{1}\pd (- \gamma^2 + D_{11}^* D_{11})^{-1} D_{11}^* C_{1}\pd & B_{2}\pd {B_{2}\pd}^* + B_{1}\pd (- \gamma^2 + D_{11}^* D_{11})^{-1} {B_{1}\pd}^*\\
- {C_{1}\pd}^* D_{11} (- \gamma^2 + D_{11}^* D_{11})^{-1} D_{11}^* C_{1}\pd &  {C_{1}\pd}^* D_{11} (- \gamma^2 + D_{11}^* D_{11})^{-1} {B _ {1}\pd}^*
\end{bmatrix}
\end{split}
$$
the feedback $u=-B_2X _ \infty x$ 
solves the robust regulator problem.

## As a descriptor system

$$
\indoe \dot x = \indoa x + \mybo w + \mybt u
$$
with
$$
z = \begin{bmatrix} \myco x  \\ u \end{bmatrix}.
$$
(note that there is no $D$!)

## The DAE Riccati

Define the feedback as $u = -\mybt^ * \Xinf x$, where $\Xinf$ is an admissible solution to the nonsymmetric generalized Riccati equation
$$
\begin{split}
\mathcal A^* X + X^* \mathcal A - X^*(B_2B_2^* - \gpmt B_1B_1^*)X + C_1^*C_1 = 0, \\ \quad \mathcal E^*X = X^*\mathcal E.
\end{split}
$$


-----


For this Riccati equation, with $\mathcal E=\indoe$ and $\mathcal A=\indoa$:

### Lemma

If $\sigma_{\max{}}(C_1\pa B_1\pa) = \sigma_{\max{}}(D_{11}) < \gamma^2$ and there exists a $\gamma$-stabilizing controller, then

  1. $\Xinf$ exists, is admissable, and looks like 
$\begin{bmatrix} X_\infty & 0 \\ X_{21} & X_{22} \end{bmatrix}$, where

  2. $\xinf$ is the stabilizing solution associated with the Hamiltonian pencil of the LTI with $D_{11}=-C_1\pa B_1\pa$.

-----


Thus,

* the feedback $u = -\mybt \Xinf x = -B_2\pd X_\infty x\pd$ is the same as in the standard case,

* the $\Hinf$-performance bound,
  $$
  \tnsqrd{z} = \tnsqrd{C_1\pd x\pd-C_1\pa B_1\pa w}+\tnsqrd{u} \leq \gamma^2\tnsqrd{w}
  $$
  follows 

* directly from examining $\frac{d}{dt}x^*\mathcal E^*\Xinf x$
* or from the equivalence to the LTI system and the feedback.

## Symmetric Riccati Equation

<!-- For the considered case, the projected^[see Benner\&Stykel'14] Riccati equation reads -->
The projected^[see, e.g., @BenS14 ] Riccati equation read

$$
\mathcal A^*X\mathcal E + \mathcal E^*X\mathcal A - X(B_2B_2^* - \gpmt B_1B_1^*)X + PC_1^*C_1P^* = 0.
$$

With $(\mathcal E, \mathcal A)$ in the Weierstra&szlig; Canonical Form, we infer that

 * $P=P^*=\indoe$ and $\mathcal X = \begin{bmatrix}X_{11} & 0 \\ 0 & 0 \end{bmatrix}$
 * and that the $X_{11}$ of a stabilizing solution $\mathcal X$ 
 * coincides with $X_\infty$ with $D_{11}=0$,

. . .

 * so that the feedback $u=-B_2\mathcal Xx$ ensures $\gamma$-stability 
<!-- that
$$\small \tnsqrd{C_1\pd x\pd} + \tnsqrd{u} = 
\gamma^2\tnsqrd{w} - \gamma^2 \tnsqrd{w-\gpmt B_1^*X_{11}x},$$ -->
<!-- \tnsqrd{z-D_{11} w} = -->
 * only for the case of no feed through. 

# Conclusion
## Conclusion

* For control, a Riccati equation has to respect the algebraic components

* If $(\mathcal E,\mathcal A)$ is index-1, then the Descriptor system is equivalent to a standard system LTI with feedthrough

* For state-feedback the suboptimal $\Hinf$-controller can be defined and estimated explicitly

* The non-symmetric Riccati approach coincides with the standard results

## Спасибо

### Thank you

### Dankesch&ouml;n

[www.mpi-magdeburg.mpg.de/823023/cacsd](https://www.mpi-magdeburg.mpg.de/823023/cacsd)

[www.janheiland.de](https://janheiland.de)

[heiland@mpi-magdeburg.mpg.de](mailto:heiland@mpi-magdeburg.mpg.de)

## References

---
nocite: |
    @MoeRS11
...

