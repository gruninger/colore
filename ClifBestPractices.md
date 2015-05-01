# Item 1: Employ modular design principles #


# Item 2: Avoid unnamed texts #

ISO 24707 allows for both named and unnamed texts (see section A.2.3.11).  However, unnamed texts cannot be referenced outside of their own scope and are not generally useful when constructing ontologies from modular components ([see Item 1](ClifBestPractices#Item_1:_Employ_modular_design_principles.md)).  It is therefore recommended that all CL texts be named using an appropriate identifier ([see Item 3](ClifBestPractices#Item_3:_Name_things_using_URNs.md)).


# Item 3: Name things using URNs #

Many constructs within the Common Logic content that you create will require names.  The principle of modular ontology design ([see Item 1](ClifBestPractices#Item_1:_Employ_modular_design_principles.md)) requires names to be defined uniquely across different CL texts.  Numerous mechanisms for defining globally unique names have been developed for use within a variety of contexts.  The Universal Resource Name (URN) scheme promoted by the IETF is well suited for defining globally unique names for use within Common Logic content.  A detailed discussion on CL naming conventions may be found on the wiki page describing [COLORE Naming Conventions](ColoreNamingConventions.md).

# Item 4: Use legible names #

This is a tradeoff between using terms in your ontology that allow a human to follow what you are saying, but don't confuse natural language terms with your ontology vocabulary. As above, a detailed discussion on CL naming conventions may be found on the wiki page describing [COLORE Naming Conventions](ColoreNamingConventions.md).