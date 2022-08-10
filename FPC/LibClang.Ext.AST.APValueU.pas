unit LibClang.Ext.AST.APValueU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.llvm.ADT.APSIntH,
  LibClang.Ext.llvm.ADT.APFloatH,
  LibClang.Ext.llvm.ADT.APFixedPointH,
  LibClang.Ext.AST.CharUnitsH,
  LibClang.Ext.AST.ExprH;

{$region 'APValue_LValueBase'}
procedure clangExt_APValue_LValueBase_Dispose(a: APValue_LValueBase); cdecl; external LibClang_dll;
//
function clangExt_APValue_LValueBase_is_ValueDecl(const a: APValue_LValueBase): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_is_Expr(const a: APValue_LValueBase): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_is_TypeInfoLValue(const a: APValue_LValueBase): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_is_DynamicAllocLValue(const a: APValue_LValueBase): Boolean; cdecl; external LibClang_dll;
//
function clangExt_APValue_LValueBase_get_ValueDecl(const a: APValue_LValueBase): ValueDecl; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_get_Expr(const a: APValue_LValueBase): Expr; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_get_TypeInfoLValue(const a: APValue_LValueBase): APValue_TypeInfoLValue; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_get_DynamicAllocLValue(const a: APValue_LValueBase): APValue_DynamicAllocLValue; cdecl; external LibClang_dll;
//
function clangExt_APValue_LValueBase_dyn_cast_ValueDecl(const a: APValue_LValueBase): ValueDecl; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_dyn_cast_Expr(const a: APValue_LValueBase): Expr; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_dyn_cast_TypeInfoLValue(const a: APValue_LValueBase): APValue_TypeInfoLValue; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_dyn_cast_DynamicAllocLValue(const a: APValue_LValueBase): APValue_DynamicAllocLValue; cdecl; external LibClang_dll;
//
function clangExt_APValue_LValueBase_getOpaqueValue(const a: APValue_LValueBase): Pointer; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_isNull(const a: APValue_LValueBase): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_getCallIndex(const a: APValue_LValueBase): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_getVersion(const a: APValue_LValueBase): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_getTypeInfoType(const a: APValue_LValueBase): CXQualType; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_getDynamicAllocType(const a: APValue_LValueBase): CXQualType; cdecl; external LibClang_dll;
function clangExt_APValue_LValueBase_getType(const a: APValue_LValueBase): CXQualType; cdecl; external LibClang_dll;
{$endregion 'APValue_LValueBase'}
                                                                  
{$region 'APValue'}
procedure clangExt_APValue_Dispose(a: APValue); cdecl; external LibClang_dll;
//
function clangExt_APValue_needsCleanup(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_getKind(const a: APValue): APValue_ValueKind; cdecl; external LibClang_dll;
function clangExt_APValue_isAbsent(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isIndeterminate(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_hasValue(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isInt(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isFloat(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isFixedPoint(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isComplexInt(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isComplexFloat(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isLValue(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isVector(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isArray(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isStruct(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isUnion(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isMemberPointer(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_isAddrLabelDiff(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_dump(const a: APValue; const Context: ASTContext): CXString; cdecl; external LibClang_dll;

function clangExt_APValue_printPretty(const a: APValue; const Ctx: ASTContext; const Ty: CXQualType): CXString; cdecl; external LibClang_dll;
function clangExt_APValue_printPretty2(const a: APValue; const Policy: CXPrintingPolicy; const Ty: CXQualType; const Ctx: ASTContext = nil): CXString; cdecl; external LibClang_dll;
function clangExt_APValue_getAsString(const a: APValue; const Ctx: ASTContext; Ty: CXQualType): CXString; cdecl; external LibClang_dll;
function clangExt_APValue_getInt(const a: APValue): APSInt; cdecl; external LibClang_dll;
function clangExt_APValue_getFloat(const a: APValue): APFloat; cdecl; external LibClang_dll;
function clangExt_APValue_getFixedPoint(const a: APValue): APFixedPoint; cdecl; external LibClang_dll;
function clangExt_APValue_getComplexIntReal(const a: APValue): APSInt; cdecl; external LibClang_dll;
function clangExt_APValue_getComplexIntImag(const a: APValue): APSInt; cdecl; external LibClang_dll;
function clangExt_APValue_getComplexFloatReal(const a: APValue): APFloat; cdecl; external LibClang_dll;
function clangExt_APValue_getComplexFloatImag(const a: APValue): APFloat; cdecl; external LibClang_dll;
function clangExt_APValue_getLValueBase(const a: APValue): APValue_LValueBase; cdecl; external LibClang_dll; // dispose: clangExt_APValue_LValueBase_Dispose
function clangExt_APValue_getLValueOffset(const a: APValue): CharUnits; cdecl; external LibClang_dll;
function clangExt_APValue_isLValueOnePastTheEnd(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_hasLValuePath(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_getNumLValuePath(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getLValuePath(const a: APValue; i: Cardinal): APValue_LValuePathEntry; cdecl; external LibClang_dll;
function clangExt_APValue_getLValueCallIndex(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getLValueVersion(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_isNullPointer(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_getVectorElt(const a: APValue; I: Cardinal): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_getVectorLength(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getArrayInitializedElt(const a: APValue; I: Cardinal): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_hasArrayFiller(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_getArrayFiller(const a: APValue): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_getArrayInitializedElts(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getArraySize(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getStructNumBases(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getStructNumFields(const a: APValue): Cardinal; cdecl; external LibClang_dll;
function clangExt_APValue_getStructBase(const a: APValue; i: Cardinal): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_getStructField(const a: APValue; i: Cardinal): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_getUnionField(const a: APValue): FieldDecl; cdecl; external LibClang_dll;
function clangExt_APValue_getUnionValue(const a: APValue): APValue; cdecl; external LibClang_dll;
function clangExt_APValue_getMemberPointerDecl(const a: APValue): ValueDecl; cdecl; external LibClang_dll;
function clangExt_APValue_isMemberPointerToDerivedMember(const a: APValue): Boolean; cdecl; external LibClang_dll;
function clangExt_APValue_getAddrLabelDiffLHS(const a: APValue): AddrLabelExpr; cdecl; external LibClang_dll;
function clangExt_APValue_getAddrLabelDiffRHS(const a: APValue): AddrLabelExpr; cdecl; external LibClang_dll;
{$endregion 'APValue'}

implementation

end.

