#include "config.ch"
#require class_win_command

FUNCTION util_speech( oWin )
   LOCAL cCor:= SetColor()
   LOCAL cScreen:= SaveScreen(0, 0, MaxRow()-1, MaxCol()-1)
   LOCAL nRow:=3,nCol:=2,nAscMax:= 255, nAsc:= 0
   LOCAL cFileGravar, cFileFlac, cTexto, cURL, cComando
   LOCAL nPos
   LOCAL oCommands:= WinCommandClass():New('')
   oWin:Clear()
   oWin:Subtitle('Reconhecimento de comandos por voz')
   SetColor('15/04')
   WHILE Lastkey() <> 27
        cFileGravar:= 'gravacao.flac'
        if File( cFileGravar )
            DELETE FILE &cFileGravar
        end
        
        // Beep
        BeepAguardando()

        // Record
        @ 03,00 say "Speak in 5 seconds"
        Run( 'arecord -q -f cd -t wav --duration=5 |' + ;
             ' flac - -o gravacao.flac ' )       
        ? "Processing your voice"
        cFileFlac:= '/' + CurDir() + '/gravacao.flac '
        ? 'File: ' + cFileFlac
        cURL:= IBM_URL
        cComando:= 'curl -X POST'+;
        ' -u "apikey:' + IBM_API_KEY + '" ' + ;
        ' --header "Content-Type: audio/flac" ' + ;
        ' --data-binary @' + cFileFlac +  ;
        ' "' + cUrl + 'recognize?model=pt-BR_BroadbandModel" >gravacao.txt'        
        ? cComando
        MemoWrit( 'comando.txt', cComando )
        @ 10,00 say ":"
        Run( cComando ) 
        ? "--end--"
        IF File( 'gravacao.txt' )            
           cTexto:= MEMOREAD( 'gravacao.txt')
           oWin:clear()
           nPos:= At( 'transcript', cTexto )
           if nPos > 0 
              ?'Tem conteudo!'
              cTexto:= SubStr( cTexto, nPos, 100 )
              nPos:= At( ':', cTexto ) 
              IF nPos > 0
                 cTexto:= SubStr( cTexto, nPos+1, 100 )
              ENDIF
              nPos:= At( '"', cTexto ) 
              IF nPos > 0
                 cTexto:= Trim( SubStr( cTexto, nPos+1, 100 ) )
              ENDIF
              nPos:= At( '"', cTexto ) 
              IF nPos > 0
                 cTexto:= SubStr( cTexto, 1, nPos-1 )
              ENDIF
              ?''
              @ MaxRow()-6,0 say 'Last Command: ' + cTexto
              IF .NOT. oCommands:Add( cTexto )
                 BeepErro()
              END
              oCommands:show()
              IF oCommands:command_close()
                 EXIT
              ENDIF
           ELSE
              oCommands:show()
              ?cTexto
           ENDIF
           
        ENDIF 
        IF Inkey(0.5) == 27
            EXIT
        ENDIF
   ENDDO
   RestScreen( 0, 0, MaxRow()-1, MaxCol()-1, cScreen )
   SetColor( cCor )
   BeepFechando()
   RETURN NIL


FUNCTION BeepAguardando()
   Run( '( speaker-test -t sine -f 500 )& pid=$! ; sleep 0.1s ; kill -9 $pid' )
   RETURN NIL

FUNCTION BeepErro()
   Run( '( speaker-test -t sine -f 800 )& pid=$! ; sleep 0.1s ; kill -9 $pid' )
   RETURN NIL

FUNCTION BeepFechando()
   Run( '( speaker-test -t sine -f 200 )& pid=$! ; sleep 0.1s ; kill -9 $pid' )
   RETURN NIL