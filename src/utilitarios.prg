FUNCTION utilitarios( oWin )
    LOCAL cScreen:= SaveScreen(0,0,MaxRow()-1,MaxCol()-1)
    LOCAL nMenu:= 0
    oWin:clear()
    @ 02,01 say "Utilitarios"
    @ 03,01 PROMPT ' 1 - Tabela ASCII    ' MESSAGE 'Exibe a tabela ASCII'
    @ 04,01 PROMPT ' 0 - Retornar        ' MESSAGE 'Retornar'
    MENU TO nMenu
    IF nMenu = 1
        Util_tabelaAscii( oWin )
    ELSEIF nMenu = 2
    ENDIF
    RestScreen(0,0,MaxRow()-1,MaxCol()-1,cScreen)
    RETURN
