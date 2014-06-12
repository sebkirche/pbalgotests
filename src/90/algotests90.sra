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

hash h
h = create hash

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

/* test auto generated
word_generator wg
wg = create word_generator
wg.init("      ", 'A', 'Z')
long i
for i = 1 to 65536
	h.set(wg.next_seq_word() , true) //it will output collisions in DebugView
	yield()
next
destroy wg
*/

/*
int f, p, r
string ls_line, ls_key, ls_val
f = fileopen("data\freq.txt", linemode!, read!)
if f > -1 then
	do 
		r = FileRead(f, ls_line)
		if r > 0 then
			p = pos(ls_line, "~t")
			ls_key = left(ls_line, p - 1)
			ls_val = mid(ls_line, p + 1)
			h.set(ls_key, ls_val)
		end if
	loop while r > 0
end if
fileclose(f)

h.dump_collisions("collisions.pl")
*/

destroy h

bench_hash bh
bh = create bench_hash
any empty[]
//59359 //10007 //400093

bh.mark({10007})

bh.mark(empty[])

bh.mark({400093})



destroy bh



end event

