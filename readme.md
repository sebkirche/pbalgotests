PB Algorithmic tests
====================

Some design and algorithmic experimentations in PowerBuilder.

Base Structures
---------------
* `dl_listitem.sru`: a double linked list with a userobject (PB cannot use structs for that)
* `hash.sru`: a PB hash table in pure PB without external dependency but PB
* `queue.sru`: a fifo
* `stack.sru`: an array based stack

Graphs
------
* `dgraph_matrix.sru`: a adjacency matrix based graph representation that can perform a non-destructive topological sort via a source queue processing.

Other
-----
* `word_generator.sru`: i needed this to get all possible words (A..Z, AA..AZ, BA..BZ, ...) to test the collisions in the hashing algorithm
* `bench.sru` and `bench_...` objects: helpers to perform benchmarks


  
