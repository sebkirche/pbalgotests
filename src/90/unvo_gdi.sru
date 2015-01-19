$PBExportHeader$unvo_gdi.sru
forward
global type unvo_gdi from nonvisualobject
end type
type st_size from structure within unvo_gdi
end type
type st_rect from structure within unvo_gdi
end type
type st_bitmap from structure within unvo_gdi
end type
end forward

type st_size from structure
	long		cx
	long		cy
end type

type st_rect from structure
	Long left
	Long top
	Long right
	Long bottom
end type

type st_bitmap from structure
	long bmType
	long bmWidth
	long bmHeight
	long bmWidthBytes
	int  bmPlanes
	int  bmBitsPixel
	long bmBits
end type

global type unvo_gdi from nonvisualobject autoinstantiate
end type

type prototypes
Subroutine OutputDebugString (String lpszOutputString)  LIBRARY "kernel32.dll" ALIAS FOR "OutputDebugStringW";

subroutine RtlMoveMemory(ref any Dest, long Source, long Length) library "kernel32.dll"
Function Long SetTimer(Long hwnd, long idTimer, Long uTimeOut, Long tmprc) Library "user32.dll"
Function Long KillTimer(Long hwnd, Long idEvent) Library "user32.dll" 

Function ULong GetDC(ULong hWnd) Library "User32.DLL"
Function ULong ReleaseDC(ULong hWnd, ULong hDC) Library "User32.DLL"
Function Ulong CreateCompatibleDC (Ulong hDC) Library "gdi32.dll"
Function Ulong DeleteDC (Ulong hDC) Library "gdi32"
//FUNCTION ulong GetObject(ulong hgdiobj, int cbBuffer, ref any dest) library "gdi32.dll" alias for "GetObjectW"
FUNCTION ulong GetObject(ulong hgdiobj, int cbBuffer, ref st_bitmap dest) library "gdi32.dll" alias for "GetObjectW"

Function Ulong SelectObject (Ulong hDC, Ulong hObject) Library "gdi32.dll"
FUNCTION ulong DeleteObject(ulong hObject) LIBRARY "gdi32.dll"     
Function ULONG GetDlgCtrlID(Ulong hwndCtl) Library "User32.DLL"
function ULONG GetWindowRect(ULong hWnd, ref st_rect lpRect) Library "User32.DLL"
Function ULong InvalidateRect(ULong hWnd, ref st_rect lpRect, boolean bErase) Library "User32.DLL"
Function ULong BitBlt(ulong hDestDC, ulong x_left, ulong y_top, ulong nWidth, ulong nHeight, ulong hSrcDC, ulong xSrc, ulong ySrc, ulong dwRop) Library "gdi32.dll"
function ulong GdiTransparentBlt(ulong hDC, long xPos, long yPos, ulong nWidth, ulong nHeight, ulong hSrcDC, long xSrc, long ySrc, ulong nSrcWidth, ulong nSrcHeight, ulong crTransparent) library "gdi32.dll"
function ulong GetPixel(ulong hDC, long x, long y) library "gdi32.dll"

Function ULong LoadImage(Ulong hinst, String lpszName, UInt uType, int cxDesired, int cyDesired, UInt fuLoad) Library "User32.DLL" alias for "LoadImageW"
function ulong CreateBitmap(int nWidth, int nHeight, uint cPlanes, uint cBpp, ulong lpbits) library "gdi32.dll"
FUNCTION ulong GetObjectBitmap(ulong hgdiobj, int cbBuffer, ref st_bitmap bm) library "gdi32.dll" alias for "GetObjectW"
Function Boolean DrawIconEx(Ulong DC, int xLeft, int yTop, ULong Icon, int cxWidth, int cyWidth, UINT istepIfAniCur, ULong hbrFlickerFreeDraw, UINT diFlags) Library "User32.DLL"
Function Boolean DestroyIcon(ULong hIcon) Library "User32.DLL"

function long SetBkColor(ulong hDc, ulong crColor) library "gdi32.dll"
function long SetTextColor(ulong hDc, ulong crColor) library "gdi32.dll"


/*
Function ULong GetMenu(ULong hWnd) Library "User32.DLL"
Function ULong GetSubMenu(ULong hMenu, int nPos) Library "User32.DLL"
Function UINT GetMenuItemID(Ulong hMenu, int nPos) Library "User32.dll"
*/
FUNCTION  ulong GetSysColor(long index) LIBRARY "user32.dll";
FUNCTION long GetSystemMetrics (long value) LIBRARY "user32.dll" ALIAS FOR "GetSystemMetrics;ansi";
Function Boolean GetTextExtentpoint32(ULong hdc, string lpString, int cbString, ref ST_SIZE lpSize) library "gdi32.dll" alias for "GetTextExtentPoint32W"
Function ulong CreateFont(long nHeight,ulong nWidth,ulong nEscapement,ulong nOrientation,ulong fnWeight,boolean fdwItalic,boolean fdwUnderline,boolean fdwStrikeOut,ulong fdwCharSet,ulong fdwOutputPrecision,ulong fdwClipPrecision,ulong fdwQuality,ulong dwPitchAndFamily,ref string lpszFace) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontW"  
Function ulong GetDeviceCaps(ulong hdc,ulong nIndex) library "gdi32.dll"

function long MulDiv(long nNumber, long nNumerator, int nDenominator) library "kernel32.dll"

function long GetDesktopWindow( ) library "user32.dll"

function BOOLean SystemParametersInfoRect( UINT uiAction, UINT uiParam, ref st_rect pvParam, UINT fWinIni) library "user32.dll" alias for "SystemParametersInfoW"


end prototypes

type variables
//font weights
constant integer FW_DONTCARE   = 0
constant integer FW_THIN       = 100
constant integer FW_EXTRALIGHT = 200
constant integer FW_ULTRALIGHT = 200
constant integer FW_LIGHT      = 300
constant integer FW_NORMAL     = 400
constant integer FW_REGULAR    = 400
constant integer FW_MEDIUM     = 500
constant integer FW_SEMIBOLD   = 600
constant integer FW_DEMIBOLD   = 600
constant integer FW_BOLD       = 700
constant integer FW_EXTRABOLD  = 800
constant integer FW_ULTRABOLD  = 800
constant integer FW_HEAVY      = 900
constant integer FW_BLACK      = 900


//charsets
//             Charset Name   Charset Value(hex)     Codepage number
constant ulong DEFAULT_CHARSET     = 1   //(x01)
constant ulong SYMBOL_CHARSET      = 2   //(x02)
constant ulong OEM_CHARSET         = 255 //(xFF)
constant ulong ANSI_CHARSET        = 0   //(x00)            1252
constant ulong RUSSIAN_CHARSET     = 204 //(xCC)            1251
constant ulong EE_CHARSET          = 238 //(xEE)            1250
constant ulong GREEK_CHARSET       = 161 //(xA1)            1253
constant ulong TURKISH_CHARSET     = 162 //(xA2)            1254
constant ulong BALTIC_CHARSET      = 186 //(xBA)            1257
constant ulong SHIFTJIS_CHARSET    = 128 //(x80)             932
constant ulong HANGEUL_CHARSET     = 129 //(x81)             949
constant ulong GB2313_CHARSET      = 134 //(x86)             936
constant ulong CHINESEBIG5_CHARSET = 136 //(x88)             950
//Middle East language edition of Windows:
constant ulong HEBREW_CHARSET      = 177 //(xB1)            1255
constant ulong ARABIC_CHARSET     = 178 //(xB2)            1256
/*
other charsets, but I do not have the values yet
EASTEUROPE_CHARSET
MAC_CHARSET
SHIFTJIS_CHARSET
VIETNAMESE_CHARSET
Korean language edition of Windows: 
    JOHAB_CHARSET
Thai language edition of Windows:
    THAI_CHARSET 
*/

//sizes of strucst
constant uint SIZEOF_BITMAP = 28

//image types for LoadImage()
constant ulong IMAGE_BITMAP = 0
constant ulong IMAGE_ICON   = 1
constant ulong IMAGE_CURSOR = 2
//Some loading types for LoadImage()
constant ulong LR_DEFAULTCOLOR    = 0
constant ulong LR_MONOCHROME      = 1
constant ulong LR_LOADFROMFILE    = 16
constant ulong LR_LOADTRANSPARENT = 32
constant ulong LR_DEFAULTSIZE     = 64
constant ulong LR_LOADMAP3DCOLORS = 4096
constant ulong LR_SHARED          = 32768

