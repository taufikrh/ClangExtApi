unit LibClang.Ext.AST.APValueW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.AST.APValueU,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.llvm.ADT.APFloatH,
  LibClang.Ext.llvm.ADT.APFixedPointH,
  LibClang.Ext.AST.CharUnitsH,
  LibClang.Ext.AST.ExprH,

  LibClang.Ext.llvm.ADT.APSIntW;

type

  { APValue_LValueBase_Helper }

  APValue_LValueBase_Helper = type helper for APValue_LValueBase
  public
    procedure Dispose;
  public
    function is_ValueDecl: Boolean;
    function is_Expr: Boolean;
    function is_TypeInfoLValue: Boolean;
    function is_DynamicAllocLValue: Boolean;
    //
    function get_ValueDecl: ValueDecl;
    function get_Expr: Expr;
    function get_TypeInfoLValue: APValue_TypeInfoLValue;
    function get_DynamicAllocLValue: APValue_DynamicAllocLValue;
    //
    function dyn_cast_ValueDecl: ValueDecl;
    function dyn_cast_Expr: Expr;
    function dyn_cast_TypeInfoLValue: APValue_TypeInfoLValue;
    function dyn_cast_DynamicAllocLValue: APValue_DynamicAllocLValue;
    //
    function getOpaqueValue: Pointer;
    function isNull: Boolean;
    function getCallIndex: Cardinal;
    function getVersion: Cardinal;
    function getTypeInfoType: CXQualType;
    function getDynamicAllocType: CXQualType;
    function getType: CXQualType;
  end;

  { APValueHelper }

  APValueHelper = type helper for APValue
  public
    procedure Dispose;
  public
    function needsCleanup: Boolean;
    function getKind: APValue_ValueKind;
    function isAbsent: Boolean;
    function isIndeterminate: Boolean;
    function hasValue: Boolean;
    function isInt: Boolean;
    function isFloat: Boolean;
    function isFixedPoint: Boolean;
    function isComplexInt: Boolean;
    function isComplexFloat: Boolean;
    function isLValue: Boolean;
    function isVector: Boolean;
    function isArray: Boolean;
    function isStruct: Boolean;
    function isUnion: Boolean;
    function isMemberPointer: Boolean;
    function isAddrLabelDiff: Boolean;
    function dump(const Context: ASTContext): string;

    function printPretty(const Ctx: ASTContext; const Ty: CXQualType): string;
    function printPretty2(const Policy: CXPrintingPolicy; const Ty: CXQualType; const Ctx: ASTContext = nil): string;
    function getAsString(const Ctx: ASTContext; const Ty: CXQualType): string;
    function getInt: TAPSIntW;
    function getFloat: APFloat;
    function getFixedPoint: APFixedPoint;
    function getComplexIntReal: TAPSIntW;
    function getComplexIntImag: TAPSIntW;
    function getComplexFloatReal: APFloat;
    function getComplexFloatImag: APFloat;
    // dispose: clangExt_APValue_LValueBase_Dispose
    function getLValueBase: APValue_LValueBase;
    function getLValueOffset: CharUnits;
    function isLValueOnePastTheEnd: Boolean;
    function hasLValuePath: Boolean;
    function getNumLValuePath: Cardinal;
    function getLValuePath(i: Cardinal): APValue_LValuePathEntry;
    function getLValueCallIndex: Cardinal;
    function getLValueVersion: Cardinal;
    function isNullPointer: Boolean;
    function getVectorElt(I: Cardinal): APValue;
    function getVectorLength: Cardinal;
    function getArrayInitializedElt(I: Cardinal): APValue;
    function hasArrayFiller: Boolean;
    function getArrayFiller: APValue;
    function getArrayInitializedElts: Cardinal;
    function getArraySize: Cardinal;
    function getStructNumBases: Cardinal;
    function getStructNumFields: Cardinal;
    function getStructBase(i: Cardinal): APValue;
    function getStructField(i: Cardinal): APValue;
    function getUnionField: FieldDecl;
    function getUnionValue: APValue;
    function getMemberPointerDecl: ValueDecl;
    function isMemberPointerToDerivedMember: Boolean;
    function getAddrLabelDiffLHS: AddrLabelExpr;
    function getAddrLabelDiffRHS: AddrLabelExpr;
  end;

