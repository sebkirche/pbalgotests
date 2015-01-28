$PBExportHeader$dgraph_matrix.sru
forward
global type dgraph_matrix from nonvisualobject
end type
end forward

global type dgraph_matrix from nonvisualobject
end type
global dgraph_matrix dgraph_matrix

type variables

//we simulate the incidence matrix by using a dynamic single-dimension array
//in the same way as a position in a C array :
//the line,column position give an offset from the first array item
// p = (line - 1) x vertices + column

long il_nodes		//number of nodes
boolean ib_incid[]	//incidence matrix
long il_indeg[]		//in-degree 
long il_toposort[]
end variables

forward prototypes
public subroutine set_totalnodes (long al_max)
public subroutine compute_indegree ()
public subroutine topo_sort (ref long al_sorted[])
public function long mxpos (long al_src, long al_trg)
public subroutine remove_edge (long al_src, long al_trg)
public subroutine add_edge (long al_src, long al_trg)
end prototypes

public subroutine set_totalnodes (long al_max);
//allocate the incidence matrix
//by setting a value in the max*max item of the incidence matrix

il_nodes = al_max
ib_incid[al_max * al_max] = false

end subroutine

public subroutine compute_indegree ();
//compute the in-dregee array of vertices

long i, j, new[]

il_indeg[] = new[]
for i = 1 to il_nodes
	il_indeg[i] = 0
	for j = 1 to il_nodes
		if ib_incid[mxpos(j, i)] then
			il_indeg[i] += 1
		end if
	next
next

end subroutine

public subroutine topo_sort (ref long al_sorted[]);
//compute a topological sort of the graph

long i,j,v
queue sources

compute_indegree( )

//each node with 0 in-degree is added to the queue of sources
for i = 1 to il_nodes
	if il_indeg[i] = 0 then
		sources.push(i)
	end if
next

do while sources.size() > 0
	//get a source, it is the next sorted vertex
	v = sources.pop()
	al_sorted[upperbound(al_sorted[])+1] = v
	
	//for each of the destination vertex of the source
	//decrement the in-degree
	//when a destination in-degree reach 0, it becomes a source
	for i = 1 to il_nodes
		if ib_incid[mxpos(v, i)] then	//if v points to a dest
			il_indeg[i]--
			if il_indeg[i] = 0 then
				sources.push(i)
			end if
		end if
	next
loop

end subroutine

public function long mxpos (long al_src, long al_trg);
//compute the position in the simulated matrix
//from the wanted source line and target column
return (al_src - 1) * il_nodes + al_trg

end function

public subroutine remove_edge (long al_src, long al_trg);
//remove an egde from the graph 
//by pointing from node source -> target in the incidence matrix

ib_incid[mxpos(al_src, al_trg)] = false

end subroutine

public subroutine add_edge (long al_src, long al_trg);
//add an egde to the graph 
//by pointing from node source -> target in the incidence matrix

ib_incid[mxpos(al_src, al_trg)] = true

end subroutine

on dgraph_matrix.create
call super::create
TriggerEvent( this, "constructor" )
end on

on dgraph_matrix.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

