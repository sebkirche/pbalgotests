$PBExportHeader$w_create_controls.srw
forward
global type w_create_controls from window
end type
type cb_read from commandbutton within w_create_controls
end type
type cb_create from commandbutton within w_create_controls
end type
end forward

global type w_create_controls from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "Dynamic control creation"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_read cb_read
cb_create cb_create
end type
global w_create_controls w_create_controls

type variables
SingleLineEdit i_myedits[]

end variables

on w_create_controls.create
this.cb_read=create cb_read
this.cb_create=create cb_create
this.Control[]={this.cb_read,&
this.cb_create}
end on

on w_create_controls.destroy
destroy(this.cb_read)
destroy(this.cb_create)
end on

type cb_read from commandbutton within w_create_controls
integer x = 2066
integer y = 184
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "read"
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
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "create"
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