implementation

{ APValue_LValueBase_Helper }

procedure APValue_LValueBase_Helper.Dispose;
begin
  clangExt_APValue_LValueBase_Dispose(Self);
end;

function APValue_LValueBase_Helper.is_ValueDecl: Boolean;
begin
  Result := clangExt_APValue_LValueBase_is_ValueDecl(Self);
end;

function APValue_LValueBase_Helper.is_Expr: Boolean;
begin
  Result := clangExt_APValue_LValueBase_is_Expr(Self);
end;

function APValue_LValueBase_Helper.is_TypeInfoLValue: Boolean;
begin
  Result := clangExt_APValue_LValueBase_is_TypeInfoLValue(Self);
end;

function APValue_LValueBase_Helper.is_DynamicAllocLValue: Boolean;
begin
  Result := clangExt_APValue_LValueBase_is_DynamicAllocLValue(Self);
end;

function APValue_LValueBase_Helper.get_ValueDecl: ValueDecl;
begin
  Result := clangExt_APValue_LValueBase_get_ValueDecl(Self);
end;

function APValue_LValueBase_Helper.get_Expr: Expr;
begin
  Result := clangExt_APValue_LValueBase_get_Expr(Self);
end;

function APValue_LValueBase_Helper.get_TypeInfoLValue: APValue_TypeInfoLValue;
begin
  Result := clangExt_APValue_LValueBase_get_TypeInfoLValue(Self);
end;

function APValue_LValueBase_Helper.get_DynamicAllocLValue: APValue_DynamicAllocLValue;
begin
  Result := clangExt_APValue_LValueBase_get_DynamicAllocLValue(Self);
end;

function APValue_LValueBase_Helper.dyn_cast_ValueDecl: ValueDecl;
begin
  Result := clangExt_APValue_LValueBase_dyn_cast_ValueDecl(Self);
end;

function APValue_LValueBase_Helper.dyn_cast_Expr: Expr;
begin
  Result := clangExt_APValue_LValueBase_dyn_cast_Expr(Self);
end;

function APValue_LValueBase_Helper.dyn_cast_TypeInfoLValue: APValue_TypeInfoLValue;
begin
  Result := clangExt_APValue_LValueBase_dyn_cast_TypeInfoLValue(Self);
end;

function APValue_LValueBase_Helper.dyn_cast_DynamicAllocLValue: APValue_DynamicAllocLValue;
begin
  Result := clangExt_APValue_LValueBase_dyn_cast_DynamicAllocLValue(Self);
end;

function APValue_LValueBase_Helper.getOpaqueValue: Pointer;
begin
  Result := clangExt_APValue_LValueBase_getOpaqueValue(Self);
end;

function APValue_LValueBase_Helper.isNull: Boolean;
begin
  Result := clangExt_APValue_LValueBase_isNull(Self);
end;

function APValue_LValueBase_Helper.getCallIndex: Cardinal;
begin
  Result := clangExt_APValue_LValueBase_getCallIndex(Self);
end;

function APValue_LValueBase_Helper.getVersion: Cardinal;
begin
  Result := clangExt_APValue_LValueBase_getVersion(Self);
end;

function APValue_LValueBase_Helper.getTypeInfoType: CXQualType;
begin
  Result := clangExt_APValue_LValueBase_getTypeInfoType(Self);
end;

function APValue_LValueBase_Helper.getDynamicAllocType: CXQualType;
begin
  Result := clangExt_APValue_LValueBase_getDynamicAllocType(Self);
end;

function APValue_LValueBase_Helper.getType: CXQualType;
begin
  Result := clangExt_APValue_LValueBase_getType(Self);
