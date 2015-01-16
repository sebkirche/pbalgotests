$PBExportHeader$w_topo_sort.srw
forward
global type w_topo_sort from window
end type
type mle_indeg from multilineedit within w_topo_sort
end type
type em_count from editmask within w_topo_sort
end type
type mle_matrix from multilineedit within w_topo_sort
end type
type mle_sorted from multilineedit within w_topo_sort
end type
type cb_sort from commandbutton within w_topo_sort
end type
end forward

global type w_topo_sort from window
integer width = 1257
integer height = 1488
boolean titlebar = true
string title = "Topological sort"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_indeg mle_indeg
em_count em_count
mle_matrix mle_matrix
mle_sorted mle_sorted
cb_sort cb_sort
end type
global w_topo_sort w_topo_sort

type variables

matrix_topo_sort_test toposort

end variables
forward prototypes
public subroutine fill_matrix ()
end prototypes

public subroutine fill_matrix ();
long n,i,j

n = long(em_count.text)
//toposort.set_totalnodes(n)

//for i = 1 to n
//	for j = 1 to n
//		toposort.add_edge( /*long al_source*/, /*long al_target */)
//	next
//next

toposort.set_totalnodes(3)
toposort.add_edge(2,3)
toposort.add_edge(3,1)

end subroutine

on w_topo_sort.create
this.mle_indeg=create mle_indeg
this.em_count=create em_count
this.mle_matrix=create mle_matrix
this.mle_sorted=create mle_sorted
this.cb_sort=create cb_sort
this.Control[]={this.mle_indeg,&
this.em_count,&
this.mle_matrix,&
this.mle_sorted,&
this.cb_sort}
end on

on w_topo_sort.destroy
destroy(this.mle_indeg)
destroy(this.em_count)
destroy(this.mle_matrix)
destroy(this.mle_sorted)
destroy(this.cb_sort)
end on

event open;
toposort = create matrix_topo_sort_test 

end event

event close;
destroy toposort

end event

type mle_indeg from multilineedit within w_topo_sort
integer x = 78
integer y = 964
integer width = 1019
integer height = 136
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
string text = "in-deg"
borderstyle borderstyle = stylelowered!
end type

type em_count from editmask within w_topo_sort
integer x = 334
integer y = 88
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "##"
double increment = 1
string minmax = "0~~"
end type

type mle_matrix from multilineedit within w_topo_sort
integer x = 123
integer y = 296
integer width = 955
integer height = 444
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
string text = "0 1 0~r~n0 0 1~r~n0 0 0"
borderstyle borderstyle = stylelowered!
end type

type mle_sorted from multilineedit within w_topo_sort
integer x = 69
integer y = 1148
integer width = 1061
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
string text = "sorted"
borderstyle borderstyle = stylelowered!
end type

type cb_sort from commandbutton within w_topo_sort
integer x = 402
integer y = 764
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "sort"
end type

event clicked;
fill_matrix( )

toposort.compute_indegree()

mle_indeg.text = ""
long n
for n = 1 to toposort.il_nodes
	mle_indeg.text += string(toposort.il_indeg[n]) + ' '
next

end event

