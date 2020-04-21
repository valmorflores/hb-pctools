#include "hbclass.ch"

CLASS OptionsClass
   VAR nLastSelected
   METHOD new( cID )
   METHOD SetLastSelected( nOpcao )
   METHOD GetLastSelected()
END CLASS

METHOD New( cID ) CLASS OptionsClass
   ::nLastSelected:= 0
   RETURN Self

METHOD SetLastSelected( nOpcao ) CLASS OptionsClass
   ::nLastSelected:= nOpcao

METHOD GetLastSelected() CLASS OptionsClass
    RETURN ::nLastSelected
