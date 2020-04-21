FUNCTION util_tabelaascii( oWin )
    LOCAL cCor:= SetColor()
    LOCAL cScreen:= SaveScreen(0,0,MaxRow()-1,MaxCol()-1)
    LOCAL nRow:=3,nCol:=2,nAscMax:= 255, nAsc:= 0
    oWin:Clear()
    oWin:Subtitle('Tabela Ascii')
    SetColor( '15/04' )
    
    FOR nAsc:= 0 TO nAscMax 
        @ nRow, nCol Say " " + StrZero( nAsc, 3 ) + " " Color "07/01" 
        @ nRow, nCol + 5 say CHR( nAsc ) color "15/01" 
        @ nRow, nCol + 7 say " " color '15/01' 
        nRow:= nRow+1
        IF nRow >= MaxRow() - 7
           nCol:= nCol + 7
           nRow:= 4
        ENDIF 
    END FOR
    Inkey(0)
    RestScreen( 0, 0, MaxRow()-1, MaxCol()-1, cScreen )
    SetColor( cCor )
RETURN



