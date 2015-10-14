$PBExportHeader$uo_coolbutton.sru
forward
global type uo_coolbutton from commandbutton
end type
type tagrect from structure within uo_coolbutton
end type
type us_bitmap from structure within uo_coolbutton
end type
type msg from structure within uo_coolbutton
end type
type point from structure within uo_coolbutton
end type
type toolinfo from structure within uo_coolbutton
end type
end forward

type tagrect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

type us_bitmap from structure
	long		bmtype
	long		bmwidth
	long		bmheight
	long		bmwidthbytes
	long		bmplanes
	long		bmbitspixel
	blob		bmbits
end type

type msg from structure
	unsignedlong		hwnd
	unsignedlong		message
	unsignedlong		wparam
	unsignedlong		lparam
	long		time
	point		pt
end type

type point from structure
	long		x
	long		y
end type

type toolinfo from structure
	unsignedlong		cbsize
	unsignedlong		uflags
	unsignedlong		hwnd
	unsignedlong		uid
	tagrect		rect
	unsignedlong		hinstance 
	long		lpsztext
end type

global type uo_coolbutton from commandbutton
integer width = 361
integer height = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "none"
event ue_paint pbm_paint
event ue_lbuttondown pbm_lbuttondown
event ue_mousemove pbm_mousemove
event ue_lbuttonup pbm_lbuttonup
event ue_size pbm_size
event ue_lbuttondblclk pbm_lbuttondblclk
event ue_keyup pbm_keyup
event ue_keydown pbm_keydown
event ue_enable pbm_enable
end type
global uo_coolbutton uo_coolbutton

type prototypes
//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

