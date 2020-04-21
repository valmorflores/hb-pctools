#include "hbclass.ch"
  
MEMVAR server, post, get
 
CLASS WinEditorClass
   VAR Title INIT ""
   METHOD new( cID )
   METHOD SetTitle( cTitle )
   METHOD show()
 
END CLASS

/* ------------------------------------------------------------------------ */
METHOD New( cID ) CLASS WinEditorClass
   ::Title:= 'TITULO INICIAL'
   RETURN Self

/* ------------------------------------------------------------------------ */
METHOD SetTitle( cTitle ) CLASS WinEditorClass
    @ 0,0 say cTitle
    ::Title:= cTitle
     
METHOD show()
    Scroll(0,0,MaxRow(),MaxCol())
    @ 0,0 Say padc( ::Title, MaxCol() ) + ' ' color "00/15"


