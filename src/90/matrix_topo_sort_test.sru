$PBExportHeader$matrix_topo_sort_test.sru
forward
global type matrix_topo_sort_test from nonvisualobject
end type
end forward

global type matrix_topo_sort_test from nonvisualobject
end type
global matrix_topo_sort_test matrix_topo_sort_test

type variables

long il_nodes		//number of nodes
boolean ib_incid[]	//incidence matrix
long il_indeg[]		//in-degree 
end variables
forward prototypes
public subroutine add_edge (long al_source, long al_target)
public subroutine set_totalnodes (long al_max)
public subroutine compute_indegree ()
end prototypes

public subroutine add_edge (long al_source, long al_target);
ib_incid[(al_source - 1) * il_nodes + al_target] = true

end subroutine

public subroutine set_totalnodes (long al_max);
il_nodes = al_max
ib_incid[al_max * al_max] = false

end subroutine

public subroutine compute_indegree ();
long i, j, new[]

il_indeg[] = new[]
for i = 1 to il_nodes
	for j = 1 to il_nodes
		if ib_incid[(i - 1) * il_nodes + j] then
			il_indeg[i] += 1
		end if
	next
next

end subroutine

on matrix_topo_sort_test.create
call super::create
TriggerEvent( this, "constructor" )
end on

on matrix_topo_sort_test.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