FUNCTION uLong GetWindowuLong(uLong  hwnd, uLong nIndex) Alias For GetWindowLongA LIBRARY "USER32.DLL"
FUNCTION uLong SetWindowuLong(uLong  hwnd, uLong nIndex,uLong dwNewLong) Alias For SetWindowLongA LIBRARY "USER32.DLL"
FUNCTION ulong FillRect(ulong hdc,ref tagrect lpRect,ulong hBrush) LIBRARY "user32.dll" alias for "FillRect"
FUNCTION ulong CreateSolidBrush(ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong GetSysColorBrush(ulong nIndex) LIBRARY "user32.dll"
FUNCTION ulong GetSysColor(ulong nIndex) LIBRARY "user32.dll"
FUNCTION ulong SetBkMode(ulong hdc,ulong nBkMode) LIBRARY "gdi32.dll"
FUNCTION ulong SetBkColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong SetTextColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong DrawText(ulong hdc,string lpStr,ulong nCount,ref tagrect lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextA"
FUNCTION boolean DrawEdge(ulong hdc,ref tagrect qrc,ulong edge,ulong grfFlags) LIBRARY "user32.dll" alias for "DrawEdge"
FUNCTION ulong ReleaseDC(ulong hwnd,ulong hdc) LIBRARY "user32.dll"
FUNCTION ulong DeleteDC(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong SelectObject(ulong hdc,ulong hObject) LIBRARY "gdi32.dll"
FUNCTION ulong DeleteObject(ulong hObject) LIBRARY "gdi32.dll"
FUNCTION ulong CreatePen(ulong nPenStyle,ulong nWidth,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong MoveToEx(ulong hdc,ulong ix,ulong iy,ulong lpPoint) LIBRARY "gdi32.dll"
FUNCTION ulong LineTo(ulong hdc,ulong ix,ulong iy) LIBRARY "gdi32.dll"
FUNCTION ulong ValidateRect(ulong hwnd,ref tagrect lpRect) LIBRARY "user32.dll" alias for "ValidateRect"
FUNCTION ulong GetDC(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong LoadImage(ulong hInst,string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA"
FUNCTION boolean DrawIconEx(ulong hdc,ulong xLeft,ulong yTop,ulong hIcon,ulong cxWidth,ulong cyWidth,ulong istepIfAniCur,ulong hbrFlickerFreeDraw,ulong diFlags) LIBRARY "user32.dll"
FUNCTION ulong GetTextFace(ulong hdc,ulong nCount,ref string lpFacename) LIBRARY "gdi32.dll" ALIAS FOR "GetTextFaceA"
FUNCTION boolean DrawState(ulong hDC,ulong hBrush,ulong lpDrawStateProc,ulong lParam,ulong wParam,ulong n1,ulong n2,ulong n3,ulong n4,ulong un) LIBRARY "user32.dll" ALIAS FOR "DrawStateA"
FUNCTION ulong DestroyIcon(ulong hIcon) LIBRARY "user32.dll"

FUNCTION ulong Rectangle(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll" 


function long LoadLibrary( ref string lpLibFileName2 ) LIBRARY "KERNEL32"  Alias For "LoadLibraryA"
function long FreeLibrary( long hinstance ) LIBRARY "KERNEL32"
FUNCTION ulong LoadBitmap(ulong hInstance, long lpBitmapName) LIBRARY "user32.dll" ALIAS FOR "LoadBitmapA"
FUNCTION ulong LoadBitmap(ulong hInstance, string lpBitmapName) LIBRARY "user32.dll" ALIAS FOR "LoadBitmapA"

FUNCTION ulong CreateDC(string lpDriverName,string lpDeviceName, string lpOutput, long lpInitData) LIBRARY "gdi32.dll" ALIAS FOR "CreateDCA"
FUNCTION ulong CreateCompatibleDC(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong GetPixel(ulong hdc,ulong ix,ulong iy) LIBRARY "gdi32.dll"
FUNCTION ulong LoadImage(ulong hInst,long lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA"


FUNCTION long FN_ResGetIconID(string lpLibFileName) LIBRARY "PBVM90.dll" alias for "FN_ResGetIconID" 
FUNCTION long FN_ResGetBitmapID(string lpLibFileName) LIBRARY "PBVM90.dll" alias for "FN_ResGetBitmapID" 
FUNCTION string FN_ResGetBitmapName(long lpLibFileName) LIBRARY "PBVM90.dll" alias for "FN_ResGetBitmapName" 
Function Long ImageList_Create (Long MinCx , Long MinCy , Long flags ,Long cInitial ,Long cGrow) Library "PBVM90.dll" ALIAS FOR "PBImageList_Create"
Function Long ImageList_AddMasked(Long hImageList ,Long hbmImage , Long crMask ) Library "PBVM90.dll" ALIAS FOR "PBImageList_AddMasked"
Function Long ImageList_GetIcon(Long hImageList , Long ImgIndex , Long hbmMask ) Library "PBVM90.dll" ALIAS FOR "PBImageList_GetIcon"
Function Long ImageList_Destroy(Long hImageList) Library "PBVM90.dll" ALIAS FOR "PBImageList_Destroy"


FUNCTION ulong RoundRect(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"
FUNCTION ulong GetStockObject(ulong nIndex) LIBRARY "gdi32.dll"

function ulong SetCapture(ulong hwnd) library "user32.dll"
function boolean ReleaseCapture() library "user32.dll"
function ulong GetCapture() library "user32.dll"

FUNCTION ulong GetWindowRect(ulong hwnd,ref tagRECT lpRect) LIBRARY "user32.dll" alias for "GetWindowRect"
FUNCTION ulong OffsetRect(ref tagrect lpRect,ulong xs,ulong ys) LIBRARY "user32.dll" alias for "OffsetRect"
FUNCTION ulong GetClientRect(ulong hwnd,ref tagRECT lpRect) LIBRARY "user32.dll" alias for "GetClientRect"
FUNCTION ulong DefWindowProc(ulong hwnd,ulong wMsg,ulong wParam,ulong lParam) LIBRARY "user32.dll" ALIAS FOR "DefWindowProcA"
FUNCTION ulong DrawFocusRect(ulong hdc,ref tagRECT lpRect) LIBRARY "user32.dll" alias for "DrawFocusRect"

Function long CreateCompatibleBitmap ( long hdc, long nwidth, long nheight ) library "gdi32"
Function uLong BitBlt(uLong hDestDC,uLong xx,uLong yy,uLong nWidth,uLong nHeight,uLong hSrcDC,uLong xSrc,uLong ySrc,uLong dwRop) LIBRARY "gdi32.dll"
Function uLong GetObjectBitmap( uLong  hgdiobj, int  cbBuffer, ref us_bitmap bm ) library "gdi32.dll" alias for "GetObjectA"
FUNCTION ulong FrameRect(ulong hdc,ref tagRECT lpRect,ulong hBrush) LIBRARY "user32.dll" alias for "FrameRect"
FUNCTION ulong StretchBlt(ulong hdc,ulong x1,ulong y1,ulong nWidth,ulong nHeight,ulong hSrcDC,ulong xSrc,ulong ySrc,ulong nSrcWidth,ulong nSrcHeight,ulong dwRop) LIBRARY "gdi32.dll"

FUNCTION ulong CreateRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll"
FUNCTION ulong CombineRgn(ulong hDestRgn,ulong hSrcRgn1,ulong hSrcRgn2,ulong nCombineMode) LIBRARY "gdi32.dll"
FUNCTION ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"

SubRoutine InitCommonControls() library "comctl32.dll"
Function long CreateWindowExA(ulong dwExStyle,string ClassName, long WindowName, ulong dwStyle,ulong uX, ulong uY, ulong nWidth, ulong nHeight, ulong hWndParent, ulong hMenu, ulong hInstance, ulong lpParam) library "user32.dll" alias for "CreateWindowExA"
Function integer DestroyWindow(long hWnd) library "user32.dll" 
Function integer ToolTipMsg(long hWnd, long uMsg, long wParam, REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageA"
Function integer RelayMsg(long hWnd, long uMsg, long wParam, REF MSG Msg) library  "user32.dll" Alias For "SendMessageA"
Function long LocalAlloc(long Flags, long Bytes) library "kernel32.dll"
Function long LocalFree(long MemHandle) library "kernel32.dll"
Function long lstrcpy(long Destination, string Source) library "kernel32.dll" alias for "lstrcpy"
end prototypes

type variables
//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

public:
boolean		HaveFocus  = true
boolean		border

long			Style	

string		normalPicName = "custom038!"
String		mMovePicName 

integer		PicSize = 16


ToolBarAlignment	PIC_Align = Alignatleft! 
rowfocusind	TOOLTIPTYPE = OFF!


private:
integer		GradientType = 1  
long			BorderColor = 12615680
long			FontColor = rgb(0,0,0)
long			MoveinFontColor = rgb(0,0,0)
long			ColorFrom = RGB(255,255,255)
long			ColorTo   = RGB(179,213,243)


private:
long il_hwnd, il_hdc
long ColorStart, ColorEnd
ulong h_normalPic,h_movePic

boolean ib_captured 	= false
boolean ib_pushDown 	= false
boolean ib_keydown 	= false
boolean ib_mousedown = false
boolean ib_paint 		= false
boolean ib_mousein 	= false
integer ii_picsize  
long il_BKDC =- 1
integer ii_BKW
integer ii_BKH
tagRect winRect
String ResBMP 

CONSTANT INTEGER STYLE_HGRADIENT = 0
CONSTANT INTEGER STYLE_VGRADIENT = 1
CONSTANT INTEGER STYLE_VHEADERGRADIENT = 2
CONSTANT INTEGER STYLE_VEDGEGRADIENT = 3

CONSTANT ulong TRANSPARENT = 1
CONSTANT uLong BDR_RAISEDOUTER = 1
CONSTANT uLong BDR_SUNKENOUTER = 2
CONSTANT uLong BDR_RAISEDINNER = 4
CONSTANT uLong BDR_SUNKENINNER = 8
CONSTANT uLong BDR_OUTER =  3
CONSTANT uLong BDR_INNER =  12

CONSTANT uLong BF_LEFT = 1
CONSTANT uLong BF_RIGHT = 4
CONSTANT uLong BF_TOP = 2
CONSTANT uLong BF_BOTTOM = 8
CONSTANT uLong BF_RECT = 1
CONSTANT uLong COLOR_BACKGROUND=1 
CONSTANT uLong COLOR_HIGHLIGHT= 13
CONSTANT uLong COLOR_HIGHLIGHTTEXT  =  14
CONSTANT uLong COLOR_MENU = 4
CONSTANT uLong COLOR_WINDOW = 5 
CONSTANT uLong COLOR_MENUTEXT = 7
CONSTANT uLong COLOR_WINDOWTEXT = 8
CONSTANT uLong COLOR_ACTIVECAPTION = 2
CONSTANT uLong COLOR_BTNFACE = 15
CONSTANT uLong COLOR_INFOBK = 24
Constant integer COLOR_BTNHIGHLIGHT = 20
Constant integer COLOR_BTNSHADOW = 16

CONSTANT uLong IMAGE_BITMAP = 0
CONSTANT uLong IMAGE_ICON = 1
CONSTANT uLong IMAGE_CURSOR = 2
CONSTANT uLong IMAGE_ENHMETAFILE = 3

CONSTANT uLong LR_DEFAULTCOLOR = 0
CONSTANT uLong LR_MONOCHROME = 1
CONSTANT uLong LR_COLOR = 2
CONSTANT uLong LR_COPYRETURNORG = 4
CONSTANT uLong LR_COPYDELETEORG = 8
CONSTANT uLong LR_LOADFROMFILE = 16
CONSTANT uLong LR_LOADTRANSPARENT = 32
CONSTANT uLong LR_DEFAULTSIZE = 64
CONSTANT uLong LR_VGACOLOR = 128
CONSTANT uLong LR_LOADMAP3DCOLORS = 4096
CONSTANT uLong LR_CREATEDIBSECTION = 8192
CONSTANT uLong LR_COPYFROMRESOURCE = 16384
CONSTANT uLong LR_SHARED = 32768
CONSTANT uLong PS_SOLID = 0

CONSTANT uLong DT_LEFT = 0
CONSTANT uLong DT_CENTER = 1
CONSTANT uLong DT_RIGHT = 2
CONSTANT uLong DT_VCENTER = 4
CONSTANT uLong DT_BOTTOM = 8
CONSTANT uLong DT_SINGLELINE = 32
CONSTANT uLong DT_CALCRECT =  1024

CONSTANT uLong DT_WORDBREAK = 16 

Constant integer DST_ICON = 3
Constant integer DST_BITMAP =4
Constant integer DSS_NORMAL =0
Constant integer DSS_DISABLED = 32
Constant integer DSS_MONO =  128
Constant integer  DSS_UNION = 16

Constant int SM_CYMENU = 15
Constant int SM_CXMENUCHECK = 71

Constant int WHITE_BRUSH=0
Constant int GRAY_BRUSH =1
Constant int LTGRAY_BRUSH=2
Constant int  DKGRAY_BRUSH=3
Constant int  BLACK_BRUSH=4
Constant int  NULL_BRUSH=5
Constant int  WHITE_PEN=6
Constant int  BLACK_PEN=7
Constant int  NULL_PEN=8
Constant int  OEM_FIXED_FONT=10
Constant int  ANSI_FIXED_FONT=11
Constant int  ANSI_VAR_FONT=12

Constant int  SYSTEM_FONT=13

Constant int WM_GETFONT = 49
constant long SRCCOPY = 13369376
constant long NOTSRCCOPY = 3342344
constant long SRCAND = 8913094
constant long SRCINVERT = 6684742


int BMPBKHEIGHT = 36
int OFFSETWIDHT = 90
int MINLENGTH =5


Private:
CONSTANT string TOOLTIPS_CLASS = 'tooltips_class32'
CONSTANT ulong CW_USEDEFAULT = 2147483648
CONSTANT long WM_USER = 1024
CONSTANT long WS_EX_TOPMOST = 8
CONSTANT long TTM_ADDTOOL = WM_USER + 4
CONSTANT long TTM_RELAYEVENT = WM_USER + 7

private:

CONSTANT integer STYLE_NORMAL = 0
CONSTANT integer STYLE_BALLOONTIP = 1
integer TIPSTYLE = STYLE_NORMAL

long hWndTT		
long ToolID = 1	
constant long TOOLINFO_SIZE = 40

CONSTANT integer TTF_CENTERTIP = 2
CONSTANT integer TTF_RTLREADING = 4
CONSTANT integer TTS_BALLOON = 64

end variables

forward prototypes
private function integer of_getpicsize ()
private subroutine of_getrect (toolbaralignment aa_align, ref tagrect ast_cbrect, ref tagrect ast_picrect, ref tagrect ast_textrect, integer ai_picsize)
protected subroutine of_drawborder (long hdc, tagrect ast_rect)
protected function long of_geticonhandle (string as_iconname, integer ai_size)
protected function long of_getmaskcolor (long al_bitmaphandle)
protected function long of_getstockicon (string as_stockbitmap, ref integer ai_imagetype)
protected subroutine of_paint ()
protected subroutine of_destroyrc ()
private subroutine of_drawbmpbk (long hdc, tagrect ast_rect)
public subroutine of_gradientfill (long hdc, tagrect rect, long ai_colorfrom, long ai_colorto, integer ai_style)
public subroutine of_color2rgb (long lg_color, ref integer r, ref integer g, ref integer b)
private function integer of_loadbkbmp ()
protected subroutine of_drawborder_xp ()
protected function integer of_drawfocus ()
protected subroutine of_drawtext (unsignedlong al_hdc, string as_text, tagrect ast_rect, boolean ab_enabled)
public subroutine of_init_draw ()
protected function integer of_repaint (tagrect picrect, ref tagrect textrect, ref long hdc, ref integer li_x, ref integer li_y)
private subroutine of_showtip (dragobject controlobject)
private function integer of_controlregister (dragobject controlobject, string tip, integer flag)
public subroutine of_init ()
end prototypes

event ue_paint;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

of_init_draw()

ValidateRect(il_hwnd,winRect) 
return 1
end event

event ue_lbuttondown;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

if not ib_keydown then
	if not ib_mousedown then
		ColorFrom = ColorEnd
		ColorTo   = ColorStart
		
		ib_mousedown = true
		ib_pushDown = true 
		this.setFocus()
		
		of_init_draw()
		return 1
	end if
end if
end event

event ue_mousemove;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

	if TOOLTIPTYPE = focusrect! then 
		TIPSTYLE = STYLE_NORMAL
		of_ControlRegister(this,this.tag,0)
		of_Showtip(this)
	elseif TOOLTIPTYPE = Hand! then
		TIPSTYLE = STYLE_BALLOONTIP
		of_ControlRegister(this,this.tag,0)
		of_Showtip(this)
	end if


boolean		lb_captured, lb_pushdown
lb_captured = ib_captured
lb_pushdown = ib_pushdown

IF NOT ib_Captured THEN
	if not ib_keydown then
		SetCapture(il_hwnd)
		ib_Captured=true
		ib_mousein = true
		IF	(NOT ib_pushdown) THEN	
			of_paint()
		END	IF
	end if
ELSE
	if not ib_keydown then
		IF ((XPos<0 or YPos<0) or (XPos>=this.Width or YPos>this.Height))	THEN
			IF	NOT	ib_pushdown		THEN
				ib_Captured = false
				ReleaseCapture()
			END	IF
			lb_captured = ib_captured
			IF ib_mousein THEN
				text = text
				ib_captured = false
				ib_pushdown = false
				ColorFrom = ColorStart
				ColorTo   = ColorEnd
				of_init_draw()
				ib_mousein = false
				ib_captured = lb_captured
				ib_pushdown = lb_pushdown
			END	IF
		ELSE
			IF NOT	ib_mousein	THEN
				ib_mousein =true
				IF	ib_pushdown	THEN
					ib_captured = true
					ColorFrom = ColorEnd
					ColorTo   = ColorStart
					of_init_draw()
					ib_captured = lb_captured
				ELSE
					ColorFrom = ColorStart
					ColorTo   = ColorEnd
					of_paint()
				END	IF
				
			END	IF

		END	IF
	end if
END	IF

return 1
end event

event ue_lbuttonup;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

if not ib_keydown then
	if ib_mousedown then
		IF ((XPos<0 or YPos<0) or (XPos>=this.Width or YPos>this.Height))	THEN
			ib_captured = false
		else
			if ib_pushdown and enabled then this.postevent("clicked")
		end if
		
		ReleaseCapture()
		ColorFrom = ColorStart
		ColorTo   = ColorEnd
		
		ib_mousedown = false
		ib_pushdown = false
		of_init_draw()
		ib_captured = false
	end if
else
	return 1
end if
end event

event ue_size;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

of_destroyrc()
of_init_draw()
end event

event ue_lbuttondblclk;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*
return 1
end event

event ue_keyup;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

if not ib_mousedown then
	IF ((Key = KeySpaceBar!) ) then
		if ib_keydown then
			ColorFrom = ColorStart
			ColorTo   = ColorEnd
			
			ib_keydown = false
			ib_pushdown = false
			of_init_draw()
			ib_captured = false

			if default and enabled then this.postevent("clicked")
		end if
	end if
else
	return 1
end if
end event

event ue_keydown;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

if not ib_mousedown then
	if not ib_keydown then
		if key = KeySpaceBar! then
			ColorFrom = ColorEnd
			ColorTo   = ColorStart
			
			ib_keydown = true
			ib_pushDown = true 
			of_init_draw()
			if (not Keydown( KeySpaceBar!) and Key = KeySpaceBar!) then
				ColorFrom = ColorStart
				ColorTo   = ColorEnd
				
				ib_keydown = false
				ib_pushdown = false
				this.setfocus()
				of_init_draw()
				this.post event clicked()
				return 1
			end if
			if default then return 1
		elseif key = KeyEnter! then
			this.post event clicked()
			return 1
		end if
	end if
end if
end event

event ue_enable;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*


if not enabled then ib_captured = false

of_init_draw()

return 1
end event

private function integer of_getpicsize ();integer li_refer,li_cbwidth,li_cbHeight

li_cbwidth = UnitsToPixels ( width, XUnitsToPixels!)
li_cbHeight = UnitsToPixels ( height, YUnitsToPixels!)
if PicSize > 0 then 
	if li_cbwidth<PicSize then width = PixelsToUnits (PicSize, XPixelsToUnits!) +2
	if li_cbHeight<PicSize then height = PixelsToUnits(PicSize, XPixelsToUnits!) +2
	return PicSize 
end if

li_refer = min(li_cbwidth,li_cbHeight) *0.9 
li_refer = li_refer /8 
li_refer = li_refer*8
return li_refer
end function

private subroutine of_getrect (toolbaralignment aa_align, ref tagrect ast_cbrect, ref tagrect ast_picrect, ref tagrect ast_textrect, integer ai_picsize);//get the two rects that pic and text to occupy 

ast_textrect = ast_cbrect
ast_picrect = ast_cbrect
choose case aa_align
	case  alignatbottom!
        ast_textrect.bottom = ast_cbrect.bottom - ai_picsize -1
		  ast_picrect.top = ast_cbrect.bottom - ai_picsize
	case  alignatleft!
		  ast_textrect.left = ast_cbrect.left + ai_picsize +1
		  ast_picrect.right = ast_cbrect.left + ai_picsize
	case  alignatright!
		  ast_textrect.right = ast_cbrect.right - ai_picsize -1
		  ast_picrect.left = ast_cbrect.right - ai_picsize
	case  alignattop! 
        ast_textrect.top = ast_cbrect.top + ai_picsize +1
		  ast_picrect.bottom = ast_cbrect.top + ai_picsize
	case  floating! 
		 //no 
end choose
end subroutine

protected subroutine of_drawborder (long hdc, tagrect ast_rect);long			hNewBrush
boolean		lb_captured
integer		li_GradientType
li_GradientType = GradientType

choose case style
	case 4
		lb_captured = true
	case 7, 8, 9
		of_DrawBorder_xp()
		return
	case else
		lb_captured = ib_captured
end choose


if ib_pushDown  then 
	if PIC_Align<>floating! then
	  DrawEdge(hdc,ast_rect, BDR_SUNKENOUTER, BF_LEFT+BF_RIGHT+BF_TOP+BF_BOTTOM) 
   end if
elseif lb_Captured then 
	if PIC_Align<>floating! then
   	DrawEdge(hdc,ast_rect, BDR_RAISEDINNER, BF_LEFT+BF_RIGHT+BF_TOP+BF_BOTTOM)
   end if
else	
	if (Border) then
		hnewBrush = CreateSolidBrush(BorderColor)
		FrameRect(hdc,ast_rect,hnewBrush)
		deleteObject(hnewBrush)
	end if
end if
end subroutine

protected function long of_geticonhandle (string as_iconname, integer ai_size);

Long ll_BitmapHandle , ll_IconHandle , ll_Library , ll_Index=-1
Environment env
Integer rtn,li_imagetype
String ls_File
Long ll_identier
long ll_hIml

if pos(lower(as_iconname),'.ico')>0 then 
	ll_IconHandle= LoadImage(0,as_iconname,IMAGE_ICON,ai_size,ai_size,LR_LOADFROMFILE )
elseif pos(lower(as_iconname),'.bmp')>0 then 	
	ll_BitmapHandle =LoadImage(0,as_iconname,IMAGE_BITMAP,ai_size,ai_size,LR_LOADFROMFILE + LR_DEFAULTSIZE)

	ll_hIml = ImageList_Create (ai_size , ai_size , 33, 4, 4)
 	ll_Index = ImageList_AddMasked(ll_hIml , ll_BitmapHandle ,  Of_GetMaskColor(ll_BitmapHandle))
 	ll_IconHandle= ImageList_GetIcon( ll_hIml , ll_Index , 1)
	ImageList_Destroy(ll_hIml)
	DeleteObject(ll_BitmapHandle)
elseif pos(as_iconname,'!')>0 then 
	rtn = GetEnvironment(env)
   IF rtn <> 1 THEN
		MessageBox("TIP","Get the value is wrrong in the PowerBuilder Environment.",StopSign!,Ok!)
		Return -1
	End If
		
	ls_File = "PBVM" + String(env.PBMajorRevision) + "0.DLL"
	ll_Library = LoadLibrary(ls_File)
	ll_identier = Of_GetStockicon(as_iconname,li_imagetype)
	If ll_identier >0 and li_imagetype = IMAGE_BITMAP Then
	  		ll_BitmapHandle =  LoadBitmap ( ll_Library , ll_identier)
     		ll_hIml = ImageList_Create (16 , 16 , 33, 4, 4)
			ll_Index = ImageList_AddMasked(ll_hIml , ll_BitmapHandle ,  Of_GetMaskColor(ll_BitmapHandle))
			ll_IconHandle= ImageList_GetIcon( ll_hIml , ll_Index , 1)
			ImageList_Destroy(ll_hIml)
			DeleteObject(ll_BitmapHandle)
	elseIf ll_identier >0 and li_imagetype = IMAGE_ICON Then	
			ll_IconHandle= LoadImage(ll_Library,ll_identier,IMAGE_ICON,0,0, LR_DEFAULTSIZE )
	Else
			ll_index = -1
	End If
		
	FreeLibrary ( ll_Library )
else
	return 0
end if

return ll_IconHandle
end function

protected function long of_getmaskcolor (long al_bitmaphandle);

String ls_Null
Long ll_Hdc,ll_HDCTemp,ll_HbmpTemp
Long ll_MaskColor = -1

ll_HDC = CreateDC("DISPLAY",ls_Null,ls_Null,0)

If ll_HDC<>0 Then

   ll_HDCTemp = CreateCompatibleDC(ll_HDC)
   If ll_HDCTemp<>0 Then

      ll_HbmpTemp = SelectObject(ll_HDCTemp, al_BitMapHandle)

      ll_MaskColor = GetPixel(ll_HDCTemp,0,0)

      SelectObject(ll_HDCTemp,ll_HbmpTemp)

		DeleteDC(ll_HDCTemp)
   End If
	
   DeleteDC(ll_HDC)
End If

Return ll_MaskColor
end function

protected function long of_getstockicon (string as_stockbitmap, ref integer ai_imagetype);

Long  ll_Identifier

If IsNull(as_StockBitmap) Or as_StockBitmap="" Then Return -1

 ll_Identifier = FN_ResGetBitmapID(as_stockbitmap)
 
 if ll_Identifier<=0 then 
 	ll_Identifier = FN_ResGetIconID(as_stockbitmap)
	ai_imagetype= IMAGE_ICON
 else  
	ai_imagetype = IMAGE_BITMAP
 end if
 return ll_Identifier
end function

protected subroutine of_paint ();if ib_paint then return
ib_paint = true

tagRect picRect
tagRect textRect
int li_x,li_y
long ll_hFont,ll_oldFont,ll_oldFcolor


if h_normalPic>0 then
	of_getrect(PIC_Align,winRect,picRect,textRect,ii_picsize)
else
	textRect = winRect
end if

of_repaint(picRect,textRect,il_hdc, li_x, li_y)

of_drawBorder(il_hdc,winRect)

of_DrawText(il_hdc, text, textRect, enabled)

if  (ib_captured or ib_pushDown) and h_MovePic > 0 and h_normalPic>0 then

	DrawIconEx(il_hdc,li_x,li_y,h_MovePic,ii_picsize,ii_picsize,0,0,DST_ICON )
elseif enabled and h_normalPic>0 then 
	DrawIconEx(il_hdc,li_x,li_y,h_normalPic,ii_picsize,ii_picsize,0,0,DST_ICON )
elseif not enabled then 
	DrawState(il_hdc, 0, 0, h_normalPic, 0, li_x, li_y, 0 , 0, DST_ICON + DSS_DISABLED)
end if

of_drawfocus()

ib_paint = false
end subroutine

protected subroutine of_destroyrc ();destroyicon(h_normalPic)
destroyicon(h_MovePic)
if il_BKDC<> - 1 then 
	deleteDC(il_BKDC)
	il_BKDC= - 1
end if
end subroutine

private subroutine of_drawbmpbk (long hdc, tagrect ast_rect);
long ll_rgb
int li_cbwidth,li_cbHeight,li_W
li_cbwidth = ast_rect.right - ast_rect.left
li_cbHeight = ast_rect.bottom - ast_rect.top
BitBlt(HDC, 0, 0,li_cbwidth,li_cbHeight, il_BKDC,0, 0, SrcCopy)	
end subroutine

public subroutine of_gradientfill (long hdc, tagrect rect, long ai_colorfrom, long ai_colorto, integer ai_style);int li_height, li_width, li, li_steps,li_halfwidth
int li_left, li_right,li_top,li_bottom
ulong hBrush, hOldBrush
int r1,r2,g1,g2,b1,b2,vr,vg,vb

CHOOSE CASE ai_style
	CASE STYLE_HGRADIENT
		li_steps = rect.Right - Rect.left
		li_width = 1
		of_color2rgb(ai_colorfrom,r1,g1,b1)
		of_color2rgb(ai_colorto,r2,g2,b2)
		vr = abs(r1 - r2) / li_steps
		vg = abs(g1 - g2) / li_steps
		vb = abs(b1 - b2) / li_steps
		IF r2<r1 THEN vr = vr * -1
		IF g2<g1 THEN vg = vg * -1
		IF b2<b1 THEN vb = vb * -1
		SetBkMode(hdc,TRANSPARENT)
		li_left = rect.left
		li_right = rect.right
		FOR li = 1 TO li_steps +1
			r2	=	r1 + vr * li
			g2 =	g1 + vg * li
			b2 =	b1 + vb * li
			rect.left = li_left + (li - 1) *li_width
			rect.right = rect.left + li_width
			hBrush = CreateSolidBrush(RGB( r2, g2, b2))
			FillRect(hdc,rect,hBrush)				
			DeleteObject(hBrush)
		NEXT
   Case STYLE_VGRADIENT
		li_steps = rect.bottom - rect.top
		li_width = 1
      of_color2rgb(ai_colorfrom,r1,g1,b1)
		of_color2rgb(ai_colorto,r2,g2,b2)
   	vr = abs(r1 - r2) / li_steps
		vg = abs(g1 - g2) / li_steps
		vb = abs(b1 - b2) / li_steps
		IF r2<r1 THEN vr = vr * -1
		IF g2<g1 THEN vg = vg * -1
		IF b2<b1 THEN vb = vb * -1
		SetBkMode(hdc,TRANSPARENT)
		li_left = rect.top
		li_right = rect.bottom
		FOR li = 1 TO li_steps +1
			r2	=	r1 + vr * li
			g2 =	g1 + vg * li
			b2 =	b1 + vb * li 
			rect.top = li_left + (li - 1) * li_width
			rect.bottom = rect.top + li_width
      	hBrush = CreateSolidBrush(RGB( r2, g2, b2))
			FillRect(hdc,rect,hBrush)				
			DeleteObject(hBrush)
		NEXT
	Case 	STYLE_VEDGEGRADIENT
		tagrect rect2
		rect2=rect
		li_steps = (rect.bottom - rect.top) /2
		li_halfwidth= (rect.bottom - rect.top) /2
		li_top= rect.top
		li_bottom = rect.bottom
		rect.bottom = li_halfwidth + rect.top
		rect2.top=rect2.bottom - li_halfwidth
		li_width = 1
   	of_color2rgb(ai_colorto,r1,g1,b1)
		of_color2rgb(ai_colorfrom,r2,g2,b2)
		vr = abs(r1 - r2) / li_steps
		vg = abs(g1 - g2) / li_steps
		vb = abs(b1 - b2) / li_steps
		IF r2<r1 THEN vr = vr * -1
		IF g2<g1 THEN vg = vg * -1
		IF b2<b1 THEN vb = vb * -1
		SetBkMode(hdc,TRANSPARENT)
		FOR li = 1 TO li_steps 
			r2	=	r1 + vr * li
			g2 =	g1 + vg * li
			b2 =	b1 + vb * li
			rect.top = li_top + (li - 1) * li_width
			rect.bottom = rect.top + li_width
			rect2.top = li_bottom - (li - 1) * li_width
			rect2.bottom = rect.bottom - li_width
			hBrush = CreateSolidBrush(RGB( r2, g2, b2))
			FillRect(hdc,rect,hBrush)				
   		FillRect(hdc,rect2,hBrush)
			DeleteObject(hBrush)
		NEXT
	CASE STYLE_VHEADERGRADIENT
		li_steps = (rect.bottom - rect.top) /2
      li_halfwidth= (rect.bottom - rect.top) /2
		li_left = rect.top
		li_right = rect.bottom
		rect.bottom = li_halfwidth + rect.top
		rect2.top=rect2.bottom - li_halfwidth
		li_width = 1
		of_color2rgb(ai_colorto,r1,g1,b1)
		of_color2rgb(ai_colorfrom,r2,g2,b2)
		vr = abs(r1 - r2) / li_steps
		vg = abs(g1 - g2) / li_steps
		vb = abs(b1 - b2) / li_steps
		IF r2<r1 THEN vr = vr * -1
		IF g2<g1 THEN vg = vg * -1
		IF b2<b1 THEN vb = vb * -1
		SetBkMode(hdc,TRANSPARENT)
		FOR li = 1 TO li_steps
	 		r2	=	r1 + vr * li
	 		g2 =	g1 + vg * li
	 		b2 =	b1 + vb * li
	 		rect.top = li_left + (li - 1) * li_width
	 		rect.bottom = rect.top + li_width
			hBrush = CreateSolidBrush(RGB( r2, g2, b2))
			FillRect(hdc,rect,hBrush)				
			DeleteObject(hBrush)
		NEXT
		rect.top = li_left + (li - 1) * li_width
		rect.bottom = li_right
		hBrush = CreateSolidBrush(RGB( r2, g2, b2))
		FillRect(hdc,rect,hBrush)
		DeleteObject(hBrush)
	CASE ELSE
		hBrush = CreateSolidBrush(ColorFrom)
		FillRect(hdc,rect,hBrush)
		DeleteObject(hBrush)
END CHOOSE
end subroutine

public subroutine of_color2rgb (long lg_color, ref integer r, ref integer g, ref integer b);
b	=	lg_color	/	65536
g	=	(lg_color - b	*	65536)	/	256
r	=	lg_color - g * 256 - b * 65536
end subroutine

private function integer of_loadbkbmp ();ulong ll_bmp,ll_new
integer	li_return = -1

ii_BKW = UnitsToPixels ( width, XUnitsToPixels!)
ii_BKH = UnitsToPixels ( height, YUnitsToPixels!)

il_BKDC = CreateCompatibleDC(il_hdc)

choose case style
	case 7, 8, 9
		String ls_loadlib
		long ll_lib
		ls_loadlib ="ButtonSkin.dll"
		ll_Lib = LoadLibrary(ls_loadlib)
		if ll_Lib>0 then
			ll_bmp =  LoadBitmap ( ll_Lib , ResBMP)
			FreeLibrary ( ll_Lib )

			li_return = 1

		end if
		SelectObject(il_BKDC,ll_bmp);
		Deleteobject(ll_bmp)
end choose

if li_return < 0 then
	ll_bmp = CreateCompatibleBitmap(il_hdc, ii_BKW, ii_BKH);
	SelectObject(il_BKDC,ll_bmp)
	of_GradientFill(il_BKDC,WinRect,ColorFrom,ColorTo, GradientType)
	Deleteobject(ll_bmp)
end if

return li_return
end function

protected subroutine of_drawborder_xp ();int li_width,li_Height
int li_y,li_x,li_drawH,li_drawW
li_width =Winrect.Right - winRect.Left
li_Height = Winrect.Bottom - winRect.Top
int li_xoffset = 0
if not this.default then 
	li_xoffset = 0
else
	li_xoffset = OFFSETWIDHT*4
end if


if ib_pushDown then
	li_xoffset = OFFSETWIDHT
elseif ib_Captured then
   li_xoffset = OFFSETWIDHT*3
end if

if not enabled then 
	li_xoffset = OFFSETWIDHT*2
end if



BitBlt(il_hdc, 0, 0,MINLENGTH,MINLENGTH, il_BKDC,li_xoffset, 0, SrcCopy)

BitBlt(il_hdc, 0, li_Height - MINLENGTH,MINLENGTH,MINLENGTH, il_BKDC,li_xoffset, BMPBKHEIGHT - MINLENGTH, SrcCopy)

li_y=MINLENGTH
if li_Height>2*MINLENGTH then
   StretchBlt(il_hdc,0, MINLENGTH,MINLENGTH,li_Height - 2*MINLENGTH, il_BKDC,li_xoffset ,  MINLENGTH,MINLENGTH , BMPBKHEIGHT - 2*MINLENGTH,SrcCopy)

end if
li_x = MINLENGTH
li_drawW = Min(li_Width - 2*MINLENGTH,OFFSETWIDHT - 2*MINLENGTH)
DO UNTIL li_x>=li_Width - MINLENGTH
	if li_Height>BMPBKHEIGHT then
		StretchBlt(il_hdc, li_x,MINLENGTH,li_drawW,li_Height - 2*MINLENGTH, il_BKDC,li_xoffset+MINLENGTH,MINLENGTH, li_drawW, BMPBKHEIGHT - 2*MINLENGTH,SrcCopy)
   else
		BitBlt(il_hdc, li_x,MINLENGTH,li_drawW,li_Height - 2*MINLENGTH, il_BKDC,li_xoffset+MINLENGTH,MINLENGTH,SrcCopy)
   end if
	li_x= li_x + li_drawW
LOOP

li_x = MINLENGTH
li_drawW = Min(li_Width - 2*MINLENGTH,OFFSETWIDHT - 2*MINLENGTH)
DO UNTIL li_x>=li_Width - MINLENGTH
	BitBlt(il_hdc,li_x,0,li_drawW,MINLENGTH, il_BKDC,li_xoffset+MINLENGTH,0, SrcCopy)
	BitBlt(il_hdc,li_x,li_Height - MINLENGTH,li_drawW,MINLENGTH, il_BKDC,li_xoffset+MINLENGTH,BMPBKHEIGHT - MINLENGTH, SrcCopy)
	li_x= li_x + li_drawW
LOOP

if li_Height>2*MINLENGTH then
	li_y = MINLENGTH

	StretchBlt(il_hdc, li_Width - MINLENGTH, li_y,MINLENGTH,li_Height - 2*MINLENGTH, il_BKDC,li_xoffset+OFFSETWIDHT -MINLENGTH,  MINLENGTH,MINLENGTH, BMPBKHEIGHT - 2*MINLENGTH,SrcCopy)

end if

BitBlt(il_hdc, li_Width - MINLENGTH, 0,MINLENGTH,MINLENGTH, il_BKDC,li_xoffset+OFFSETWIDHT -MINLENGTH, 0, SrcCopy)

BitBlt(il_hdc, li_Width - MINLENGTH, li_Height - MINLENGTH,MINLENGTH,MINLENGTH, il_BKDC,li_xoffset+OFFSETWIDHT -MINLENGTH, BMPBKHEIGHT - MINLENGTH, SrcCopy)




end subroutine

protected function integer of_drawfocus ();if getfocus()=this and HaveFocus then 
	tagrect FocusRect

	FocusRect.left  = winRect.left +3
   FocusRect.top = winRect.top +3
   FocusRect.right = winRect.right -3
	FocusRect.bottom = winRect.bottom -3
	
	DrawFocusRect(il_hdc,FocusRect)
end if

return 1
end function

protected subroutine of_drawtext (unsignedlong al_hdc, string as_text, tagrect ast_rect, boolean ab_enabled);//-------------------------------------------------------*	
//	FUNCTION:		of_drawtext										*
//	Description:														*
//-------------------------------------------------------*
//	Parameters:		ulong		al_hdc									*
//						string	as_text								*
//						tagrect		ast_rect								*
//						boolean	ab_enabled							*
//-------------------------------------------------------*
//	Author(s)		Date			Remark							*
//	Rain				2003.03.10										*
//-------------------------------------------------------*

SetBkMode(al_hdc,TRANSPARENT)

long		ll_hFont,ll_OldFont,ll_oldFcolor

ll_hFont = Send(il_hwnd, WM_GETFONT, 0, 0)

ll_oldFont = SelectObject(il_Hdc, ll_hFont)
if  ib_captured then
	ll_oldFcolor = SetTextColor(il_hdc,COLOR_WINDOWTEXT)
else
	if this.Enabled THEN
		ll_oldFcolor = SetTextColor(il_hdc,COLOR_WINDOWTEXT)
	else
//		no
	end if
end if

IF	ab_enabled	THEN


	DrawText(al_hdc,as_text,-1,ast_rect,DT_CENTER+DT_VCENTER+DT_SINGLELINE)

ELSE
	SetTextColor( al_hdc , GetSysColor( COLOR_BTNHIGHLIGHT))
	ast_rect.Left = ast_rect.Left + 2
	ast_rect.Top = ast_rect.Top  + 2
	DrawText( al_hdc , as_text , -1 , ast_rect, DT_CENTER+DT_VCENTER+DT_SINGLELINE)

	SetTextColor( al_hdc,GetSysColor( COLOR_BTNSHADOW ) )
	ast_rect.Left = ast_rect.Left -2
	ast_rect.Top = ast_rect.Top  -2
	DrawText( al_hdc , as_text , -1, ast_rect , DT_CENTER+DT_VCENTER+DT_SINGLELINE)


END IF
end subroutine

public subroutine of_init_draw ();

ii_picsize = of_getpicsize()
if normalPicName<>"" then
	h_normalPic = of_geticonhandle(normalPicName,ii_picsize)
else
	h_normalPic = 0
end if

if mMovePicName<>"" then
	h_MovePic = of_geticonhandle(mMovePicName,ii_picsize)
else
	h_MovePic = 0
end if

of_loadbkbmp()

of_paint()
end subroutine

protected function integer of_repaint (tagrect picrect, ref tagrect textrect, ref long hdc, ref integer li_x, ref integer li_y);		if PIC_Align = alignatleft! then
			li_y = (picRect.bottom - picRect.top - ii_picsize) /2
			li_x = li_y
		elseif  PIC_Align = alignatright! then
			li_y = (picRect.bottom - picRect.top - ii_picsize) /2
			li_x = picRect.left - li_y 	
		elseif PIC_Align = alignattop! then
			li_x = (picRect.right - picRect.left - ii_picsize) /2	
			li_y = li_x 
		elseif PIC_Align = alignatbottom! then
			li_x = (picRect.right - picRect.left - ii_picsize) /2	
			li_y = picRect.Top - li_x 	
		end if	
		
		if ib_pushDown then
			li_y ++
			li_x ++
			offsetRect(textRect,1,1)
		end if	

choose case style
	case 7, 8, 9
	case else
		of_drawbmpbk(hdc,winRect)
end choose

return 1
end function

private subroutine of_showtip (dragobject controlobject);MSG Msg
Msg.hWnd = Handle(ControlObject)
Msg.Message	= 512	// WM_MOUSEMOVE
Msg.WParam = Message.WordParm
Msg.Lparam = Message.LongParm

RelayMsg(hWndTT,TTM_RELAYEVENT,0,Msg)
end subroutine

private function integer of_controlregister (dragobject controlobject, string tip, integer flag);if hWndTT<=0 then
	if  TIPSTYLE = STYLE_BALLOONTIP then 
		hWndTT = CreateWindowExA(WS_EX_TOPMOST,TOOLTIPS_CLASS,0, TTF_CENTERTIP + TTS_BALLOON + 2, &
         	CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,  &
         	0, 0, Handle(GetApplication()),0)
	else
		HWndTT = CreateWindowExA(WS_EX_TOPMOST, TOOLTIPS_CLASS,0,TTF_CENTERTIP, &
				CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,  &
				0, 0, Handle(GetApplication()),0)
	end if
end if




TOOLINFO ToolInfo

ToolInfo.cbSize = 40
ToolInfo.uFlags = Flag 
ToolInfo.hWnd = Handle(ControlObject)
ToolInfo.hInstance = 0
ToolInfo.uID = ToolID
ToolID++
ToolInfo.lpszText = LocalAlloc(0,80)

POST LocalFree(ToolInfo.lpszText)

lStrCpy(ToolInfo.lpszText,Left(tip,80))

tagrect lrect

lrect.Left = 0
lrect.top = 0
lrect.right = UnitsToPixels(ControlObject.Width,XUnitsToPixels!)
lrect.bottom = UnitsToPixels(ControlObject.Height,YUnitsToPixels!)

ToolInfo.Rect = lrect

If ToolTipMsg(hWndTT,TTM_ADDTOOL, 1, ToolInfo) = 0 Then
	Return(-1)
End If
Return(ToolID - 1)
end function

public subroutine of_init ();

GradientType = 1

GetClientRect(handle(this),winRect) 
choose case style
	case 0
		ColorFrom = RGB(255,255,255)
		ColorTo = RGB(179,213,243)
	case 1
		ColorFrom = RGB(255,255,255)
		ColorTo = RGB(179,213,243)
		GradientType = 2
	case 2
		ColorFrom = 16777215
		ColorTo = 8882055
	case 3
		ColorFrom = 13554646
		ColorTo = 13554646
	case 4
		ColorFrom = 13554646
		ColorTo = 13554646
	case 5
		ColorFrom = 16777215
		ColorTo = 12500640
	case 6
		ColorFrom = RGB(255,255,255)
		ColorTo = RGB(179,213,243)
		GradientType = 1
	case 7
		ResBMP = "RESOURCE_XP_Corona"
		BMPBKHEIGHT = 36
		OFFSETWIDHT = 90
		MINLENGTH =5

		if of_loadbkbmp() < 0 then
			style = 0
		end if
	case 8
		ResBMP = "RESOURCE_XP_Platinum"
		BMPBKHEIGHT = 23
		OFFSETWIDHT = 75
		MINLENGTH =5

		if of_loadbkbmp() < 0 then
			style = 0
		end if
	case 9
		ResBMP = "RESOURCE_XP_blue"
		BMPBKHEIGHT = 23
		OFFSETWIDHT = 59
		MINLENGTH =5

		if of_loadbkbmp() < 0 then
			style = 0
		end if
	case else
		ColorFrom = RGB(255,255,255)
		ColorTo = RGB(179,213,243)
end choose

ColorStart = ColorFrom
ColorEnd   = ColorTo
end subroutine

event constructor;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*


constant long BS_OWNERDRAW = 11
constant long GWL_STYLE = -16
constant long BS_PUSHBUTTON = 0

il_hwnd = handle(this)
il_hdc = GetDC(il_hwnd)

InitCommonControls()


long nStyle
nStyle = GetWindowuLong(il_hwnd, GWL_STYLE)
nStyle = nStyle + BS_OWNERDRAW 
SetWindowuLong(il_hwnd, GWL_STYLE, nStyle)

of_init()


end event

on uo_coolbutton.create
end on

on uo_coolbutton.destroy
end on

event destructor;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

of_destroyRC()  
ReleaseDC(il_hwnd, il_hdc)
DestroyWindow(hWndTT)
end event

event getfocus;//----------------------------------------------------------------*
//	Author(s):	         Omar Parra											*
//	Date 		:	         22/10/2006											*
//	Email		:	         oparra1963@hotmail.com							*
//----------------------------------------------------------------*

post of_paint()
end event