end;



{ APValueHelper }

procedure APValueHelper.Dispose;
begin
  if Assigned(Self) then
  begin
    clangExt_APValue_Dispose(Self);
    Self := nil;
  end;
end;

function APValueHelper.needsCleanup: Boolean;
begin
  Result := clangExt_APValue_needsCleanup(Self);
end;

function APValueHelper.getKind: APValue_ValueKind;
begin
  Result := clangExt_APValue_getKind(Self);
end;

function APValueHelper.isAbsent: Boolean;
begin
  Result := clangExt_APValue_isAbsent(Self);
end;

function APValueHelper.isIndeterminate: Boolean;
begin
  Result := clangExt_APValue_isIndeterminate(Self);
end;

function APValueHelper.hasValue: Boolean;
begin
  Result := clangExt_APValue_hasValue(Self);
end;

function APValueHelper.isInt: Boolean;
begin
  Result := clangExt_APValue_isInt(Self);
end;

function APValueHelper.isFloat: Boolean;
begin
  Result := clangExt_APValue_isFloat(Self);
end;

function APValueHelper.isFixedPoint: Boolean;
begin
  Result := clangExt_APValue_isFixedPoint(Self);
end;

function APValueHelper.isComplexInt: Boolean;
begin
  Result := clangExt_APValue_isComplexInt(Self);
end;

function APValueHelper.isComplexFloat: Boolean;
begin
  Result := clangExt_APValue_isComplexFloat(Self);
end;

function APValueHelper.isLValue: Boolean;
begin
  Result := clangExt_APValue_isLValue(Self);
end;

function APValueHelper.isVector: Boolean;
begin
  Result := clangExt_APValue_isVector(Self);
end;

function APValueHelper.isArray: Boolean;
begin
  Result := clangExt_APValue_isArray(Self);
end;

function APValueHelper.isStruct: Boolean;
begin
  Result := clangExt_APValue_isStruct(Self);
end;

function APValueHelper.isUnion: Boolean;
begin
  Result := clangExt_APValue_isUnion(Self);
end;

function APValueHelper.isMemberPointer: Boolean;
begin
  Result := clangExt_APValue_isMemberPointer(Self);
end;

function APValueHelper.isAddrLabelDiff: Boolean;
begin
  Result := clangExt_APValue_isAddrLabelDiff(Self);
end;

function APValueHelper.dump(const Context: ASTContext): string;
begin
  Result := clangExt_APValue_dump(Self, Context).ToString;
end;

function APValueHelper.printPretty(const Ctx: ASTContext; const Ty: CXQualType): string;
begin
  Result := clangExt_APValue_printPretty(Self, Ctx, Ty).ToString;
end;

function APValueHelper.printPretty2(const Policy: CXPrintingPolicy; const Ty: CXQualType; const Ctx: ASTContext): string;
begin
  Result := clangExt_APValue_printPretty2(Self, Policy, Ty, Ctx).ToString;
end;

function APValueHelper.getAsString(const Ctx: ASTContext; const Ty: CXQualType): string;
begin
  Result := clangExt_APValue_getAsString(Self, Ctx, Ty).ToString;
end;

function APValueHelper.getInt: TAPSIntW;
begin
  clangExt_APValue_getInt(Self).Wrap(Result);
end;

function APValueHelper.getFloat: APFloat;
begin
  Result := clangExt_APValue_getFloat(Self);
end;

function APValueHelper.getFixedPoint: APFixedPoint;
begin
  Result := clangExt_APValue_getFixedPoint(Self);
end;

function APValueHelper.getComplexIntReal: TAPSIntW;
begin
  clangExt_APValue_getComplexIntReal(Self).Wrap(Result);
end;

function APValueHelper.getComplexIntImag: TAPSIntW;
begin
  clangExt_APValue_getComplexIntImag(Self).Wrap(Result);
end;

function APValueHelper.getComplexFloatReal: APFloat;
begin
  Result := clangExt_APValue_getComplexFloatReal(Self);
