# System Architecture #

The Samian Platform, being developed under an affiliate [open source project](http://code.google.com/a/eclipselabs.org/p/samian-platform/), will support the construction of semantic systems based on Common Logic.  The platform is released under the [Eclipse Public License](http://www.eclipse.org/legal/epl-v10.html) which supports COLORE's objectives for ecosystem development.  The Samian Platform is being adopted as COLORE's CL processing kernel.  Figure 1 depicts the Samian Platform within the context of the COLORE system architecture.  The Common Logic Abstract Syntax (CLAS) shown in the figure provides an Object-Oriented representation of arbitrary CL texts.  The platform provides an extensible mechanism for iterating over CLAS instances to perform a variety of custom operations such as language translation and metrics analysis.  This same mechanism will also be used to integrate the CLAS model with various reasoning engines.  The CLAS model may be persisted to a variety of database back-ends via the [DataNucleus Access Platform](http://www.datanucleus.org/).  The versatility of this persistence technology will help remove barriers to adopting the Samian Platform for a variety of applications.



wiki:video: cannot find YouTube video id within parameter "url".



The Resource-Oriented Repository (ROR), shown in Figure 1, provides a RESTful interface into the Object-Oriented CLAS model.  We believe that REpresentational State Transfer (REST) is an effective protocol for managing CL repository content.  Whilst contemporary applications of REST have focused on web services, one requirement of the COLORE project is to support both web-based and non-web-based applications.  The Samian ROR generalizes the principles developed for RESTful web services to support this COLORE requirement.

<a href='Hidden comment: 
Generally speaking, resources may be thought of as anything that is interesting enough to be identified by name.  Based on an understanding of the COLORE requirements and an analysis of the [ColoreResourceModel#References ISO 24707] specification, we have identified named texts, modules and interpretablenames as the base set of CL resources within the Samian ROR.
'></a>

![http://colore.googlecode.com/svn/wiki/ColoreSystemArchitecture.jpg](http://colore.googlecode.com/svn/wiki/ColoreSystemArchitecture.jpg)<br />
**Figure 1:  The COLORE System Architecture**

A Common Logic (CL) text contains elements such as sentences, terms, literals, logical operators and quantifiers. A CL text also contains structural elements such as named texts, modules and importations. Certain CL elements may be associated with an identifiable name. Within the Samian Platform, these elements are referred to as CL “resources”. Whereas some CL resources are only referenced within a single CL text, others are referenced by external sources. Resources with external references constitute the public interface of a CL text and the names of these resource must be defined to be globally unique, location independent and persistent. Namespacing is a technique that has been employed within other technologies to achieve these naming properties. However, the Common Logic standard does not provide explicit support for namespaces. This means that content authors must take care when naming CL constructs that will be referenced from external sources. This article outlines a technique for naming CL resources such that a CL text may be used within both web-based and non-web-based applications.

Uniform Resource Names (URNs) are intended to serve as persistent, location-independent resource identifiers.  Unlike Universal Resource Locators (URLs), URNs do not tie a resource to a specific location on the web.  Rather, the resolution of URNs occurs at runtime and may change over time, or result in multiple possible locations.  As COLORE is intended for both web-based and non-web-based applications, URNs are ideal for naming COLORE resources.  Table 1 summarizes the URNs for accessing the Samian ROR.

<table width='1000' border='1'>
<blockquote><tr>
<blockquote><td align='center'><b>URN</b></td>
<td align='center'><b>Description</b></td>
<td align='center'><b>Representation</b></td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts</td>
<td>The directory of all COLORE texts</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}</td>
<td>The most recent version of the CL text identified by {text}</td>
<td>A listing of CLIF text</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:{version}</td>
<td>The version, identified by {version}, of the CL text identified by {text}</td>
<td>A listing of CLIF text</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:{rep_type}</td>
<td>The most recent version of the CL text identified by {text}</td>
<td>A listing of CL text in the syntax identified by {rep_type}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:{version}:{rep_type}</td>
<td>The version, identified by {version}, of the CL text identified by {text}</td>
<td>A listing of CL text in the syntax identified by {rep_type}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules</td>
<td>The directory of all COLORE modules</td>
<td>A list of URN strings of the form urn:oor:colore:module:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}</td>
<td>The most recent version of the CL module identified by {module}</td>
<td>A listing of CLIF text</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:{version}</td>
<td>The version, identified by {version}, of the CL module identified by {module}</td>
<td>A listing of CLIF text</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:{rep_type}</td>
<td>The most recent version of the CL module identified by {module}</td>
<td>A listing of CL text in the syntax identified by {rep_type}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:{version}:{rep_type}</td>
<td>The version, identified by {version}, of the CL module identified by {module}</td>
<td>A listing of CL text in the syntax identified by {rep_type}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:direct_imports</td>
<td>The directory representing the named texts and modules explicitly imported into the most recent version of the CL text identified by {text}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:{version}:direct_imports</td>
<td>The directory representing the named texts and modules explicitly imported into the version, identified by {version}, of the CL text identified by {text}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:import_closure</td>
<td>The directory representing the transitive closure of all named texts and modules associated with the most recent version of the CL text identified by {text}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:texts:{text}:{version}:import_closure</td>
<td>The directory representing the transitive closure of all named texts and modules associated with the version, identified by {version}, of the CL text identified by {text}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:direct_imports</td>
<td>The directory representing the named texts and modules explicitly imported into the most recent version of the CL module identified by {module}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:{version}:direct_imports</td>
<td>The directory representing the named texts and modules explicitly imported into the version, identified by {version}, of the CL module identified by {module}</td>
<td>A list of URN strings of the form <i>urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr></i><tr>
<blockquote><td>urn:oor:colore:modules:{module}:import_closure</td>
<td>The directory representing the transitive closure of all named texts and modules associated with the most recent version of the CL module identified by {module}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
<tr>
<blockquote><td>urn:oor:colore:modules:{module}:{version}:import_closure</td>
<td>The directory representing the transitive closure of all named texts and modules associated with the version, identified by {version}, of the CL module identified by {module}</td>
<td>A list of URN strings of the form urn:oor:colore:texts:{text} and urn:oor:colore:modules:{module}</td>
</blockquote></tr>
</table>
<b>Table 1: URNs of the Samian Resource-Oriented Repository</b>