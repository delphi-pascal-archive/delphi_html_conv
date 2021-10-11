unit DelphiToHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDelphiToHTML = class(TObject)
  private
    ReservList: TStringList; // Список зарезервированных слов
    DelphiList: TStringList;
    HTMLList: TStringList;
    DelimSet: set of char;
    
    // Здесь вы можете включать недостающие резервные слова.
    // но помните, что некоторые резервные слова имеют смысл
    // только в определенные местах кода (например, write).
    // Подобные резервные слова в список добавлять не стоит
    procedure LoadReservList;
    procedure ReplaceText(CharNum: Integer; OldText, NewText: string;
      var Text: string);
    function GetWord(nByte: Integer; S: string): string;
    function IsReservWord(S: string): Boolean;
    function IsValue(S: string): Boolean;
  public
    {с буквы B начинается открывающий тэг, с буквы E - закрывающий тэг}
    Bcom, Ecom, // Комментарии
    Bres, Eres, // Зарезирвированные слова
    Bnum, Enum, // Числа
    Bstr, Estr, // Строки
    Bdir, Edir // Директивы компилятора
    : string;
  public
    constructor Create(); overload;
    destructor Destroy(); override;
    function Convert(DelphiText: string; GenHTMLPage: Boolean = False): string;
  published
  end;


implementation

{ TDelphiToHTML }

function TDelphiToHTML.Convert(DelphiText: string;
  GenHTMLPage: Boolean = False): string;
var
  I, J, C: Integer;
  S: string;
  Str: string;
  IsCom, IsCom1, IsDir, IsDir1, IsStr: Boolean;
begin
  HTMLList.Clear;
  if GenHTMLPage then begin
    HTMLList.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
    HTMLList.Add('<html>');
    HTMLList.Add('<head>');
    HTMLList.Add('<title> New Document </title>');
    HTMLList.Add('<meta name="Generator" content="MatrixHelpProducer">');
    HTMLList.Add(' <meta content="text/html; charset=windows-1251"' +
      ' http-equiv="content-type">');
    HTMLList.Add('</head>');
    HTMLList.Add('<body>');
  end;
  HTMLList.Add('<pre>');
  DelphiList.Text := DelphiText;
  if DelphiList.Count = 0 then Exit;

  IsCom := False; // Комментарий
  IsCom1 := False;
  IsDir := False; // Директива компилятора
  IsDir1 := False;
  for I := 0 to DelphiList.Count - 1 do begin
    S := DelphiList[I];
    // Заменяем символы < > на &lt; &gt;
    while Pos('<', S) > 0 do ReplaceText(Pos('<', S), '<', '&lt;', S);
    while Pos('>', S) > 0 do ReplaceText(Pos('>', S), '>', '&gt;', S);
    J := 0;
    IsStr := False; // Строка
    while J < Length(S) do begin
      Inc(J);
      // Если директива компилятора {$...}
      if (S[J] = '{') and (S[J + 1] = '$') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsDir := True;
        Insert(Bdir, S, J);
        Inc(J, Length(Bdir) + 1);
        Continue;
      end;
      if (S[J] = '}') and Isdir then begin
        IsDir := False;
        Insert(Edir, S, J + 1);
        Inc(J, Length(Edir));
        Continue;
      end;
      // Если директива компилятора {(*$...*)}
      if (S[J] = '(') and (S[J + 1] = '*') and (S[J + 2] = '$') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsDir1 := True;
        Insert(Bdir, S, J);
        Inc(J, Length(Bdir) + 2);
        Continue;
      end;
      if (S[J] = '*') and (S[J + 1] = ')') and IsDir1 then begin
        IsDir1 := False;
        Insert(Edir, S, J + 2);
        Inc(J, Length(Edir) + 1);
        Continue;
      end;

      // Если ограничивающие коментарии {...}
      if (S[J] = '{') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then
        begin
        IsCom := True;
        Insert(Bcom, S, J);
        Inc(J, Length(Bcom));
        Continue;
      end;
      if (S[J] = '}') and IsCom then begin
        IsCom := False;
        Insert(Ecom, S, J + 1);
        Inc(J, Length(Ecom));
        Continue;
      end;
      // Если ограничивающие коментарии (*...*)
      if (S[J] = '(') and (S[J + 1] = '*') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        IsCom1 := True;
        Insert(Bcom, S, J);
        Inc(J, Length(Bcom) + 1);
        Continue;
      end;
      if (S[J] = '*') and (S[J + 1] = ')') and IsCom1 then begin
        IsCom1 := False;
        Insert(Ecom, S, J + 2);
        Inc(J, Length(Ecom) + 1);
        Continue;
      end;
      // Если идет строка текста '...'
      if (S[J] = '''') and not (IsCom or IsDir or IsStr or IsCom1 or IsDir1)
        then begin
        IsStr := True;
        Insert(Bstr, S, J);
        Inc(J, Length(Bstr));
        Continue;
      end;
      if (S[J] = '''') and IsStr then begin
        IsStr := False;
        Insert(Estr, S, J + 1);
        Inc(J, Length(Estr));
        Continue;
      end;
      // Если комментарий // ...
      if (S[J] = '/') and (S[J + 1] = '/') and
        not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) then begin
        Insert(Bcom, S, J);
        Insert(Ecom, S, Length(S) + 1);
        Break;
      end;

      // Выделяем жирным шрифтом основные слова
      if not (IsCom or IsDir or IsStr or IsCom1 or IsDir1) and
        (((S[J] in DelimSet) and not (S[J + 1] in DelimSet)) or
        ((J = 1) and not (S[J] in DelimSet))) then begin
        if (J = 1) and not (S[J] in DelimSet) then C := 1 else C := J + 1;
        Str := GetWord(C, S);
        if IsReservWord(Str) then begin
          // Выделяем жирным шрифтом
          Insert(Bres, S, C);
          C := C + Length(Bres + Str);
          Insert(Eres, S, C);
          J := C + Length(Eres) - 1;
          Continue;
        end;
        if IsValue(Str) then begin
          // Выделяем
          Insert(Bnum, S, C);
          C := C + Length(Bnum + Str);
          Insert(Enum, S, C);
          J := C + Length(Enum) - 1;
          Continue;
        end;

      end;
    end;
    HTMLList.Add(S);
  end;
  HTMLList.Add('</pre>');
  if GenHTMLPage then begin
    HTMLList.Add('</body>');
    HTMLList.Add('</html>');

  end;
  Result := HTMLList.Text;
