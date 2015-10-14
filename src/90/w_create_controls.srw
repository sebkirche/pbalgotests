$PBExportHeader$w_create_controls.srw
forward
global type w_create_controls from window
end type
type sle_trg from singlelineedit within w_create_controls
end type
type sle_src from singlelineedit within w_create_controls
end type
type uo_static from uo_multi_static within w_create_controls
end type
type cb_radio from commandbutton within w_create_controls
end type
type uo_radio from uo_multi_radio_selector within w_create_controls
end type
type cb_1 from uo_coolbutton within w_create_controls
end type
type cb_array from commandbutton within w_create_controls
end type
type uo_array from v_array within w_create_controls
end type
type cb_read from commandbutton within w_create_controls
end type
type cb_create from commandbutton within w_create_controls
end type
end forward

global type w_create_controls from window
integer width = 3109
integer height = 1736
boolean titlebar = true
string title = "Dynamic control creation"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_trg sle_trg
sle_src sle_src
uo_static uo_static
cb_radio cb_radio
uo_radio uo_radio
cb_1 cb_1
cb_array cb_array
uo_array uo_array
cb_read cb_read
cb_create cb_create
end type
global w_create_controls w_create_controls

type variables
SingleLineEdit i_myedits[]

end variables

on w_create_controls.create
this.sle_trg=create sle_trg
this.sle_src=create sle_src
this.uo_static=create uo_static
this.cb_radio=create cb_radio
this.uo_radio=create uo_radio
this.cb_1=create cb_1
this.cb_array=create cb_array
this.uo_array=create uo_array
this.cb_read=create cb_read
this.cb_create=create cb_create
this.Control[]={this.sle_trg,&
this.sle_src,&
this.uo_static,&
this.cb_radio,&
this.uo_radio,&
this.cb_1,&
this.cb_array,&
this.uo_array,&
this.cb_read,&
this.cb_create}
end on

on w_create_controls.destroy
destroy(this.sle_trg)
destroy(this.sle_src)
destroy(this.uo_static)
destroy(this.cb_radio)
destroy(this.uo_radio)
destroy(this.cb_1)
destroy(this.cb_array)
destroy(this.uo_array)
destroy(this.cb_read)
destroy(this.cb_create)
end on

type sle_trg from singlelineedit within w_create_controls
integer x = 251
integer y = 1240
integer width = 343
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event dragdrop;
singlelineedit lsle_source
if typeof(source ) = singlelineedit! then
 lsle_source = source
 this.text = lsle_source.text
end if 

end event

type sle_src from singlelineedit within w_create_controls
integer x = 229
integer y = 988
integer width = 343
integer height = 92
integer taborder = 60
string dragicon = "Query5!"
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type uo_static from uo_multi_static within w_create_controls
integer x = 1289
integer y = 288
integer taborder = 100
boolean border = true
string is_facename = "tahoma"
end type

on uo_static.destroy
call uo_multi_static::destroy
end on

type cb_radio from commandbutton within w_create_controls
integer x = 1600
integer y = 56
integer width = 416
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "radio test"
end type

event clicked;
uo_radio.of_init( {"test1","test2","test3"})
uo_static.of_init( {"test1","test2","test3"})

end event

type uo_radio from uo_multi_radio_selector within w_create_controls
integer x = 686
integer y = 288
integer width = 594
integer taborder = 70
boolean border = true
string is_facename = "tahoma"
integer ii_textsize = 8
end type

on uo_radio.destroy
call uo_multi_radio_selector::destroy
end on

type cb_1 from uo_coolbutton within w_create_controls
integer x = 594
integer y = 84
integer taborder = 20
end type

type cb_array from commandbutton within w_create_controls
integer x = 2066
integer y = 312
integer width = 416
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "draw array"
end type

event clicked;
unvo_gdi gdi

long em_width, em_height, col_width
long test_len = 10
string test_str
test_str = fill('M',test_len)

col_width = gdi.of_getstringwidthunits(parent, test_str, uo_array.is_font, uo_array.ii_fontsize, false, false)
em_width = gdi.of_getstringwidthunits(parent, 'M', uo_array.is_font, uo_array.ii_fontsize, false, false)
em_height = gdi.of_getstringheightunits(parent, 'M', uo_array.is_font, uo_array.ii_fontsize, false, false)

uo_array.setheaders({'a','b','c'})
uo_array.setrowtags({'1','2','3'})


uo_array.ii_colwidth = col_width
uo_array.ii_rowheight = em_height
uo_array.ii_rowtagswidth = 3 * em_width

int i,j
for i = 1 to 3
	for j = 1 to 3
		uo_array.setcell( i, j, iif(i=j, test_str, ""))
	next
next
uo_array.draw( )

end event

type uo_array from v_array within w_create_controls
integer x = 1010
integer y = 432
integer width = 1687
integer height = 1144
integer taborder = 50
boolean border = true
borderstyle borderstyle = styleraised!
boolean ib_collines = true
boolean ib_rowlines = true
integer ii_fontsize = 9
end type

on uo_array.destroy
call v_array::destroy
end on

type cb_read from commandbutton within w_create_controls
integer x = 2066
integer y = 184
integer width = 416
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "read statics"
end type

event clicked;
SingleLineEdit sle
int i
string s_msg

for i = 1 to upperbound(i_myedits[])
	sle = i_myedits[i]
	if i > 1 then s_msg += "~r~n"
	s_msg += "edit #" + string(i) + " (" + sle.tag + ") says '" + sle.text + "'"
next
messagebox("Edits values", s_msg)

end event

type cb_create from commandbutton within w_create_controls
integer x = 2066
integer y = 56
integer width = 416
integer height = 112
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "create statics"
end type

event clicked;
SingleLineEdit sle
int i
for i = 1 to 8 
    sle = create singlelineedit
    sle.text = "text" + string(i)
    sle.tag = "text_" + string(i)
	sle.height = pixelstounits(20, ypixelstounits!)
	sle.width = pixelstounits(100, xpixelstounits!)
    parent.openuserobject(sle, pixelstounits(10, xpixelstounits!), pixelstounits(22 * i, ypixelstounits!))
    i_myedits[i] = sle //keep our own reference
next

end event