end;

function APValueHelper.getComplexFloatImag: APFloat;
begin
  Result := clangExt_APValue_getComplexFloatImag(Self);
end;

function APValueHelper.getLValueBase: APValue_LValueBase;
begin
  Result := clangExt_APValue_getLValueBase(Self);
end;

function APValueHelper.getLValueOffset: CharUnits;
begin
  Result := clangExt_APValue_getLValueOffset(Self);
end;

function APValueHelper.isLValueOnePastTheEnd: Boolean;
begin
  Result := clangExt_APValue_isLValueOnePastTheEnd(Self);
end;

function APValueHelper.hasLValuePath: Boolean;
begin
  Result := clangExt_APValue_hasLValuePath(Self);
end;

function APValueHelper.getNumLValuePath: Cardinal;
begin
  Result := clangExt_APValue_getNumLValuePath(Self);
end;

function APValueHelper.getLValuePath(i: Cardinal): APValue_LValuePathEntry;
begin
  Result := clangExt_APValue_getLValuePath(Self, i);
end;

function APValueHelper.getLValueCallIndex: Cardinal;
begin
  Result := clangExt_APValue_getLValueCallIndex(Self);
end;

function APValueHelper.getLValueVersion: Cardinal;
begin
  Result := clangExt_APValue_getLValueVersion(Self);
end;

function APValueHelper.isNullPointer: Boolean;
begin
  Result := clangExt_APValue_isNullPointer(Self);
end;

function APValueHelper.getVectorElt(I: Cardinal): APValue;
begin
  Result := clangExt_APValue_getVectorElt(Self, I);
end;

function APValueHelper.getVectorLength: Cardinal;
begin
  Result := clangExt_APValue_getVectorLength(Self);
end;

function APValueHelper.getArrayInitializedElt(I: Cardinal): APValue;
begin
  Result := clangExt_APValue_getArrayInitializedElt(Self, I);
end;

function APValueHelper.hasArrayFiller: Boolean;
begin
  Result := clangExt_APValue_hasArrayFiller(Self);
end;

function APValueHelper.getArrayFiller: APValue;
begin
  Result := clangExt_APValue_getArrayFiller(Self);
end;

function APValueHelper.getArrayInitializedElts: Cardinal;
begin
  Result := clangExt_APValue_getArrayInitializedElts(Self);
end;

function APValueHelper.getArraySize: Cardinal;
begin
  Result := clangExt_APValue_getArraySize(Self);
end;

function APValueHelper.getStructNumBases: Cardinal;
begin
  Result := clangExt_APValue_getStructNumBases(Self);
end;

function APValueHelper.getStructNumFields: Cardinal;
begin
  Result := clangExt_APValue_getStructNumFields(Self);
end;

function APValueHelper.getStructBase(i: Cardinal): APValue;
begin
  Result := clangExt_APValue_getStructBase(Self, i);
end;

function APValueHelper.getStructField(i: Cardinal): APValue;
begin
  Result := clangExt_APValue_getStructField(Self, i);
end;

function APValueHelper.getUnionField: FieldDecl;
begin
  Result := clangExt_APValue_getUnionField(Self);
end;

function APValueHelper.getUnionValue: APValue;
begin
  Result := clangExt_APValue_getUnionValue(Self);
end;

function APValueHelper.getMemberPointerDecl: ValueDecl;
begin
  Result := clangExt_APValue_getMemberPointerDecl(Self);
end;

function APValueHelper.isMemberPointerToDerivedMember: Boolean;
begin
  Result := clangExt_APValue_isMemberPointerToDerivedMember(Self);
end;

function APValueHelper.getAddrLabelDiffLHS: AddrLabelExpr;
begin
  Result := clangExt_APValue_getAddrLabelDiffLHS(Self);
end;

function APValueHelper.getAddrLabelDiffRHS: AddrLabelExpr;
begin
  Result := clangExt_APValue_getAddrLabelDiffRHS(Self);
end;

end.

