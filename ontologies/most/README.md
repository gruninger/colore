# MOlecular Structure Ontology (MoSt)

This repository directory contains the theories found in the MOlecular Structure Ontology (MoSt) written in the Common Logic syntax.

The ontology represents atoms, bonds, functional groups, and molecules as things in the ontology, and imports theories from [molecular_graph](https://github.com/gruninger/colore/blob/master/ontologies/molecular_graph/).

# currently refactoring!
# check the archive directory for old copies of the working axioms

# major changes
================================================
april 21, 2017: renamed all inBond/inGroup/etc. relations to mol(x,y) - all axioms will now require sort constraints

# major design decisions
================================================
ontology allows for:
- unique fusion
- unique spiro
- unique tether
- bridge = one end is spiro'd, other end is tethered

Notes
================================================
- This ontology is currently a work in progress.
- Common functional groups have been axiomatized in the ontology (see [functional groups](http://colore.oor.net/most/definitions)).
- A few molecules have been axiomatized in [most_molecules](https://github.com/gruninger/colore/blob/master/ontologies/most/definitions/most_molecules.clif) for demonstration purposes.

Verification of the Ontology
================================================
- Currently a WIP.
- See the [mappings](https://github.com/gruninger/colore/blob/master/ontologies/most/mappings/) folder for translation definitions.
- See the [interprets](https://github.com/gruninger/colore/blob/master/ontologies/most/interprets/) folder for proofs.

Things To Do
================================================
- Since there are various names for groups and molecules, we have included the common ones listed on Wikipedia (to be updated later with validated names found on ChemSpider).
    - There needs to be a standardized way to axiomatize the names of these molecules with multiple names - ACD/IUPAC/other languages/informal names.
- We currently do not have any axioms for cis/trans isomers at the moment (need a new relation for indicating the geometric placement of carbons); definitions of groups to fix:
    - (cis_but_2_ene x)
    - (trans_but_2_ene x)
    - (cis_pent_2_ene x)
    - (trans_pent_2_ene x)
    - (cis_2_hexene x)
    - (trans_2_hexene x)
    
References
================================================
- http://www.kentchemistry.com/links/organic/isomersofalkanes.htm
- table of functional groups
![test](https://github.com/gruninger/colore/blob/master/ontologies/most/2016-02-16_004830.jpg)
