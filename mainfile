program lecteur_de_fichier_pgn;

{$mode objfpc}

uses crt,sysutils;

{type t1=record
     car:char;
     end;    }

var fpgn,frempl,foutpgn:textfile;
    lpgn,alpgn,derlpgn,lrempl,nom,tempnom:string;
    fin:string[5];
    tempnbr,bourech1,bourech2,ntitre,emp,nblect,nbwh,ind,bou,nbrempl
      ,nbpart,nbnom,indbou,trouv,compt1, valrech,avalrech:longint;
    rempsour,rempdest,nomeng,rechnom:array [0..20000] of string;
    nbpartnom,nbrechnom:array [0..20000] of longint;
    c:char;
    finfic,aff,finrempl:boolean;


procedure initfic;
begin
  clrscr;
  AssignFile(fpgn,'g:\ratinglist\2012janvier\lentrapide\tout.pgn');
  AssignFile(foutpgn,'g:\ratinglist\2012janvier\lentrapide\remplout.pgn');
  AssignFile(frempl,'g:\ratinglist\2012janvier\lentrapide\modif4.txt');

  { AssignFile(fpgn,'g:\ratinglist\2012janvier\ccw.pgn');
  AssignFile(foutpgn,'g:\ratinglist\2012janvier\remplout.pgn');
  AssignFile(frempl,'g:\ratinglist\2012janvier\modif2.txt');   }

 { AssignFile(fpgn,'g:\ratinglist\newlist\rapid.pgn');
  AssignFile(foutpgn,'g:\ratinglist\newlist\remplout.pgn');
  AssignFile(frempl,'g:\ratinglist\newlist\modif3.txt');}
  reset(fpgn);
  reset(frempl);
  rewrite(foutpgn);
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
  writeln;writeln; writeln;writeln; writeln;writeln;writeln;writeln; writeln;writeln;writeln;
  clrscr;
   end;

procedure init;
begin
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
   close (fpgn);close(foutpgn);
   end;

{procedure top40
begin
for bourech1:=1 to nbnom
 do begin
      if nbpartnom[bourech1] > nbrechnom[0]
        then begin
                nbrechnom[0]:=nbpartnom[bourech1];
                rechnom[0]:=nomeng[bourech1];
                bourech2:=0;
                while ((bourech<40) and (nbrechnom[bourech1]<)
                  do begin
             end;


   do begin if
end;       }

procedure afftop;
begin
clrscr;
valrech:=0;
avalrech:=9999999;

for bourech2:=1 to 36 do begin
  for bourech1:=1 to nbnom do
        if ((nbpartnom[bourech1] > valrech) and  (nbpartnom[bourech1] < avalrech))
                                  then valrech:=nbpartnom[bourech1];

  for bourech1:=1 to nbnom do if nbpartnom[bourech1] = valrech
          then writeln ('     ',bourech2:3,'- ',nomeng[bourech1],' - ',valrech);
  avalrech:=valrech;
  valrech:=0;
end;

end;

procedure enrgnom;
begin
nom:=copy(lpgn,9,(LastDelimiter(']',lpgn)-10));
indbou:=0;
trouv:=0;
while ((indbou<nbnom) and (trouv=0))
do begin
  if nomeng[indbou]=nom then trouv:=1;
{  writeln(indbou,' ',nomeng[indbou],'=?',nom);}
  inc(indbou);
end;
if trouv=0 then begin
                 nomeng[nbnom]:=nom;
               {  write (nom,' '); }
                 inc(nbnom);
                { if nbnom mod 100 = 0 then write('nbnom :',nbnom);  }
                end
            else begin inc(nbpartnom[indbou-1]);
                       if nbpartnom[indbou-1] mod 1000=0 then begin
                                                       { gotoxy(10,37);
                                                        write('|',nomeng[indbou-1], ' ',nbpartnom[indbou-1],' ');}
                                                        inc(compt1);
                                                        { gotoxy(2+((compt1 div 40) mod 2)*40 ,1+(compt1 mod 40));
                                                        write('                                      ');
                                                        gotoxy(2+((compt1 div 40) mod 2)*40 ,1+(compt1 mod 40));
                                                        write('|',nomeng[indbou-1], ' ',nbpartnom[indbou-1],'   ');}
                                                      {  afftop;  }
                                                        end;
                 end;


end;



Begin
init;

repeat
   lect;
   if ((leftstr(lpgn , 8) = '[White "') or (leftstr(lpgn , 8) = '[Black "'))
    then begin for bou:=1 to ind do lpgn:=StringReplace(lpgn,rempsour[bou],rempdest[bou],[rfReplaceAll]);
               enrgnom;
               inc(nbpart);
               if nbpart mod 20000 = 0 then begin {write('*');}
                                                  if nbpart mod 10000 = 0 then begin
                                                                            {    top40;}
                                                                                afftop;
                                                                                gotoxy (10,42);
                                                                                write ('- nbpart:',nbpart div 2,'  nblgn:',nblect,'  Nb eng:',nbnom,' -');

                                                                                end;

                                             end;
             {  if (alpgn<>lpgn) then
                 begin inc(nbrempl);
                       writeln(foutpgn, lpgn);
                       if nbrempl mod 1000 = 0 then write('nb: ',nbrempl,' ',lpgn);
                 end;    }
         end;


   { then begin  inc(nbwh);
                joublan:=copy(lpgn,9,(LastDelimiter(']',lpgn)-10));
                if (nbwh mod 10000) = 0 then writeln (nblect,' ',nbwh, ' ',joublan)
         end  ;    }
     writeln(foutpgn, lpgn);
 until ((nblect>100000000) or (finfic));
fermer;
writeln;writeln; writeln;writeln;writeln;

write ('- nbpart:',nbpart div 2,'  nblgn:',nblect,'  Nb eng:',nbnom,' -');
 writeln ('END !!!');
end.
