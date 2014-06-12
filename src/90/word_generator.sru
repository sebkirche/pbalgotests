$PBExportHeader$word_generator.sru
forward
global type word_generator from nonvisualobject
end type
end forward

global type word_generator from nonvisualobject
end type
global word_generator word_generator

type prototypes
SUBROUTINE OutputDebugString (String lpszOutputString)  LIBRARY "kernel32.dll" ALIAS FOR "OutputDebugStringA";

end prototypes

type variables

char ic_word[] //"static" word
char ic_first
char ic_last
end variables

forward prototypes
public function string increment_char (integer ai_pos)
public subroutine init (string as_init, character ac_first, character ac_last)
public function string next_seq_word ()
end prototypes

public function string increment_char (integer ai_pos);
int li_pos
li_pos = upperbound(ic_word) - ai_pos + 1

if ic_word[li_pos] = char(32) then
	ic_word[li_pos] = ic_first
else
	ic_word[li_pos] = char(asc(ic_word[li_pos]) + 1)
end if

if asc(ic_word[li_pos]) > asc(ic_last) then 
	ic_word[li_pos] = ic_first
	if ai_pos < upperbound(ic_word) then increment_char(ai_pos+1)
end if

return lefttrim(ic_word)

end function

public subroutine init (string as_init, character ac_first, character ac_last);
ic_word = as_init
ic_first = ac_first
ic_last = ac_last

end subroutine

public function string next_seq_word ();
string s 
s = increment_char(1)
//outputdebugstring(s)
return s

end function

on word_generator.create
call super::create
TriggerEvent( this, "constructor" )
end on

on word_generator.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

