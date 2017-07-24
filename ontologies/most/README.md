# MOlecular Structure Ontology (MoSt)

This repository directory contains the theories found in the MOlecular Structure Ontology (MoSt) written in the Common Logic syntax.

The ontology represents atoms, bonds, functional groups, and molecules as things in the ontology, and imports theories from [molecular_graph](https://github.com/gruninger/colore/blob/master/ontologies/molecular_graph/).

![most hierarchy](most_semantic_conditions.jpg)

# Major Changes
===============
- april 21, 2017: renamed all inBond/inGroup/etc. relations to mol(x,y) - all axioms will now require sort constraints

# Major Design Decisions
========================
The ontology allows for:
- unique fusion
- unique spiro
- unique tether
- bridge = one end is spiro'd, other end is tethered
