#include "hbclass.ch"
  
CLASS WinClass
   VAR Title INIT ""
   METHOD new( cID )
   METHOD SetTitle( cTitle )
   METHOD show()
   METHOD clear()
   METHOD subtitle( cText )
END CLASS

/* ------------------------------------------------------------------------ */
METHOD New( cID ) CLASS WinClass
   ::Title:= 'TITULO INICIAL'
   RETURN Self

/* ------------------------------------------------------------------------ */
METHOD SetTitle( cTitle ) CLASS WinClass
    @ 0,0 say cTitle
    ::Title:= cTitle
     
METHOD show() CLASS WinClass
   Local cCorFundoLogo:= '15'
    Scroll(0, 0, MaxRow(), MaxCol())
    @ 0,0 Say padr(::Title, MaxCol()) + ' ' color "15/08"
    @ 0,MaxCol()-23 Say ' FileTools ' + chr(179) + ' CriaSis' + chr(169) + ' ' color "00/" + cCorFundoLogo
    @ 0,MaxCol()-24 Say Chr(17) color cCorFundoLogo + "/08"
    @ 0,MaxCol()-01  Say Chr(16) color cCorFundoLogo + "/08"

METHOD clear() CLASS WinClass
   Scroll(2, 0, MaxRow()-5, MaxCol())


METHOD subTitle( cText ) CLASS WinClass
   @ 1,0 Say ' ' + PadR( cText, MaxCol()-1 ) Color '15/02'