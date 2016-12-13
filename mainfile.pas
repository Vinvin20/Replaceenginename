program lecteur_de_fichier_pgn;

{$mode objfpc}

uses crt,sysutils;

{type t1=record
     car:char;
     end;    }

var fpgn,frempl,foutpgn,deleteng,fparam:textfile;
    lpgn,alpgn,derlpgn,lrempl,nom,tempnom,lparam:string;
    fin:string[5];
    tempnbr,bourech1,bourech2,ntitre,emp,nblect,nbwh,ind,bou,nbrempl
      ,nbpart,nbnom,indbou,trouv,compt1, valrech,avalrech,nblgn:longint;
    rempsour,rempdest,nomeng,rechnom:array [0..20000] of string;
    nbpartnom,nbrechnom:array [0..20000] of longint;
    nomfi:array [0..4] of string;
    c:char;
    finfic,aff,finrempl:boolean;


procedure initfic;
begin
  clrscr;
 { AssignFile(fpgn,'g:\ratinglist\2012janvier\lentrapide\tout2.pgn'); }
{  AssignFile(fpgn,'g:\ratinglist\2012janvier\lentrapide\cwar.pgn'); }
  AssignFile(fpgn,nomfi[1]);
  AssignFile(foutpgn,nomfi[2]);
  AssignFile(frempl,nomfi[3]);
  AssignFile(deleteng,nomfi[4]);
  writeln('assignfile ok');


  { AssignFile(fpgn,'g:\ratinglist\2012janvier\ccw.pgn');
  AssignFile(foutpgn,'g:\ratinglist\2012janvier\remplout.pgn');
  AssignFile(frempl,'g:\ratinglist\2012janvier\modif2.txt');   }

 { AssignFile(fpgn,'g:\ratinglist\newlist\rapid.pgn');
  AssignFile(foutpgn,'g:\ratinglist\newlist\remplout.pgn');
  AssignFile(frempl,'g:\ratinglist\newlist\modif3.txt');}
  reset(fpgn);
  reset(frempl);
  rewrite(foutpgn);
  rewrite(deleteng);
  end;

procedure initrempl;
begin
  ind:=0;
  repeat
   inc(ind);
   readln(frempl,lrempl);
   rempsour[ind]:=lrempl;
   readln(frempl,lrempl);
   rempdest[ind]:=lrempl;
   readln(frempl,lrempl);
  if ind>400 then writeln (ind, ' ' , AnsiQuotedStr(rempsour[ind], '|'), ' -> ', AnsiQuotedStr(rempdest[ind], '|'));
 {  writeln(lrempl, '  ',AnsiQuotedStr(lrempl, '|' ));}
   if  eof (frempl) then finrempl:=true;
  until finrempl;
  writeln;writeln; writeln;
  clrscr;
  close (frempl);

   end;

procedure lireficparam;
begin
   AssignFile(fparam,paramstr(1));
   reset(fparam);
   for bou:=1 to 4 do begin
     readln(fparam,lparam);
     writeln (bou, ' : ',lparam);{readln;}
     nomfi[bou]:=lparam;
     end;
  { readln;   }
end;


procedure init;
begin
WriteLn('Program name : ', ParamStr(0));
writeln ('nb param : ' , paramcount);
for bou := 1 to ParamCount do
WriteLn('Param ', bou , ' : ', ParamStr(bou));
lireficparam;
writeln('fin lireficparam');
initfic;
initrempl;
lpgn:='';
end;

procedure lect;
begin
   readln(fpgn,lpgn);
   inc(nblect);
 {  if nblect > 0 then writeln(nbpart,' ',leftstr(lpgn,60));
   if (((nblect mod 50) = 0) and (nblect>0)) then readln;  }
  { if nblect mod 100000 = 0 then write('*'); ('nblect : ', nblect,' ');}
   if  eof (fpgn) then finfic:=true;
   end;

{procedure traitnom;
begin
for bou:=1 to ind do StringReplace(lpgn,rempsour[bou],rempdest[bou],[rfReplaceAll]);
end;     }

procedure fermer;
begin
   close (fpgn);close(foutpgn); close(deleteng); close (frempl);
   end;


Begin
init;

repeat
   lect;
   if ((leftstr(lpgn , 8) = '[White "') or (leftstr(lpgn , 8) = '[Black "'))
    then begin  alpgn:=lpgn;
                for bou:=1 to ind do lpgn:=StringReplace(lpgn,rempsour[bou],rempdest[bou],[rfReplaceAll]);
              { enrgnom;  }
               inc(nbpart);
               if nbpart mod 17177= 0 then
                     begin
                    { gotoxy (10,42);}
                    { writeln;}
                     writeln ('nbpart:',nbpart div 2,'  nblgn:',nblect);

                     end;
               if (alpgn<>lpgn) then
                 begin inc(nbrempl);
                     {  writeln(foutpgn, lpgn); }
                       if nbrempl mod 5000 = 0 then writeln('nbrempl:',nbrempl,' ',copy(alpgn,9,(LastDelimiter(']',alpgn)-10)),'>',copy(lpgn,9,(LastDelimiter(']',lpgn)-10)));
                 end;
         end;


   { then begin  inc(nbwh);
                joublan:=copy(lpgn,9,(LastDelimiter(']',lpgn)-10));
                if (nbwh mod 10000) = 0 then writeln (nblect,' ',nbwh, ' ',joublan)
         end  ;    }
     writeln(foutpgn, lpgn);
 until ((nblect>100000000) or (finfic));
fermer;
writeln;
write ('- nbpart:',nbpart div 2,'  nblgn:',nblect,'  Nb eng:',nbnom,' -');
 writeln ('END !!!');
end.
