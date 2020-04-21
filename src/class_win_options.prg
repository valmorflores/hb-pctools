#include "hbclass.ch"
  
#require class_options

CLASS WinOptionsClass
   VAR oOptionClass
   METHOD new( cID )
   METHOD menu()
   METHOD show()
   METHOD SetOptionClass( oOptClass )
END CLASS

/* ------------------------------------------------------------------------ */
METHOD New( cID ) CLASS WinOptionsClass
   RETURN Self

METHOD SetOptionClass( oOptClass ) CLASS WinOptionsClass
   ::oOptionClass:= oOptClass 
     
METHOD show() CLASS WinOptionsClass
   Scroll(MaxRow()-3,0,MaxRow(),MaxCol())
   //@ 0,0 Say padc( ::Title, MaxCol() ) + ' ' color "00/15"

METHOD menu() CLASS WinOptionsClass
   Scroll(MaxRow()-4,0,MaxRow(),MaxCol())
   @ MaxRow()-4,0 Say Replicate(chr(196),MaxCol()+1)
   @ MaxRow()-4,01 Say chr(219) + ' Menu ' + Chr( 219 ) 
   @ MaxRow()-4,02 Say ' Menu ' color '01/15'
   @ MaxRow()-3,01 prompt " View "
   @ MaxRow()-3,10 prompt " Edit "
   @ MaxRow()-3,20 prompt " Delete "
   @ MaxRow()-3,30 prompt " Move "
   @ MaxRow()-3,40 prompt " Binary "
   @ MaxRow()-3,50 prompt " Utility "
   // Serie 2
   @ MaxRow()-2,01 prompt " Code "
   @ MaxRow()-2,10 prompt " Convert "
   @ MaxRow()-2,20 prompt " Quit "
   // Serie 3
   @ MaxRow()-1,01 Prompt " X-Voice "
   menu to nOpcao
   ::oOptionClass:SetLastSelected( nOpcao )
   //Alert( 'nOpcao' + Str( ::oOptionClass:GetLastSelected() ) )
