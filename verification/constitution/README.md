# Constitution translation regressions

Run from the repository root:

```sh
python3 verification/constitution/test_translations.py
```

For a second checkout of the unmodified base commit, also run:

```sh
python3 verification/constitution/test_translations.py --baseline /path/to/base-checkout
```

The baseline for this repair is `28912a28876182e6d6d172b9f703a03376f84611`.
The tests cover six files with concrete encoding defects:

- `constitution.clif`: the second argument of `constitutes` is a `MaterialObject`.
- `matter2boolean_semi/Delta1.clif`: use the existing `chunkOf` predicate, and quantify both arguments of its binary translation.
- `boolean_semi2matter/Pi1.clif`, `material_object2cem_mereology/Delta4.clif`, and `cem_mereology2material_object/Pi4.clif`: quantify both arguments of each binary translation.
- `definitions/portionOf.clif`: close the enclosing `cl-text` expression.

In Common Logic a name outside a quantifier is not automatically a syntax error. The translation problem is semantic: quantifying only `x` constrains a single named second argument, rather than the intended complete binary relation. The tests exhibit two-element interpretations that distinguish these readings. They also distinguish `chunkOf` from an independent predicate named `chuckOf`, and the correct source/target typing from the former source/source typing.

The test reader and evaluator implement only the small relational fragment needed here. They do not resolve imports, validate all of Common Logic, or establish consistency or definitional equivalence of the full theories. The stored `ax1.proof` files are historical evidence for their displayed individual goals; they have not been regenerated or promoted to certificates of entire modules.

## Remaining semantic work

These local repairs do not change the ontology's broader commitments:

- `constitution.clif` still contains both functionality directions, including the condition that a chunk constitutes at most one object. It does not include all domain-disjointness, coverage, or harmony assumptions used by the historical mapping proof inputs.
- The existing `Delta7`/`Pi7` identify matter with points and material objects with lines. `mapping_preserve` preserves order from points to lines. A theory mapping material objects to their constituting chunks requires a separately reviewed reorientation of these translations and their proof obligations.
- The modules named `matter_mereology` and `materialobject_mereology` here contain typed partial-order axioms. Their names and translation-directory names alone do not supply Boolean or closure-extensional mereology axioms.
- `definitions/portionOf.clif` defines object parthood by an equivalence with matter parthood. This is stronger than a one-way preservation axiom. Its historical `cl-text` identifier differs from its file path; this repair preserves that identifier rather than silently migrating it.
- `ontologies/matter/matter.clif` uses auxiliary overlap/disjointness predicates without defining them in that file, and its product-like clause uses a disjunction of proper-part predicates. These require a separate review of intended imports and semantics.

Do not infer that the full representation theorems have been mechanically verified from these focused regression results. The shared `multigeometry/mapping_preserve.clif` is unchanged.
