# Multimereology - Axiomatizations and Prover9 Proofs
This project folder is designed to store axiomatizations and Prover9 proofs for multimereology. Prover9 is a software tool for automated theorem proving in first-order logic. The folder named 'theorems' contains all necessary proofs for Theorems 3 and 4 in the paper submitted to Formal Ontology in Information Systems Conference for 2023. Under each subfolder: '2dcem2simplicial', 'codi2multimereo', 'multimereo2codi', and 'simplicial2cem', the files are structured as follows: for each input in the '.in' file format and there is a corresponding proof in the '.out' file. 

## Prover9 Proofs for Theorem 3

Theorem 3 is as stated: 
> T<sub>2D_cem_mereology</sub> is logically synonymous to T<sub>simplicial_2_complex</sub>.

To prove Theorem 3, each axiom in T<sub>2D_cem_mereology</sub> is true with respect to the T<sub>simplicial_2_complex</sub> (see *2dcem2simplicial* folder). Likewise, each axiom stated in T<sub>simplicial_2_complex</sub> is true in T<sub>2D_cem_mereology</sub> (see *simplicial2cem* folder).

## Prover9 Proofs for Theorem 4

Theorem 4 is as stated:
> T<sub>2d_codi_down</sub> is logically synonymous to T<sub>multimereo</sub>.

To prove Theorem 4, we need to show a one-to-one correspondence between models of T<sub>2d_codi_down</sub> and models of T<sub>multimereo</sub>. Folder, 'codi2multimereo', is showing the correspondence from T<sub>2d_codi_down</sub> to T<sub>multimereo</sub>. Folder, 'multimereo2codi', is showing the correspondence from T<sub>multimereo</sub> to T<sub>2d_codi_down</sub>.