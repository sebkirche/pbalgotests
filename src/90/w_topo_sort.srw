$PBExportHeader$w_topo_sort.srw
forward
global type w_topo_sort from window
end type
type st_c from statictext within w_topo_sort
end type
type st_v from statictext within w_topo_sort
end type
type mle_indeg from multilineedit within w_topo_sort
end type
type mle_matrix from multilineedit within w_topo_sort
end type
type mle_sorted from multilineedit within w_topo_sort
end type
type cb_sort from commandbutton within w_topo_sort
end type
type gb_mx from groupbox within w_topo_sort
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
string icon = "Structure5!"
boolean center = true
st_c st_c
st_v st_v
mle_indeg mle_indeg
mle_matrix mle_matrix
mle_sorted mle_sorted
cb_sort cb_sort
gb_mx gb_mx
end type
global w_topo_sort w_topo_sort

type variables

matrix_topo_sort_test toposort

end variables

forward prototypes
public function boolean fill_matrix ()
end prototypes

public function boolean fill_matrix ();
long n,i,j,l,c
string lines[], conns[]

split_to_array(mle_matrix.text, '~r~n', ref lines[])
l = long(upperbound(lines[]))
toposort.set_totalnodes(l)

for i = 1 to l
	split_to_array(trim(lines[i]), ' ', ref conns[])
	c = long(upperbound(conns[]))
	if c <> l then
		mle_indeg.text = "column count <> line count at matrix line " + string(i)
		return false		
	end if
	for j = 1 to c
		if conns[j] = '1' then
			toposort.add_edge(i, j)
		end if
	next
next

return true

end function

on w_topo_sort.create
this.st_c=create st_c
this.st_v=create st_v
this.mle_indeg=create mle_indeg
this.mle_matrix=create mle_matrix
this.mle_sorted=create mle_sorted
this.cb_sort=create cb_sort
this.gb_mx=create gb_mx
this.Control[]={this.st_c,&
this.st_v,&
this.mle_indeg,&
this.mle_matrix,&
this.mle_sorted,&
this.cb_sort,&
this.gb_mx}
end on

on w_topo_sort.destroy
destroy(this.st_c)
destroy(this.st_v)
destroy(this.mle_indeg)
destroy(this.mle_matrix)
destroy(this.mle_sorted)
destroy(this.cb_sort)
destroy(this.gb_mx)
end on

event open;
toposort = create matrix_topo_sort_test 

end event

event close;
destroy toposort

end event

type st_c from statictext within w_topo_sort
integer x = 407
integer y = 128
integer width = 617
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
long backcolor = 67108864
string text = "Connected to vertices"
boolean focusrectangle = false
end type

type st_v from statictext within w_topo_sort
integer x = 64
integer y = 280
integer width = 251
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
long backcolor = 67108864
string text = "List~r~nof~r~nVertices"
alignment alignment = Center!
boolean focusrectangle = false
end type

type mle_indeg from multilineedit within w_topo_sort
integer x = 37
integer y = 964
integer width = 1138
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

type mle_matrix from multilineedit within w_topo_sort
integer x = 334
integer y = 200
integer width = 795
integer height = 540
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
string text = "0 0 0 1 0~r~n0 0 0 1 0~r~n1 1 0 0 0~r~n0 0 0 0 0~r~n1 0 0 0 0"
borderstyle borderstyle = stylelowered!
end type

type mle_sorted from multilineedit within w_topo_sort
integer x = 37
integer y = 1148
integer width = 1138
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
integer x = 37
integer y = 800
integer width = 1138
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "compute sort"
end type

event clicked;
if not fill_matrix() then return

toposort.compute_indegree()

//display the in-degrees
mle_indeg.text = "in-degrees: "
long n
for n = 1 to toposort.il_nodes
	mle_indeg.text += string(toposort.il_indeg[n]) + ' '
next

long s[]
toposort.topo_sort(ref s[])
mle_sorted.text = "sorted vertices: "
for n = 1 to toposort.il_nodes
	mle_sorted.text += string(s[n]) + ' '
next

end event

type gb_mx from groupbox within w_topo_sort
integer x = 37
integer y = 64
integer width = 1138
integer height = 708
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Consolas"
long textcolor = 33554432
long backcolor = 67108864
string text = "Adjacency matrix"
end type

