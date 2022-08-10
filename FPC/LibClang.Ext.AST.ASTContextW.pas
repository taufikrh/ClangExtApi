unit LibClang.Ext.AST.ASTContextW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.ASTContextU;

type

  { ASTContextHelper }

  ASTContextHelper = type helper for ASTContext
    // clang_PrintingPolicy_dispose
    function getPrintingPolicy: CXPrintingPolicy;
    function getAttributedType(attrKind: CX_AttrKind; const modifiedType: CXQualType; const equivalentType: CXQualType): CXQualType;
  end;

implementation

{ ASTContextHelper }

function ASTContextHelper.getPrintingPolicy: CXPrintingPolicy;
begin
  Result := clangExt_ASTContext_getPrintingPolicy(Self);
end;

function ASTContextHelper.getAttributedType(attrKind: CX_AttrKind;
  const modifiedType: CXQualType; const equivalentType: CXQualType): CXQualType;
begin
  Result := clangExt_ASTContext_getAttributedType(Self, attrKind, modifiedType, equivalentType);
end;

end.

