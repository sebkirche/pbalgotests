$PBExportHeader$v_array.sru
forward
global type v_array from userobject
end type
end forward

global type v_array from userobject
integer width = 681
integer height = 444
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global v_array v_array

type prototypes

function ulong SetParent(ulong child, ulong newparent) library "user32"

end prototypes

type variables


int ii_cols
int ii_rows

string is_header[]
string is_row[]
string is_cell[]

int ii_rowtagswidth
int ii_colwidth
int ii_rowheight

boolean ib_collines
boolean ib_rowlines

statictext ctrl[]

string is_font = "Consolas"
int ii_fontsize = 8
end variables

forward prototypes
public subroutine setheaders (string as_heads[])
public subroutine setcell (integer ai_col, integer ai_row, string as_val)
public subroutine draw ()
public subroutine setrowtags (string as_rows[])
end prototypes

public subroutine setheaders (string as_heads[]);
is_header[] = as_heads[]

ii_cols = upperbound(is_header[])
ii_colwidth = pixelstounits(20, xpixelstounits!)
end subroutine

public subroutine setcell (integer ai_col, integer ai_row, string as_val);
is_cell[ (ai_row - 1) * ii_cols + ai_col] = as_val

end subroutine

public subroutine draw ();
int posx, posy
statictext st
window p
p = getparentwindow(this)

setredraw(false)

int r, c
for r = 0 to ii_rows
	for c = 0 to ii_cols
    st = create statictext
    //sle.tag = "text_" + string(i)
	st.height = ii_rowheight
	st.width = ii_colwidth
	st.facename = is_font
	st.textsize = -ii_fontsize
	st.backcolor = this.backcolor

	if c = 0 or r = 0 then
		if c = 0 and r > 0 then
			st.text = is_row[r]
			st.width = ii_rowtagswidth
		elseif r = 0 and c > 0 then
			st.text = is_header[c]
		else
			continue
		end if
	else
	    st.text = is_cell[ (r - 1) * ii_cols + c ]// string(r)+string(c)
	end if
	
	if c = 0 then
		posx = 0//this.x
	else
		posx = ii_rowtagswidth + (c - 1) * ii_colwidth //+ this.x
	end if
	if r = 0 then
		posy = 0//this.y
	else
		posy = r * ii_rowheight //+ this.y
	end if
    p.openuserobject(st, posx , posy + 4)
	setparent(handle(st), handle(this))
	//st.bringtotop = true
    ctrl[r*(ii_cols+1) + c + 1] = st //keep our own reference
	next
next

setredraw(true)

end subroutine

public subroutine setrowtags (string as_rows[]);
is_row[] = as_rows[]

ii_rows = upperbound(is_row[])
ii_rowheight = pixelstounits(20, ypixelstounits!)

ii_rowtagswidth = pixelstounits(30, ypixelstounits!)

end subroutine

on v_array.create
end on

on v_array.destroy
end on

event destructor;
int i
window p
p = getparentwindow(this)

for i = 1 to upperbound(ctrl[])
	setparent(handle(ctrl[i]), handle(p))
	p.closeuserobject(ctrl[i])
next

end event

