#include "hbclass.ch"

CLASS WinCommandClass
    VAR aCommands
    VAR aAcceptCommands
    METHOD new( cID )
    METHOD command_close()
    METHOD show()
    METHOD add( cCommand )
END CLASS

/* ------------------------------------------------------------------------ */
METHOD New( cID ) CLASS WinCommandClass
   ::aAcceptCommands:= {}
   ::aCommands:= {}
   Aadd( ::aAcceptCommands, { 'NOVA FASE', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'EM NOVA FASE', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'NOVA FRASE', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'NOVA FASE O', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'A NOVA FASE', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'EM FASE', 'NOVA FASE' } )
   Aadd( ::aAcceptCommands, { 'NOVO ARQUIVO', 'NOVO ARQUIVO' } )
   Aadd( ::aAcceptCommands, { 'A NOVA ARQUIVO', 'NOVO ARQUIVO' } )
   Aadd( ::aAcceptCommands, { 'ARQUIVO', 'NOVO ARQUIVO' } )
   Aadd( ::aAcceptCommands, { 'O ARQUIVO', 'NOVO ARQUIVO' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR INIMIGOS', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR OS INIMIGOS', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'ADICIONA INIMIGOS', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'ADICIONA INIMIGO', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR O INIMIGO', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'INIMIGOS', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'INIMIGO', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'O INIMIGO', 'ADICIONAR INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'REMOVER INIMIGOS', 'REMOVER INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'REMOVER INIMIGO', 'REMOVER INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'REMOVE INIMIGO', 'REMOVER INIMIGOS' } )
   Aadd( ::aAcceptCommands, { 'CHEFE', 'ADICIONAR CHEFE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR CHEFE', 'ADICIONAR CHEFE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR CHEFES', 'ADICIONAR CHEFE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR O CHEFE', 'ADICIONAR CHEFE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR O CHEFAO', 'ADICIONAR CHEFE' } )
   Aadd( ::aAcceptCommands, { 'GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR A GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR O GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR OS GERENTES', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR UM GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR UMA GERENTE', 'ADICIONAR GERENTE' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR BLOQUEIO', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'BLOQUEIO', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'BLOQUEIOS', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'BLOQUEADOR', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'VIDA', 'ADICIONAR VIDA' } )
   Aadd( ::aAcceptCommands, { 'PODER', 'ADICIONAR PODER' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR UM BLOQUEIO', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'ADICIONAR O BLOQUEIO', 'ADICIONAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'SUBIR BLOQUEIO', 'SUBIR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'SUBIR UM BLOQUEIO', 'SUBIR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'SUBIR O BLOQUEIO', 'SUBIR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'DESCER BLOQUEIO','DESCER BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'APAGAR BLOQUEIO', 'APAGAR BLOQUEIO' } )
   Aadd( ::aAcceptCommands, { 'SALVAR FRASE','SALVAR FASE' } )
   Aadd( ::aAcceptCommands, { 'SALVAR FASE','SALVAR FASE' } )
   Aadd( ::aAcceptCommands, { 'SAL AR', 'SALVAR FASE' } )
   Aadd( ::aAcceptCommands, { 'SALVE', 'SALVAR FASE' } )
   Aadd( ::aAcceptCommands, { 'LIMPAR FASE', 'LIMPAR FASE' } )
   Aadd( ::aAcceptCommands, { 'LIMPAR FRASE', 'LIMPAR FASE' } )
   Aadd( ::aAcceptCommands, { 'LIMPE', 'LIMPAR FASE' } )   
   Aadd( ::aAcceptCommands, { 'LIMPEZA', 'LIMPAR FASE' } )   
   Aadd( ::aAcceptCommands, { 'LIMPAR', 'LIMPAR FASE' } )   
   Aadd( ::aAcceptCommands, { 'LIMPA', 'LIMPAR FASE' } )   
   Aadd( ::aAcceptCommands, { 'TESTE', 'TESTE' } )  
   Aadd( ::aAcceptCommands, { 'TESTANDO', 'TESTE' } )  
   Aadd( ::aAcceptCommands, { 'UM DOIS', 'TESTE' } )
   /* Exit Commands*/
   Aadd( ::aAcceptCommands, { 'FECHAR', 'FECHAR' } )
   Aadd( ::aAcceptCommands, { 'FECHAR SISTEMA', 'FECHAR' } )
   Aadd( ::aAcceptCommands, { 'FECHAR O SISTEMA', 'FECHAR' } )
   Aadd( ::aAcceptCommands, { 'FECHAR JANELA', 'FECHAR' } )
   Aadd( ::aAcceptCommands, { 'FECHAR A JANELA', 'FECHAR' } )
   Aadd( ::aAcceptCommands, { 'SAIR', 'FECHAR' } )
RETURN Self
 
METHOD show() CLASS WinCommandClass
   LOCAL cCor:= SetColor()
   LOCAL i:= 0, nLin
   LOCAL nChar:= 177
   SetColor('00/04')
   nLin:= 2
   DispBox( nLin, MaxCol()-32, MaxRow()-5, MaxCol(), Replicate( Chr(nChar), 9 ) )
   @ nLin,MaxCol()-30 Say ' Commands: ' Color "15/13"
   IF LEN( ::aCommands ) > 0
      FOR i:= 1 TO LEN( ::aCommands )  
         @ ++nLin, MaxCol()-30 Say ::aCommands[i] Color "14/00"
      NEXT
   ENDIF
   SetColor( cCor )
   
METHOD add( cCommand )
   nPos:= AScan( ::aAcceptCommands, {|a| a[1] = UPPER( TRIM( cCommand ) ) } )
   IF nPos <= 0
      nPos:= AScan( ::aAcceptCommands, {|a| at( a[1], UPPER( TRIM( cCommand ) ) ) > 0 } )
   ENDIF
   IF nPos > 0 
      AADD( ::aCommands, ::aAcceptCommands[ nPos ][2] )
      RETURN .T.
   ELSE
      RETURN .F.
   END

METHOD command_close()
   nPos:= AScan( ::aCommands, 'FECHAR' )
   RETURN ( nPos > 0 )
