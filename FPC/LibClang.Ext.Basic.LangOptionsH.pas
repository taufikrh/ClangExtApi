unit LibClang.Ext.Basic.LangOptionsH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  LangOptions = type Pointer;

  MSVtorDispMode = type Integer;

  { MSVtorDispModeHelper }

  MSVtorDispModeHelper = type helper for MSVtorDispMode
  public const
    Never = 0;
    ForVBaseOverride = 1;
    ForVFTable = 2;   
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  FPOptionsOverride = type UInt32;
  FPOptions = type UInt16;

implementation

uses
  SysUtils;

{ MSVtorDispModeHelper }

function MSVtorDispModeHelper.Value: Integer;
begin
  Result := Self;
end;

function MSVtorDispModeHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    Never: Result := 'Never';
    ForVBaseOverride: Result := 'ForVBaseOverride';
    ForVFTable: Result := 'ForVFTable';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

