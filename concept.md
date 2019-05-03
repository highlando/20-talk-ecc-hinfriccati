---
title: Riccati-based $H_\infty$-control for DAEs
author: Jan Heiland
date: \today
institute: CSC
# output: binb::metropolis
# output: ioslides_presentation
output: pdf_document
# output: html_document
---

\include{def}

# Introduction

## Transfer functions of descriptor systems

* Descriptor systems have an ODE part and an algebraic part
 \begin{align*}
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
 \end{align*}

* in terms of transfer functions
 \begin{align*}
 \begin{bmatrix}
	 C^{\mathsf{d}}  & C^{\mathsf{a}}
 \end{bmatrix}
 \begin{bmatrix}
	 sI-A & 0 \\ 0 & sN-I
 \end{bmatrix}^{-1} 
 \begin{bmatrix}
	 B\pd  \\ B\pa
 \end{bmatrix}
 & = C\pd(sI-A)^{-1}B\pd + C\pa\sum_{i=0}^{\nu}(sN)^iB\pa \\
 & = G\pd(s) + G\pa(s)
 \end{align*}

* ODE part $G\pd$ -- the strictly proper part
* algebraic part $G\pd$ -- polynomial part (only proper ($\nu=1$) and more)

##  The pseudo DAE approach with Riccati eqns.

* reduce/control the ODE part, keep the polynomial part
  + see HeiSS08 
  + et al. that follows these lines Benner, Goyal, Gugercin, Heiland, Stykel, Weichelt

* this is ODE theory 
  + for model reduction -- no objections 
    - see the $B\pa \neq 0$ section in HeiSS
  + for control -- OK, as long as the polynomial part is zero
	  - Benner/Heiland/Weichelt: $B\pa=0$

* for control of DAEs through Riccati equations
  * the Riccatis need to consider the algebraic part
  * see, e.g., M\"ockel/Reis/Stykel

## Show case -- Hinf-control of a Descriptor System with an Index-1 Pencil

\begin{align*}
	E\dot{x} &= Ax\phantom{_1} + B_1w\phantom{_1} + B_2 u, \\
				z &= C_1 x + D_{11} w + D_{12} u, \\
				y &= C_2 x + D_{21} w + D_{22} u.
\end{align*}

* generally written as $\Sigma \sim (E,A,[B_1,B_2],[C_1,C_2],D)$

* **Assumption**: $(E, A)$ is of index 1

* **wlog**:
$$
\Sigma\sim \bigl(\indoe,\indoa,\genbobt,\gencoct,D\bigr)
$$

* **wlog**: $D=0$:
$$
\Sigma\sim \bigl(\indoe,\indoa,\tgenbobt,\tgencoct,0 \bigr)
$$

* **assumption** $B_2\pa=0$, $C_2\pa=0$
$$
\Sigma\sim \bigl(\indoe,\indoa,\mybobt,\mycoct,0 \bigr)
$$

* **equivalence** to an LTI with $D=-C_1^IB_1^I$
$$
\Sigma\sim \bigl(I,A,\begin{bmatrix}B_1\pd&B_2\pd\end{bmatrix},\begin{bmatrix}C_1\pd\\C_2\pd\end{bmatrix},D \bigr)
$$

## For this presentation

* assume we can do state-feedback
    - then the suboptimal $\Hinf$ control problem reads
	  - find $\gamma$ and $K$ such that $(E,A-B_2K)$ is admissible^[i.e. *index-1* and stable in the ODE part]
		- and such that $\|T_{zw}\|_\infty = \|[C_1-D_{12}K](\cdot E-(A-B_2K))^{-1}B_1+D_{11}\|_\infty < \gamma$

## Gonna show

In this *index-1* case,

1. Non-symmetric Riccati Feedback is the standard $\Hinf$-Riccati-Feedback for the equivalent ODE system with feedthrough $D$

2. The (projected) symmetric DAE Riccati simply neglects the feedthrough $D$

## Make it the Standard Plant

\begin{align*}
	\left[
	\begin{array}{c|cc}
		\msEAwcf & \Bosf & \Btsf \\
		\hline\\[-.9em]
		\Cosf & 0 & \Dotsf \\
		\Ctsf & \Dtosf & 0 \\
	\end{array}
	\right].
