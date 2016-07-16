## Introduction
#################
01. Cover Page
    Image: 3D model of RpP from Si(111)(1x1):H. Our calculations for SSHG are
    robust and predictive at this point.
#################
02. SHG
    Brief intro, mention that nonlinear crystal is a highly nonlinear active
    material. Segue into next slide...
#################
03. Photo of KDP crystal
    Excited at 800nm, so SHG emission is at exactly half of that (400nm). 800nm
    is infrared so we can't see it in the picture.
#################
04. Energy level diagrams
    Virtual states do not correspond to real energy levels in the system! This
    is IPA, where we only consider one electron and neglect other electrons and
    electron-hole pairs (excitons) Fluorescence has nanosecond emission (takes
    some time to relax), while SHG is in femtoseconds (almost instantaneous
    emission). These need not be eigen states of the atomic system. Whenever the
    virtual states coincide with real states, there is a resonant enhancement of
    the signal. These states need a very high signal intensity, as they have a
    very short lifetime (hence, the use of femtosecond lasers)
#################
05. Applications: XP2SHG
    SHG is extremely sensitive, non-invasive, and non-destructive surface probe.
    Talk about how surface oxidation and temperature affects SHG spectra. Other
    applications, such as frequency conversion, and nonlinear microscopy for
    detecting nanoparticles and certain biological tissues.
#################
06. Applications: TSVs
    Through Silicon Vias are used for stacking silicon layers. The provide
    connectivity between the different components. These TSVs lead to very fast
    communication and lower power consumption. However, the thermal properties
    of the metallic TSVs do not closely match the surrounding Si, creating
    strain fields in the Si around the TSVs. SHG is a very good probe for these
    strain fields.
#################
07. Second-order processes
    Many interesting semiconductor materials are centrosymmetric (including bulk
    Si). SHG is a second-order process, so we need to determine the nonlinear
    susceptibility. For this work, we disregard any quadrupolar response from
    the bulk, so we obtain a response unique to the surface.
#################
08. Centrosymmetric materials
    Self-explanatory
#################
09. Drawing of a simple system
    chi2 is expressed in the part where it is nonzero. We neglect the
    quadrupolar bulk response from this point out.
#################
10. Test cases
    The Si(001)(2x1) surface is clearly non-centrosymmetric. The upper surface
    is in a clean, 2x1 reconstruction with the surface comprised of asymmetrical
    dimers. The lower surface is H-saturated, forcing the Si to occupy the ideal
    bulk positions. We will use this surface for the first part of this work.
    The Si(111)(1x1):H surface is centrosymmetric and experimentally
    well-characterized, so we will use this in the second part of this work.

## chi2
#################
11. New elememts
    1. DFT-LDA produces an underestimated band gap, so the scissors operator
       improves on this by allowing us to "open" the DFT-LDA gap to its correct
       experimental or GW value. This is accomplished by rigidly shifting the
       conduction bands (in energy) so the gap is corrected.
    2. The success of the PA is due to the fact that it enables the study of
       very complex large-scale systems, by removing the core electrons from the
       calculations and treating only the valence electrons, which are the
       chemically active players. In the PA, the core electrons are frozen and
       the electron-ion Coulomb interaction for the valence electrons is
       replaced by an effective  semilocal or fully nonlocal potential.
    The nonlocal part of the pseudopotential relates to the angular momentum of
    the electron. In this formulation, it is accounted for by computing the
    matrix elements of v, instead of p. If we neglect the nonlocal operators,
    the momentum operator can be used in place of the velocity operator.
    3. The layered cut-function allows us to select the surface response, or
       even particular layers of our slab.
#################
12. Scissors operator and vnl
    Explain what each term is, p is the electron momentum operator, r is the
    electron position operator, Vnl is the nonlocal part of the pseudopotential,
    and S is the scissors correction.
#################
13. Layered cut function
    Allows us to choose a particular layer, and we can easily convert any
    operator to its layered counterpart by the equation listed there. If we set
    C(z) to 1 across the whole slab, we recover the bulk quantities.
#################
14. Cut function diagram
    How we can select different layers, or indeed encompass a large portion of
    layers. This allows us to isolate the surface response from the slab.
#################
15. Bigass expressions for chi2
    Terms are divided into 1w and 2w transitions, for interband and intraband
    transitions. Interband happens between different valence and conduction
    bands, while intraband transitions occur over small energy differences along
    the same band. v and c and real valence and conduction states. q are virtual
    states, so the innermost sum is over all the virtual states. That gradient
    turns into the generalized derivative that can then be calculated
#################
16. Software 1
    You got this man
#################

Local field effects: 
Los enlaces entre los atomos interacciona con el campos externo y se comportan
como dipolos. Los campos locales son la influencia que tienen sobre un dipolo
dado el resto de los dipolos.
