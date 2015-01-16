$PBExportHeader$counter.sru
forward
global type counter from nonvisualobject
end type
end forward

global type counter from nonvisualobject autoinstantiate
end type

type variables

string is_unit = "EURO"
string is_sub = "CENT"

end variables
forward prototypes
public function string count (string as_val)
public function string stringify (string as_val)
end prototypes

public function string count (string as_val);
String ls_Amount, ls_cents
string ls_ret
Long ll_Position, ll_amount, ll_cents

ls_Amount = Trim(as_val)
ll_Position = Pos(ls_Amount,'.')
if ll_Position > 0 then
	ls_Cents = Mid(ls_Amount,ll_Position + 1,2)
	ll_cents = Long(ls_cents)
	ls_Amount = Mid(ls_Amount,1,ll_Position - 1)
	ll_amount = long(ls_amount)
end if

ls_ret = stringify(ls_amount)

if ll_amount > 1 then
	ls_ret += ' ' + is_unit + 'S'
else
	ls_ret += ' ' + is_unit
end if
if ll_cents > 0 then
	ls_ret += ' AND ' + stringify(ls_cents)
	if ll_cents > 1 then
		ls_ret += ' ' + is_sub + 'S'
	else
		ls_ret += ' ' + is_sub
	end if
end if


return ls_ret

end function

public function string stringify (string as_val);
String ls_Single[], ls_Ten[], ls_Teen[], ls_Mega[]
String ls_Hundred, ls_Word, ls_Char, ls_Temp, ls_amount, ls_unit
string ls_ret
Integer li_Point
Long ll_Position
ls_Single = { 'ONE','TWO','THREE','FOUR','FIVE','SIX','SEVEN','EIGHT','NINE' }
ls_Ten = { 'TEN','TWENTY','THIRTY','FORTY','FIFTY','SIXTY','SEVENTY','EIGHTY','NINETY' }
ls_Teen = { 'TEN', 'ELEVEN','TWELVE','THIRTEEN','FOURTEEN','FIFTEEN','SIXTEEN','SEVENTEEN','EIGHTEEN','NINETEEN' }
ls_Mega = { '','THOUSAND','MILLION','BILLION'}
ls_Hundred = 'HUNDRED'
li_Point = 1

ls_amount = as_val
do while Len(ls_Amount) > 0
	ls_Word = ''
	ls_Temp = Right(ls_Amount,3)
	do while Len(ls_Temp) > 0
		if len(ls_word) > 0 then ls_word += ' '
		choose case Len(ls_Temp)
			case 3
				ls_Char = Mid(ls_Temp,1,1)
				if ls_Char <> '0' then
					ls_Word += ls_Single[Integer(ls_Char)] + ' ' +ls_Hundred
				end if
				ls_Temp = Mid(ls_Temp,2)
			case 2
				ls_Char = Mid(ls_Temp,1,1)
				If ls_Char = '0' then
					ls_Temp = Mid(ls_Temp,2,1)
				else
					if ls_Char = '1' then 
						ls_Word += ls_Teen[Integer(Mid(ls_Temp,2,1))+1]
						ls_Temp = ''
					else
						ls_Word += ls_Ten[Integer(ls_Char)]
						ls_Temp = Mid(ls_Temp,2,1)
					end if
				end if
			case 1
				ls_Char = Mid(ls_Temp,1,1)
				If ls_Char <> '0' then
					ls_Word += ls_Single[Integer(ls_Char)]
				END IF
				ls_Temp = ''
		end choose
	loop

	ls_Amount = Mid(ls_Amount,1,Len(ls_Amount)-3)
	if Len(ls_Word) > 0 then
		if len(ls_ret) > 0 then ls_ret = ' ' + ls_ret
		ls_unit = ls_Mega[li_Point]
		if len(ls_unit) > 0 then
			ls_ret = ls_Word + ' ' + ls_unit + ls_ret
		else
			ls_ret = ls_Word + ls_ret
		end if
	end IF
	li_Point++
loop

return ls_ret

end function

on counter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on counter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

