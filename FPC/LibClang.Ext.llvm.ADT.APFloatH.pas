unit LibClang.Ext.llvm.ADT.APFloatH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  APFloatBase = type Pointer;
  APFloat = type APFloatBase;

  APFloatBase_fltCategory = type Integer;

  { APFloatBase_fltCategory_Helper }

  APFloatBase_fltCategory_Helper = type helper for APFloatBase_fltCategory
  public const
    fcInfinity = 0;
    fcNaN = 1;
    fcNormal = 2;
    fcZero = 3;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

implementation

uses
  SysUtils;

{ APFloatBase_fltCategory_Helper }

function APFloatBase_fltCategory_Helper.Value: Integer;
begin
  Result := Self;
end;

function APFloatBase_fltCategory_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    fcInfinity: Result := 'Infinity';
    fcNaN: Result := 'NaN';
    fcNormal: Result := 'Normal';
    fcZero: Result := 'Zero';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

