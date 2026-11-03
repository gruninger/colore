#!/usr/bin/env python3
"""Focused regressions for six repaired legacy constitution CLIF files.

Run: python3 verification/constitution/test_translations.py
Optional baseline: python3 verification/constitution/test_translations.py \
    --baseline /path/to/unmodified/colore

This deliberately small S-expression reader/evaluator supports only the
first-order relational fragment used in these assertions. It does NOT validate
the Common Logic standard, resolve imports, replay old proofs, or certify the
R2 manuscript. The counterinterpretations concern selected local sentences,
not the conjunction of every imported ontology.

Common Logic permits names outside quantifiers. Thus an unquantified `y` is
not automatically a syntax error: the defect here is that the intended binary
definition constrains only a named column instead of all second arguments.
"""
from __future__ import annotations

import argparse
from itertools import product
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]
BASELINE = None
CONSTITUTION = Path("ontologies/constitution/constitution.clif")
PORTION = Path("ontologies/constitution/definitions/portionOf.clif")
TRANSLATIONS = {
    "matter2boolean_semi/Delta1.clif": ("part", "chunkOf"),
    "boolean_semi2matter/Pi1.clif": ("chunkOf", "part"),
    "material_object2cem_mereology/Delta4.clif": ("leq", "portionOf"),
    "cem_mereology2material_object/Pi4.clif": ("portionOf", "leq"),
}
TRANSLATION_ROOT = Path("ontologies/constitution/theorems")
VARIABLE_LIKE = re.compile(r"[xyzuvw](?:[0-9]+)?\Z")


def parse(text):
    # The six target files use C-style block comments and unquoted atom names.
    # Fail closed if quoted names/comments or unsupported delimiters occur.
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    if "/*" in text or "*/" in text or any(c in text for c in "\"'[]{}"):
        raise ValueError("Unsupported or unterminated token/comment")
    tokens = re.findall(r"\(|\)|[^\s()]+", text)
    stack, result = [], []
    for token in tokens:
        if token == "(":
            node = []
            (stack[-1] if stack else result).append(node)
            stack.append(node)
        elif token == ")":
            if not stack:
                raise ValueError("Unexpected closing parenthesis")
            stack.pop()
        else:
            if not stack:
                raise ValueError("Top-level atom outside CL text")
            stack[-1].append(token)
    if stack:
        raise ValueError("Unclosed parenthesis")
    if len(result) != 1 or not result[0] or result[0][0] != "cl-text":
        raise ValueError("Expected one cl-text wrapper")
    return result[0]


def sentences(root, path):
    tree = parse((root / path).read_text())
    return [node for node in tree[2:] if node and node[0] != "cl-imports"]


def unbound_variable_like_names(formula, bound=frozenset()):
    op, *args = formula
    if op in ("forall", "exists"):
        names, body = args
        return unbound_variable_like_names(body, bound | set(names))
    if op in ("and", "or", "not", "if", "iff"):
        return set().union(*(unbound_variable_like_names(a, bound) for a in args))
    return {term for term in args if VARIABLE_LIKE.fullmatch(term) and term not in bound}


def evaluate(formula, domain, relations, constants=None, env=None):
    constants, env = constants or {}, env or {}
    op, *args = formula
    if op in ("forall", "exists"):
        names, body = args
        values = (evaluate(body, domain, relations, constants, env | dict(zip(names, vals)))
                  for vals in product(domain, repeat=len(names)))
        return all(values) if op == "forall" else any(values)
    if op == "not":
        return not evaluate(args[0], domain, relations, constants, env)
    if op in ("and", "or", "if", "iff"):
        values = [evaluate(a, domain, relations, constants, env) for a in args]
        if op == "and": return all(values)
        if op == "or": return any(values)
        if op == "if": return not values[0] or values[1]
        return values[0] == values[1]
    terms = tuple(env[t] if t in env else constants[t] for t in args)
    if op == "=":
        return terms[0] == terms[1]
    if op not in relations:
        raise ValueError(f"Missing predicate interpretation: {op}")
    return terms in relations[op]


def binary_definition(root, relative):
    candidates = [s for s in sentences(root, TRANSLATION_ROOT / relative)
                  if s[0] == "forall" and s[2][0] == "iff" and s[2][1][0] != "="
                  and len(s[2][1]) == 3]
    if len(candidates) != 1:
        raise ValueError(f"Expected one binary translation in {relative}")
    return candidates[0]


