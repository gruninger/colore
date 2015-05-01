### By Cameron Ross ###
This page is currently a work in progress!!!

# The Universal Resource Name Scheme #

# The COLORE Resource Model #

The COLORE Resource Model (CRM) is loosely based on the Resource-Oriented Architecture (ROA) defined in [Richardson & Ruby](ColoreResourceModel#References.md).  Although the ROA has been designed specifically to support RESTful Web Services, the guiding principles behind the methodology have been extended for COLORE's more general scope.

COLORE resources are categorized according to the purpose they server within the COLORE system.  The Core resource category contains resources associated with the actual CL content contained within the repository.  Other resource categories, such as the User resource category, describe relationships between non-CL content and the Core resource model.

## Common Logic Resources ##

Within the ROA, resources may be thought of as anything that is interesting enough to be identified by name.  According to the [ISO 24707](ColoreResourceModel#References.md) specification, the Common Logic constructs that may be identified explicitly include texts, modules and importations (see Section 6.1).  Therefore, these constructs form the base set of Common Logic resources within the CRM.  We have avoided introducing COLORE specific constructs, such as categories, ontologies and users, into the CL resource model to make these resource descriptions useful outside the scope of COLORE.

  * **_urn:oor:colore:texts_** is the directory of all COLORE texts.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text}_.

  * **_urn:oor:colore:texts:{text}_** is the most recent version of the CL text identified by _{text}_.   This resource is represented as a listing of CLIF text.

  * **_urn:oor:colore:texts:{text}:{version}_** is the version, identified by _{version}_, of the CL text identified by _{text}_.   This resource is represented as a listing of CLIF text.

  * **_urn:oor:colore:texts:{text}:{rep\_type}_** is the most recent version of the CL text identified by _{text}_.  This resource is represented as a listing of CL text in the syntax identified by _{rep\_type}_ (e.g. CLIF, CGIF, CLCE etc.).

  * **_urn:oor:colore:texts:{text}:{version}:{rep\_type}_** is the version, identified by _{version}_, of the CL text identified by _{text}_.  This resource is represented as a listing of CL text in the syntax identified by _{rep\_type}_ (e.g. CLIF, CGIF, CLCE etc.).

  * **_urn:oor:colore:modules_** is the directory of all COLORE modules.  This resource is represented as a list of URN strings of the form _urn:oor:colore:module:{module}_.

  * **_urn:oor:colore:modules:{module}_** is the most recent version of the CL module identified by _{module}_.   This resource is represented as a listing of CLIF text.

  * **_urn:oor:colore:modules:{module}:{version}_** is the version, identified by _{version}_, of the CL module identified by _{module}_.   This resource is represented as a listing of CLIF text.

  * **_urn:oor:colore:modules:{module}:{rep\_type}_** is the most recent version of the CL module identified by _{module}_.  This resource is represented as a listing of CL text in the syntax identified by _{rep\_type}_ (e.g. CLIF, CGIF, CLCE etc.).

  * **_urn:oor:colore:modules:{module}:{version}:{rep\_type}_** is the version, identified by _{version}_, of the CL module identified by _{module}_.  This resource is represented as a listing of CL text in the syntax identified by _{rep\_type}_ (e.g. CLIF, CGIF, CLCE etc.).

  * **_urn:oor:colore:texts:{text}:direct\_imports_** is the directory representing the named texts and modules explicitly imported into the most recent version of the CL text identified by _{text}_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text}_ and _urn:oor:colore:modules:{module}_.

  * **_urn:oor:colore:texts:{text}:{version}:direct\_imports_** is the directory representing the named texts and modules explicitly imported into the version, identified by _{version}_, of the CL text identified by _{text}_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text}_ and _urn:oor:colore:modules:{module}_.

  * _**urn:oor:colore:texts:{text}:import\_closure** is the directory representing the transitive closure of all named texts and modules associated with the most recent version of the CL text identified by_{text}_.  This resource is represented as a list of URN strings of the form_urn:oor:colore:texts:{text}_and_urn:oor:colore:modules:{module}_._

  * _**urn:oor:colore:texts:{text}:{version}:import\_closure** is the directory representing the transitive closure of all named texts and modules associated with the version, identified by_{version}_, of the CL text identified by_{text}_.  This resource is represented as a list of URN strings of the form_urn:oor:colore:texts:{text}_and_urn:oor:colore:modules:{module}_._

  * **_urn:oor:colore:modules:{module}:direct\_imports_** is the directory representing the named texts and modules explicitly imported into the most recent version of the CL module identified by _{module}_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text}_ and _urn:oor:colore:modules:{module}_.

  * **_urn:oor:colore:modules:{module}:{version}:direct\_imports_** is the directory representing the named texts and modules explicitly imported into the version, identified by _{version}_, of the CL module identified by _{module}_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text}_ and _urn:oor:colore:modules:{module}_.

  * _**urn:oor:colore:modules:{module}:import\_closure** is the directory representing the transitive closure of all named texts and modules associated with the most recent version of the CL module identified by_{module}_.  This resource is represented as a list of URN strings of the form_urn:oor:colore:texts:{text}_and_urn:oor:colore:modules:{module}_._

  * _**urn:oor:colore:modules:{module}:{version}:import\_closure** is the directory representing the transitive closure of all named texts and modules associated with the version, identified by_{version}_, of the CL module identified by_{module}_.  This resource is represented as a list of URN strings of the form_urn:oor:colore:texts:{text}_and_urn:oor:colore:modules:{module}_._

