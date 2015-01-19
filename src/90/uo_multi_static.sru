$PBExportHeader$uo_multi_static.sru
forward
global type uo_multi_static from userobject
end type
type st_1 from statictext within uo_multi_static
end type
end forward

global type uo_multi_static from userobject
integer width = 759
integer height = 96
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global uo_multi_static uo_multi_static

type prototypes
function long SetParent( long hWndChild, long hWndNewParent ) Library "user32.dll" 
end prototypes

type variables
public:
boolean ib_buttons_on_right_side = false
string is_facename = 'arial'
int ii_textsize = 10
long il_textcolor = 33554432
//long il_backcolor = 67108864

private:
//string is_labels[]
integer ii_nb_rb				//number of popups 
statictext iradb_ctrl[]		//array of statictexts

end variables

forward prototypes
public function string of_gettext (integer ai_listnum)
public function string of_itemtext (integer ai_listnum, integer ai_index)
public function integer of_init (string as_labels[], integer ai_default)
public function integer of_init (string as_labels[])
end prototypes

public function string of_gettext (integer ai_listnum);

if ai_listnum > UpperBound(iradb_ctrl) then return ""

return iradb_ctrl[ai_listnum].text
end function

public function string of_itemtext (integer ai_listnum, integer ai_index);

if ai_listnum > UpperBound(iradb_ctrl) then return ""

return iradb_ctrl[ai_listnum].text
end function

public function integer of_init (string as_labels[], integer ai_default);// dynamic fill of the control with statictexts
//
// SeKi 2008-02-29

statictext rb
window winparent
integer i, j , i_ret
integer l_maxlen, i_width, i_height
string s_lab
unvo_gdi gdi
//constant integer i_lineinc = 112
integer i_lineinc 
constant integer i_button_width = 22

st_1.visible = false

winparent = getParentWindow(this)
if isnull(winparent) then return 0
if upperbound(as_labels) = 0 then return 0

// creation of the controls
// we must use openUserObject as else the controls do not belong to the userobject
// OpenUserObject need to be called on a window, so we correct the ownership with SetParent
// do not forget to reattach the controls to the window before destroying the control
l_maxlen = 0
ii_nb_rb = upperbound(as_labels)
if ai_default > ii_nb_rb then ai_default = 1

i_lineinc = gdi.of_getstringheightunits(winparent, 'Blah', is_facename, ii_textsize, false, false) + PixelsToUnits(4, YPixelsToUnits!)

// loop for the label texts to get the longuest one
for i=1 to ii_nb_rb
	i_width = gdi.of_getstringwidthunits(winparent, as_labels[i], is_facename, ii_textsize, false, false) + PixelsToUnits(1, XPixelsToUnits!)
	if i_width > l_maxlen then l_maxlen = i_width
next

// loop for the statictexts
for i=1 to ii_nb_rb
	rb = create statictext
	if isvalid(rb) then
		rb.width = l_maxlen + PixelsToUnits(i_button_width, XPixelsToUnits!) //ii_popup_width
		rb.height = i_lineinc//788
		rb.facename = is_facename
		rb.textsize = -ii_textsize
		rb.text = as_labels[i]
		rb.textcolor = il_textcolor
		rb.backcolor = this.backcolor
		rb.borderstyle = StyleLowered!
		rb.visible = true
		rb.enabled = true
		
		//i_ret = winparent.openuserobject(rb, width - ii_popup_width, 4 + (i - 1) * i_lineinc)
		i_ret = winparent.openuserobject(rb, 0, 4 + (i - 1) * i_lineinc)
		if i_ret = 1 then SetParent(handle(rb), handle(this))
		
		iradb_ctrl[i] = rb
	end if
next


//adjust the size of the control in function of the inner controls created
height = 6 + (i - 1) * i_lineinc 
width = l_maxlen + PixelsToUnits(i_button_width + 3, XPixelsToUnits!)

return i

end function

public function integer of_init (string as_labels[]);
return of_init(as_labels, 1)

end function

event constructor;
st_1.visible = false

end event

on uo_multi_static.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_multi_static.destroy
destroy(this.st_1)
end on

event destructor;integer i
window winparent

winparent = getParentWindow(this)

for i=1 to upperbound(iradb_ctrl )
	if IsValid(iradb_ctrl[i]) THEN
		 // Change parent back to window
		 SetParent( Handle( iradb_ctrl[i]), Handle(winparent) )
		 // Destroy ddlb
		 winparent.CloseUserObject( iradb_ctrl[i] )
		 if isvalid(iradb_ctrl[i]) then destroy iradb_ctrl[i]
	END IF 
next

end event

type st_1 from statictext within uo_multi_static
integer x = 23
integer y = 20
integer width = 695
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_multi_radio_selector control"
boolean focusrectangle = false
end type

