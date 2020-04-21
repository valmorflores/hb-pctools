Function FileView( oWin, cFile )
  Local cCor:= SetColor()
  Local cNewContent
  Local cContent

  SET SCOREBOARD OFF
  oWin:subtitle( 'View File: ' + cFile )
  IF File( cFile )
     cContent:= MemoRead( cFile )
  ENDIF
  SetColor('07/01')
  Scroll( 2, 0, MaxRow()-5, 2 )
  cNewContent:= MemoEdit( cContent, 2, 2, MaxRow()-5, MaxCol() )
  SetColor( cCor )

RETURN NIL



