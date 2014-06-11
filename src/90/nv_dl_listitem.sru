$PBExportHeader$nv_dl_listitem.sru
forward
global type nv_dl_listitem from nonvisualobject
end type
end forward

global type nv_dl_listitem from nonvisualobject
end type
global nv_dl_listitem nv_dl_listitem

type variables

string key
any value
nv_dl_listitem dl_prev
nv_dl_listitem dl_next

end variables
on nv_dl_listitem.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_dl_listitem.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

