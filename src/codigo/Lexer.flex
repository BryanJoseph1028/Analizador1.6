package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens

L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
end_if|
print|
begin|
end|
while {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"#".* {/*Ignore*/}
"\n" {return Linea;}
"=" {return Asignacion;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
">=" {lexeme=yytext(); return MayorIgual;}
"<=" {lexeme=yytext(); return MenorIgual;}
">" {lexeme=yytext(); return MayorQue;}
"<" {lexeme=yytext(); return MenorQue;}
"==" {lexeme=yytext(); return Comparador;}
"(" {lexeme=yytext(); return Parentesis_abren;}
")" {lexeme=yytext(); return Parentesis_cierran;}
"," {lexeme=yytext(); return Coma;}
";" {lexeme=yytext(); return PuntoComa;}


{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}



 . {return ERROR;}