class TranslationRegressions(unittest.TestCase):
    def test_balanced_wrappers_and_bound_intended_variables(self):
        paths = [CONSTITUTION, PORTION] + [TRANSLATION_ROOT / p for p in TRANSLATIONS]
        for path in paths:
            with self.subTest(path=str(path)):
                for formula in sentences(ROOT, path):
                    self.assertEqual(unbound_variable_like_names(formula), set())

    def test_binary_translations_hold_for_identical_relations(self):
        domain, diagonal = (0, 1), {(0, 0), (1, 1)}
        for path, (left, right) in TRANSLATIONS.items():
            with self.subTest(path=path):
                self.assertTrue(evaluate(binary_definition(ROOT, path), domain,
                                         {left: diagonal, right: diagonal}))

    def test_every_second_argument_is_constrained(self):
        # The two relations agree in column 0, but differ at (1, 1).
        domain = (0, 1)
        for path, (left, right) in TRANSLATIONS.items():
            with self.subTest(path=path):
                formula = binary_definition(ROOT, path)
                model = {left: {(0, 0)}, right: {(0, 0), (1, 1)}}
                self.assertFalse(evaluate(formula, domain, model, {"y": 0}))
                missing_y = ["forall", ["x"], formula[2]]
                self.assertEqual(unbound_variable_like_names(missing_y), {"y"})
                self.assertTrue(evaluate(missing_y, domain, model, {"y": 0}))

    def test_matter_translation_uses_actual_chunk_relation(self):
        formula = binary_definition(ROOT, "matter2boolean_semi/Delta1.clif")
        # A separate, misspelled predicate can agree with part while chunkOf does not.
        model = {"part": {(0, 0), (1, 1)}, "chuckOf": {(0, 0), (1, 1)},
                 "chunkOf": {(0, 0), (0, 1), (1, 1)}}
        self.assertFalse(evaluate(formula, (0, 1), model))
        misspelled = ["forall", ["x", "y"], ["iff", ["part", "x", "y"], ["chuckOf", "x", "y"]]]
        self.assertTrue(evaluate(misspelled, (0, 1), model))

    def test_constitution_types_its_target(self):
        typing = sentences(ROOT, CONSTITUTION)[0]
        model = {"mat": {("m",)}, "MaterialObject": {("o",)}, "constitutes": {("m", "o")}}
        self.assertTrue(evaluate(typing, ("m", "o"), model))
        old_typing = ["forall", ["x", "y"], ["if", ["constitutes", "x", "y"],
                      ["and", ["mat", "x"], ["MaterialObject", "x"]]]]
        self.assertFalse(evaluate(old_typing, ("m", "o"), model))
        wrong_target_model = {"mat": {("m",)}, "MaterialObject": {("m",)}, "constitutes": {("m", "o")}}
        self.assertFalse(evaluate(typing, ("m", "o"), wrong_target_model))
        self.assertTrue(evaluate(old_typing, ("m", "o"), wrong_target_model))

    def test_repaired_local_constitution_accepts_typed_example(self):
        model = {"mat": {("m",)}, "MaterialObject": {("o",)}, "constitutes": {("m", "o")}}
        self.assertTrue(all(evaluate(f, ("m", "o"), model) for f in sentences(ROOT, CONSTITUTION)))

    def test_portion_definition_requires_closed_wrapper(self):
        text = (ROOT / PORTION).read_text().rstrip()
        parse(text)
        self.assertTrue(text.endswith(")"))
        with self.assertRaises(ValueError):
            parse(text[:-1])

    def test_original_snapshot_reproduces_all_six_defects(self):
        if BASELINE is None:
            self.skipTest("Pass --baseline to test the unmodified snapshot too")
        with self.assertRaises(ValueError):
            sentences(BASELINE, PORTION)
        for path in TRANSLATIONS:
            self.assertEqual(unbound_variable_like_names(binary_definition(BASELINE, path)), {"y"})
        original_delta = binary_definition(BASELINE, "matter2boolean_semi/Delta1.clif")
        model = {"part": {(0, 0), (1, 1)}, "chuckOf": {(0, 0), (1, 1)}, "chunkOf": set()}
        self.assertTrue(evaluate(original_delta, (0, 1), model, {"y": 0}))
        self.assertFalse(evaluate(binary_definition(ROOT, "matter2boolean_semi/Delta1.clif"), (0, 1), model))
        typed = {"mat": {("m",)}, "MaterialObject": {("o",)}, "constitutes": {("m", "o")}}
        self.assertFalse(evaluate(sentences(BASELINE, CONSTITUTION)[0], ("m", "o"), typed))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", type=Path)
    args, remaining = parser.parse_known_args()
    BASELINE = args.baseline
    unittest.main(argv=[__file__] + remaining, verbosity=2)
