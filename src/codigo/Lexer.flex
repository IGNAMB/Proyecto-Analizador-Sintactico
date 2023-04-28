código de paquete;
importar código estático.Tokens.*;
%%
%clase Lexer
%tipo de fichas
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    lexema de cuerda pública;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignorar*/}

/* Comentarios */
( "//"(.)* ) {/*Ignorar*/}

/* salto de linea */
( "\n" ) {return Linea;}

/*comillas*/
( "\"" ) {lexema=yytext(); return Comillas;}

/* tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); devolver T_dato;}

/* Tipo de dato String */
( Cadena ) {lexema=yytext(); volver Cadena;}

/* Palabra reservada If */
(si) {lexema=yytext(); devolver si;}

/* Palabra reservada Else */
(si no) {lexema=yytext(); volver Else;}

/* Palabra reservada Hacer */
( hacer ) {lexema=yytext(); volver Hacer;}

/* Palabra reservada Mientras */
(mientras) {lexema=yytext(); volver Mientras;}

/* Palabra reservada para */
( para ) {lexema=yytext(); volver para;}

/* Operador Igual */
( "=" ) {lexema=yytext(); volver Igual;}

/* Operador Suma */
( "+" ) {lexema=yytext(); volver Suma;}

/* Operador Resta */
( "-" ) {lexema=yytext(); volver Resta;}

/* Operador Multiplicacion */
( "*" ) {lexema=yytext(); return Multiplicacion;}

/* División Operador */
( "/" ) {lexema=yytext(); División de retorno;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexema=yytext(); volver Op_logico;}

/*Operadores Relacionales*/
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexema = yytext(); volver Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-=" | "*=" | "/=" | "%=" ) {lexema = yytext(); volver Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexema = yytext(); volver Op_incremento;}

/*Operadores Booleanos*/
(verdadero | falso) {lexema = yytext(); volver Op_booleano;}

/* Paréntesis de apertura */
( "(" ) {lexema=yytext(); return Parentesis_a;}

/* Paréntesis de cierre */
( ")" ) {lexema=yytext(); volver Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexema=yytext(); volver Llave_a;}

/* Llave de cierre */
( "}" ) {lexema=yytext(); volver Llave_c;}

/* Corchete de apertura */
( "[" ) {lexema = yytext(); volver Corchete_a;}

/* corchete de cierre */
( "]" ) {lexema = yytext(); volver Corchete_c;}

/* Marcador de inicio de algoritmo */
( "principal" ) {lexema=yytext(); volver Principal;}

/*Punto y coma*/
( ";" ) {lexema=yytext(); devolver P_coma;}

/*Identificador*/
{L}({L}|{D})* {lexema=yytext(); volver Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexema=yytext(); volver Número;}

/* Error de analisis */
 . {retornar ERROR;}