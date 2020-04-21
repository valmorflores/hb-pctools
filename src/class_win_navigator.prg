#include "hbclass.ch"
  
CLASS WinClassNavigator
   VAR oOptionClass
   METHOD new( cID )
   METHOD menu()
   METHOD show()
END CLASS

/* ------------------------------------------------------------------------ */
METHOD New( cID ) CLASS WinClassNavigator
   ::Title:= 'TITULO INICIAL'
   RETURN Self

/* ------------------------------------------------------------------------ */
METHOD SetTitle( cTitle ) CLASS WinClassNavigator
   @ 0,0 say cTitle
   ::Title:= cTitle

METHOD SetOptionClass( oOptClass ) CLASS WinClassNavigator
   ::oOptionClass:= oOptClass 
     
METHOD show() CLASS WinClassNavigator
    Scroll(0,0,MaxRow(),MaxCol())
    @ 0,0 Say padc( ::Title, MaxCol() ) + ' ' color "00/15"

METHOD menu() CLASS WinClassNavigator
   Scroll(MaxRow()-3,0,MaxRow(),MaxCol())
   @ 01,01 prompt "View"
   @ 01,10 prompt "Edit"
   @ 01,20 prompt "Delete"
   @ 01,30 prompt "Move"
   @ 01,40 prompt "Binary"
   menu to nOpcao
   ::oOptionClass:SetLastSelected( nOpcao )
