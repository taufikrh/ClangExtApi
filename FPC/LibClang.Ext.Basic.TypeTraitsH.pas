unit LibClang.Ext.Basic.TypeTraitsH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  TypeTrait = type Integer;

  { TypeTraitHelper }

  TypeTraitHelper = type helper for TypeTrait
  public const
    {$i TypeTrait_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  ArrayTypeTrait = type Integer;

  { ArrayTypeTraitHelper }

  ArrayTypeTraitHelper = type helper for ArrayTypeTrait
  public const
    {$i ArrayTypeTrait_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  UnaryExprOrTypeTrait = type Integer;

  { UnaryExprOrTypeTraitHelper }

  UnaryExprOrTypeTraitHelper = type helper for UnaryExprOrTypeTrait
  public const
    {$i UnaryExprOrTypeTrait_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

implementation

uses
  SysUtils;

{ TypeTraitHelper }

function TypeTraitHelper.Value: Integer;
begin
  Result := Self;
end;

function TypeTraitHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i TypeTrait_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ ArrayTypeTraitHelper }

function ArrayTypeTraitHelper.Value: Integer;
begin
  Result := Self;
end;

function ArrayTypeTraitHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i ArrayTypeTrait_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ UnaryExprOrTypeTraitHelper }

function UnaryExprOrTypeTraitHelper.Value: Integer;
begin
  Result := Self;
end;

function UnaryExprOrTypeTraitHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i UnaryExprOrTypeTrait_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

