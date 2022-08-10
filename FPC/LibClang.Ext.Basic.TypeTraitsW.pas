unit LibClang.Ext.Basic.TypeTraitsW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.Basic.TypeTraitsH,
  LibClang.Ext.Basic.TypeTraitsU
  ;

type

  { TypeTraitHelper2 }

  TypeTraitHelper2 = type helper(TypeTraitHelper) for TypeTrait
  public
    function getTraitName: string;
    function getTraitSpelling: string;
  end;

  { ArrayTypeTraitHelper2 }

  ArrayTypeTraitHelper2 = type helper(ArrayTypeTraitHelper) for ArrayTypeTrait
  public
    function getTraitName: string;
    function getTraitSpelling: string;
  end;

  { UnaryExprOrTypeTraitHelper2 }

  UnaryExprOrTypeTraitHelper2 = type helper(UnaryExprOrTypeTraitHelper) for UnaryExprOrTypeTrait
  public
    function getTraitName: string;
    function getTraitSpelling: string;
  end;

implementation

{ TypeTraitHelper2 }

function TypeTraitHelper2.getTraitName: string;
begin
  Result := StrPas(clangExt_TypeTrait_getTraitName(Self));
end;

function TypeTraitHelper2.getTraitSpelling: string;
begin
  Result := StrPas(clangExt_TypeTrait_getTraitSpelling(Self));
end;

{ ArrayTypeTraitHelper2 }

function ArrayTypeTraitHelper2.getTraitName: string;
begin
  Result := StrPas(clangExt_ArrayTypeTrait_getTraitName(Self));
end;

function ArrayTypeTraitHelper2.getTraitSpelling: string;
begin
  Result := StrPas(clangExt_ArrayTypeTrait_getTraitSpelling(Self));
end;

{ UnaryExprOrTypeTraitHelper2 }

function UnaryExprOrTypeTraitHelper2.getTraitName: string;
begin
  Result := StrPas(clangExt_UnaryExprOrTypeTrait_getTraitName(Self));
end;

function UnaryExprOrTypeTraitHelper2.getTraitSpelling: string;
begin
  Result := StrPas(clangExt_UnaryExprOrTypeTrait_getTraitSpelling(Self));
end;

end.

