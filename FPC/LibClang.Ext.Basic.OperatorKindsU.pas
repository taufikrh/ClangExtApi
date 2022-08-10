unit LibClang.Ext.Basic.OperatorKindsU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.Basic.OperatorKindsH
  ;

function clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindLength(): Integer; cdecl; external LibClang_dll;
function clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindName(i: OverloadedOperatorKind): CXString; cdecl; external LibClang_dll;
//
function clangExt_OverloadedOperatorKind_getOperatorSpelling(Operator_: OverloadedOperatorKind): PChar; cdecl; external LibClang_dll;
function clangExt_OverloadedOperatorKind_getRewrittenOverloadedOperator(Kind: OverloadedOperatorKind): OverloadedOperatorKind; cdecl; external LibClang_dll;
function clangExt_OverloadedOperatorKind_isCompoundAssignmentOperator(Kind: OverloadedOperatorKind): Boolean; cdecl; external LibClang_dll;

implementation

end.