## Structural Resources ##

  * **_urn:oor:colore:ontologies_** is the directory of all COLORE ontologies.  This resource is represented as a list of URN strings of the form _urn:oor:colore:ontologies:{ontology\_name}_.

  * **_urn:oor:colore:ontologies:{ontology\_name}_** is the directory of all named cl-texts and cl-modules comprising the COLORE ontology identified by _ontology\_name_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:texts:{text\_name}_.

  * **_urn:oor:colore:categories:{category\_name}_** is the directory of all COLORE ontologies belonging to _category\_name_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:ontologies:{ontology\_name}_.

  * **_urn:oor:colore:categories_** is the directory of all categories supported by COLORE.  This resource is represented as a list of URN strings of the form _urn:oor:colore:categories:{category\_name}_.

  * **_urn:oor:colore:ontologies:{ontology\_name}:texts:{text\_name}_** is the content of the cl-text identified by _text\_name_ and belonging to the COLORE ontology specified by _ontology\_name_.  Note that _text\_name_ may refer to either a named cl-text or a cl-module.  This resource is represented as valid CLIF text.

  * **_urn:oor:colore:ontologies:{ontology\_name}:text:{text\_name}:{rep\_type}_** is the content of the cl-text identified by _text\_name_ and belonging to the COLORE ontology specified by _ontology\_name_.  Note that _text\_name_ may refer to either a named cl-text or a cl-module.  This resource is represented according to the type identified by _rep\_type_ (e.g. valid CGIF, CLCE etc.).


## User Resources ##

  * **_urn:oor:colore:users:{user\_name}_** is the directory of all categories supported by COLORE.  This resource is represented as a list of URN strings of the form _urn:oor:colore:categories:{category\_name}_.

  * **_urn:oor:colore:{owner\_name}_** is the directory of all COLORE ontologies owned by _owner\_name_.  This resource is represented as a list of URN strings of the form _urn:oor:colore:{ontology\_name}_.


# References #

  1. [RESTful Web Services by Richardson & Ruby](http://oreilly.com/catalog/9780596529260).
  1. [ISO/IEC 24707 - Common Logic (CL): A framework for a family of logic-based languages](http://standards.iso.org/ittf/PubliclyAvailableStandards/c039175_ISO_IEC_24707_2007%28E%29.zip).