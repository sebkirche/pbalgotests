$PBExportHeader$counter.sru
forward
global type counter from nonvisualobject
end type
end forward

global type counter from nonvisualobject autoinstantiate
end type

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
If ll_Position > 0 THEN
	ls_Cents = Mid(ls_Amount,ll_Position + 1,2)
	ll_cents = Long(ls_cents)
	ls_Amount = Mid(ls_Amount,1,ll_Position - 1)
	ll_amount = long(ls_amount)
END IF

ls_ret = stringify(ls_amount)

IF ll_amount > 1 THEN
	ls_ret += ' PESOS'
else
	ls_ret += ' PESO'
END IF
if ll_cents > 0 then
	ls_ret += ' AND ' + stringify(ls_cents)
	if ll_cents > 1 then
		ls_ret += ' CENTS'
	else
		ls_ret += ' CENT'
	end if
end if


Return ls_ret

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
Do while Len(ls_Amount) > 0
	ls_Word = ''
	ls_Temp = Right(ls_Amount,3)
	Do While Len(ls_Temp) > 0
		if len(ls_word) > 0 then ls_word += ' '
		CHOOSE CASE Len(ls_Temp)
			CASE 3
				ls_Char = Mid(ls_Temp,1,1)
				If ls_Char <> '0' THEN
					ls_Word += ls_Single[Integer(ls_Char)] + ' ' +ls_Hundred
				END IF
				ls_Temp = Mid(ls_Temp,2)
			CASE 2
				ls_Char = Mid(ls_Temp,1,1)
				If ls_Char = '0' THEN
					ls_Temp = Mid(ls_Temp,2,1)
				Else
					If ls_Char = '1' THEN 
						ls_Word += ls_Teen[Integer(Mid(ls_Temp,2,1))+1]
						ls_Temp = ''
					Else
						ls_Word += ls_Ten[Integer(ls_Char)]
						ls_Temp = Mid(ls_Temp,2,1)
					END IF
				END IF
			CASE 1
				ls_Char = Mid(ls_Temp,1,1)
				If ls_Char <> '0' THEN
					ls_Word += ls_Single[Integer(ls_Char)]
				END IF
				ls_Temp = ''
		END CHOOSE
	LOOP

	ls_Amount = Mid(ls_Amount,1,Len(ls_Amount)-3)
	If Len(ls_Word) > 0 THEN
		if len(ls_ret) > 0 then ls_ret = ' ' + ls_ret
		ls_unit = ls_Mega[li_Point]
		if len(ls_unit) > 0 then
			ls_ret = ls_Word + ' ' + ls_unit + ls_ret
		else
			ls_ret = ls_Word + ls_ret
		end if
	END IF
	li_Point++
LOOP

Return ls_ret

end function

on counter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on counter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

