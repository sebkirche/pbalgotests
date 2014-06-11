$PBExportHeader$nv_hash.sru
forward
global type nv_hash from nonvisualobject
end type
end forward

global type nv_hash from nonvisualobject
end type
global nv_hash nv_hash

type variables

//PowerBuilder implementation of a hash table


private:

/* to be efficient
 - the b_hash parameter must be a power of 2
 - the n_hash parameter must be a prime number, not close of a power of 2
*/
constant long n_hash = 10007 //400093
constant long b_hash = 256

nv_dl_listitem buckets[10007]	//cannot use a constant to size the array

end variables

forward prototypes
public function long hash (string s)
public subroutine remove (string as_key)
public function boolean get (string as_key, ref any as_val)
public function boolean exists (string as_key)
public subroutine set (string as_key, any aa_value)
public function boolean lookup (string as_key, ref nv_dl_listitem an_item)
end prototypes

public function long hash (string s);
// compute the hash value of the string

long val, i, length

length = len(s)
for i = 1 to length
	val = mod (val * b_hash + asc(mid(s, i, 1)), n_hash)
next

return val

end function

public subroutine remove (string as_key);
//remove a value from the table
//
// as an array item cannot be deleted with PB,
// we flag it as 'empty'

long ll_hashval, i
nv_dl_listitem item

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
end if

end subroutine

public function boolean get (string as_key, ref any as_val);
//search for a value in the hash
// return true if found and fill the as_val

nv_dl_listitem item

if lookup(as_key, item) then
	as_val = item.value
	return true
end if

return false

end function

public function boolean exists (string as_key);
// test for the existence of a key

nv_dl_listitem item

return lookup(as_key, item)

end function

public subroutine set (string as_key, any aa_value);
long ll_hashval
nv_dl_listitem curitem, newitem

ll_hashval = hash(as_key)

curitem = buckets[ll_hashval]
do while not isnull(curitem) and isvalid(curitem)
	if curitem.key = as_key then
		//found the key in the bucket, replace the value
		curitem.value = aa_value
		return
	end if
	curitem = curitem.dl_next
loop

newitem = create nv_dl_listitem
newitem.key = as_key
newitem.value = aa_value
if not isnull(curitem) and isvalid(curitem) then
	curitem.dl_next = newitem
	newitem.dl_prev = curitem
else
	buckets[ll_hashval] = newitem
end if

end subroutine

public function boolean lookup (string as_key, ref nv_dl_listitem an_item);
//lookup of a key in the hash
//
// if found, get the bucket and the item index

long ll_hashval, i
nv_dl_listitem item

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

on nv_hash.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_hash.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

