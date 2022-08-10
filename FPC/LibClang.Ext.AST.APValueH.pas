unit LibClang.Ext.AST.APValueH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  APValue = type Pointer;
  PAPValue = ^APValue;

  APValue_TypeInfoLValue = type Pointer;
  APValue_DynamicAllocLValue = type Pointer;

  APValue_LValueBase = type Pointer;

  APValue_ValueKind = type Integer;

  { APValue_ValueKind_Helper }

  APValue_ValueKind_Helper = type helper for APValue_ValueKind
  public const
    // There is no such object (it's outside its lifetime).
    None = 0;
    // This object has an indeterminate value (C++ [basic.indet]).
    Indeterminate = 1;
    Int = 2;
    Float = 3;
    FixedPoint = 4;
    ComplexInt = 5;
    ComplexFloat = 6;
    LValue = 7;
    Vector = 8;
    Array_ = 9;
    Struct = 10;
    Union = 11;
    MemberPointer = 12;
    AddrLabelDiff = 13;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  APValue_LValuePathEntry = type Pointer;

implementation

uses
  SysUtils;

{ APValue_ValueKind_Helper }

function APValue_ValueKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function APValue_ValueKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    None          : Result := 'None';
    Indeterminate : Result := 'Indeterminate';
    Int           : Result := 'Int';
    Float         : Result := 'Float';
    FixedPoint    : Result := 'FixedPoint';
    ComplexInt    : Result := 'ComplexInt';
    ComplexFloat  : Result := 'ComplexFloat';
    LValue        : Result := 'LValue';
    Vector        : Result := 'Vector';
    Array_        : Result := 'Array';
    Struct        : Result := 'Struct';
    Union         : Result := 'Union';
    MemberPointer : Result := 'MemberPointer';
    AddrLabelDiff : Result := 'AddrLabelDiff';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

