# MOlecular Structure Ontology (MoSt)

This repository directory contains the theories found in the MOlecular Structure Ontology (MoSt) written in the Common Logic syntax.

The ontology represents atoms, bonds, functional groups, and molecules as things in the ontology, and imports theories from [most_graph](../blob/master/ontologies/molecular_graph).

Notes
================================================
- This ontology is currently a work in progress.
- Common functional groups have been axiomatized in the ontology

To Do
================================================
- Since there are various names for groups and molecules, we have included the common ones listed on Wikipedia (to be updated later with validated names found on ChemSpider).
- We currently do not have any axioms for cis/trans isomerism at the moment (need a new relation?); definitions of groups to fix:
- - (cis_but_2_ene x)
- - (trans_but_2_ene x)
- - (cis_pent_2_ene x)
- - (trans_pent_2_ene x)
- Include fork/end relation in definitions of functional groups???