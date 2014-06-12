$PBExportHeader$bench_hash.sru
forward
global type bench_hash from bench
end type
end forward

global type bench_hash from bench
end type
global bench_hash bench_hash

type variables

hash h

end variables

event bench;call super::bench;

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

end event

event pre_bench;call super::pre_bench;
h = create hash

if upperbound(aa_args[]) > 0 then
	h.realloc(aa_args[1])
end if

end event

event post_bench;call super::post_bench;
h.dump_collisions("collisions_" + string(h.size()) + ".pl")

destroy h

end event

on bench_hash.create
call super::create
end on

on bench_hash.destroy
call super::destroy
end on

