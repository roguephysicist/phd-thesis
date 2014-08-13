Length Gauge Theory of Surface Second Harmonic Generation
=========================================================

Abstract
------------
We present a theoretical review of surface second harmonic generation (SHG) from semiconductor surfaces based on the longitudinal gauge. This layer-by-layer analysis is carefully presented in order to show how a surface SHG calculation can be readily evaluated. The nonlinear susceptibility tensor for a surface, χS (−2ω; ω, ω) is split into two terms relating to inter-band and intra-band one-electron transitions.


Coding Notes (07/13/14)
------------
The work branch of TINIBA contains some preliminary work with calpmn.

The next stage is working on integrands.f90.

First, take a look at Eq. I15 and compare to Eq. G2 that is already coded. These two can be placed in the same subroutine and may be readily completed.

What needs to be done: code Eqs. I15, and I17 and verify that I17 yields the same result as G2.
