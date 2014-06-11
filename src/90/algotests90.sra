$PBExportHeader$algotests90.sra
$PBExportComments$Generated Application Object
forward
global type algotests90 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type algotests90 from application
string appname = "algotests90"
end type
global algotests90 algotests90

on algotests90.create
appname="algotests90"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on algotests90.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;

nv_hash h
h = create nv_hash

string m
m = "hello=" + string(h.hash("hello"))
m += "~r~ntruc=" + string(h.hash("truc"))
m += "~r~nmachin=" + string(h.hash("machin"))
m += "~r~nhello=" + string(h.hash("hello"))
m += "~r~ntroc=" + string(h.hash("troc"))
m += "~r~nbozo le clown=" + string(h.hash("bozo le clown"))
m += "~r~nbozo le cliwn=" + string(h.hash("bozo le cliwn"))
m += "~r~nbozo le colwn=" + string(h.hash("bozo le colwn"))

messagebox("hashes", m)

h.set("truc", "valeur truc")
h.set("machin", "valeur machin")
h.set("trcu", "valeur trcu")

any val
if h.get("truc", val) then
	messagebox("test get", string(val))
else
	messagebox("test get", "not found")
end if

h.remove("truc")

if h.get("truc", val) then
	messagebox("test get", string(val))
else
	messagebox("test get", "not found")
end if

messagebox("test exists", 'exists("machin")='+string(h.exists("machin")))
messagebox("test exists", 'exists("other")='+string(h.exists("other")))

destroy h


end event

