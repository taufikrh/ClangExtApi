unit LibClang.Ext.Basic.OperatorKindsH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  OverloadedOperatorKind = type Integer;

  { OverloadedOperatorKindHelper }

  OverloadedOperatorKindHelper = type helper for OverloadedOperatorKind
  public const
    {$i 'OverloadedOperatorKind_h.inc'}
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

implementation

uses
  SysUtils;

{ OverloadedOperatorKindHelper }

function OverloadedOperatorKindHelper.Value: Integer;
begin
  Result := Self;
end;

function OverloadedOperatorKindHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    {$i OverloadedOperatorKind_impl.inc}

  else
    Result := 'Unknow';
  end;
  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

