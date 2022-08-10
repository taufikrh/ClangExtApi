unit LibClang.Ext.AST.ASTContextU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.Index,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ASTContextH;

// clang_PrintingPolicy_dispose
function clangExt_ASTContext_getPrintingPolicy(const C: ASTContext): CXPrintingPolicy; cdecl; external LibClang_dll;
function clangExt_ASTContext_getAttributedType(const C: ASTContext; attrKind: CX_AttrKind; const modifiedType: CXQualType; const equivalentType: CXQualType): CXQualType; cdecl; external LibClang_dll;

implementation

end.

