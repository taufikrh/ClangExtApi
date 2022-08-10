unit LibClang.CXString;

{$mode ObjFPC}{$H+}   
{$modeswitch advancedrecords}     
{$modeswitch typehelpers}
{$PACKRECORDS C}
{$minenumsize 4}

interface

uses
  LibClang.Base;

type
  CXStringFlag = type Cardinal;

  CXStringFlagHelper = type helper for CXStringFlag
  public const
    /// CXString contains a 'const char *' that it doesn't own.
    CXS_Unmanaged = 0;

    /// CXString contains a 'const char *' that it allocated with malloc().
    CXS_Malloc = 1;

    /// CXString contains a CXStringBuf that needs to be returned to the
    /// CXStringPool.
    CXS_StringBuf = 2;
  end;

  {
  A character string.

  The CXString type is used to return strings from the interface when
  the ownership of that string might differ from one call to the next.
  Use clang_getCString() to retrieve the string data and, once finished
  with the string data, call clang_disposeString() to free the string.
  }

  { CXString }

  CXString = record
    data: Pointer;
    private_flags: CXStringFlag;
  public
    function GetString: string;
    function ToString: string;
    procedure disposeString;
    class function CreateEmpty: CXString; static;    
    class function CreateNull: CXString; static;
    class function CreateRef(s: string): CXString; static;
  end;
  PCXString = ^CXString;

  CXStringSet = record
    Strings: PCXString;
    Count: Cardinal;
  end;
  PCXStringSet = ^CXStringSet;

  {
  Retrieve the character data associated with the given string.
  }
  function clang_getCString(
    string_: CXString
    ): PChar; cdecl; external LibClang_dll;

  {
  Free the given string.
  }
  procedure clang_disposeString(
    string_: CXString
    ); cdecl; external LibClang_dll;

  {
  Free the given string set.
  }
  procedure clang_disposeStringSet(
    set_: PCXStringSet
    ); cdecl; external LibClang_dll;

implementation

uses
  SysUtils;

{ CXString }

function CXString.GetString: string;
var
  p: PChar;
begin
  p := clang_getCString(Self);
  if Assigned(p) then
    Result := StrPas(p)
  else
    Result := EmptyStr;
end;

function CXString.ToString: string;
begin
  Result := GetString;
  clang_disposeString(Self);
end;

procedure CXString.disposeString;
begin
  clang_disposeString(Self);
end;

class function CXString.CreateEmpty: CXString;
begin
  Result := Default(CXString);
  Result.data := PChar(EmptyStr);
  Result.private_flags := CXStringFlag.CXS_Unmanaged;
end;

class function CXString.CreateNull: CXString;
begin
  Result := Default(CXString);
  Result.data := nil;
  Result.private_flags := CXStringFlag.CXS_Unmanaged;
end;

class function CXString.CreateRef(s: string): CXString;
begin
  Result := Default(CXString);
  Result.data := PChar(s);
  Result.private_flags := CXStringFlag.CXS_Unmanaged;
end;

end.

