Movies network, part of the Koblenz Network Collection
===========================================================================

This directory contains the TSV and related files of the dbpedia-starring network:

This is the bipartite network of movies and the actors that have played in them, from the DBpedia project. The nodes in the network are movies and actors. An edge connects a movie will an actor that has played in it. The dataset corresponds to the <http://dbpedia.org/ontology/starring> relation in DBpedia.


More information about the network is provided here: 
http://konect.uni-koblenz.de/networks/dbpedia-starring

Files: 
    meta.dbpedia-starring -- Metadata about the network 
    out.dbpedia-starring -- The adjacency matrix of the network in space separated values format, with one edge per line
      The meaning of the columns in out.dbpedia-starring are: 
        First column: ID of from node 
        Second column: ID of to node


Complete documentation about the file format can be found in the KONECT
handbook, in the section File Formats, available at:

http://konect.uni-koblenz.de/publications

All files are licensed under a Creative Commons Attribution-ShareAlike 2.0 Germany License.
For more information concerning license visit http://konect.uni-koblenz.de/license.



Use the following References for citation:

@MISC{konect:2016:dbpedia-starring,
    title = {Movies network dataset -- {KONECT}},
    month = sep,
    year = {2016},
    url = {http://konect.uni-koblenz.de/networks/dbpedia-starring}
}

@inproceedings{konect:dbpedia2,
        author = {Sören Auer and Christian Bizer and Georgi Kobilarov
                  and Jens Lehmann and Richard Cyganiak and Zachary
                  Ives},
        title = {{DBpedia}: A Nucleus for a Web of Open Data },
        booktitle = {Proc. Int. Semantic Web Conf.},    
        pages = {722--735},
        year = {2008},
}


@inproceedings{konect,
	title = {{KONECT} -- {The} {Koblenz} {Network} {Collection}},
	author = {Jérôme Kunegis},
	year = {2013},
	booktitle = {Proc. Int. Conf. on World Wide Web Companion},
	pages = {1343--1350},
	url = {http://userpages.uni-koblenz.de/~kunegis/paper/kunegis-koblenz-network-collection.pdf}, 
	url_presentation = {http://userpages.uni-koblenz.de/~kunegis/paper/kunegis-koblenz-network-collection.presentation.pdf},
}