//operations for BitBlt
constant ulong NOTSRCCOPY     = 3342344		//Copies the inverted source rectangle to the destination.
constant ulong NOTSRCERASE    = 1114278		//Combines the colors of the source and destination rectangles by using the Boolean OR operator and then inverts the resultant color.
constant ulong SRCAND         = 8913094		//Combines the colors of the source and destination rectangles by using the Boolean AND operator.
constant ulong SRCCOPY        = 13369376		//Copies the source rectangle directly to the destination rectangle.
constant ulong SRCPAINT       = 15597702		//Combines the colors of the source and destination rectangles by using the Boolean OR operator.
constant ulong SRCERASE       = 4457256		//Combines the inverted colors of the destination rectangle with the colors of the source rectangle by using the Boolean AND operator.
constant ulong SRCINVERT      = 6684742		//Combines the colors of the source and destination rectangles by using the Boolean XOR operator.
constant ulong BLACKNESS      = 66				//Fills the destination rectangle using the color associated with index 0 in the physical palette. (This color is black for the default physical palette.)
constant ulong WHITENESS      = 16711778		//Fills the destination rectangle using the color associated with index 1 in the physical palette. (This color is white for the default physical palette.)
constant ulong CAPTUREBLT     = 1073741824	//98/ME/2000/XP: Includes any windows that are layered on top of your window in the resulting image. By default, the image only contains your window. Note that this generally cannot be used for printing device contexts.
constant ulong DSTINVERT      = 5570569		//Inverts the destination rectangle.
constant ulong MERGECOPY      = 12583114		//Merges the colors of the source rectangle with the brush currently selected in hdcDest, by using the Boolean AND operator.
constant ulong MERGEPAINT     = 12255782		//Merges the colors of the inverted source rectangle with the colors of the destination rectangle by using the Boolean OR operator.
constant ulong NOMIRRORBITMAP = 2147483648	//98/ME/2000/XP: Prevents the bitmap from being mirrored.
constant ulong PATCOPY        = 15728673		//Copies the brush currently selected in hdcDest, into the destination bitmap.
constant ulong PATINVERT      = 5898313		//Combines the colors of the brush currently selected in hdcDest, with the colors of the destination rectangle by using the Boolean XOR operator.
constant ulong PATPAINT       = 16452105		//Combines the colors of the brush currently selected in hdcDest, with the colors of the inverted source rectangle by using the Boolean OR operator. The result of this operation is combined with the colors of the destination rectangle by using the Boolean OR operator.

//color constants
//For other possibilities (up to id = 30 ): http://msdn.microsoft.com/en-us/library/ms724371(VS.85).aspx
constant ulong COLOR_SCROLLBAR = 0    //Scroll-bar gray area
constant ulong COLOR_BACKGROUND        = 1    //Desktop
constant ulong COLOR_ACTIVECAPTION     = 2    //Active window caption
constant ulong COLOR_INACTIVECAPTION   = 3    //Inactive window caption
constant ulong COLOR_MENU              = 4    //Menu background
constant ulong COLOR_WINDOW            = 5    //Window background
constant ulong COLOR_WINDOWFRAME       = 6    //Window frame
constant ulong COLOR_MENUTEXT          = 7    //Text in menus
constant ulong COLOR_WINDOWTEXT        = 8    //Text in windows
constant ulong COLOR_CAPTIONTEXT       = 9    //Text in caption, size box, scroll bar arrow box
constant ulong COLOR_ACTIVEBORDER      = 10   //Active window border
constant ulong COLOR_INACTIVEBORDER    = 11   //Inactive window border
constant ulong COLOR_APPWORKSPACE      = 12   //Background color of multiple document interface (MDI) applications
constant ulong COLOR_HIGHLIGHT         = 13   //Items selected item in a control
constant ulong COLOR_HIGHLIGHTTEXT     = 14   //Text of item selected in a control
constant ulong COLOR_BTNFACE           = 15   //Face shading on push button
constant ulong COLOR_BTNSHADOW         = 16   //Edge shading on push button
constant ulong COLOR_GRAYTEXT          = 17   //Grayed (disabled) text. This color is set to 0 if the current display driver does not support a solid gray color.
constant ulong COLOR_BTNTEXT           = 18   //Text on push buttons

//other constant
constant long HWND_DESKTOP = 0 //to ask for desktop caps its the handle to give to GetDC

//Constants for GetSystemMetrics
constant ulong SM_CYCAPTION = 4
constant ulong SM_CXBORDER = 5
constant ulong SM_CYBORDER = 6
constant ulong SM_CXSIZEFRAME = 32 //The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. -> width of border
constant ulong SM_CYSIZEFRAME = 33 //The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. -> height of border
constant ulong SM_CXEDGE = 45
constant ulong SM_CYEDGE = 46
constant ulong SM_CYMENUCHECK = 72

//constants for GetDeviceCaps
constant ulong HORZSIZE = 4		//Width, in millimeters, of the physical screen.
constant ulong VERTSIZE = 6		//Height, in millimeters, of the physical screen.
constant ulong HORZRES = 8			//Width, in pixels, of the screen; or for printers, the width, in pixels, of the printable area of the page.
constant ulong VERTRES = 10		//Height, in raster lines, of the screen; or for printers, the height, in pixels, of the printable area of the page.
constant ulong LOGPIXELSX = 88	//Number of pixels per logical inch along the screen width.
constant ulong LOGPIXELSY = 90	//Number of pixels per logical inch along the screen height.
//TwipsPerPixelX = 1440& / GetDeviceCaps(lngDC, LOGPIXELSX)
//TwipsPerPixelY = 1440& / GetDeviceCaps(lngDC, LOGPIXELSY)
//constant long DM_BITSPERPEL = &H40000
//constant long DM_PELSWIDTH =  &H80000
//constant long DM_PELSHEIGHT = &H100000

constant ulong SPI_GETWORKAREA = 48

end variables

