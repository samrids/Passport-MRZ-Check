unit PassMRZChk;

interface

implementation

function CheckPassportDigit(const PassportStr: string): byte;
const
  Weight: array [0 .. 2] of byte = (1, 7, 3);
  //
  function GetChrProductXWeight(DigitChr: Char; const Idx: byte): byte;
  begin
    DigitChr := UpCase(DigitChr);
    case DigitChr of
      '<':
        Result := 0;
      '0' .. '9':
        Result := (Ord(DigitChr) - 48);
      'A' .. 'Z':
        Result := (Ord(DigitChr) - 65) + 10;
    else
      Result := 0;
    end;
    Result := Result * Weight[(Idx mod 3)];
  end;

var
  i: byte;
  ProductXWeight: byte;
  Sum: Word;
begin
  Sum := 0;
  if Length(PassportStr) = 0 then
    exit(0);
  for i := 1 to Length(PassportStr) do
  begin
    ProductXWeight := GetChrProductXWeight(PassportStr[i], (i mod 3));
    Sum := Sum + ProductXWeight;
  end;
  Result := (Sum mod 10);
end;

end.
