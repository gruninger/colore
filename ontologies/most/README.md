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

Notes
=====
- This ontology is currently a work in progress.
- Common functional groups have been axiomatized in the ontology (see [functional groups](http://colore.oor.net/most/definitions)).
- A few molecules have been axiomatized in [most_molecules](https://github.com/gruninger/colore/blob/master/ontologies/most/definitions/most_molecules.clif) for demonstration purposes.

Verification of the Ontology
================================================
- Currently a WIP.
- See the [mappings](https://github.com/gruninger/colore/blob/master/ontologies/most/mappings/) folder for translation definitions.
- See the [interprets](https://github.com/gruninger/colore/blob/master/ontologies/most/interprets/) folder for proofs.
