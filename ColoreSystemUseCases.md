### By Cameron Ross ###

# A work in progress!!! #

# Objectives #

The COLORE initiative has requirements related to both content development and software development.  The Uses Cases presented here describe COLORE's functional software requirements.  However, before delving into a detailed analysis of software requirements, it is important to understand the overall objectives of the project.  COLORE is intended to be an open repository of ontologies represented using Common Logic (CL).  The objectives of the COLORE project are:
  * to develop techniques for representing ontologies using CL,
  * to establish an open repository of CL-based ontologies,
  * to establish a testbed for integration and evaluation techniques,
  * to support the design and reuse of modular ontologies,
  * to promote ISO 24707 for constructing ontologies using FOL,
  * to develop best practices for ontological engineering using CL,
  * to construct infrastructure for collaborative ontology development,
  * to develop APIs and services for accessing CL-based repositories,
  * to support both web-based and non-web-based applications,
  * to enable proliferation and interoperation of CL-based repositories, and
  * to enable and promote an ecosystem of both open source and commercial developments focused on CL technology.

# Collaborative Ontology Development #

One of our primary objectives is to support the collaborative development of CL-based ontologies.  Therefore, the COLORE system shall provide the means for _Users_ to create their own projects and to manage and coordinate the development life cycle of these projects within an open and transparent environment.  Several existing systems support a similar model for open source software development and the COLORE feature set is partly derived from these systems (e.g. Google Code, SourceForge, GitHub etc.).  COLORE will provide the following features in support of collaborative ontology development:
  * a project Wiki for documenting the ontology,
  * a project email list to coordinate and archive project discussions,
  * a revision control system to manage project artifacts,
  * an issue tracking system to help resolve issues with project artifacts,
  * a administration console to help manage project _Users_ and settings, and
  * a mechanism for publishing project artifacts (e.g. ontology source files)

Although the details of these features are to be determined, the salient aspect for our Use Case analysis is that COLORE content will be partitioned into projects and that each project will have the scope of an ontology.  We call these partitions _Ontology Projects_.

# Actors #

Users of the COLORE system fall into one of three general categories: _Administrators_, _Users_ and _Guests_.  _Administrators_ are authorized to perform all functions relating to both system management and content management.  The COLORE system can have one or more _Administrators_.  _Users_ are formally registered with the COLORE system and can create and contribute to _Ontology Projects_.  The COLORE system can have any number of _Users_.  _Guests_ are not registered with the COLORE system and are limited to read-only access of COLORE's public artifacts.

_Users_ fall into one of three sub-categories: _Owners_, _Committers_, and _Contributors_.  _Owners_ can make changes to an _Ontology Project's_ artifacts and can manage the project's _User_ membership.  An _Ontology Project_ can have one or more _Owners_.  _Committers_ can make changes to a project's artifacts, but cannot change a project's members list.  An _Ontology Project_ can have zero or more _Committers_.  _Contributors_ have read-only access rights to a project's artifacts, but can participate in the discussion forums and wikis associated with the project.  The following list enumerates the COLORE actors:
  * _Administrator_
  * _Guest_
  * _User:_
    * _Owner_
    * _Committer_
    * _Contributor_

# COLORE Use Cases #
The methodology used to analyze COLORE requirements is motivated by the concepts of Resource-Oriented Architecture, developed by [Richardson & Ruby](http://oreilly.com/catalog/9780596529260), and the ideas on Resource-Oriented Analysis & Design, developed by [Louvel & Boileau](http://www.manning.com/louvel). The format used to capture COLORE Use Cases is based on [Alistar Cockburn's](http://www.amazon.com/Writing-Effective-Cases-Alistair-Cockburn/dp/0201702258) approach.

## Use Cases for Managing COLORE Users ##

  * [UC6646](UC6646.md): Add a new user to the system
  * [UC6203](UC6203.md): Retrieve a list of all users registered within the system
  * [UC4089](UC4089.md): Retrieve the metadata of a specified user
  * [UC1011](UC1011.md): Update the metadata of a specified user
  * [UC2261](UC2261.md): Remove a specified user from the system
  * [UC5983](UC5983.md): Add a new organization to the system
  * [UC6706](UC6706.md): Retrieve a list of all organizations registered within the system
  * [UC6533](UC6533.md): Retrieve the metadata of a specified organization
  * [UC8874](UC8874.md): Update the metadata of a specified organization
  * [UC9687](UC9687.md): Remove a specified organization from the system
  * [UC1194](UC1194.md): Associated a specified user with a specified organization

## Use Cases for Managing the COLORE Catalog ##

  * [UC9626](UC9626.md): Add a new category to the system
  * [UC7318](UC7318.md): Retrieve a list of all categories defined within the system
  * [UC8779](UC8779.md): Retrieve the metadata of a specified category
  * [UC4316](UC4316.md): Update the metadata of a specified category
  * [UC9493](UC9493.md): Remove a specified category from the system

## Use Cases for Managing Common Logic Content ##

  * [UC2505](UC2505.md): Add a new ontology to a specified category
  * [UC4764](UC4764.md): Retrieve a list of all ontologies within a specified category
  * [UC2798](UC2798.md): Retrieve the metadata of a specified ontology
  * [UC4169](UC4169.md): Update the metadata of a specified ontology
  * [UC5503](UC5503.md): Remove a specified ontology from the system
  * [UC9786](UC9786.md): Add a new CL text to the specified ontology
  * [UC3467](UC3467.md): Retrieve a listing of all CL texts within the repository
  * [UC5377](UC5377.md): Retrieve most recent version of a CL text from the repository
  * [UC8204](UC8204.md): Retrieve a specific version of a CL text from the repository
  * [UC3980](UC3980.md): Add a new version of a CL text within the repository
  * [UC7883](UC7883.md): Update an existing version of a CL text within the repository
  * [UC8388](UC8388.md): Delete all versions of a CL text from the repository
  * [UC9742](UC9742.md): Delete a specific version of a CL text from the repository
  * [UC2892](UC2892.md): Delete the most recent version of a CL text from the repository
  * [UC4135](UC4135.md): Retrieve a listing of all CL texts that reference a specified CL name


# OOR Use Cases #