forward prototypes
public subroutine of_drawtransparentbitmap (unsignedlong aul_hdc, long al_x, long al_y, unsignedlong aul_width, unsignedlong aul_height, unsignedlong aul_hsrc, long al_xsrc, long al_ysrc, unsignedlong aul_widthsrc, unsignedlong aul_heightsrc, unsignedlong aul_color)
public subroutine of_drawtransparentbitmap (unsignedlong aul_hdc, long al_x, long al_y, unsignedlong aul_width, unsignedlong aul_height, unsignedlong aul_hsrc, long al_xsrc, long al_ysrc, unsignedlong aul_widthsrc, unsignedlong aul_heightsrc, unsignedlong aul_xcolor, unsignedlong aul_ycolor)
public subroutine get_screen_rect (ref long al_width, ref long al_height)
public function boolean is_themexpclassic ()
public function string of_getthemename ()
public subroutine of_splitcolors (long al_color, ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function long of_offset_color_light (long al_color, integer ai_offset)
public function long of_offset_color_red (long al_color, integer ai_offset)
public function long of_offset_color_green (long al_color, integer ai_offset)
public function long of_offset_color_blue (long al_color, integer ai_offset)
public subroutine get_screen_rect_pxl (ref long al_width, ref long al_height)
public function long of_gettitlebarheight ()
public function long of_getyborder ()
public function long of_getmenubarheight ()
public subroutine get_work_area (ref long al_x, ref long al_y, ref long al_width, ref long al_height)
public function long of_getstringheight (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic)
public function long of_getstringheightunits (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic)
public function long of_getstringwidth (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic)
public function long of_getstringwidthunits (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic)
public subroutine get_work_area_pxl (ref long al_x, ref long al_y, ref long al_width, ref long al_height)
public function any of_splitcolors (long al_color)
public function long of_inches2pixelsx (decimal adec_inches)
public function long of_inches2pixelsy (decimal adec_inches)
public function long of_cm2pixelsx (decimal adec_cm)
public function long of_cm2pixelsy (decimal adec_cm)
public function long of_getscreendpix ()
public function long of_getscreendpiy ()
public function decimal of_pixels2inchesx (long al_pixels)
public function decimal of_pixels2inchesy (long al_pixels)
public function decimal of_pixels2cmx (long al_pixels)
public function decimal of_pixels2cmy (long al_pixels)
end prototypes

public subroutine of_drawtransparentbitmap (unsignedlong aul_hdc, long al_x, long al_y, unsignedlong aul_width, unsignedlong aul_height, unsignedlong aul_hsrc, long al_xsrc, long al_ysrc, unsignedlong aul_widthsrc, unsignedlong aul_heightsrc, unsignedlong aul_color);// draw a transparent bitmap with the given transparent color
//
// Author : SeKi - 2008

gditransparentblt(aul_hdc,al_x, al_y,aul_width,aul_height,aul_hsrc,al_xsrc,al_ysrc,aul_widthsrc,aul_heightsrc, aul_color)

end subroutine

public subroutine of_drawtransparentbitmap (unsignedlong aul_hdc, long al_x, long al_y, unsignedlong aul_width, unsignedlong aul_height, unsignedlong aul_hsrc, long al_xsrc, long al_ysrc, unsignedlong aul_widthsrc, unsignedlong aul_heightsrc, unsignedlong aul_xcolor, unsignedlong aul_ycolor);// draw a transparent bitmap with the given pixel to get the transparent color
//
// Author : SeKi - 2008

ulong lul_color
lul_color = getpixel(aul_hsrc, aul_xcolor, aul_ycolor)
gditransparentblt(aul_hdc,al_x, al_y,aul_width,aul_height,aul_hsrc,al_xsrc,al_ysrc,aul_widthsrc,aul_heightsrc, lul_color)


end subroutine

public subroutine get_screen_rect (ref long al_width, ref long al_height);st_rect lr_rect
getwindowrect( GetDesktopWindow(), lr_rect )
al_height = PixelsToUnits( lr_rect.bottom, YPixelsToUnits! )
al_width = PixelsToUnits( lr_rect.right, XPixelsToUnits! )

end subroutine

public function boolean is_themexpclassic ();string ls_themeactive

registryget("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ThemeManager", "ThemeActive", ls_themeactive)

return ls_themeactive = "0"

end function

public function string of_getthemename ();
string ls_name

if is_themexpclassic( ) then
	registryget("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ThemeManager", "ColorName", ls_name)
end if

return ls_name

end function

public subroutine of_splitcolors (long al_color, ref integer ai_red, ref integer ai_green, ref integer ai_blue);// Split a color into its components
//
// Author : SeKi - 2009

//color rgb = 65536 * Blue+ 256 * Green+ Red
ai_blue = al_color / 65536
al_color = mod(al_color, 65536)

ai_green = al_color / 256
ai_red = mod(al_color, 256)

end subroutine

public function long of_offset_color_light (long al_color, integer ai_offset);// apply an offset to a color to lighten or darken it
//
// Author : SeKi 2009

int li_red, li_green, li_blue

of_splitcolors( al_color, li_red, li_green, li_blue)

li_red += ai_offset
if li_red < 0 then li_red = 0
if li_red > 255 then li_red = 255

li_green += ai_offset
if li_green < 0 then li_green = 0
if li_green > 255 then li_green = 255

li_blue += ai_offset
if li_blue < 0 then li_blue = 0
if li_blue > 255 then li_blue = 255

return rgb(li_red, li_green, li_blue)

end function

public function long of_offset_color_red (long al_color, integer ai_offset);// apply an offset to a color to lighten or darken it - on the red component
//
// Author : SeKi 2009

int li_red, li_green, li_blue

of_splitcolors( al_color, li_red, li_green, li_blue)

li_red += ai_offset
if li_red < 0 then li_red = 0
if li_red > 255 then li_red = 255

return rgb(li_red, li_green, li_blue)

end function

public function long of_offset_color_green (long al_color, integer ai_offset);// apply an offset to a color to lighten or darken it - on the red component
//
// Author : SeKi 2009

int li_red, li_green, li_blue

of_splitcolors( al_color, li_red, li_green, li_blue)

li_green += ai_offset
if li_green < 0 then li_green = 0
if li_green > 255 then li_green = 255

return rgb(li_red, li_green, li_blue)

end function

public function long of_offset_color_blue (long al_color, integer ai_offset);// apply an offset to a color to lighten or darken it - on the red component
//
// Author : SeKi 2009

int li_red, li_green, li_blue

of_splitcolors( al_color, li_red, li_green, li_blue)

li_blue += ai_offset
if li_blue < 0 then li_blue = 0
if li_blue > 255 then li_blue = 255

return rgb(li_red, li_green, li_blue)

end function

public subroutine get_screen_rect_pxl (ref long al_width, ref long al_height);st_rect lr_rect
getwindowrect( GetDesktopWindow(), lr_rect )
al_height = lr_rect.bottom
al_width = lr_rect.right

end subroutine

public function long of_gettitlebarheight ();long ll_tbHeight = 0
ll_tbHeight = getsystemmetrics( SM_CYCAPTION )
ll_tbHeight = PixelsToUnits(ll_tbHeight, YPixelsToUnits! )
return ll_tbHeight

/** Extract from MSDN :
 *******************
 Value	Meaning
SM_ARRANGE
56
The flags that specify how the system arranged minimized windows. For more information, see the Remarks section in this topic.
SM_CLEANBOOT
67
The value that specifies how the system is started:
0 Normal boot
1 Fail-safe boot
2 Fail-safe with network boot
A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot) bypasses the user startup files.
SM_CMONITORS
80
The number of display monitors on a desktop. For more information, see the Remarks section in this topic.
SM_CMOUSEBUTTONS
43
The number of buttons on a mouse, or zero if no mouse is installed.
SM_CXBORDER
5
The width of a window border, in pixels. This is equivalent to the SM_CXEDGE value for windows with the 3-D look.
SM_CXCURSOR
13
The width of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CXDLGFRAME
7
This value is the same as SM_CXFIXEDFRAME.
SM_CXDOUBLECLK
36
The width of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle that is defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the width of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
SM_CXDRAG
68
The number of pixels on either side of a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from the left of the mouse-down point and added to the right of it.
SM_CXEDGE
45
The width of a 3-D border, in pixels. This metric is the 3-D counterpart of SM_CXBORDER.
SM_CXFIXEDFRAME
7
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CXDLGFRAME.
SM_CXFOCUSBORDER
83
The width of the left and right edges of the focus rectangle that the DrawFocusRect draws. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CXFRAME
32
This value is the same as SM_CXSIZEFRAME.
SM_CXFULLSCREEN
16
The width of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen that is not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CXHSCROLL
21
The width of the arrow bitmap on a horizontal scroll bar, in pixels.
SM_CXHTHUMB
10
The width of the thumb box in a horizontal scroll bar, in pixels.
SM_CXICON
11
The default width of an icon, in pixels. The LoadIcon function can load only icons with the dimensions that SM_CXICON and SM_CYICON specifies.
SM_CXICONSPACING
38
The width of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CXICON.
SM_CXMAXIMIZED
61
The default width, in pixels, of a maximized top-level window on the primary display monitor.
SM_CXMAXTRACK
59
The default maximum width of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXMENUCHECK
71
The width of the default menu check-mark bitmap, in pixels.
SM_CXMENUSIZE
54
The width of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CXMIN
28
The minimum width of a window, in pixels.
SM_CXMINIMIZED
57
The width of a minimized window, in pixels.
SM_CXMINSPACING
47
The width of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CXMINIMIZED.
SM_CXMINTRACK
34
The minimum tracking width of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXPADDEDBORDER
92
The amount of border padding for captioned windows, in pixels.
Windows XP/2000:  This value is not supported.
SM_CXSCREEN
0
The width of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, HORZRES).
SM_CXSIZE
30
The width of a button in a window caption or title bar, in pixels.
SM_CXSIZEFRAME
32
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CXFRAME.
SM_CXSMICON
49
The recommended width of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CXSMSIZE
52
The width of small caption buttons, in pixels.
SM_CXVIRTUALSCREEN
78
The width of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_XVIRTUALSCREEN metric is the coordinates for the left side of the virtual screen.
SM_CXVSCROLL
2
The width of a vertical scroll bar, in pixels.
SM_CYBORDER
6
The height of a window border, in pixels. This is equivalent to the SM_CYEDGE value for windows with the 3-D look.
SM_CYCAPTION
4
The height of a caption area, in pixels.
SM_CYCURSOR
14
The height of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CYDLGFRAME
8
This value is the same as SM_CYFIXEDFRAME.
SM_CYDOUBLECLK
37
The height of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the height of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKHEIGHT.
SM_CYDRAG
69
The number of pixels above and below a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from above the mouse-down point and added below it.
SM_CYEDGE
46
The height of a 3-D border, in pixels. This is the 3-D counterpart of SM_CYBORDER.
SM_CYFIXEDFRAME
8
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CYDLGFRAME.
SM_CYFOCUSBORDER
84
The height of the top and bottom edges of the focus rectangle drawn by DrawFocusRect. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CYFRAME
33
This value is the same as SM_CYSIZEFRAME.
SM_CYFULLSCREEN
17
The height of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CYHSCROLL
3
The height of a horizontal scroll bar, in pixels.
SM_CYICON
12
The default height of an icon, in pixels. The LoadIcon function can load only icons with the dimensions SM_CXICON and SM_CYICON.
SM_CYICONSPACING
39
The height of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CYICON.
SM_CYKANJIWINDOW
18
For double byte character set versions of the system, this is the height of the Kanji window at the bottom of the screen, in pixels.
SM_CYMAXIMIZED
62
The default height, in pixels, of a maximized top-level window on the primary display monitor.
SM_CYMAXTRACK
60
The default maximum height of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYMENU
15
The height of a single-line menu bar, in pixels.
SM_CYMENUCHECK
72
The height of the default menu check-mark bitmap, in pixels.
SM_CYMENUSIZE
55
The height of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CYMIN
29
The minimum height of a window, in pixels.
SM_CYMINIMIZED
58
The height of a minimized window, in pixels.
SM_CYMINSPACING
48
The height of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CYMINIMIZED.
SM_CYMINTRACK
35
The minimum tracking height of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYSCREEN
1
The height of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, VERTRES).
SM_CYSIZE
31
The height of a button in a window caption or title bar, in pixels.
SM_CYSIZEFRAME
33
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CYFRAME.
SM_CYSMCAPTION
51
The height of a small caption, in pixels.
SM_CYSMICON
50
The recommended height of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CYSMSIZE
53
The height of small caption buttons, in pixels.
SM_CYVIRTUALSCREEN
79
The height of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
SM_CYVSCROLL
20
The height of the arrow bitmap on a vertical scroll bar, in pixels.
SM_CYVTHUMB
9
The height of the thumb box in a vertical scroll bar, in pixels.
SM_DBCSENABLED
42
Nonzero if User32.dll supports DBCS; otherwise, 0.
SM_DEBUG
22
Nonzero if the debug version of User.exe is installed; otherwise, 0.
SM_DIGITIZER
94
Nonzero if the current operating system is Windows 7 or Windows Server 2008 R2 and the Tablet PC Input service is started; otherwise, 0. The return value is a bit mask that specifies the type of digitizer input supported by the device. For more information, see Remarks.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_IMMENABLED
82
Nonzero if Input Method Manager/Input Method Editor features are enabled; otherwise, 0.
SM_IMMENABLED indicates whether the system is ready to use a Unicode-based IME on a Unicode application. To ensure that a language-dependent IME works, check SM_DBCSENABLED and the system ANSI code page. Otherwise the ANSI-to-Unicode conversion may not be performed correctly, or some components like fonts or registry settings may not be present.
SM_MAXIMUMTOUCHES
95
Nonzero if there are digitizers in the system; otherwise, 0.
SM_MAXIMUMTOUCHES returns the aggregate maximum of the maximum number of contacts supported by every digitizer in the system. If the system has only single-touch digitizers, the return value is 1. If the system has multi-touch digitizers, the return value is the number of simultaneous contacts the hardware can provide.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_MEDIACENTER
87
Nonzero if the current operating system is the Windows XP, Media Center Edition, 0 if not.
SM_MENUDROPALIGNMENT
40
Nonzero if drop-down menus are right-aligned with the corresponding menu-bar item; 0 if the menus are left-aligned.
SM_MIDEASTENABLED
74
Nonzero if the system is enabled for Hebrew and Arabic languages, 0 if not.
SM_MOUSEPRESENT
19
Nonzero if a mouse is installed; otherwise, 0. This value is rarely zero, because of support for virtual mice and because some systems detect the presence of the port instead of the presence of a mouse.
SM_MOUSEHORIZONTALWHEELPRESENT
91
Nonzero if a mouse with a horizontal scroll wheel is installed; otherwise 0.
SM_MOUSEWHEELPRESENT
75
Nonzero if a mouse with a vertical scroll wheel is installed; otherwise 0.
SM_NETWORK
63
The least significant bit is set if a network is present; otherwise, it is cleared. The other bits are reserved for future use.
SM_PENWINDOWS
41
Nonzero if the Microsoft Windows for Pen computing extensions are installed; zero otherwise.
SM_REMOTECONTROL
0x2001
This system metric is used in a Terminal Services environment. Its value is nonzero if the current session is remotely controlled; otherwise, 0.
SM_REMOTESESSION
0x1000
This system metric is used in a Terminal Services environment. If the calling process is associated with a Terminal Services client session, the return value is nonzero. If the calling process is associated with the Terminal Services console session, the return value is 0.
Windows Server 2003 and Windows XP:  The console session is not necessarily the physical console. For more information, see WTSGetActiveConsoleSessionId.
SM_SAMEDISPLAYFORMAT
81
Nonzero if all the display monitors have the same color format, otherwise, 0. Two displays can have the same bit depth, but different color formats. For example, the red, green, and blue pixels can be encoded with different numbers of bits, or those bits can be located in different places in a pixel color value.
SM_SECURE
44
This system metric should be ignored; it always returns 0.
SM_SERVERR2
89
The build number if the system is Windows Server 2003 R2; otherwise, 0.
SM_SHOWSOUNDS
70
Nonzero if the user requires an application to present information visually in situations where it would otherwise present the information only in audible form; otherwise, 0.
SM_SHUTTINGDOWN
0x2000
Nonzero if the current session is shutting down; otherwise, 0.
Windows 2000:  This value is not supported.
SM_SLOWMACHINE
73
Nonzero if the computer has a low-end (slow) processor; otherwise, 0.
SM_STARTER
88
Nonzero if the current operating system is Windows 7 Starter Edition, Windows Vista Starter, or Windows XP Starter Edition; otherwise, 0.
SM_SWAPBUTTON
23
Nonzero if the meanings of the left and right mouse buttons are swapped; otherwise, 0.
SM_TABLETPC
86
Nonzero if the current operating system is the Windows XP Tablet PC edition or if the current operating system is Windows Vista or Windows 7 and the Tablet PC Input service is started; otherwise, 0. The SM_DIGITIZER setting indicates the type of digitizer input supported by a device running Windows 7 or Windows Server 2008 R2. For more information, see Remarks.
SM_XVIRTUALSCREEN
76
The coordinates for the left side of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CXVIRTUALSCREEN metric is the width of the virtual screen.
SM_YVIRTUALSCREEN
77
The coordinates for the top of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CYVIRTUALSCREEN metric is the height of the virtual screen.
 

Return Value

If the function succeeds, the return value is the requested system metric or configuration setting.

If the function fails, the return value is 0. GetLastError does not provide extended error information.

Remarks

System metrics can vary from display to display.

GetSystemMetrics(SM_CMONITORS) counts only visible display monitors. This is different from EnumDisplayMonitors, which enumerates both visible display monitors and invisible pseudo-monitors that are associated with mirroring drivers. An invisible pseudo-monitor is associated with a pseudo-device used to mirror application drawing for remoting or other purposes.

The SM_ARRANGE setting specifies how the system arranges minimized windows, and consists of a starting position and a direction. The starting position can be one of the following values.

Value	Meaning
ARW_BOTTOMLEFT	Start at the lower-left corner of the screen. The default position.
ARW_BOTTOMRIGHT	Start at the lower-right corner of the screen. Equivalent to ARW_STARTRIGHT.
ARW_TOPLEFT	Start at the upper-left corner of the screen. Equivalent to ARW_STARTTOP.
ARW_TOPRIGHT	Start at the upper-right corner of the screen. Equivalent to ARW_STARTTOP | SRW_STARTRIGHT.
 

The direction in which to arrange minimized windows can be one of the following values.

Value	Meaning
ARW_DOWN	Arrange vertically, top to bottom.
ARW_HIDE	Hide minimized windows by moving them off the visible area of the screen.
ARW_LEFT	Arrange horizontally, left to right.
ARW_RIGHT	Arrange horizontally, right to left.
ARW_UP	Arrange vertically, bottom to top.
 

The SM_DIGITIZER setting specifies the type of digitizers that are installed on a device running Windows 7 or Windows Server 2008 R2. The return value is a bit mask that specifies one or more of the following values.

Value	Meaning
NID_INTEGRATED_TOUCH
0x01
The device has an integrated touch digitizer.
NID_EXTERNAL_TOUCH
0x02
The device has an external touch digitizer.
NID_INTEGRATED_PEN
0x04
The device has an integrated pen digitizer.
NID_EXTERNAL_PEN
0x08
The device has an external pen digitizer.
NID_MULTI_INPUT
0x40
The device supports multiple sources of digitizer input.
NID_READY
0x80
The device is ready to receive digitizer input.
 **/
end function

public function long of_getyborder ();long ll_tbHeight = 0
ll_tbHeight = getsystemmetrics( SM_CYBORDER )
ll_tbHeight = PixelsToUnits(ll_tbHeight, YPixelsToUnits! )
return ll_tbHeight

/** Extract from MSDN :
 *******************
 Value	Meaning
SM_ARRANGE
56
The flags that specify how the system arranged minimized windows. For more information, see the Remarks section in this topic.
SM_CLEANBOOT
67
The value that specifies how the system is started:
0 Normal boot
1 Fail-safe boot
2 Fail-safe with network boot
A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot) bypasses the user startup files.
SM_CMONITORS
80
The number of display monitors on a desktop. For more information, see the Remarks section in this topic.
SM_CMOUSEBUTTONS
43
The number of buttons on a mouse, or zero if no mouse is installed.
SM_CXBORDER
5
The width of a window border, in pixels. This is equivalent to the SM_CXEDGE value for windows with the 3-D look.
SM_CXCURSOR
13
The width of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CXDLGFRAME
7
This value is the same as SM_CXFIXEDFRAME.
SM_CXDOUBLECLK
36
The width of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle that is defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the width of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
SM_CXDRAG
68
The number of pixels on either side of a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from the left of the mouse-down point and added to the right of it.
SM_CXEDGE
45
The width of a 3-D border, in pixels. This metric is the 3-D counterpart of SM_CXBORDER.
SM_CXFIXEDFRAME
7
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CXDLGFRAME.
SM_CXFOCUSBORDER
83
The width of the left and right edges of the focus rectangle that the DrawFocusRect draws. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CXFRAME
32
This value is the same as SM_CXSIZEFRAME.
SM_CXFULLSCREEN
16
The width of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen that is not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CXHSCROLL
21
The width of the arrow bitmap on a horizontal scroll bar, in pixels.
SM_CXHTHUMB
10
The width of the thumb box in a horizontal scroll bar, in pixels.
SM_CXICON
11
The default width of an icon, in pixels. The LoadIcon function can load only icons with the dimensions that SM_CXICON and SM_CYICON specifies.
SM_CXICONSPACING
38
The width of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CXICON.
SM_CXMAXIMIZED
61
The default width, in pixels, of a maximized top-level window on the primary display monitor.
SM_CXMAXTRACK
59
The default maximum width of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXMENUCHECK
71
The width of the default menu check-mark bitmap, in pixels.
SM_CXMENUSIZE
54
The width of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CXMIN
28
The minimum width of a window, in pixels.
SM_CXMINIMIZED
57
The width of a minimized window, in pixels.
SM_CXMINSPACING
47
The width of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CXMINIMIZED.
SM_CXMINTRACK
34
The minimum tracking width of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXPADDEDBORDER
92
The amount of border padding for captioned windows, in pixels.
Windows XP/2000:  This value is not supported.
SM_CXSCREEN
0
The width of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, HORZRES).
SM_CXSIZE
30
The width of a button in a window caption or title bar, in pixels.
SM_CXSIZEFRAME
32
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CXFRAME.
SM_CXSMICON
49
The recommended width of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CXSMSIZE
52
The width of small caption buttons, in pixels.
SM_CXVIRTUALSCREEN
78
The width of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_XVIRTUALSCREEN metric is the coordinates for the left side of the virtual screen.
SM_CXVSCROLL
2
The width of a vertical scroll bar, in pixels.
SM_CYBORDER
6
The height of a window border, in pixels. This is equivalent to the SM_CYEDGE value for windows with the 3-D look.
SM_CYCAPTION
4
The height of a caption area, in pixels.
SM_CYCURSOR
14
The height of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CYDLGFRAME
8
This value is the same as SM_CYFIXEDFRAME.
SM_CYDOUBLECLK
37
The height of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the height of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKHEIGHT.
SM_CYDRAG
69
The number of pixels above and below a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from above the mouse-down point and added below it.
SM_CYEDGE
46
The height of a 3-D border, in pixels. This is the 3-D counterpart of SM_CYBORDER.
SM_CYFIXEDFRAME
8
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CYDLGFRAME.
SM_CYFOCUSBORDER
84
The height of the top and bottom edges of the focus rectangle drawn by DrawFocusRect. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CYFRAME
33
This value is the same as SM_CYSIZEFRAME.
SM_CYFULLSCREEN
17
The height of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CYHSCROLL
3
The height of a horizontal scroll bar, in pixels.
SM_CYICON
12
The default height of an icon, in pixels. The LoadIcon function can load only icons with the dimensions SM_CXICON and SM_CYICON.
SM_CYICONSPACING
39
The height of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CYICON.
SM_CYKANJIWINDOW
18
For double byte character set versions of the system, this is the height of the Kanji window at the bottom of the screen, in pixels.
SM_CYMAXIMIZED
62
The default height, in pixels, of a maximized top-level window on the primary display monitor.
SM_CYMAXTRACK
60
The default maximum height of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYMENU
15
The height of a single-line menu bar, in pixels.
SM_CYMENUCHECK
72
The height of the default menu check-mark bitmap, in pixels.
SM_CYMENUSIZE
55
The height of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CYMIN
29
The minimum height of a window, in pixels.
SM_CYMINIMIZED
58
The height of a minimized window, in pixels.
SM_CYMINSPACING
48
The height of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CYMINIMIZED.
SM_CYMINTRACK
35
The minimum tracking height of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYSCREEN
1
The height of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, VERTRES).
SM_CYSIZE
31
The height of a button in a window caption or title bar, in pixels.
SM_CYSIZEFRAME
33
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CYFRAME.
SM_CYSMCAPTION
51
The height of a small caption, in pixels.
SM_CYSMICON
50
The recommended height of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CYSMSIZE
53
The height of small caption buttons, in pixels.
SM_CYVIRTUALSCREEN
79
The height of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
SM_CYVSCROLL
20
The height of the arrow bitmap on a vertical scroll bar, in pixels.
SM_CYVTHUMB
9
The height of the thumb box in a vertical scroll bar, in pixels.
SM_DBCSENABLED
42
Nonzero if User32.dll supports DBCS; otherwise, 0.
SM_DEBUG
22
Nonzero if the debug version of User.exe is installed; otherwise, 0.
SM_DIGITIZER
94
Nonzero if the current operating system is Windows 7 or Windows Server 2008 R2 and the Tablet PC Input service is started; otherwise, 0. The return value is a bit mask that specifies the type of digitizer input supported by the device. For more information, see Remarks.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_IMMENABLED
82
Nonzero if Input Method Manager/Input Method Editor features are enabled; otherwise, 0.
SM_IMMENABLED indicates whether the system is ready to use a Unicode-based IME on a Unicode application. To ensure that a language-dependent IME works, check SM_DBCSENABLED and the system ANSI code page. Otherwise the ANSI-to-Unicode conversion may not be performed correctly, or some components like fonts or registry settings may not be present.
SM_MAXIMUMTOUCHES
95
Nonzero if there are digitizers in the system; otherwise, 0.
SM_MAXIMUMTOUCHES returns the aggregate maximum of the maximum number of contacts supported by every digitizer in the system. If the system has only single-touch digitizers, the return value is 1. If the system has multi-touch digitizers, the return value is the number of simultaneous contacts the hardware can provide.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_MEDIACENTER
87
Nonzero if the current operating system is the Windows XP, Media Center Edition, 0 if not.
SM_MENUDROPALIGNMENT
40
Nonzero if drop-down menus are right-aligned with the corresponding menu-bar item; 0 if the menus are left-aligned.
SM_MIDEASTENABLED
74
Nonzero if the system is enabled for Hebrew and Arabic languages, 0 if not.
SM_MOUSEPRESENT
19
Nonzero if a mouse is installed; otherwise, 0. This value is rarely zero, because of support for virtual mice and because some systems detect the presence of the port instead of the presence of a mouse.
SM_MOUSEHORIZONTALWHEELPRESENT
91
Nonzero if a mouse with a horizontal scroll wheel is installed; otherwise 0.
SM_MOUSEWHEELPRESENT
75
Nonzero if a mouse with a vertical scroll wheel is installed; otherwise 0.
SM_NETWORK
63
The least significant bit is set if a network is present; otherwise, it is cleared. The other bits are reserved for future use.
SM_PENWINDOWS
41
Nonzero if the Microsoft Windows for Pen computing extensions are installed; zero otherwise.
SM_REMOTECONTROL
0x2001
This system metric is used in a Terminal Services environment. Its value is nonzero if the current session is remotely controlled; otherwise, 0.
SM_REMOTESESSION
0x1000
This system metric is used in a Terminal Services environment. If the calling process is associated with a Terminal Services client session, the return value is nonzero. If the calling process is associated with the Terminal Services console session, the return value is 0.
Windows Server 2003 and Windows XP:  The console session is not necessarily the physical console. For more information, see WTSGetActiveConsoleSessionId.
SM_SAMEDISPLAYFORMAT
81
Nonzero if all the display monitors have the same color format, otherwise, 0. Two displays can have the same bit depth, but different color formats. For example, the red, green, and blue pixels can be encoded with different numbers of bits, or those bits can be located in different places in a pixel color value.
SM_SECURE
44
This system metric should be ignored; it always returns 0.
SM_SERVERR2
89
The build number if the system is Windows Server 2003 R2; otherwise, 0.
SM_SHOWSOUNDS
70
Nonzero if the user requires an application to present information visually in situations where it would otherwise present the information only in audible form; otherwise, 0.
SM_SHUTTINGDOWN
0x2000
Nonzero if the current session is shutting down; otherwise, 0.
Windows 2000:  This value is not supported.
SM_SLOWMACHINE
73
Nonzero if the computer has a low-end (slow) processor; otherwise, 0.
SM_STARTER
88
Nonzero if the current operating system is Windows 7 Starter Edition, Windows Vista Starter, or Windows XP Starter Edition; otherwise, 0.
SM_SWAPBUTTON
23
Nonzero if the meanings of the left and right mouse buttons are swapped; otherwise, 0.
SM_TABLETPC
86
Nonzero if the current operating system is the Windows XP Tablet PC edition or if the current operating system is Windows Vista or Windows 7 and the Tablet PC Input service is started; otherwise, 0. The SM_DIGITIZER setting indicates the type of digitizer input supported by a device running Windows 7 or Windows Server 2008 R2. For more information, see Remarks.
SM_XVIRTUALSCREEN
76
The coordinates for the left side of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CXVIRTUALSCREEN metric is the width of the virtual screen.
SM_YVIRTUALSCREEN
77
The coordinates for the top of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CYVIRTUALSCREEN metric is the height of the virtual screen.
 

Return Value

If the function succeeds, the return value is the requested system metric or configuration setting.

If the function fails, the return value is 0. GetLastError does not provide extended error information.

Remarks

System metrics can vary from display to display.

GetSystemMetrics(SM_CMONITORS) counts only visible display monitors. This is different from EnumDisplayMonitors, which enumerates both visible display monitors and invisible pseudo-monitors that are associated with mirroring drivers. An invisible pseudo-monitor is associated with a pseudo-device used to mirror application drawing for remoting or other purposes.

The SM_ARRANGE setting specifies how the system arranges minimized windows, and consists of a starting position and a direction. The starting position can be one of the following values.

Value	Meaning
ARW_BOTTOMLEFT	Start at the lower-left corner of the screen. The default position.
ARW_BOTTOMRIGHT	Start at the lower-right corner of the screen. Equivalent to ARW_STARTRIGHT.
ARW_TOPLEFT	Start at the upper-left corner of the screen. Equivalent to ARW_STARTTOP.
ARW_TOPRIGHT	Start at the upper-right corner of the screen. Equivalent to ARW_STARTTOP | SRW_STARTRIGHT.
 

The direction in which to arrange minimized windows can be one of the following values.

Value	Meaning
ARW_DOWN	Arrange vertically, top to bottom.
ARW_HIDE	Hide minimized windows by moving them off the visible area of the screen.
ARW_LEFT	Arrange horizontally, left to right.
ARW_RIGHT	Arrange horizontally, right to left.
ARW_UP	Arrange vertically, bottom to top.
 

The SM_DIGITIZER setting specifies the type of digitizers that are installed on a device running Windows 7 or Windows Server 2008 R2. The return value is a bit mask that specifies one or more of the following values.

Value	Meaning
NID_INTEGRATED_TOUCH
0x01
The device has an integrated touch digitizer.
NID_EXTERNAL_TOUCH
0x02
The device has an external touch digitizer.
NID_INTEGRATED_PEN
0x04
The device has an integrated pen digitizer.
NID_EXTERNAL_PEN
0x08
The device has an external pen digitizer.
NID_MULTI_INPUT
0x40
The device supports multiple sources of digitizer input.
NID_READY
0x80
The device is ready to receive digitizer input.
 **/
end function

public function long of_getmenubarheight ();long ll_tbHeight = 0
ll_tbHeight = getsystemmetrics( SM_CYMENUCHECK )
ll_tbHeight = PixelsToUnits(ll_tbHeight, YPixelsToUnits! )
return ll_tbHeight

/** Extract from MSDN :
 *******************
 Value	Meaning
SM_ARRANGE
56
The flags that specify how the system arranged minimized windows. For more information, see the Remarks section in this topic.
SM_CLEANBOOT
67
The value that specifies how the system is started:
0 Normal boot
1 Fail-safe boot
2 Fail-safe with network boot
A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot) bypasses the user startup files.
SM_CMONITORS
80
The number of display monitors on a desktop. For more information, see the Remarks section in this topic.
SM_CMOUSEBUTTONS
43
The number of buttons on a mouse, or zero if no mouse is installed.
SM_CXBORDER
5
The width of a window border, in pixels. This is equivalent to the SM_CXEDGE value for windows with the 3-D look.
SM_CXCURSOR
13
The width of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CXDLGFRAME
7
This value is the same as SM_CXFIXEDFRAME.
SM_CXDOUBLECLK
36
The width of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle that is defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the width of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
SM_CXDRAG
68
The number of pixels on either side of a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from the left of the mouse-down point and added to the right of it.
SM_CXEDGE
45
The width of a 3-D border, in pixels. This metric is the 3-D counterpart of SM_CXBORDER.
SM_CXFIXEDFRAME
7
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CXDLGFRAME.
SM_CXFOCUSBORDER
83
The width of the left and right edges of the focus rectangle that the DrawFocusRect draws. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CXFRAME
32
This value is the same as SM_CXSIZEFRAME.
SM_CXFULLSCREEN
16
The width of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen that is not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CXHSCROLL
21
The width of the arrow bitmap on a horizontal scroll bar, in pixels.
SM_CXHTHUMB
10
The width of the thumb box in a horizontal scroll bar, in pixels.
SM_CXICON
11
The default width of an icon, in pixels. The LoadIcon function can load only icons with the dimensions that SM_CXICON and SM_CYICON specifies.
SM_CXICONSPACING
38
The width of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CXICON.
SM_CXMAXIMIZED
61
The default width, in pixels, of a maximized top-level window on the primary display monitor.
SM_CXMAXTRACK
59
The default maximum width of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXMENUCHECK
71
The width of the default menu check-mark bitmap, in pixels.
SM_CXMENUSIZE
54
The width of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CXMIN
28
The minimum width of a window, in pixels.
SM_CXMINIMIZED
57
The width of a minimized window, in pixels.
SM_CXMINSPACING
47
The width of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CXMINIMIZED.
SM_CXMINTRACK
34
The minimum tracking width of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CXPADDEDBORDER
92
The amount of border padding for captioned windows, in pixels.
Windows XP/2000:  This value is not supported.
SM_CXSCREEN
0
The width of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, HORZRES).
SM_CXSIZE
30
The width of a button in a window caption or title bar, in pixels.
SM_CXSIZEFRAME
32
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CXFRAME.
SM_CXSMICON
49
The recommended width of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CXSMSIZE
52
The width of small caption buttons, in pixels.
SM_CXVIRTUALSCREEN
78
The width of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_XVIRTUALSCREEN metric is the coordinates for the left side of the virtual screen.
SM_CXVSCROLL
2
The width of a vertical scroll bar, in pixels.
SM_CYBORDER
6
The height of a window border, in pixels. This is equivalent to the SM_CYEDGE value for windows with the 3-D look.
SM_CYCAPTION
4
The height of a caption area, in pixels.
SM_CYCURSOR
14
The height of a cursor, in pixels. The system cannot create cursors of other sizes.
SM_CYDLGFRAME
8
This value is the same as SM_CYFIXEDFRAME.
SM_CYDOUBLECLK
37
The height of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time.
To set the height of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKHEIGHT.
SM_CYDRAG
69
The number of pixels above and below a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from above the mouse-down point and added below it.
SM_CYEDGE
46
The height of a 3-D border, in pixels. This is the 3-D counterpart of SM_CYBORDER.
SM_CYFIXEDFRAME
8
The thickness of the frame around the perimeter of a window that has a caption but is not sizable, in pixels. SM_CXFIXEDFRAME is the height of the horizontal border, and SM_CYFIXEDFRAME is the width of the vertical border.
This value is the same as SM_CYDLGFRAME.
SM_CYFOCUSBORDER
84
The height of the top and bottom edges of the focus rectangle drawn by DrawFocusRect. This value is in pixels.
Windows 2000:  This value is not supported.
SM_CYFRAME
33
This value is the same as SM_CYSIZEFRAME.
SM_CYFULLSCREEN
17
The height of the client area for a full-screen window on the primary display monitor, in pixels. To get the coordinates of the portion of the screen not obscured by the system taskbar or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
SM_CYHSCROLL
3
The height of a horizontal scroll bar, in pixels.
SM_CYICON
12
The default height of an icon, in pixels. The LoadIcon function can load only icons with the dimensions SM_CXICON and SM_CYICON.
SM_CYICONSPACING
39
The height of a grid cell for items in large icon view, in pixels. Each item fits into a rectangle of size SM_CXICONSPACING by SM_CYICONSPACING when arranged. This value is always greater than or equal to SM_CYICON.
SM_CYKANJIWINDOW
18
For double byte character set versions of the system, this is the height of the Kanji window at the bottom of the screen, in pixels.
SM_CYMAXIMIZED
62
The default height, in pixels, of a maximized top-level window on the primary display monitor.
SM_CYMAXTRACK
60
The default maximum height of a window that has a caption and sizing borders, in pixels. This metric refers to the entire desktop. The user cannot drag the window frame to a size larger than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYMENU
15
The height of a single-line menu bar, in pixels.
SM_CYMENUCHECK
72
The height of the default menu check-mark bitmap, in pixels.
SM_CYMENUSIZE
55
The height of menu bar buttons, such as the child window close button that is used in the multiple document interface, in pixels.
SM_CYMIN
29
The minimum height of a window, in pixels.
SM_CYMINIMIZED
58
The height of a minimized window, in pixels.
SM_CYMINSPACING
48
The height of a grid cell for a minimized window, in pixels. Each minimized window fits into a rectangle this size when arranged. This value is always greater than or equal to SM_CYMINIMIZED.
SM_CYMINTRACK
35
The minimum tracking height of a window, in pixels. The user cannot drag the window frame to a size smaller than these dimensions. A window can override this value by processing the WM_GETMINMAXINFO message.
SM_CYSCREEN
1
The height of the screen of the primary display monitor, in pixels. This is the same value obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, VERTRES).
SM_CYSIZE
31
The height of a button in a window caption or title bar, in pixels.
SM_CYSIZEFRAME
33
The thickness of the sizing border around the perimeter of a window that can be resized, in pixels. SM_CXSIZEFRAME is the width of the horizontal border, and SM_CYSIZEFRAME is the height of the vertical border.
This value is the same as SM_CYFRAME.
SM_CYSMCAPTION
51
The height of a small caption, in pixels.
SM_CYSMICON
50
The recommended height of a small icon, in pixels. Small icons typically appear in window captions and in small icon view.
SM_CYSMSIZE
53
The height of small caption buttons, in pixels.
SM_CYVIRTUALSCREEN
79
The height of the virtual screen, in pixels. The virtual screen is the bounding rectangle of all display monitors. The SM_YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
SM_CYVSCROLL
20
The height of the arrow bitmap on a vertical scroll bar, in pixels.
SM_CYVTHUMB
9
The height of the thumb box in a vertical scroll bar, in pixels.
SM_DBCSENABLED
42
Nonzero if User32.dll supports DBCS; otherwise, 0.
SM_DEBUG
22
Nonzero if the debug version of User.exe is installed; otherwise, 0.
SM_DIGITIZER
94
Nonzero if the current operating system is Windows 7 or Windows Server 2008 R2 and the Tablet PC Input service is started; otherwise, 0. The return value is a bit mask that specifies the type of digitizer input supported by the device. For more information, see Remarks.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_IMMENABLED
82
Nonzero if Input Method Manager/Input Method Editor features are enabled; otherwise, 0.
SM_IMMENABLED indicates whether the system is ready to use a Unicode-based IME on a Unicode application. To ensure that a language-dependent IME works, check SM_DBCSENABLED and the system ANSI code page. Otherwise the ANSI-to-Unicode conversion may not be performed correctly, or some components like fonts or registry settings may not be present.
SM_MAXIMUMTOUCHES
95
Nonzero if there are digitizers in the system; otherwise, 0.
SM_MAXIMUMTOUCHES returns the aggregate maximum of the maximum number of contacts supported by every digitizer in the system. If the system has only single-touch digitizers, the return value is 1. If the system has multi-touch digitizers, the return value is the number of simultaneous contacts the hardware can provide.
Windows Server 2008, Windows Vista, and Windows XP/2000:  This value is not supported.
SM_MEDIACENTER
87
Nonzero if the current operating system is the Windows XP, Media Center Edition, 0 if not.
SM_MENUDROPALIGNMENT
40
Nonzero if drop-down menus are right-aligned with the corresponding menu-bar item; 0 if the menus are left-aligned.
SM_MIDEASTENABLED
74
Nonzero if the system is enabled for Hebrew and Arabic languages, 0 if not.
SM_MOUSEPRESENT
19
Nonzero if a mouse is installed; otherwise, 0. This value is rarely zero, because of support for virtual mice and because some systems detect the presence of the port instead of the presence of a mouse.
SM_MOUSEHORIZONTALWHEELPRESENT
91
Nonzero if a mouse with a horizontal scroll wheel is installed; otherwise 0.
SM_MOUSEWHEELPRESENT
75
Nonzero if a mouse with a vertical scroll wheel is installed; otherwise 0.
SM_NETWORK
63
The least significant bit is set if a network is present; otherwise, it is cleared. The other bits are reserved for future use.
SM_PENWINDOWS
41
Nonzero if the Microsoft Windows for Pen computing extensions are installed; zero otherwise.
SM_REMOTECONTROL
0x2001
This system metric is used in a Terminal Services environment. Its value is nonzero if the current session is remotely controlled; otherwise, 0.
SM_REMOTESESSION
0x1000
This system metric is used in a Terminal Services environment. If the calling process is associated with a Terminal Services client session, the return value is nonzero. If the calling process is associated with the Terminal Services console session, the return value is 0.
Windows Server 2003 and Windows XP:  The console session is not necessarily the physical console. For more information, see WTSGetActiveConsoleSessionId.
SM_SAMEDISPLAYFORMAT
81
Nonzero if all the display monitors have the same color format, otherwise, 0. Two displays can have the same bit depth, but different color formats. For example, the red, green, and blue pixels can be encoded with different numbers of bits, or those bits can be located in different places in a pixel color value.
SM_SECURE
44
This system metric should be ignored; it always returns 0.
SM_SERVERR2
89
The build number if the system is Windows Server 2003 R2; otherwise, 0.
SM_SHOWSOUNDS
70
Nonzero if the user requires an application to present information visually in situations where it would otherwise present the information only in audible form; otherwise, 0.
SM_SHUTTINGDOWN
0x2000
Nonzero if the current session is shutting down; otherwise, 0.
Windows 2000:  This value is not supported.
SM_SLOWMACHINE
73
Nonzero if the computer has a low-end (slow) processor; otherwise, 0.
SM_STARTER
88
Nonzero if the current operating system is Windows 7 Starter Edition, Windows Vista Starter, or Windows XP Starter Edition; otherwise, 0.
SM_SWAPBUTTON
23
Nonzero if the meanings of the left and right mouse buttons are swapped; otherwise, 0.
SM_TABLETPC
86
Nonzero if the current operating system is the Windows XP Tablet PC edition or if the current operating system is Windows Vista or Windows 7 and the Tablet PC Input service is started; otherwise, 0. The SM_DIGITIZER setting indicates the type of digitizer input supported by a device running Windows 7 or Windows Server 2008 R2. For more information, see Remarks.
SM_XVIRTUALSCREEN
76
The coordinates for the left side of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CXVIRTUALSCREEN metric is the width of the virtual screen.
SM_YVIRTUALSCREEN
77
The coordinates for the top of the virtual screen. The virtual screen is the bounding rectangle of all display monitors. The SM_CYVIRTUALSCREEN metric is the height of the virtual screen.
 

Return Value

If the function succeeds, the return value is the requested system metric or configuration setting.

If the function fails, the return value is 0. GetLastError does not provide extended error information.

Remarks

System metrics can vary from display to display.

GetSystemMetrics(SM_CMONITORS) counts only visible display monitors. This is different from EnumDisplayMonitors, which enumerates both visible display monitors and invisible pseudo-monitors that are associated with mirroring drivers. An invisible pseudo-monitor is associated with a pseudo-device used to mirror application drawing for remoting or other purposes.

The SM_ARRANGE setting specifies how the system arranges minimized windows, and consists of a starting position and a direction. The starting position can be one of the following values.

Value	Meaning
ARW_BOTTOMLEFT	Start at the lower-left corner of the screen. The default position.
ARW_BOTTOMRIGHT	Start at the lower-right corner of the screen. Equivalent to ARW_STARTRIGHT.
ARW_TOPLEFT	Start at the upper-left corner of the screen. Equivalent to ARW_STARTTOP.
ARW_TOPRIGHT	Start at the upper-right corner of the screen. Equivalent to ARW_STARTTOP | SRW_STARTRIGHT.
 

The direction in which to arrange minimized windows can be one of the following values.

Value	Meaning
ARW_DOWN	Arrange vertically, top to bottom.
ARW_HIDE	Hide minimized windows by moving them off the visible area of the screen.
ARW_LEFT	Arrange horizontally, left to right.
ARW_RIGHT	Arrange horizontally, right to left.
ARW_UP	Arrange vertically, bottom to top.
 

The SM_DIGITIZER setting specifies the type of digitizers that are installed on a device running Windows 7 or Windows Server 2008 R2. The return value is a bit mask that specifies one or more of the following values.

Value	Meaning
NID_INTEGRATED_TOUCH
0x01
The device has an integrated touch digitizer.
NID_EXTERNAL_TOUCH
0x02
The device has an external touch digitizer.
NID_INTEGRATED_PEN
0x04
The device has an integrated pen digitizer.
NID_EXTERNAL_PEN
0x08
The device has an external pen digitizer.
NID_MULTI_INPUT
0x40
The device supports multiple sources of digitizer input.
NID_READY
0x80
The device is ready to receive digitizer input.
 **/
end function

public subroutine get_work_area (ref long al_x, ref long al_y, ref long al_width, ref long al_height);st_rect lr_rect
SystemParametersInfoRect( SPI_GETWORKAREA, 0, lr_rect , 0)
debug_message( classname(), "get_work_area( " + &
	string( lr_rect.left ) + "," + &
	string( lr_rect.top ) + "," + &
	string( lr_rect.right ) + "," + &
	string( lr_rect.bottom ) + ")", DEBUG_LEVEL_PARANO )	
al_y = PixelsToUnits( lr_rect.top, YPixelsToUnits! )
al_x = PixelsToUnits( lr_rect.left, XPixelsToUnits! )
al_height = PixelsToUnits( abs( lr_rect.bottom - lr_rect.top ) , YPixelsToUnits! )
al_width = PixelsToUnits( abs(lr_rect.right - lr_rect.left ), XPixelsToUnits! )

end subroutine

public function long of_getstringheight (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic);// computes the height in pixels of a string as drawn in the specified font

ulong ll_handle, ll_hdc, ll_hdcbis
ulong ll_hfont
ulong weight
long height
long ret_height = -1
st_size size

ll_handle = handle(aw_parent)
ll_hdc = GetDC(ll_handle)

// create the specified font
if ab_bold then weight = FW_BOLD else weight = FW_NORMAL
// compute the height using the display device physical properties
height = -MulDiv(ai_size, GetDeviceCaps(ll_hdc, LOGPIXELSY), 72)
ll_hfont = CreateFont( height, 0, 0, 0, weight, ab_italic, false, false, 0, DEFAULT_CHARSET, 0, 0, 0, as_fontname)
// use that font for the device context
SelectObject(ll_hdc, ll_hfont)

if GetTextExtentPoint32(ll_hdc, as_text, len(as_text), size) then
	ret_height = size.cy
end if

ReleaseDC(ll_handle, ll_hdc)

return ret_height

end function

public function long of_getstringheightunits (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic);// computes the height in pixels of a string as drawn in the specified font
// returns a result in PB units

long height = -1

height = of_getstringheight(aw_parent, as_text, as_fontname, ai_size, ab_bold, ab_italic)
height = PixelsToUnits(height, YPixelsToUnits!) 

return height

end function

public function long of_getstringwidth (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic);// computes the width in pixels of a string as drawn in the specified font

ulong ll_handle, ll_hdc, ll_hdcbis
ulong ll_hfont
ulong weight
long height
long width = -1
st_size size

ll_handle = handle(aw_parent)
ll_hdc = GetDC(ll_handle)

// create the specified font
if ab_bold then weight = FW_BOLD else weight = FW_NORMAL
// compute the height using the display device physical properties
height = -MulDiv(ai_size, GetDeviceCaps(ll_hdc, LOGPIXELSX), 72)
ll_hfont = CreateFont( height, 0, 0, 0, weight, ab_italic, false, false, 0, DEFAULT_CHARSET, 0, 0, 0, as_fontname)
// use that font for the device context
SelectObject(ll_hdc, ll_hfont)

if GetTextExtentPoint32(ll_hdc, as_text, len(as_text), size) then
	width = size.cx + 1 //add 1 is better, look trhough MSDN for clues ;o)
end if

ReleaseDC(ll_handle, ll_hdc)

return width

end function

public function long of_getstringwidthunits (window aw_parent, string as_text, string as_fontname, integer ai_size, boolean ab_bold, boolean ab_italic);// computes the size in pixels of a string as drawn in the specified font
// returns a result in PB units

long width = -1

width = of_getstringwidth(aw_parent, as_text, as_fontname, ai_size, ab_bold, ab_italic)
width = PixelsToUnits(width, XPixelsToUnits!) 

return width

end function

public subroutine get_work_area_pxl (ref long al_x, ref long al_y, ref long al_width, ref long al_height);st_rect lr_rect
SystemParametersInfoRect( SPI_GETWORKAREA, 0, lr_rect , 0)
debug_message( classname(), "get_work_area( " + &
	string( lr_rect.left ) + "," + &
	string( lr_rect.top ) + "," + &
	string( lr_rect.right ) + "," + &
	string( lr_rect.bottom ) + ")", DEBUG_LEVEL_PARANO )	
al_y = lr_rect.top
al_x = lr_rect.left
al_height = abs( lr_rect.bottom - lr_rect.top )
al_width = abs(lr_rect.right - lr_rect.left )

end subroutine

public function any of_splitcolors (long al_color);// Split a color into its components
//
// Author : SeKi - 2009

integer li_red, li_green, li_blue, li_ret[]

//color rgb = 65536 * Blue+ 256 * Green+ Red
li_blue = al_color / 65536
al_color = mod(al_color, 65536)

li_green = al_color / 256
li_red = mod(al_color, 256)

li_ret = {li_red, li_green, li_blue}

return li_ret[]

end function

public function long of_inches2pixelsx (decimal adec_inches);
ulong ll_dc
long ll_px

ll_dc = GetDC(HWND_DESKTOP)
ll_px = adec_inches * of_getscreendpix( )
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_px

end function

public function long of_inches2pixelsy (decimal adec_inches);
ulong ll_dc
long ll_px

ll_dc = GetDC(HWND_DESKTOP)
ll_px = adec_inches * of_getscreendpiy( )
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_px

end function

public function long of_cm2pixelsx (decimal adec_cm);
ulong ll_dc
long ll_px

ll_dc = GetDC(HWND_DESKTOP)
ll_px = adec_cm * of_getscreendpix( ) / 2.54
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_px

end function

public function long of_cm2pixelsy (decimal adec_cm);
ulong ll_dc
long ll_px

ll_dc = GetDC(HWND_DESKTOP)
ll_px = adec_cm * of_getscreendpiy( ) / 2.54
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_px

end function

public function long of_getscreendpix ();
// Get the actual screen horizontal dpi value
// not the "logical" 96 value

ulong ll_dc
long ll_dpi

ll_dc = GetDC(HWND_DESKTOP)
ll_dpi = MulDiv(GetDeviceCaps(ll_dc, HORZRES)*10, 254, GetDeviceCaps(ll_dc, HORZSIZE)*10)
ll_dpi = ll_dpi / 10
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_dpi

end function

public function long of_getscreendpiy ();
// Get the actual screen horizontal dpi value
// not the "logical" 96 value

ulong ll_dc
long ll_dpi

ll_dc = GetDC(HWND_DESKTOP)
ll_dpi = MulDiv(GetDeviceCaps(ll_dc, VERTRES)*10, 254, GetDeviceCaps(ll_dc, VERTSIZE)*10)
ll_dpi = ll_dpi / 10
ReleaseDC(HWND_DESKTOP, ll_dc)

return ll_dpi

end function

public function decimal of_pixels2inchesx (long al_pixels);
ulong ll_dc
dec ldec_inches

ll_dc = GetDC(HWND_DESKTOP)
ldec_inches = al_pixels / of_getscreendpix( )
ReleaseDC(HWND_DESKTOP, ll_dc)

return ldec_inches

end function

public function decimal of_pixels2inchesy (long al_pixels);
ulong ll_dc
dec ldec_inches

ll_dc = GetDC(HWND_DESKTOP)
ldec_inches = al_pixels / of_getscreendpiy( )
ReleaseDC(HWND_DESKTOP, ll_dc)

return ldec_inches

end function

public function decimal of_pixels2cmx (long al_pixels);
ulong ll_dc
dec ldec_cm

ll_dc = GetDC(HWND_DESKTOP)
ldec_cm = al_pixels / of_getscreendpix( ) * 2.54
ReleaseDC(HWND_DESKTOP, ll_dc)

return ldec_cm

end function

public function decimal of_pixels2cmy (long al_pixels);
ulong ll_dc
dec ldec_cm

ll_dc = GetDC(HWND_DESKTOP)
ldec_cm = al_pixels / of_getscreendpiy( ) * 2.54
ReleaseDC(HWND_DESKTOP, ll_dc)

return ldec_cm

end function

on unvo_gdi.create
call super::create
TriggerEvent( this, "constructor" )
end on

on unvo_gdi.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

