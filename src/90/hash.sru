$PBExportHeader$hash.sru
forward
global type hash from nonvisualobject
end type
end forward

global type hash from nonvisualobject
end type
global hash hash

type prototypes

SUBROUTINE OutputDebugString (String lpszOutputString)  LIBRARY "kernel32.dll" ALIAS FOR "OutputDebugStringA";

end prototypes

type variables

//PowerBuilder implementation of a hash table

private:

/* to be efficient
 - the b_hash parameter must be a power of 2
 - the n_hash parameter must be a prime number, not close of a power of 2
*/
long n_hash = 59359 //10007 //400093
long b_hash = 256
dl_listitem buckets[]
ulong il_count = 0
end variables

forward prototypes
public function long hash (string s)
public subroutine remove (string as_key)
public function boolean get (string as_key, ref any as_val)
public function boolean exists (string as_key)
public subroutine set (string as_key, any aa_value)
public function boolean lookup (string as_key, ref dl_listitem an_item)
public subroutine dump_collisions (string as_filename)
public function long count ()
public function long size ()
public subroutine realloc (long al_size)
end prototypes

public function long hash (string s);
// compute the hash value of the string

long val, i, length

length = len(s)
for i = 1 to length
	val = mod (val * b_hash + asc(mid(s, i, 1)), n_hash)
next

return val + 1 //PB arrays start at 1 by default

end function

public subroutine remove (string as_key);
//remove a value from the table
//
// as an array item cannot be deleted with PB,
// we flag it as 'empty'

long ll_hashval, i
dl_listitem item

ll_hashval = hash(as_key)
if lookup(as_key, item) then
	if not isnull(item.dl_prev) and isvalid(item.dl_prev) then item.dl_prev.dl_next = item.dl_next
	if not isnull(item.dl_next) and isvalid(item.dl_next) then item.dl_next.dl_prev = item.dl_prev
	if item = buckets[ll_hashval] then
		if not isnull(item.dl_next) and isvalid(item.dl_next) then 
			buckets[ll_hashval] = item.dl_next
		end if
	end if
	destroy item
	il_count --
end if

end subroutine

public function boolean get (string as_key, ref any as_val);
//search for a value in the hash
// return true if found and fill the as_val

dl_listitem item

if lookup(as_key, item) then
	as_val = item.value
	return true
end if

return false

end function

public function boolean exists (string as_key);
// test for the existence of a key

dl_listitem item

return lookup(as_key, item)

end function

public subroutine set (string as_key, any aa_value);
long ll_hashval
dl_listitem curitem, newitem

ll_hashval = hash(as_key)

curitem = buckets[ll_hashval]
do while not isnull(curitem) and isvalid(curitem)
	OutputDebugString("collision: " + as_key + " collides with " + curitem.key + string(ll_hashval))
	if curitem.key = as_key then
		//found the key in the bucket, replace the value
		curitem.value = aa_value
		return
	end if
	curitem = curitem.dl_next
loop

curitem = buckets[ll_hashval]
newitem = create dl_listitem
newitem.key = as_key
newitem.value = aa_value
if not isnull(curitem) and isvalid(curitem) then
	curitem.dl_prev = newitem
	newitem.dl_next = curitem
end if
buckets[ll_hashval] = newitem
il_count ++

end subroutine

public function boolean lookup (string as_key, ref dl_listitem an_item);
//lookup of a key in the hash
//
// if found, get the bucket and the item index

long ll_hashval, i
dl_listitem item

ll_hashval = hash(as_key)

item = buckets[ll_hashval]
do while not isnull(item) and isvalid(item)
	if item.key = as_key then
		//found the key in the bucket
		an_item = item
		return true
	end if
	item = item.dl_next
loop

return false

end function

public subroutine dump_collisions (string as_filename);
int dump, c, vmax = 0
long buck
dl_listitem item

dump = fileopen(as_filename, linemode!, write!, lockwrite!, replace!)

if dump = 0 then return

FileWrite(dump, "use feature 'say';~r~n &
#n_hash (hash size) = " + string(size()) + "~r~n &
#b_hash = " + string(b_hash) + "~r~n &
my %colls = ();")

for buck = 1 to upperbound(buckets[])
	item = buckets[buck]
	if isnull(item) or not isvalid(item) then continue
	c = item.size()
	if item.size() < 2 then continue
	if c > vmax then vmax = c 
	FileWrite(dump, "$colls{" + string(buck) + "}=[")
	do while not isnull(item) and isvalid(item)
		FileWrite(dump,"'" + item.key + "',")
		item = item.dl_next
	loop
	FileWrite(dump, "];");
next
FileWrite(dump, "# maximum collision = " + string(vmax) + " for " + string(count()) + " items ~r~n &
my $sum = 0, $avg = 0;~r~n &
($sum += scalar @$_) foreach values %colls;~r~n &
$avg = $sum / keys %colls;~r~n &
say ~"count = ~" . (scalar keys %colls) . ~" avg = $avg~";~r~n &
# 10 first collisions by decreasing count~r~n &
say $_, ' ', scalar @{$colls{$_}}, ' ', '[',join(',',@{$colls{$_}}),']' for (sort {scalar @{$colls{$b}} <=> scalar @{$colls{$a}}} keys %colls)[0..9];~r~n &
~r~n &
#~ my $sum = 0, $avg = 0;~r~n &
#~ ($sum += scalar @$_) foreach values %colls;~r~n &
#~ $avg = $sum / keys %colls;~r~n &
#~ say ~"avg = $avg~";~r~n &
#~ say '[',join(',',@$_),']' for grep {scalar @$_ > $avg} values %colls;~r~n &
#~ say $_,'[',join(',',@{$colls{$_}}),']' for sort{$a<=>$b} grep {1 or scalar @{$colls{$_}} > $avg} keys %colls;~r~n")

fileclose(dump)

end subroutine

public function long count ();
return il_count

end function

public function long size ();
return upperbound(buckets[])

end function

public subroutine realloc (long al_size);
dl_listitem new[]
dl_listitem item

new[al_size] = item

buckets[] = new[]
n_hash = al_size

end subroutine

on hash.create
call super::create
TriggerEvent( this, "constructor" )
end on

on hash.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
dl_listitem init[59359]

buckets[] = init[]


end event

