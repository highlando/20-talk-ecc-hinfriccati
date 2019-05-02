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

##  The pseudo DAE approach

* reduce/control the ODE part, keep the polynomial part
  + see HeiSS08 
  + et al. that follows these lines Benner, Goyal, Gugercin, Heiland, Stykel, Weichelt

* this is ODE theory 
  + for model reduction -- no objections 
  + for control -- OK, as long as the polynomial part is zero

* for control of DAEs through Riccati equations
  * the Riccatis need to consider the algebraic part

## Show case -- Hinf-control of a Descriptor System with an Index-1 Pencil

* generally written like $(E,A,[B_1,B_2],[C_1,C_2],D)$
* transform into wcf $(E,A,[B_1,B_2],[C_1,C_2],D)$
* transform into D=0: $(E,A,[B_1,B_2],[C_1,C_2],0)$
* assumption $B_2^I=0$, $C_2^I=0$
* equivalence to LTI with $D_{11}=-C_1^IB_1^I$

## Gonna show

* assume state-feedback
  + the formulas are more explicit
  + can show $T_{zw} < \gamma$ directly 

1. DAE Riccati Feeback == ZDG Feedback

2. The projected DAE Riccati simply neglects $D_{11}$
