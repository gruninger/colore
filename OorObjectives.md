# Initial OOR Scope and Vision #

This section summarizes the initial scope and vision of the OOR initiatives as set out in the [Ontology Summit 2008 Communique](http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2008_Communique).

  * In this discussion, we have agreed that an "ontology repository is a facility where ontologies and related information artifacts can be stored, retrieved and managed."[[1](http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2008_Communique#nid1GUJ)]

  * Examples of anticipated services include automated semantic interpretation of content expressed in knowledge representation languages, the creation and maintenance of mappings among disparate ontologies and content, and inference over this content.[[2](http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2008_Communique#nid1GUM)]

  * In a distributed setting, ontology repository developers increasingly are adopting Service Oriented Architectures (SOA), providing access, search, and other capabilities via web services. Two major approaches to SOA are REST and SOAP. REST is built on HTTP, with a small set of operators (GET, PUT, POST, DELETE) and the use of URL (or URI) addresses for all objects of interest. SOAP is based on XML RPCs. REST is much simpler to implement and should be adequate for typical ontology repository functions. SOAP is supported by a wide variety of software tools. Both SOA approaches are currently being used.[[3](http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2008_Communique#nid1GV3)].

  * An ontology repository typically facilitates access to a variety of ontology related tools: creation, editors, pretty printers, visualization tools, differencing tools, modularization tools, import / export, version management, access control, inference engines, explanation, summarization.[[4](http://ontolog.cim3.net/cgi-bin/wiki.pl?OntologySummit2008_Communique#nid1GV4)]

# Current Understanding of the OOR Objectives and Requirements #

This section summarizes the [OOR Use Case Review](http://ontolog.cim3.net/file/work/OOR-Ontolog-Panel/2010-04-01_OOR-Use-Cases-III/OOR-UseCaseReview--ToddSchneider_20100401.pdf) presented to the OOR team by Todd Schneider on April 1, 2010.

  1. Primary goal is to provide an architecture and an infrastructure that supports:
    * ontology creation
    * ontology sharing
    * ontology searching
    * ontology mapping
    * ontology integration
    * ontology governance/management
    * linkages to database
    * linkages to XML schema structured data and documents
  1. Complementary Goals:
    * foster use of ontologies and semantic technologies
    * aid the Semantic Web community
    * identify and promote best practices
    * provision services relevant to RDFS, OWL, CL ontologies
    * provision services relevant to RDFS, OWL, CL ontologies
    * provision services relevant to RDFS, OWL, CL ontologies
    * provision services relevant to RDF instance stores
  1. Architectural Principles:
    * support evolutionary development
    * support distributed instances
    * support federation
    * scalable
    * ontology services decoupled from core repository functionality
    * no hierarchical dependencies
    * support arbitrary ontology representation languages
    * ontologically driven – Development & Runtime
    * platform independent
  1. Assumptions:
    * supports evolutionary development
    * partitioning of functionality
    * instance data not stored apart from infrastructure data (e.g. polices, rules)
    * repository architecture (mostly) independent of knowledge representation language
    * initial support for OWL
    * meta/provenance information ontologically based
    * standards based to extent possible
    * not near-real time
    * federatable
  1. Core Requirements:
    * storing, management, governance of ontologies & related items
    * discovery/searching ontologies
    * scalable (parallelism, federation)
    * multi-language support
    * arbitrary knowledge domain
    * platform independent
    * don’t impede storing of instance data
  1. Ontology User Role:
    * find and browse ontology
    * find a term or relation
    * find a mapping
    * find a theory or rule
    * review ontology
    * subscribe to ontology (development?)
    * get help with an ontology
  1. Ontology Designer Role:
    * manage an ontology
    * manage an ontology's metadata
    * manage a rule set
    * manage a rule set's metadata
    * manage an ontology mapping
    * download an ontology
    * download a rule set
    * merge ontologies
    * integrate ontologies
    * split an ontology
  1. Administrator Role:
    * manage system reports
    * manage system users
    * manage system services
    * manage system policies
    * manage system persistence
    * manage system federation
  1. QUESTIONS:
    * What's the difference between an ontology and a theory?
    * Why are rules considered independently from ontologies?
    * Should CRUD operations on an entities metadata be folded into the CRUD operations of the entity itself?

# OOR Use Cases #

This section summarizes the current collection of OOR Use cases from the [Ontolog Wiki](http://ontolog.cim3.net/cgi-bin/wiki.pl?OpenOntologyRepository_UseCases):
  * Find Ontology
  * Browse a single Ontology
  * Add Comment for an Uncontrolled Review
  * Review an OOR Ontology
  * Add Change Request
  * Specify Axioms via Examples / DB's
  * Upload Ontology
  * Update Ontology
  * Create Mapping among existing ontologies
  * Download Ontology
  * Correct Ontology Errors

Uses Cases prepared by [Ken Baclawski](http://ontolog.cim3.net/file/work/OOR/OOR-Use-Cases/oor-usecase-v2.xml):

  * Query Administered Item
  * Navigate Administered Item
  * Retrieve Administered Item
  * Extract Administered Item Part
  * Advertise Administered Items
  * Accredit Registration Authority
  * Steward Registration
  * Submitter Registration
  * Retire Process Participant
  * Query the registration authorities
  * Query Contact Information
  * Update Contact Information
  * Upload Administered Item Map
  * Compose Administered Items
  * Use Administered Item
  * Register Item
  * Update Administered Item
  * Validate Item
  * Upload Administered Item Version
  * Upload Process or Policy Definition
  * Process Instance Form Completion
  * Query procedures
  * Review an administered item
  * Query reviews
  * Query metrics
  * Reassign Process Participant
  * Notify Registrar
  * Map Administered Item Version