\end{align*}
or, equivalently,
\begin{align*}
	\left[
	\begin{array}{c|cc}
		-sI+J & \sfBo & \sfBt \\
		\hline\\[-.9em]
		\sfCo & \Doosf & \Dotsf \\
		\sfCt & \Dtosf & 0 \\
	\end{array}
	\right].
\end{align*}

# Direct estimation of the $\Hinf$-performance gain

## Warm-up: LTI with no feedthrough

Consider the standard LTI case with $D=0$ with standard assumptions.

Let $\gamma>0$ and $X_\infty$ be a stabilizing solution to the $\Hinf$-Riccati equations
$$
A^*X + XA - X(B_2B_2^* - \gpmt B_1B_1^*)X + C_1^*C_1 = 0
$$

then, for $x$ being a trajectory to 

$$\dot x = Ax + B_1w + B_2u, \quad x(0)=0$$

and 
$$
z = \begin{bmatrix} C_1x \\ u \end{bmatrix},
$$

one derives 

\begin{align*}
\frac{d}{dt}x^*X_\infty x 
&= \dot x^* X_\infty x + x^* x_\infty \dot x = (x^*A^*+w^*B_1^*+u^*B_2^*)X_\infty x + x^*X_\infty(Ax+B_1 w + B_2 u) \\
&= -x^*C_1^*C_1x + x^*X_\infty(B_2B_2^* - \gpmt B_1B_1^*)X_\infty x + 2\langle w, B_1^* X_\infty x \rangle + 2\langle u, B_2^* X_\infty x \rangle \\
&= -\|C_1x \|^2 + \|B_2 X_\infty x\|^2  - \gpmt\|B_1^*X_\infty x\|^2 + 2\langle w, B_1^* X_\infty x \rangle + 2\langle u, B_2^* X_\infty x \rangle \\
&= -\|z\|^2 + \gamma^2 \|w\|^2 - \gamma^2 \|w-\gpmt B_1^*X_\infty x \|^2 + \|u+B_2^* X_\infty u \|^2
\end{align*}

No choose $u=-B_2^*X_\infty x$. Then, for $w\in \mathcal L^2$, also $x(t)\to 0$, as $t\to \infty$, and integration from $0$ to $\infty$ gives

$$
0 = -\|z\|^2_{\mathcal L_2} + \gamma^2 \|w\|^2 _{\mathcal L_2}- \gamma^2 \|w-\gpmt B_1^*X_\infty x \|^2 _{\mathcal L_2}
$$
or
$$
\|z\|^2_{\mathcal L_2} = \gamma^2 \|w\|^2 _{\mathcal L_2}- \gamma^2 \|w-\gpmt B_1^*X_\infty x \|^2 _{\mathcal L_2}
$$
i.e., $\| T_{zw} \| < \gamma$.

## LTI with feedthrough from $z \to w$

Consider 

$$\dot x = Ax + B_1w + B_2u, \quad x(0)=0$$

and 
$$
z = \begin{bmatrix} C_1 x + D_{11}w \\ u \end{bmatrix},
$$

Necessary for a closed-loop $\| T_{zw} \|_\infty < \gamma$: 

$$
\sigma_{\max{}}(D_{11}) < \gamma^2, \quad\text{implying that}\quad -\gamma^2 I+D_{11}^*D_{11} \text{ is invertible}
$$

Then, with $X_\infty$ being a stabilizing solution to the Riccati equation associated with the Hamiltonian pencil^[see, e.g., ZDG Ch. 17.4]

\begin{equation*}
	\begin{split}
&\begin{bmatrix}
		-sI+A & 0 \\
		{C_1\pd}^*{C_1\pd} & -sI - A^*
	\end{bmatrix} \\
&-\begin{bmatrix}
	- B_{1}\pd (- \gamma^2 + D_{11}^* D_{11})^{-1} D_{11}^* C_{1}\pd & B_{2}\pd {B_{2}\pd}^* + B_{1}\pd (- \gamma^2 + D_{11}^* D_{11})^{-1} {B_{1}\pd}^*\\
	- {C_{1}\pd}^* D_{11} (- \gamma^2 + D_{11}^* D_{11})^{-1} D_{11}^* C_{1}\pd &  {C_{1}\pd}^* D_{11} (- \gamma^2 + D_{11}^* D_{11})^{-1} {B_{1}\pd}^*
\end{bmatrix}
\end{split}
\end{equation*}
and $u=-B_2X_\infty x$ from $\int_0^\infty \frac{d}{dt}x^*X_\infty x dt = 0$, one derives
that
$$
\tnsqrd{z} = \tnsqrd{C_1x+D_{11}w}+\tnsqrd{u} = \gamma^2 \tnsqrd{w} - \gamma^2\tnsqrd{\sqrod w - \msqrod D_{11}^*C_1 x - \gpmt \msqrod B_1 X_\infty x}
$$
where $\sqrod$ is a (Cholesky) factor of $I-\gpmt D_{11}^*D_{11}$.

## Same System but as a Descriptor

$$
\indoe \dot x = \indoa x + \mybo w + \mybt u
$$
with
$$
z = \begin{bmatrix} \myco x  \\ u \end{bmatrix}
$$
(note that there is no $D$)

Define the feedback as $-\mybt \Xinf x$, where $\Xinf$ is an admissible solution to the nonsymmetric generalized Riccati equations
$$
\mathcal A^* X + X^* \mathcal A + X^*(B_2B_2^* - \gpmt B_1B_1^*)X + C_1^*C_1 = 0, \quad \mathcal E^*X = X^*\mathcal E.
$$

For this Riccati equation, with $\mathcal E=\indoe$ and $\mathcal A=\indoa$,  can show that

* if $\sigma_{\max{}}(C_1\pa B_1\pa) = \sigma_{\max{}}(D_{11}) < \gamma^2$ and the $(H_\infty)$ has a stabilizing solution, then
  1. $\Xinf$ exists, is admissable, and looks like 
	$\begin{bmatrix} X_\infty & 0 \\ X_{21} & X_{22} \end{bmatrix}$, where
	2. $\Xinf$ is the stabilizing solution associated with $H_\infty$

Thus,

* the feedback $u = -\mybt \Xinf x = -B_2\pd X_\infty x\pd$ is the same as in the standard case

* the $\Hinf$-performance bound,
  $$
  \tnsqrd{z} = \tnsqrd{C_1\pd x\pd-C_1\pa B_1\pa w}+\tnsqrd{u} \leq \gamma^2\tnsqrd{w}
  $$
  follows 

* directly from examining $\frac{d}{dt}x^*\mathcal E^*\Xinf x$
* or from the equivalence to the LTI system and the feedback

## What about the symmetric Riccati Equation

For the considered the projected^[see Benner\&Stykel'14] Riccati equation

$$
\mathcal A^*X\mathcal E + \mathcal E^*X\mathcal A + X(B_2B_2^* - \gpmt B_1B_1^*)X + PC_1^*C_1P^* = 0, \quad X = PXP^* 
$$

the special coordinates with $\mathcal E=\indoe$ and $\mathcal A=\indoa$ imply that

* $P=P^*=\indoe$
* $X = \begin{bmatrix}X_{11} & 0 \\ 0 & 0 \end{bmatrix}$

and that $X_{11}$ of a stabilizing solution $\mathcal X$ 

* coincides with $X_\infty$ with $D_{11}=0$. 
* the feedback $u=-B_2\mathcal Xx$ ensures the following performance bound
  $$
	\tnsqrd{C_1\pd x\pd} + \tnsqrd{u} = \tnsqrd{z+C_1\pa D_1\pa w} = \gamma^2\tnsqrd{w} - \gamma^2 \tnsqrd{w-\gpmt B_1^*X_{11}x}
  $$
* which is at odds with the goal of 
\begin{align*}
	\tnsqrd{z} &= \tnsqrd{C_1\pd x\pd + C_1\pa x\pa} + \tnsqrd{u} \\
	&= \tnsqrd{C_1\pd x\pd - C_1\pa B_1\pa w} + \tnsqrd{u} < \gamma^2\tnsqrd{w}
\end{align*}
