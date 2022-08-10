#ifndef LIB_CLANG_EXT_AST_APVALUE_H
#define LIB_CLANG_EXT_AST_APVALUE_H

#include <clang/AST/Expr.h>
#include <llvm/ADT/APFloat.h>
#include <llvm/ADT/APSInt.h>
#include <clang/AST/APValue.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;
using namespace llvm;

typedef void* APValue_TypeInfoLValue;
typedef void* APValue_DynamicAllocLValue;

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE void clangExt_APValue_LValueBase_Dispose(APValue::LValueBase* a);
//
CINDEX_LINKAGE bool clangExt_APValue_LValueBase_is_ValueDecl(const APValue::LValueBase* a);
CINDEX_LINKAGE bool clangExt_APValue_LValueBase_is_Expr(const APValue::LValueBase* a);
CINDEX_LINKAGE bool clangExt_APValue_LValueBase_is_TypeInfoLValue(const APValue::LValueBase* a);
CINDEX_LINKAGE bool clangExt_APValue_LValueBase_is_DynamicAllocLValue(const APValue::LValueBase* a);
//
CINDEX_LINKAGE const ValueDecl* clangExt_APValue_LValueBase_get_ValueDecl(const APValue::LValueBase* a);
CINDEX_LINKAGE const Expr* clangExt_APValue_LValueBase_get_Expr(const APValue::LValueBase* a);
CINDEX_LINKAGE const APValue_TypeInfoLValue clangExt_APValue_LValueBase_get_TypeInfoLValue(const APValue::LValueBase* a); // TypeInfoLValue
CINDEX_LINKAGE const APValue_DynamicAllocLValue clangExt_APValue_LValueBase_get_DynamicAllocLValue(const APValue::LValueBase* a); // DynamicAllocLValue
//
CINDEX_LINKAGE const ValueDecl* clangExt_APValue_LValueBase_dyn_cast_ValueDecl(const APValue::LValueBase* a);
CINDEX_LINKAGE const Expr* clangExt_APValue_LValueBase_dyn_cast_Expr(const APValue::LValueBase* a);
CINDEX_LINKAGE const APValue_TypeInfoLValue clangExt_APValue_LValueBase_dyn_cast_TypeInfoLValue(const APValue::LValueBase* a); // TypeInfoLValue
CINDEX_LINKAGE const APValue_DynamicAllocLValue clangExt_APValue_LValueBase_dyn_cast_DynamicAllocLValue(const APValue::LValueBase* a); // DynamicAllocLValue
//
CINDEX_LINKAGE const void* clangExt_APValue_LValueBase_getOpaqueValue(const APValue::LValueBase* a);
CINDEX_LINKAGE bool clangExt_APValue_LValueBase_isNull(const APValue::LValueBase* a);
CINDEX_LINKAGE unsigned clangExt_APValue_LValueBase_getCallIndex(const APValue::LValueBase* a);
CINDEX_LINKAGE unsigned clangExt_APValue_LValueBase_getVersion(const APValue::LValueBase* a);
CINDEX_LINKAGE const CXQualType clangExt_APValue_LValueBase_getTypeInfoType(const APValue::LValueBase* a);
CINDEX_LINKAGE const CXQualType clangExt_APValue_LValueBase_getDynamicAllocType(const APValue::LValueBase* a);
CINDEX_LINKAGE const CXQualType clangExt_APValue_LValueBase_getType(const APValue::LValueBase* a);
//=======================================================================================================================
CINDEX_LINKAGE void clangExt_APValue_Dispose(APValue* a);
//
CINDEX_LINKAGE bool clangExt_APValue_needsCleanup(const APValue* a);
CINDEX_LINKAGE APValue::ValueKind clangExt_APValue_getKind(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isAbsent(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isIndeterminate(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_hasValue(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isInt(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isFloat(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isFixedPoint(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isComplexInt(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isComplexFloat(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isLValue(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isVector(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isArray(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isStruct(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isUnion(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isMemberPointer(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isAddrLabelDiff(const APValue* a);
CINDEX_LINKAGE CXString clangExt_APValue_dump(const APValue* a, const ASTContext* Context);
CINDEX_LINKAGE CXString clangExt_APValue_printPretty(const APValue* a, const ASTContext* Ctx, const CXQualType Ty);
CINDEX_LINKAGE CXString clangExt_APValue_printPretty2(const APValue* a, const CXPrintingPolicy Policy, const CXQualType Ty, const ASTContext* Ctx = nullptr);
CINDEX_LINKAGE CXString clangExt_APValue_getAsString(const APValue* a, const ASTContext* Ctx, const CXQualType Ty);
CINDEX_LINKAGE const APSInt* clangExt_APValue_getInt(const APValue* a);
CINDEX_LINKAGE const APFloat* clangExt_APValue_getFloat(const APValue* a);
CINDEX_LINKAGE const APFixedPoint* clangExt_APValue_getFixedPoint(const APValue* a);
CINDEX_LINKAGE const APSInt* clangExt_APValue_getComplexIntReal(const APValue* a);
CINDEX_LINKAGE const APSInt* clangExt_APValue_getComplexIntImag(const APValue* a);
CINDEX_LINKAGE const APFloat* clangExt_APValue_getComplexFloatReal(const APValue* a);
CINDEX_LINKAGE const APFloat* clangExt_APValue_getComplexFloatImag(const APValue* a);
CINDEX_LINKAGE const APValue::LValueBase* clangExt_APValue_getLValueBase(const APValue* a); // dispose: clangExt_APValue_LValueBase_Dispose
CINDEX_LINKAGE const CharUnits* clangExt_APValue_getLValueOffset(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isLValueOnePastTheEnd(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_hasLValuePath(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getNumLValuePath(const APValue* a);
CINDEX_LINKAGE const APValue::LValuePathEntry* clangExt_APValue_getLValuePath(const APValue* a, unsigned i);
CINDEX_LINKAGE unsigned clangExt_APValue_getLValueCallIndex(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getLValueVersion(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isNullPointer(const APValue* a);
CINDEX_LINKAGE const APValue* clangExt_APValue_getVectorElt(const APValue* a, unsigned I);
CINDEX_LINKAGE unsigned clangExt_APValue_getVectorLength(const APValue* a);
CINDEX_LINKAGE const APValue* clangExt_APValue_getArrayInitializedElt(const APValue* a, unsigned I);
CINDEX_LINKAGE bool clangExt_APValue_hasArrayFiller(const APValue* a);
CINDEX_LINKAGE const APValue* clangExt_APValue_getArrayFiller(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getArrayInitializedElts(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getArraySize(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getStructNumBases(const APValue* a);
CINDEX_LINKAGE unsigned clangExt_APValue_getStructNumFields(const APValue* a);
CINDEX_LINKAGE const APValue* clangExt_APValue_getStructBase(const APValue* a, unsigned i);
CINDEX_LINKAGE const APValue* clangExt_APValue_getStructField(const APValue* a, unsigned i);
CINDEX_LINKAGE const FieldDecl* clangExt_APValue_getUnionField(const APValue* a);
CINDEX_LINKAGE const APValue* clangExt_APValue_getUnionValue(const APValue* a);
CINDEX_LINKAGE const ValueDecl* clangExt_APValue_getMemberPointerDecl(const APValue* a);
CINDEX_LINKAGE bool clangExt_APValue_isMemberPointerToDerivedMember(const APValue* a);
CINDEX_LINKAGE const AddrLabelExpr* clangExt_APValue_getAddrLabelDiffLHS(const APValue* a);
CINDEX_LINKAGE const AddrLabelExpr* clangExt_APValue_getAddrLabelDiffRHS(const APValue* a);
//=======================================================================================================================
//=======================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif