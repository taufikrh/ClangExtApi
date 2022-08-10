#ifndef LIB_CLANG_EXT_AST_TYPE_H
#define LIB_CLANG_EXT_AST_TYPE_H

#include <clang/AST/Type.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=======================================================================================================================
// CXType.cpp
CINDEX_LINKAGE const CXQualType clangExt_CXType_GetQualType(CXType CT);
CINDEX_LINKAGE CXTranslationUnit clangExt_CXType_GetTU(CXType CT);
CINDEX_LINKAGE int clangExt_CXType_getNumArgTypes(CXType CT);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasConst(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasOnlyConst(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withConst(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasVolatile(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasOnlyVolatile(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withVolatile(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasRestrict(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasOnlyRestrict(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withRestrict(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasCVRQualifiers(CXQualifiers q);
CINDEX_LINKAGE unsigned clangExt_CXQualifiers_getCVRQualifiers(CXQualifiers q);
CINDEX_LINKAGE unsigned clangExt_CXQualifiers_getCVRUQualifiers(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasUnaligned(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasObjCGCAttr(CXQualifiers q);
CINDEX_LINKAGE Qualifiers::GC clangExt_CXQualifiers_getObjCGCAttr(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withoutObjCGCAttr(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withoutObjCLifetime(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_withoutAddressSpace(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasObjCLifetime(CXQualifiers q);
CINDEX_LINKAGE Qualifiers::ObjCLifetime clangExt_CXQualifiers_getObjCLifetime(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasNonTrivialObjCLifetime(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasStrongOrWeakObjCLifetime(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasAddressSpace(CXQualifiers q);
CINDEX_LINKAGE LangAS clangExt_CXQualifiers_getAddressSpace(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasTargetSpecificAddressSpace(CXQualifiers q);
CINDEX_LINKAGE unsigned clangExt_CXQualifiers_getAddressSpaceAttributePrintValue(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasFastQualifiers(CXQualifiers q);
CINDEX_LINKAGE unsigned clangExt_CXQualifiers_getFastQualifiers(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasNonFastQualifiers(CXQualifiers q);
CINDEX_LINKAGE CXQualifiers clangExt_CXQualifiers_getNonFastQualifiers(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_hasQualifiers(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_empty(CXQualifiers q);
CINDEX_LINKAGE bool clangExt_CXQualifiers_isAddressSpaceSupersetOf(LangAS A, LangAS B);
CINDEX_LINKAGE bool clangExt_CXQualifiers_isAddressSpaceSupersetOfOther(CXQualifiers q, CXQualifiers other);
CINDEX_LINKAGE bool clangExt_CXQualifiers_compatiblyIncludes(CXQualifiers q, CXQualifiers other);
CINDEX_LINKAGE bool clangExt_CXQualifiers_compatiblyIncludesObjCLifetime(CXQualifiers q, CXQualifiers other);
CINDEX_LINKAGE bool clangExt_CXQualifiers_isStrictSupersetOf(CXQualifiers q, CXQualifiers Other);
CINDEX_LINKAGE CXString clangExt_CXQualifiers_getAsString(CXQualifiers q);
CINDEX_LINKAGE CXString clangExt_CXQualifiers_getAsStringPrintingPolicy(CXQualifiers q, CXPrintingPolicy Policy);
CINDEX_LINKAGE CXString clangExt_CXQualifiers_getAddrSpaceAsString(LangAS AS);
CINDEX_LINKAGE bool clangExt_CXQualifiers_isEmptyWhenPrinted(CXQualifiers q, CXPrintingPolicy Policy);
CINDEX_LINKAGE CXString clangExt_CXQualifiers_print(CXQualifiers q, CXPrintingPolicy Policy, bool appendSpaceIfNonEmpty = false);
//=======================================================================================================================
// QualType
CINDEX_LINKAGE unsigned clangExt_QualType_getLocalFastQualifiers(const CXQualType Q);
CINDEX_LINKAGE const Type* clangExt_QualType_getTypePtr(const CXQualType Q);
CINDEX_LINKAGE const Type* clangExt_QualType_getTypePtrOrNull(const CXQualType Q);
CINDEX_LINKAGE const IdentifierInfo* clangExt_QualType_getBaseTypeIdentifier(const CXQualType Q);
CINDEX_LINKAGE CXSplitQualType clangExt_QualType_split(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isCanonical(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isCanonicalAsParam(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isNull(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isLocalConstQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isConstQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isLocalRestrictQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isRestrictQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isLocalVolatileQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isVolatileQualified(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasLocalQualifiers(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasQualifiers(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasLocalNonFastQualifiers(const CXQualType Q);
CINDEX_LINKAGE CXQualifiers clangExt_QualType_getLocalQualifiers(const CXQualType Q);
CINDEX_LINKAGE CXQualifiers clangExt_QualType_getQualifiers(const CXQualType Q);
CINDEX_LINKAGE unsigned clangExt_QualType_getLocalCVRQualifiers(const CXQualType Q);
CINDEX_LINKAGE unsigned clangExt_QualType_getCVRQualifiers(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isConstant(const CXQualType Q, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_QualType_isPODType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_isCXX98PODType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_isCXX11PODType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_isTrivialType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_isTriviallyCopyableType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_isTriviallyRelocatableType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_QualType_mayBeDynamicClass(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_mayBeNotDynamicClass(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getCanonicalType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getLocalUnqualifiedType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getUnqualifiedType(const CXQualType Q);
CINDEX_LINKAGE CXSplitQualType clangExt_QualType_getSplitUnqualifiedType(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isMoreQualifiedThan(const CXQualType Q, const CXQualType Other);
CINDEX_LINKAGE bool clangExt_QualType_isAtLeastAsQualifiedAs(const CXQualType Q, const CXQualType Other);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getNonReferenceType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getNonLValueExprType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getNonPackExpansionType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getDesugaredType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE CXSplitQualType clangExt_QualType_getSplitDesugaredType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getSingleStepDesugaredType(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE const CXQualType clangExt_QualType_IgnoreParens(const CXQualType Q);
CINDEX_LINKAGE CXString clangExt_QualType_getAsStringSplitQualType(CXSplitQualType Q, const CXPrintingPolicy Policy);
CINDEX_LINKAGE CXString clangExt_QualType_getAsStringTypeQualifiers(const Type* ty, CXQualifiers qs, const CXPrintingPolicy Policy);
CINDEX_LINKAGE CXString clangExt_QualType_getAsString(const CXQualType Q);
CINDEX_LINKAGE CXString clangExt_QualType_getAsStringPrintingPolicy(const CXQualType Q, const CXPrintingPolicy Policy);
CINDEX_LINKAGE bool clangExt_QualType_hasAddressSpace(const CXQualType Q);
CINDEX_LINKAGE LangAS clangExt_QualType_getAddressSpace(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isAddressSpaceOverlapping(const CXQualType Q, const CXQualType T);
CINDEX_LINKAGE bool clangExt_QualType_isObjCGCWeak(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isObjCGCStrong(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasNonTrivialObjCLifetime(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasStrongOrWeakObjCLifetime(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isNonWeakInMRRWithObjCWeak(const CXQualType Q, const ASTContext* Context);
CINDEX_LINKAGE QualType::PrimitiveDefaultInitializeKind clangExt_QualType_isNonTrivialToPrimitiveDefaultInitialize(const CXQualType Q);
CINDEX_LINKAGE QualType::PrimitiveCopyKind clangExt_QualType_isNonTrivialToPrimitiveCopy(const CXQualType Q);
CINDEX_LINKAGE QualType::PrimitiveCopyKind clangExt_QualType_isNonTrivialToPrimitiveDestructiveMove(const CXQualType Q);
CINDEX_LINKAGE QualType::DestructionKind clangExt_QualType_isDestructedType(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasNonTrivialToPrimitiveDestructCUnion(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_hasNonTrivialToPrimitiveCopyCUnion(const CXQualType Q);
CINDEX_LINKAGE bool clangExt_QualType_isCForbiddenLValueType(const CXQualType Q);
CINDEX_LINKAGE const CXQualType clangExt_QualType_stripObjCKindOfType(const CXQualType Q, const ASTContext* ctx);
CINDEX_LINKAGE const CXQualType clangExt_QualType_getAtomicUnqualifiedType(const CXQualType Q);
//
CINDEX_LINKAGE const BuiltinType* clangExt_QualType_castAs_BuiltinType(const CXQualType Q);
CINDEX_LINKAGE const ComplexType* clangExt_QualType_castAs_ComplexType(const CXQualType Q);
CINDEX_LINKAGE const ParenType* clangExt_QualType_castAs_ParenType(const CXQualType Q);
CINDEX_LINKAGE const PointerType* clangExt_QualType_castAs_PointerType(const CXQualType Q);
CINDEX_LINKAGE const AdjustedType* clangExt_QualType_castAs_AdjustedType(const CXQualType Q);
CINDEX_LINKAGE const DecayedType* clangExt_QualType_castAs_DecayedType(const CXQualType Q);
CINDEX_LINKAGE const BlockPointerType* clangExt_QualType_castAs_BlockPointerType(const CXQualType Q);
CINDEX_LINKAGE const ReferenceType* clangExt_QualType_castAs_ReferenceType(const CXQualType Q);
CINDEX_LINKAGE const LValueReferenceType* clangExt_QualType_castAs_LValueReferenceType(const CXQualType Q);
CINDEX_LINKAGE const RValueReferenceType* clangExt_QualType_castAs_RValueReferenceType(const CXQualType Q);
CINDEX_LINKAGE const MemberPointerType* clangExt_QualType_castAs_MemberPointerType(const CXQualType Q);
CINDEX_LINKAGE const DependentAddressSpaceType* clangExt_QualType_castAs_DependentAddressSpaceType(const CXQualType Q);
CINDEX_LINKAGE const DependentSizedExtVectorType* clangExt_QualType_castAs_DependentSizedExtVectorType(const CXQualType Q);
CINDEX_LINKAGE const VectorType* clangExt_QualType_castAs_VectorType(const CXQualType Q);
CINDEX_LINKAGE const DependentVectorType* clangExt_QualType_castAs_DependentVectorType(const CXQualType Q);
CINDEX_LINKAGE const ExtVectorType* clangExt_QualType_castAs_ExtVectorType(const CXQualType Q);
CINDEX_LINKAGE const MatrixType* clangExt_QualType_castAs_MatrixType(const CXQualType Q);
CINDEX_LINKAGE const ConstantMatrixType* clangExt_QualType_castAs_ConstantMatrixType(const CXQualType Q);
CINDEX_LINKAGE const DependentSizedMatrixType* clangExt_QualType_castAs_DependentSizedMatrixType(const CXQualType Q);
CINDEX_LINKAGE const FunctionType* clangExt_QualType_castAs_FunctionType(const CXQualType Q);
CINDEX_LINKAGE const FunctionNoProtoType* clangExt_QualType_castAs_FunctionNoProtoType(const CXQualType Q);
CINDEX_LINKAGE const FunctionProtoType* clangExt_QualType_castAs_FunctionProtoType(const CXQualType Q);
CINDEX_LINKAGE const UnresolvedUsingType* clangExt_QualType_castAs_UnresolvedUsingType(const CXQualType Q);
CINDEX_LINKAGE const UsingType* clangExt_QualType_castAs_UsingType(const CXQualType Q);
CINDEX_LINKAGE const TypedefType* clangExt_QualType_castAs_TypedefType(const CXQualType Q);
CINDEX_LINKAGE const MacroQualifiedType* clangExt_QualType_castAs_MacroQualifiedType(const CXQualType Q);
CINDEX_LINKAGE const TypeOfExprType* clangExt_QualType_castAs_TypeOfExprType(const CXQualType Q);
CINDEX_LINKAGE const DependentTypeOfExprType* clangExt_QualType_castAs_DependentTypeOfExprType(const CXQualType Q);
CINDEX_LINKAGE const TypeOfType* clangExt_QualType_castAs_TypeOfType(const CXQualType Q);
CINDEX_LINKAGE const DecltypeType* clangExt_QualType_castAs_DecltypeType(const CXQualType Q);
CINDEX_LINKAGE const DependentDecltypeType* clangExt_QualType_castAs_DependentDecltypeType(const CXQualType Q);
CINDEX_LINKAGE const UnaryTransformType* clangExt_QualType_castAs_UnaryTransformType(const CXQualType Q);
CINDEX_LINKAGE const DependentUnaryTransformType* clangExt_QualType_castAs_DependentUnaryTransformType(const CXQualType Q);
CINDEX_LINKAGE const TagType* clangExt_QualType_castAs_TagType(const CXQualType Q);
CINDEX_LINKAGE const RecordType* clangExt_QualType_castAs_RecordType(const CXQualType Q);
CINDEX_LINKAGE const EnumType* clangExt_QualType_castAs_EnumType(const CXQualType Q);
CINDEX_LINKAGE const AttributedType* clangExt_QualType_castAs_AttributedType(const CXQualType Q);
CINDEX_LINKAGE const BTFTagAttributedType* clangExt_QualType_castAs_BTFTagAttributedType(const CXQualType Q);
CINDEX_LINKAGE const TemplateTypeParmType* clangExt_QualType_castAs_TemplateTypeParmType(const CXQualType Q);
CINDEX_LINKAGE const SubstTemplateTypeParmType* clangExt_QualType_castAs_SubstTemplateTypeParmType(const CXQualType Q);
CINDEX_LINKAGE const SubstTemplateTypeParmPackType* clangExt_QualType_castAs_SubstTemplateTypeParmPackType(const CXQualType Q);
CINDEX_LINKAGE const DeducedType* clangExt_QualType_castAs_DeducedType(const CXQualType Q);
CINDEX_LINKAGE const AutoType* clangExt_QualType_castAs_AutoType(const CXQualType Q);
CINDEX_LINKAGE const DeducedTemplateSpecializationType* clangExt_QualType_castAs_DeducedTemplateSpecializationType(const CXQualType Q);
CINDEX_LINKAGE const TemplateSpecializationType* clangExt_QualType_castAs_TemplateSpecializationType(const CXQualType Q);
CINDEX_LINKAGE const InjectedClassNameType* clangExt_QualType_castAs_InjectedClassNameType(const CXQualType Q);
CINDEX_LINKAGE const ElaboratedType* clangExt_QualType_castAs_ElaboratedType(const CXQualType Q);
CINDEX_LINKAGE const DependentNameType* clangExt_QualType_castAs_DependentNameType(const CXQualType Q);
CINDEX_LINKAGE const DependentTemplateSpecializationType* clangExt_QualType_castAs_DependentTemplateSpecializationType(const CXQualType Q);
CINDEX_LINKAGE const PackExpansionType* clangExt_QualType_castAs_PackExpansionType(const CXQualType Q);
CINDEX_LINKAGE const ObjCTypeParamType* clangExt_QualType_castAs_ObjCTypeParamType(const CXQualType Q);
CINDEX_LINKAGE const ObjCObjectType* clangExt_QualType_castAs_ObjCObjectType(const CXQualType Q);
CINDEX_LINKAGE const ObjCObjectPointerType* clangExt_QualType_castAs_ObjCObjectPointerType(const CXQualType Q);
CINDEX_LINKAGE const AtomicType* clangExt_QualType_castAs_AtomicType(const CXQualType Q);
CINDEX_LINKAGE const PipeType* clangExt_QualType_castAs_PipeType(const CXQualType Q);
CINDEX_LINKAGE const BitIntType* clangExt_QualType_castAs_BitIntType(const CXQualType Q);
CINDEX_LINKAGE const DependentBitIntType* clangExt_QualType_castAs_DependentBitIntType(const CXQualType Q);

//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_TypeSourceInfo_getType(const TypeSourceInfo* T);
CINDEX_LINKAGE CXTypeLoc clangExt_TypeSourceInfo_getTypeLoc(const TypeSourceInfo* T);
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_Type_EnumGetTypeClassLength();
CINDEX_LINKAGE CXString clangExt_Type_EnumGetTypeClassName(Type::TypeClass i);
//
CINDEX_LINKAGE Type::TypeClass clangExt_Type_getTypeClass(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFromAST(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_containsUnexpandedParameterPack(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isCanonicalUnqualified(const Type* T);
CINDEX_LINKAGE const CXQualType clangExt_Type_getLocallyUnqualifiedSingleStepDesugaredType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSizelessType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSizelessBuiltinType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVLSTBuiltinType(const Type* T);
CINDEX_LINKAGE const CXQualType clangExt_Type_getSveEltType(const Type* T, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Type_isIncompleteType(const Type* T, NamedDecl** Def = nullptr);
CINDEX_LINKAGE bool clangExt_Type_isIncompleteOrObjectType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjectType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isLiteralType(const Type* T, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Type_isStructuralType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isStandardLayoutType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isBuiltinType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSpecificBuiltinType(const Type* T, unsigned K);
CINDEX_LINKAGE bool clangExt_Type_isPlaceholderType(const Type* T);
CINDEX_LINKAGE const BuiltinType* clangExt_Type_getAsPlaceholderType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSpecificPlaceholderType(const Type* T, unsigned K);
CINDEX_LINKAGE bool clangExt_Type_isNonOverloadPlaceholderType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isEnumeralType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isScopedEnumeralType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isBooleanType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isCharType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isWideCharType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isChar8Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isChar16Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isChar32Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAnyCharacterType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isIntegralType(const Type* T, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Type_isIntegralOrEnumerationType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isIntegralOrUnscopedEnumerationType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnscopedEnumerationType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isRealFloatingType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isComplexType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAnyComplexType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFloatingType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isHalfType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFloat16Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isBFloat16Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFloat128Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isIbm128Type(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isRealType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isArithmeticType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVoidType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isScalarType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAggregateType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFundamentalType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isCompoundType(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_isFunctionType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFunctionNoProtoType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFunctionProtoType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAnyPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isBlockPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVoidPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isReferenceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isLValueReferenceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isRValueReferenceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjectPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFunctionPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFunctionReferenceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isMemberPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isMemberFunctionPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isMemberDataPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isArrayType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isConstantArrayType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isIncompleteArrayType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVariableArrayType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isDependentSizedArrayType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isRecordType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isClassType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isStructureType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCBoxableRecordType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isInterfaceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isStructureOrClassType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnionType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isComplexIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVectorType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isExtVectorType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isExtVectorBoolType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isMatrixType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isConstantMatrixType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isDependentAddressSpaceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCObjectPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCRetainableType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCLifetimeType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCIndirectLifetimeType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCNSObjectType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCIndependentClassType(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_isObjCObjectType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCQualifiedInterfaceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCQualifiedIdType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCQualifiedClassType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCObjectOrInterfaceType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCIdType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isDecltypeType(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_isObjCInertUnsafeUnretainedType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCClassType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCClassOrClassKindOfType(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_isBlockCompatibleObjCPointerType(const Type* T, const ASTContext* ctx);
CINDEX_LINKAGE bool clangExt_Type_isObjCSelType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCBuiltinType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isObjCARCBridgableType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isCARCBridgableType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isTemplateTypeParmType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isNullPtrType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isNothrowT(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAlignValT(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isStdByteType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isAtomicType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUndeducedAutoType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isTypedefNameType(const Type* T);

CINDEX_LINKAGE Type::ScalarTypeKind clangExt_Type_getScalarTypeKind(const Type* T);
CINDEX_LINKAGE TypeDependence clangExt_Type_getDependence(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_containsErrors(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isDependentType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isInstantiationDependentType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUndeducedType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVariablyModifiedType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasSizedVLAType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasUnnamedOrLocalType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isOverloadableType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isElaboratedTypeSpecifier(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_canDecayToPointerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasPointerRepresentation(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasObjCPointerRepresentation(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasIntegerRepresentation(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasSignedIntegerRepresentation(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasUnsignedIntegerRepresentation(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_hasFloatingRepresentation(const Type* T);

CINDEX_LINKAGE const RecordType* clangExt_Type_getAsStructureType(const Type* T);
CINDEX_LINKAGE const RecordType* clangExt_Type_getAsUnionType(const Type* T);
CINDEX_LINKAGE const ComplexType* clangExt_Type_getAsComplexIntegerType(const Type* T);
CINDEX_LINKAGE const ObjCObjectType* clangExt_Type_getAsObjCInterfaceType(const Type* T);
CINDEX_LINKAGE const ObjCObjectPointerType* clangExt_Type_getAsObjCInterfacePointerType(const Type* T);
CINDEX_LINKAGE const ObjCObjectPointerType* clangExt_Type_getAsObjCQualifiedIdType(const Type* T);
CINDEX_LINKAGE const ObjCObjectPointerType* clangExt_Type_getAsObjCQualifiedClassType(const Type* T);
CINDEX_LINKAGE const ObjCObjectType* clangExt_Type_getAsObjCQualifiedInterfaceType(const Type* T);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_Type_getAsCXXRecordDecl(const Type* T);
CINDEX_LINKAGE const RecordDecl* clangExt_Type_getAsRecordDecl(const Type* T);
CINDEX_LINKAGE const TagDecl* clangExt_Type_getAsTagDecl(const Type* T);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_Type_getPointeeCXXRecordDecl(const Type* T);
CINDEX_LINKAGE const DeducedType* clangExt_Type_getContainedDeducedType(const Type* T);
CINDEX_LINKAGE const AutoType* clangExt_Type_getContainedAutoType(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_hasAutoForTrailingReturnType(const Type* T);
CINDEX_LINKAGE const ArrayType* clangExt_Type_getAsArrayTypeUnsafe(const Type* T);
CINDEX_LINKAGE const ArrayType* clangExt_Type_castAsArrayTypeUnsafe(const Type* T);

CINDEX_LINKAGE bool clangExt_Type_hasAttr(const Type* T, attr::Kind AK);
CINDEX_LINKAGE const Type* clangExt_Type_getBaseElementTypeUnsafe(const Type* T);
CINDEX_LINKAGE const Type* clangExt_Type_getArrayElementTypeNoTypeQual(const Type* T);
CINDEX_LINKAGE const Type* clangExt_Type_getPointeeOrArrayElementType(const Type* T);
CINDEX_LINKAGE const CXQualType clangExt_Type_getPointeeType(const Type* T);
CINDEX_LINKAGE const Type* clangExt_Type_getUnqualifiedDesugaredType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isPromotableIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSignedIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnsignedIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSignedIntegerOrEnumerationType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnsignedIntegerOrEnumerationType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFixedPointType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isFixedPointOrIntegerType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSaturatedFixedPointType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnsaturatedFixedPointType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSignedFixedPointType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isUnsignedFixedPointType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isConstantSizeType(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isSpecifierType(const Type* T);
CINDEX_LINKAGE Linkage clangExt_Type_getLinkage(const Type* T);
CINDEX_LINKAGE Visibility clangExt_Type_getVisibility(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isVisibilityExplicit(const Type* T);
//CINDEX_LINKAGE LinkageInfo clangExt_Type_getLinkageAndVisibility(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_isLinkageValid(const Type* T);
CINDEX_LINKAGE bool clangExt_Type_canHaveNullability(const Type* T, bool ResultIfUnknown = true);
CINDEX_LINKAGE bool clangExt_Type_acceptsObjCTypeParams(const Type* T);
CINDEX_LINKAGE const char* clangExt_Type_getTypeClassName(const Type* T);
CINDEX_LINKAGE const CXQualType clangExt_Type_getCanonicalTypeInternal(const Type* T);
CINDEX_LINKAGE CXString clangExt_Type_dump(const Type* T, const ASTContext* Context);
//=======================================================================================================================
CINDEX_LINKAGE unsigned clangExt_BuiltinType_Kind_LastKind();
CINDEX_LINKAGE CXString clangExt_BuiltinType_Kind_GetKindName(BuiltinType::Kind i);
//
CINDEX_LINKAGE BuiltinType::Kind clangExt_BuiltinType_getKind(const BuiltinType* T);
CINDEX_LINKAGE CXString clangExt_BuiltinType_getName(const BuiltinType* T, const CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_BuiltinType_getNameAsCString(const BuiltinType* T, const CXPrintingPolicy Policy);
CINDEX_LINKAGE bool clangExt_BuiltinType_isSugared(const BuiltinType* T);
CINDEX_LINKAGE const CXQualType clangExt_BuiltinType_desugar(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isInteger(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isSignedInteger(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isUnsignedInteger(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isFloatingPoint(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isSVEBool(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isPlaceholderTypeKind(BuiltinType::Kind K);
CINDEX_LINKAGE bool clangExt_BuiltinType_isPlaceholderType(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_isNonOverloadPlaceholderType(const BuiltinType* T);
CINDEX_LINKAGE bool clangExt_BuiltinType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_ComplexType_getElementType(const ComplexType* T);
CINDEX_LINKAGE bool clangExt_ComplexType_isSugared(const ComplexType* T);
CINDEX_LINKAGE const CXQualType clangExt_ComplexType_desugar(const ComplexType* T);
CINDEX_LINKAGE bool clangExt_ComplexType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_ParenType_getInnerType(const ParenType* T);
CINDEX_LINKAGE bool clangExt_ParenType_isSugared(const ParenType* T);
CINDEX_LINKAGE const CXQualType clangExt_ParenType_desugar(const ParenType* T);
CINDEX_LINKAGE bool clangExt_ParenType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_PointerType_getPointeeType(const PointerType* T);
CINDEX_LINKAGE bool clangExt_PointerType_isSugared(const PointerType* T);
CINDEX_LINKAGE const CXQualType clangExt_PointerType_desugar(const PointerType* T);
CINDEX_LINKAGE bool clangExt_PointerType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_AdjustedType_getOriginalType(const AdjustedType* T);
CINDEX_LINKAGE const CXQualType clangExt_AdjustedType_getAdjustedType(const AdjustedType* T);
CINDEX_LINKAGE bool clangExt_AdjustedType_isSugared(const AdjustedType* T);
CINDEX_LINKAGE const CXQualType clangExt_AdjustedType_desugar(const AdjustedType* T);
CINDEX_LINKAGE bool clangExt_AdjustedType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_DecayedType_getDecayedType(const DecayedType* T);
CINDEX_LINKAGE const CXQualType clangExt_DecayedType_getPointeeType(const DecayedType* T);
CINDEX_LINKAGE bool clangExt_DecayedType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE CXQualType clangExt_BlockPointerType_getPointeeType(const BlockPointerType* T);
CINDEX_LINKAGE bool clangExt_BlockPointerType_isSugared(const BlockPointerType* T);
CINDEX_LINKAGE CXQualType clangExt_BlockPointerType_desugar(const BlockPointerType* T);
CINDEX_LINKAGE bool clangExt_BlockPointerType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_ReferenceType_isSpelledAsLValue(const ReferenceType* T);
CINDEX_LINKAGE bool clangExt_ReferenceType_isInnerRef(const ReferenceType* T);
CINDEX_LINKAGE const CXQualType clangExt_ReferenceType_getPointeeTypeAsWritten(const ReferenceType* T);
CINDEX_LINKAGE const CXQualType clangExt_ReferenceType_getPointeeType(const ReferenceType* T);
CINDEX_LINKAGE bool clangExt_ReferenceType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_LValueReferenceType_isSugared(const LValueReferenceType* T);
CINDEX_LINKAGE const CXQualType clangExt_LValueReferenceType_desugar(const LValueReferenceType* T);
CINDEX_LINKAGE bool clangExt_LValueReferenceType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_RValueReferenceType_isSugared(const RValueReferenceType* T);
CINDEX_LINKAGE const CXQualType clangExt_RValueReferenceType_desugar(const RValueReferenceType* T);
CINDEX_LINKAGE bool clangExt_RValueReferenceType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_MemberPointerType_getPointeeType(const MemberPointerType* T);
CINDEX_LINKAGE bool clangExt_MemberPointerType_isMemberFunctionPointer(const MemberPointerType* T);
CINDEX_LINKAGE bool clangExt_MemberPointerType_isMemberDataPointer(const MemberPointerType* T);
CINDEX_LINKAGE const Type* clangExt_MemberPointerType_getClass(const MemberPointerType* T);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_MemberPointerType_getMostRecentCXXRecordDecl(const MemberPointerType* T);
CINDEX_LINKAGE bool clangExt_MemberPointerType_isSugared(const MemberPointerType* T);
CINDEX_LINKAGE const CXQualType clangExt_MemberPointerType_desugar(const MemberPointerType* T);
CINDEX_LINKAGE bool clangExt_MemberPointerType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_ArrayType_getElementType(const ArrayType* T);
CINDEX_LINKAGE ArrayType::ArraySizeModifier clangExt_ArrayType_getSizeModifier(const ArrayType* T);
CINDEX_LINKAGE CXQualifiers clangExt_ArrayType_getIndexTypeQualifiers(const ArrayType* T);
CINDEX_LINKAGE unsigned clangExt_ArrayType_getIndexTypeCVRQualifiers(const ArrayType* T);
CINDEX_LINKAGE bool clangExt_ArrayType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const llvm::APInt* clangExt_ConstantArrayType_getSize(const ConstantArrayType* T);
CINDEX_LINKAGE const Expr* clangExt_ConstantArrayType_getSizeExpr(const ConstantArrayType* T);
CINDEX_LINKAGE bool clangExt_ConstantArrayType_isSugared(const ConstantArrayType* T);
CINDEX_LINKAGE const CXQualType clangExt_ConstantArrayType_desugar(const ConstantArrayType* T);
CINDEX_LINKAGE unsigned clangExt_ConstantArrayType_getNumAddressingBits(const ASTContext* Context, const CXQualType ElementType, const llvm::APInt* NumElements);
CINDEX_LINKAGE unsigned clangExt_ConstantArrayType_getMaxSizeBits(const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_ConstantArrayType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_IncompleteArrayType_isSugared(const IncompleteArrayType* T);
CINDEX_LINKAGE const CXQualType clangExt_IncompleteArrayType_desugar(const IncompleteArrayType* T);
CINDEX_LINKAGE bool clangExt_IncompleteArrayType_classof(const Type* T);
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_FunctionType_getReturnType(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_getHasRegParm(const FunctionType* T);
CINDEX_LINKAGE unsigned clangExt_FunctionType_getRegParmType(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_getNoReturnAttr(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_getCmseNSCallAttr(const FunctionType* T);
CINDEX_LINKAGE CallingConv clangExt_FunctionType_getCallConv(const FunctionType* T);
// ExtInfo getExtInfo(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_isConst(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_isVolatile(const FunctionType* T);
CINDEX_LINKAGE bool clangExt_FunctionType_isRestrict(const FunctionType* T);
CINDEX_LINKAGE const CXQualType clangExt_FunctionType_getCallResultType(const FunctionType* T, const ASTContext* Context);
CINDEX_LINKAGE CXString clangExt_FunctionType_getNameForCallConv(CallingConv CC);
CINDEX_LINKAGE bool clangExt_FunctionType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_FunctionNoProtoType_isSugared(const FunctionNoProtoType* T);
CINDEX_LINKAGE const CXQualType clangExt_FunctionNoProtoType_desugar(const FunctionNoProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionNoProtoType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE unsigned clangExt_FunctionProtoType_getNumParams(const FunctionProtoType* T);
CINDEX_LINKAGE const CXQualType clangExt_FunctionProtoType_getParamType(const FunctionProtoType* T, unsigned i);
CINDEX_LINKAGE ExceptionSpecificationType clangExt_FunctionProtoType_getExceptionSpecType(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasExceptionSpec(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasDynamicExceptionSpec(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasNoexceptExceptionSpec(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasDependentExceptionSpec(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasInstantiationDependentExceptionSpec(const FunctionProtoType* T);
CINDEX_LINKAGE unsigned clangExt_FunctionProtoType_getNumExceptions(const FunctionProtoType* T);
CINDEX_LINKAGE const CXQualType clangExt_FunctionProtoType_getExceptionType(const FunctionProtoType* T, unsigned i);
CINDEX_LINKAGE const Expr* clangExt_FunctionProtoType_getNoexceptExpr(const FunctionProtoType* T);
CINDEX_LINKAGE const FunctionDecl* clangExt_FunctionProtoType_getExceptionSpecDecl(const FunctionProtoType* T);
CINDEX_LINKAGE const FunctionDecl* clangExt_FunctionProtoType_getExceptionSpecTemplate(const FunctionProtoType* T);
CINDEX_LINKAGE CanThrowResult clangExt_FunctionProtoType_canThrow(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_isNothrow(const FunctionProtoType* T, bool ResultIfDependent = false);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_isVariadic(const FunctionProtoType* T);
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionProtoType_getEllipsisLoc(const FunctionProtoType* T, const ASTContext* Context);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_isTemplateVariadic(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasTrailingReturn(const FunctionProtoType* T);
CINDEX_LINKAGE CXQualifiers clangExt_FunctionProtoType_getMethodQuals(const FunctionProtoType* T);
CINDEX_LINKAGE RefQualifierKind clangExt_FunctionProtoType_getRefQualifier(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_hasExtParameterInfos(const FunctionProtoType* T);
CINDEX_LINKAGE unsigned clangExt_FunctionProtoType_getNumExtParameterInfo(const FunctionProtoType* T);
CINDEX_LINKAGE const FunctionProtoType::ExtParameterInfo* clangExt_FunctionProtoType_getExtParameterInfo(const FunctionProtoType* T, unsigned i);
CINDEX_LINKAGE ParameterABI clangExt_FunctionProtoType_getParameterABI(const FunctionProtoType* T, unsigned I);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_isParamConsumed(const FunctionProtoType* T, unsigned I);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_isSugared(const FunctionProtoType* T);
CINDEX_LINKAGE const CXQualType clangExt_FunctionProtoType_desugar(const FunctionProtoType* T);
CINDEX_LINKAGE bool clangExt_FunctionProtoType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const UnresolvedUsingTypenameDecl* clangExt_UnresolvedUsingType_getDecl(const UnresolvedUsingType* T);
CINDEX_LINKAGE bool clangExt_UnresolvedUsingType_isSugared(const UnresolvedUsingType* T);
CINDEX_LINKAGE const CXQualType clangExt_UnresolvedUsingType_desugar(const UnresolvedUsingType* T);
CINDEX_LINKAGE bool clangExt_UnresolvedUsingType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const UsingShadowDecl* clangExt_UsingType_getFoundDecl(const UsingType* T);
CINDEX_LINKAGE const CXQualType clangExt_UsingType_getUnderlyingType(const UsingType* T);
CINDEX_LINKAGE bool clangExt_UsingType_isSugared(const UsingType* T);
CINDEX_LINKAGE const CXQualType clangExt_UsingType_desugar(const UsingType* T);
CINDEX_LINKAGE bool clangExt_UsingType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const TypedefNameDecl* clangExt_TypedefType_getDecl(const TypedefType* T);
CINDEX_LINKAGE bool clangExt_TypedefType_isSugared(const TypedefType* T);
CINDEX_LINKAGE const CXQualType clangExt_TypedefType_desugar(const TypedefType* T);
CINDEX_LINKAGE bool clangExt_TypedefType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const TagDecl* clangExt_TagType_getDecl(const TagType* T);
CINDEX_LINKAGE bool clangExt_TagType_isBeingDefined(const TagType* T);
CINDEX_LINKAGE bool clangExt_TagType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const RecordDecl* clangExt_RecordType_getDecl(const RecordType* T);
CINDEX_LINKAGE bool clangExt_RecordType_hasConstFields(const RecordType* T);
CINDEX_LINKAGE bool clangExt_RecordType_isSugared(const RecordType* T);
CINDEX_LINKAGE const CXQualType clangExt_RecordType_desugar(const RecordType* T);
CINDEX_LINKAGE bool clangExt_RecordType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const EnumDecl* clangExt_EnumType_getDecl(const EnumType* T);
CINDEX_LINKAGE bool clangExt_EnumType_isSugared(const EnumType* T);
CINDEX_LINKAGE const CXQualType clangExt_EnumType_desugar(const EnumType* T);
CINDEX_LINKAGE bool clangExt_EnumType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE AttributedType::Kind clangExt_AttributedType_getAttrKind(const AttributedType* T);
CINDEX_LINKAGE const CXQualType clangExt_AttributedType_getModifiedType(const AttributedType* T);
CINDEX_LINKAGE const CXQualType clangExt_AttributedType_getEquivalentType(const AttributedType* T);
CINDEX_LINKAGE bool clangExt_AttributedType_isSugared(const AttributedType* T);
CINDEX_LINKAGE const CXQualType clangExt_AttributedType_desugar(const AttributedType* T);
CINDEX_LINKAGE bool clangExt_AttributedType_isQualifier(const AttributedType* T);
CINDEX_LINKAGE bool clangExt_AttributedType_isMSTypeSpec(const AttributedType* T);
CINDEX_LINKAGE bool clangExt_AttributedType_isCallingConv(const AttributedType* T);
CINDEX_LINKAGE bool clangExt_AttributedType_classof(const Type* T);
//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_DeducedType_isSugared(const DeducedType* T);
CINDEX_LINKAGE const CXQualType clangExt_DeducedType_desugar(const DeducedType* T);
CINDEX_LINKAGE const CXQualType clangExt_DeducedType_getDeducedType(const DeducedType* T);
CINDEX_LINKAGE bool clangExt_DeducedType_isDeduced(const DeducedType* T);
CINDEX_LINKAGE bool clangExt_DeducedType_classof(const Type* T);
//=======================================================================================================================
CINDEX_LINKAGE const TemplateArgument* clangExt_AutoType_getArgs(const AutoType* T);
CINDEX_LINKAGE unsigned clangExt_AutoType_getNumArgs(const AutoType* T);
CINDEX_LINKAGE const TemplateArgument* clangExt_AutoType_getArg(const AutoType* T, unsigned Idx);
CINDEX_LINKAGE unsigned clangExt_AutoType_getNumTypeConstraintArgument(const AutoType* T);
CINDEX_LINKAGE const TemplateArgument* clangExt_AutoType_getTypeConstraintArgument(const AutoType* T, unsigned Idx);
CINDEX_LINKAGE const ConceptDecl* clangExt_AutoType_getTypeConstraintConcept(const AutoType* T);
CINDEX_LINKAGE bool clangExt_AutoType_isConstrained(const AutoType* T);
CINDEX_LINKAGE bool clangExt_AutoType_isDecltypeAuto(const AutoType* T);
CINDEX_LINKAGE bool clangExt_AutoType_isGNUAutoType(const AutoType* T);
CINDEX_LINKAGE AutoTypeKeyword clangExt_AutoType_getKeyword(const AutoType* T);
CINDEX_LINKAGE bool clangExt_AutoType_classof(const Type* T);
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeyword(const TypeWithKeyword* T);
CINDEX_LINKAGE ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeywordForTypeSpec(unsigned TypeSpec);
CINDEX_LINKAGE TagTypeKind clangExt_TypeWithKeyword_getTagTypeKindForTypeSpec(unsigned TypeSpec);
CINDEX_LINKAGE ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeywordForTagTypeKind(TagTypeKind Tag);
CINDEX_LINKAGE TagTypeKind clangExt_TypeWithKeyword_getTagTypeKindForKeyword(ElaboratedTypeKeyword Keyword);
CINDEX_LINKAGE bool clangExt_TypeWithKeyword_KeywordIsTagTypeKind(ElaboratedTypeKeyword Keyword);
CINDEX_LINKAGE CXString clangExt_TypeWithKeyword_getKeywordName(ElaboratedTypeKeyword Keyword);
CINDEX_LINKAGE CXString clangExt_TypeWithKeyword_getTagTypeKindName(TagTypeKind Kind);
//=======================================================================================================================
CINDEX_LINKAGE const NestedNameSpecifier* clangExt_ElaboratedType_getQualifier(const ElaboratedType* T);
CINDEX_LINKAGE const CXQualType clangExt_ElaboratedType_getNamedType(const ElaboratedType* T);
CINDEX_LINKAGE const CXQualType clangExt_ElaboratedType_desugar(const ElaboratedType* T);
CINDEX_LINKAGE bool clangExt_ElaboratedType_isSugared(const ElaboratedType* T);
CINDEX_LINKAGE const TagDecl* clangExt_ElaboratedType_getOwnedTagDecl(const ElaboratedType* T);
CINDEX_LINKAGE bool clangExt_ElaboratedType_classof(const Type* T);
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif