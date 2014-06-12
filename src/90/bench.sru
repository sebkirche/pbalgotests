$PBExportHeader$bench.sru
forward
global type bench from nonvisualobject
end type
end forward

global type bench from nonvisualobject
event pre_bench ( any aa_args[] )
event bench ( any aa_args[] )
event post_bench ( any aa_args[] )
event journalize_hook ( integer log,  any aa_args[] )
end type
global bench bench

type variables

boolean ib_journalize = true
long il_benchtime
string is_journal = "pb_bench.log"

end variables

forward prototypes
public function long mark (any aa_args[])
public subroutine journalize (any aa_args[])
end prototypes

event journalize_hook(integer log, any aa_args[]);
int i
for i = 1 to upperbound(aa_args[])
	FileWrite(log, "arg " + string(i) + " = " + string(aa_args[i]) + "~r~n")
next

end event

public function long mark (any aa_args[]);
long lstart, lend

event pre_bench(aa_args[])
lstart = cpu()

event bench(aa_args[])

lend = cpu()
il_benchtime = lend - lstart
if ib_journalize then journalize(aa_args[])

event post_bench(aa_args[])

return il_benchtime

end function

public subroutine journalize (any aa_args[]);
int l

l = FileOpen(is_journal, linemode!, write!, lockwrite!, append!)

if l < 0 then return

FileWrite(l, string(today()) + ' ' + string(now()) + ' - ' + classname() + "~n")
event journalize_hook(l, aa_args[])
FileWrite(l, "~r~nLasted " + string(il_benchtime) + " ms~n")
FileWrite(l, "------------------------------------------------~n")

FileClose(l)
l = -1

end subroutine

on bench.create
call super::create
TriggerEvent( this, "constructor" )
end on

on bench.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

