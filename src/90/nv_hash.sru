$PBExportHeader$nv_hash.sru
forward
global type nv_hash from nonvisualobject
end type
type s_item from structure within nv_hash
end type
type s_bucket from structure within nv_hash
end type
end forward

type s_item from structure
	string		key
	any		value
	boolean		empty
end type

type s_bucket from structure
	s_item		items[]
end type

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

s_bucket buckets[10007]	//cannot use a constant to size the array

end variables
forward prototypes
public function long hash (string s)
public subroutine add (string as_key, any aa_value)
public subroutine remove (string as_key)
public function boolean get (string as_key, ref any as_val)
public function boolean lookup (string as_key, ref long al_bucket, ref long al_item)
public function boolean exists (string as_key)
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

public subroutine add (string as_key, any aa_value);
long ll_hashval, i
s_item item

ll_hashval = hash(as_key)

if upperbound(buckets[ll_hashval].items[]) = 0 then
	//no item in this bucket, allocate a new one
	item.key = as_key
	item.value = aa_value
	item.empty = false
	buckets[ll_hashval].items[1] = item
	return
end if

for i = 1 to upperbound(buckets[ll_hashval].items[])
	if buckets[ll_hashval].items[i].key = as_key then
		//found the key in the bucket, replace the value
		buckets[ll_hashval].items[i].value = aa_value
		return
	end if
next

item.key = as_key
item.value = aa_value
item.empty = false

//fill an empty item, if any
for i = 1 to upperbound(buckets[ll_hashval].items[])
	if buckets[ll_hashval].items[i].empty then
		buckets[ll_hashval].items[i] = item
		return
	end if
next

buckets[ll_hashval].items[upperbound(buckets[ll_hashval].items[]) + 1] = item

end subroutine

public subroutine remove (string as_key);
//remove a value from the table
//
// as an array item cannot be deleted with PB,
// we flag it as 'empty'

long ll_hashval, i
s_bucket buck
s_item item

ll_hashval = hash(as_key)
buck = buckets[ll_hashval]

for i = 1 to upperbound(buck.items[])
	if buck.items[i].key = as_key then
		//found the key in the bucket, replace the value
		item.empty = true
		buckets[ll_hashval].items[i] = item
		return
	end if
next

end subroutine

public function boolean get (string as_key, ref any as_val);
//search for a value in the hash
// return true if found and fill the as_val

long ll_buck, ll_item

if lookup(as_key, ll_buck, ll_item) then
	as_val = buckets[ll_buck].items[ll_item].value
	return true
end if

return false

end function

public function boolean lookup (string as_key, ref long al_bucket, ref long al_item);
//lookup of a key in the hash
//
// if found, get the bucket and the item index

long ll_hashval, i

ll_hashval = hash(as_key)

for i = 1 to upperbound(buckets[ll_hashval].items[])
	if buckets[ll_hashval].items[i].key = as_key then
		//found the key in the bucket
		al_bucket = ll_hashval
		al_item = i
		return true
	end if
next

return false

end function

public function boolean exists (string as_key);
// test for the existence of a key

long ll_buck, ll_item

return lookup(as_key, ll_buck,  ll_item)

end function

on nv_hash.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_hash.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