end;

constructor TDelphiToHTML.Create;
begin
  ReservList := TStringList.Create;
  DelphiList := TStringList.Create;
  HTMLList := TStringList.Create;
  LoadReservList(); // Загружаем зарезервированные слова
  // Используемые разделители:
  DelimSet := [',', ';', ':', '=', '+', '-', '*', '/', ' ', '''', '@', '(', ')',
    '[', ']'];
  //Bcom, Ecom, Bres, Eres, Bnum, Enum, Bstr, Estr.
  Bcom := '<i style="color: navy;">'; Ecom := '</i>'; // Комментарии
  Bres := '<b>'; ERes := '</b>'; // Зарезервированные слова
  Bnum := '<span style="color: navy;">'; Enum := '</span>'; // Числа
  Bstr := '<span style="color: navy;">'; Estr := '</span>'; // Строки
  Bdir := '<span style="color: green;">'; Edir := '</span>';
end;

destructor TDelphiToHTML.Destroy;
begin
  ReservList.Free;
  DelphiList.Free;
  HTMLList.Free;
  inherited Destroy;
end;

function TDelphiToHTML.GetWord(nByte: Integer; S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := nByte to Length(S) do
    if (S[I] in DelimSet) then Exit else Result := Result + S[I];
end;

function TDelphiToHTML.IsReservWord(S: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  S := AnsiLowerCase(S);
  for I := 0 to ReservList.Count - 1 do
    if ReservList[I] = S then begin Result := True; Exit; end;
end;

function TDelphiToHTML.IsValue(S: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  if S = '' then Exit;
  if S = '.' then Exit;
  if not (S[1] in ['0'..'9', '$', '#', '.']) then Exit;

  if Length(S) = 1 then begin Result := True; Exit; end;

  for I := 2 to length(S) do
    if not (S[I] in ['0'..'9', '$', '#', '.', 'a'..'f', 'A'..'F']) then Exit;
  Result := True;
end;

procedure TDelphiToHTML.LoadReservList;
begin
  with ReservList do begin
    Add('constructor'); Add('string');
    Add('destructor'); Add('uses');
    Add('inherited'); Add('var');
    Add('begin'); Add('type');
    Add('end'); Add('class');
    Add('if'); Add('record');
    Add('then'); Add('array');
    Add('else'); Add('of');
    Add('with'); Add('set');
    Add('do'); Add('in');
    Add('for'); Add('out');
    Add('to'); Add('case');
    Add('while'); Add('until');
    Add('repeat'); Add('end.');
    Add('downto'); Add('private');
    Add('stdcall'); Add('public');
    Add('overload'); Add('published');
    Add('override'); Add('procedure');
    Add('unit'); Add('function');
    Add('interface'); Add('try');
    Add('implementation'); Add('except');
    Add('property'); Add('virtual'); 
    Add('const'); Add('asm');
    Add('initialization'); Add('finalization');
    Add('packed'); Add('nil');
    Add('finally');
    Add('or'); Add('and'); Add('not');
    Add('mod'); Add('div'); Add('shr');
    Add('shl');
  end;
end;

procedure TDelphiToHTML.ReplaceText(CharNum: Integer; OldText,
  NewText: string; var Text: string);
begin
  Delete(Text, CharNum, Length(OldText));
  Insert(NewText, Text, CharNum);
end;

end.

