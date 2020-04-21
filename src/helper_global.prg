
/*
* Modulo      - SKIPPERARR
* Parametro   - NTOJUMP - Quantidade de registro
*               WMATRIZ - Matriz para trabalho
* Finalidade  - Controlar acesso ao primeiro e/ou ultimo registro
*             - Auxilio ao browse de matrizes
* Programador - Valmor Pereira Flores
* Data        - 02/Fevereiro/1994
* Atualizacao
*/
func skipperarr(NTOJUMP,WMATRIZ,nROW)
    loca NJUMPED:=0
    if nROW + NTOJUMP < 1
       NJUMPED:=-nROW + 1
       nROW:=1
    elseif nROW + NTOJUMP > len( WMATRIZ )
       NJUMPED:=len(WMATRIZ) - nROW
       nROW:=len(WMATRIZ)
    else
       NJUMPED:=NTOJUMP
       nROW+=NTOJUMP
    endif
    return NJUMPED
    