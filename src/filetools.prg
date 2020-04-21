/*
REQUEST HB_CodePage_PTISO
Set( _SET_CODEPAGE, "PTISO" )	 
*/
#include "inkey.ch"
#include "fileio.ch"
#require class_win
#require class_options
#require class_win_options

REQUEST HB_CodePage_PT850
 
FUNCTION Main()
    LOCAL cFile, cFileGravar
    LOCAL nKey
    LOCAL nOpcao:= 0
    LOCAL oWin:= WinClass():New( '', .T. )
    LOCAL oWinOptions:= WinOptionsClass():New()
    LOCAL oOptClass:= OptionsClass():New()
    LOCAL cDir:= curdir()
    Set( _SET_CODEPAGE, "PT850" )	 

    SET DATE BRITISH
    SET STATUS OFF
    SET COLOR TO "W/B"
    SET MESSAGE TO MAXROW()-1 CENTER
    SetMode(24,80)    

    oWin:SetTitle('MENU - FILE EXPLORER')
    IF hb_FileExists( 'config.sys')        
        IF ( nH := FOpen( "config.sys", FO_READWRITE + FO_DENYNONE ) ) == F_ERROR
           ? "File cannot be opened"
        ENDIF
    ELSE
    ENDIF
    
    DO WHILE .T. 
        
        //Scroll(0,0,MaxRow(),MaxCol())
        DispBox(0,0,MaxRow(),MaxCol(), ;
        CHR(176) + ;  // corner (1)
        CHR(176) + ;  // line 1
        CHR(176) + ;  // corner (2)
        CHR(176) + CHR(176) + CHR(176) + CHR(176)    + ;  // 
        CHR(176)+chr(176) )
        //Help( '[ENTER] selecionar [ESC] sair')
        Message( "" )
        
        oWin:Show()

        @ 01,00 say PADR( CURDIR(), MaxCol() )+' ' color '15/02' 
        cFile:= myFileList()
        //nKey:= inkey(0)
        if ( LastKey() == 27 ) .OR. ( LastKey() == 13 )
            IF cFile == NIL
               cFile:= ''
            ENDIF
            IF trim( cFile ) == '..'
                   hb_cwd( '..' )
                ELSE
                    oWin:subtitle( cFile )
                    oWinOptions:SetOptionClass( @oOptClass )
                    oWinOptions:Menu()
                    IF ( ( oOptClass:GetLastSelected() == 9 ) )
                       RETURN NIL
                    ENDIF
                    
                    IF oOptClass:GetLastSelected() == 6
                        Utilitarios( oWin )
                    ENDIF

                    IF oOptClass:GetLastSelected() == 1
                        FileView( oWin, cFile )
                    ENDIF

                    IF oOptClass:GetLastSelected() == 7
                        Run( 'code ' + cFile )
                    ENDIF
                    
                    IF oOptClass:GetLastSelected() == 10
                        util_speech( oWin )
                    ENDIF
                    

                ENDIF
            
        ENDIF
    ENDDO
    //chdir( cDir )
    hb_cwd( cDir )


    FUNCTION myfileList()
    LOCAL cCor:= SetColor()
    LOCAL nLen,nTecla,aFiles,aFile,nRow:=1,cCorFundo:= '00'
    /* File List */
    nLen := ADir( "*.*" )  // Number of JPG files in this directory
    IF nLen > 0
       aName := Array( nLen )  // make room to store the information
       aSize := Array( nLen )
       aDate := Array( nLen )
       aTime := Array( nLen )
       aAttr := Array( nLen )
       aFiles:= {}
       ADir( "*.*", aName, aSize, aDate, aTime, aAttr )
       FOR tmp := 1 TO nLen
          aFile:= { aName[tmp], aSize[tmp], aAttr[ tmp ], aDate[ tmp ], aTime[ tmp ] }
          Aadd( aFiles, aFile )
          /*@ tmp+1,01 say aName[ tmp ]
          @ tmp+1,40 say aAttr[ tmp ]
          @ tmp+1,44 say aSize[ tmp ]
          @ tmp+1,60 say aDate[ tmp ]
          @ tmp+1,70 say aTime[ tmp ]*/
       NEXT
       
    ELSE
       //? "This directory is clean from smut"
       aFiles:= Directory( "*.*", 'HSDV')
       //aFiles:= {}
       aFile:= { '.', 0, 'D', '', '' }
       Aadd( aFiles, aFile )
       aFile:= { '..', 0, 'D', '', '' }
       Aadd( aFiles, aFile )
    ENDIF
    
    /* Browse */
    SetCursor(0)
    SetColor('15/00,00/14,,,,14/02')
    oTAB:=tbrowsenew( 02, 02, MaxRow()-5, 66 )
    oTAB:addcolumn(tbcolumnnew(,{|| ' ' + PAD( aFiles[nRow][1], 30 ) + ' ' }))
    oTAB:addcolumn(tbcolumnnew(,{|| aFiles[nRow][2] }))
    oTAB:addcolumn(tbcolumnnew(,{|| aFiles[nRow][3] }))
    oTAB:addcolumn(tbcolumnnew(,{|| aFiles[nRow][4] }))
    oTAB:addcolumn(tbcolumnnew(,{|| aFiles[nRow][5] }))
    oTAB:AUTOLITE:=.f.
    oTAB:GOTOPBLOCK :={|| nROW:=1}
    oTAB:GOBOTTOMBLOCK:={|| nROW:=len(aFiles)}
    oTAB:SKIPBLOCK:={|WTOJUMP| skipperarr(WTOJUMP,aFiles,@nROW)}
    oTAB:dehilite()
        
    WHILE .T.
        oTAB:colorrect({oTAB:ROWPOS,1,oTAB:ROWPOS,5},{2,1})
        WHILE nextkey()==0 .and. ! oTAB:stabilize()
        ENDDO
        /*
        @ 08,45 Say "Nome         " Color "10/" + cCorFundo
        @ 10,45 Say "Data         " Color "10/" + cCorFundo
        @ 12,45 Say "Hora         " Color "10/" + cCorFundo
        @ 14,45 Say "Bytes        " Color "10/" + cCorFundo
        @ 09,45 Say PAD( aFiles[ nRow ][ 1 ], 15 )         Color "15/" + cCorFundo
        @ 11,45 Say Dtoc( aFiles[ nRow ][ 3 ] ) Color "15/" + cCorFundo
        @ 13,45 Say aFiles[ nRow ][ 4 ]         Color "15/" + cCorFundo
        @ 15,45 Say PAD( Alltrim( Tran( aFiles[ nRow ][ 2 ], "@E 999,999,999" ) ), 15 ) Color "15/" + cCorFundo
        */
        nTecla:= Inkey(0)
        IF nTecla==K_ESC .OR. nTecla==K_TAB
            cFile:= Nil
            exit
        ENDIF
        DO CASE
            CASE nTecla==K_UP         ;oTAB:up()
            CASE nTecla==K_DOWN       ;oTAB:down()
            CASE nTecla==K_LEFT       ;oTAB:up()
            CASE nTecla==K_RIGHT      ;oTAB:down()
            CASE nTecla==K_PGUP       ;oTAB:pageup()
            CASE nTecla==K_CTRL_PGUP  ;oTAB:gotop()
            CASE nTecla==K_PGDN       ;oTAB:pagedown()
            CASE nTecla==K_CTRL_PGDN  ;oTAB:gobottom()
            CASE nTecla==K_ENTER
                cFile:= aFiles[ nRow ][ 1 ]
                EXIT
            OTHERWISE                ;tone(125); tone(300)
        ENDCASE
        oTAB:refreshcurrent()
        oTAB:stabilize()
    ENDDO
    SetColor( cCor )
    RETURN cFile

