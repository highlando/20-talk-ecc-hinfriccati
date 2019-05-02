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

# Introduction

 * Descriptor systems have an ODE part and an algebraic part
   * in terms of transfer functions
   * ODE part -- the strictly proper part
   * algebraic part -- polynomial part (only proper and more)

 * Often used: reduce/control the ODE part, keep the polynomial part
   * see HeiSS08 and all that follows these lines
 * this is ODE theory 
   * for model reduction -- no objections
   * for control -- OK, as long as the polynomial part is zero

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
   * the formulas are more explicit
   * can show $T_{zw} < \gamma$ directly 

 1. DAE Riccati Feeback == ZDG Feedback

 2. The projected DAE Riccati simply neglects $D_{11}$

