#include <llvm/Support/raw_ostream.h>
#include <clang/AST/Decl.h>
#include <clang/AST/TypeLoc.h>
#include "Clang_Ext_AST_Type.h"
#include "CXString.h"
#include "CXSourceLocation.h"

using namespace clang;
//=======================================================================================================================
// CXType.cpp
static inline QualType GetQualType(CXType CT) {
	return QualType::getFromOpaquePtr(CT.data[0]);
}
const CXQualType clangExt_CXType_GetQualType(CXType CT) {
	return CT.data[0];
}
CXTranslationUnit clangExt_CXType_GetTU(CXType CT) {
	return static_cast<CXTranslationUnit>(CT.data[1]);
}
int clangExt_CXType_getNumArgTypes(CXType CT) {
	QualType T = GetQualType(CT);
	if (T.isNull())
		return -1;

	if (const FunctionProtoType* FD = T->getAs<FunctionProtoType>()) {
		return FD->getNumParams();
		//Type::TypeClass::fun
		//FD->getTypeClass
	}

	if (T->getAs<FunctionNoProtoType>()) {
		return 0;
	}

	return -1;
}
//=======================================================================================================================
bool clangExt_CXQualifiers_hasConst(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasConst();
}
bool clangExt_CXQualifiers_hasOnlyConst(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasOnlyConst();
}
CXQualifiers clangExt_CXQualifiers_withConst(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withConst().getAsOpaqueValue();
}
bool clangExt_CXQualifiers_hasVolatile(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasVolatile();
}
bool clangExt_CXQualifiers_hasOnlyVolatile(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasOnlyVolatile();
}
CXQualifiers clangExt_CXQualifiers_withVolatile(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withVolatile().getAsOpaqueValue();
}
bool clangExt_CXQualifiers_hasRestrict(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasRestrict();
}
bool clangExt_CXQualifiers_hasOnlyRestrict(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasOnlyRestrict();
}
CXQualifiers clangExt_CXQualifiers_withRestrict(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withRestrict().getAsOpaqueValue();
}
bool clangExt_CXQualifiers_hasCVRQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasCVRQualifiers();
}
unsigned clangExt_CXQualifiers_getCVRQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getCVRQualifiers();
}
unsigned clangExt_CXQualifiers_getCVRUQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getCVRUQualifiers();
}
bool clangExt_CXQualifiers_hasUnaligned(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasUnaligned();
}
bool clangExt_CXQualifiers_hasObjCGCAttr(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasObjCGCAttr();
}
Qualifiers::GC clangExt_CXQualifiers_getObjCGCAttr(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getObjCGCAttr();
}
CXQualifiers clangExt_CXQualifiers_withoutObjCGCAttr(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withoutObjCGCAttr().getAsOpaqueValue();
}
CXQualifiers clangExt_CXQualifiers_withoutObjCLifetime(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withoutObjCLifetime().getAsOpaqueValue();
}
CXQualifiers clangExt_CXQualifiers_withoutAddressSpace(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).withoutAddressSpace().getAsOpaqueValue();
}
bool clangExt_CXQualifiers_hasObjCLifetime(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasObjCLifetime();
}
Qualifiers::ObjCLifetime clangExt_CXQualifiers_getObjCLifetime(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getObjCLifetime();
}
bool clangExt_CXQualifiers_hasNonTrivialObjCLifetime(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasNonTrivialObjCLifetime();
}
bool clangExt_CXQualifiers_hasStrongOrWeakObjCLifetime(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasStrongOrWeakObjCLifetime();
}
bool clangExt_CXQualifiers_hasAddressSpace(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasAddressSpace();
}
LangAS clangExt_CXQualifiers_getAddressSpace(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getAddressSpace();
}
bool clangExt_CXQualifiers_hasTargetSpecificAddressSpace(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasTargetSpecificAddressSpace();
}
unsigned clangExt_CXQualifiers_getAddressSpaceAttributePrintValue(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getAddressSpaceAttributePrintValue();
}
bool clangExt_CXQualifiers_hasFastQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasFastQualifiers();
}
unsigned clangExt_CXQualifiers_getFastQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getFastQualifiers();
}
bool clangExt_CXQualifiers_hasNonFastQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasNonFastQualifiers();
}
CXQualifiers clangExt_CXQualifiers_getNonFastQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).getNonFastQualifiers().getAsOpaqueValue();
}
bool clangExt_CXQualifiers_hasQualifiers(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).hasQualifiers();
}
bool clangExt_CXQualifiers_empty(CXQualifiers q) {
	return Qualifiers::fromOpaqueValue(q).empty();
}
bool clangExt_CXQualifiers_isAddressSpaceSupersetOf(LangAS A, LangAS B) {
	return Qualifiers::isAddressSpaceSupersetOf(A, B);
}
bool clangExt_CXQualifiers_isAddressSpaceSupersetOfOther(CXQualifiers q, CXQualifiers other) {
	return Qualifiers::fromOpaqueValue(q).isAddressSpaceSupersetOf(Qualifiers::fromOpaqueValue(other));
}
bool clangExt_CXQualifiers_compatiblyIncludes(CXQualifiers q, CXQualifiers other) {
	return Qualifiers::fromOpaqueValue(q).compatiblyIncludes(Qualifiers::fromOpaqueValue(other));
}
bool clangExt_CXQualifiers_compatiblyIncludesObjCLifetime(CXQualifiers q, CXQualifiers other) {
	return Qualifiers::fromOpaqueValue(q).compatiblyIncludesObjCLifetime(Qualifiers::fromOpaqueValue(other));
}
bool clangExt_CXQualifiers_isStrictSupersetOf(CXQualifiers q, CXQualifiers Other) {
	return Qualifiers::fromOpaqueValue(q).isStrictSupersetOf(Qualifiers::fromOpaqueValue(Other));
}
CXString clangExt_CXQualifiers_getAsString(CXQualifiers q) {
	return cxstring::createDup(StringRef(Qualifiers::fromOpaqueValue(q).getAsString()));
}
CXString clangExt_CXQualifiers_getAsStringPrintingPolicy(CXQualifiers q, CXPrintingPolicy Policy) {
	return cxstring::createDup(StringRef(
		Qualifiers::fromOpaqueValue(q).getAsString(*static_cast<PrintingPolicy*>(Policy))
	));
}
CXString clangExt_CXQualifiers_getAddrSpaceAsString(LangAS AS) {
	return cxstring::createDup(StringRef(Qualifiers::getAddrSpaceAsString(AS)));
}
bool clangExt_CXQualifiers_isEmptyWhenPrinted(CXQualifiers q, CXPrintingPolicy Policy) {
	return Qualifiers::fromOpaqueValue(q).isEmptyWhenPrinted(*static_cast<PrintingPolicy*>(Policy));
}
CXString clangExt_CXQualifiers_print(CXQualifiers q, CXPrintingPolicy Policy, bool appendSpaceIfNonEmpty) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	Qualifiers::fromOpaqueValue(q).print(infoOut, *static_cast<PrintingPolicy*>(Policy), appendSpaceIfNonEmpty);
	return cxstring::createDup(info.c_str());
}
//=======================================================================================================================
unsigned clangExt_QualType_getLocalFastQualifiers(const CXQualType Q) {
	//QualType::getFromOpaquePtr(Q)->isSizelessType();
	return QualType::getFromOpaquePtr(Q).getLocalFastQualifiers();
}
const Type* clangExt_QualType_getTypePtr(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getTypePtr();
}
const Type* clangExt_QualType_getTypePtrOrNull(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getTypePtrOrNull();
}
const IdentifierInfo* clangExt_QualType_getBaseTypeIdentifier(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getBaseTypeIdentifier();
}
CXSplitQualType clangExt_QualType_split(const CXQualType Q) {
	SplitQualType q = QualType::getFromOpaquePtr(Q).split();
	return CXSplitQualType{ q.Ty, q.Quals.getAsOpaqueValue() };
}
bool clangExt_QualType_isCanonical(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isCanonical();
}
bool clangExt_QualType_isCanonicalAsParam(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isCanonicalAsParam();
}
bool clangExt_QualType_isNull(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isNull();
}
bool clangExt_QualType_isLocalConstQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isLocalConstQualified();
}
bool clangExt_QualType_isConstQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isConstQualified();
}
bool clangExt_QualType_isLocalRestrictQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isLocalRestrictQualified();
}
bool clangExt_QualType_isRestrictQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isRestrictQualified();
}
bool clangExt_QualType_isLocalVolatileQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isLocalVolatileQualified();
}
bool clangExt_QualType_isVolatileQualified(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isVolatileQualified();
}
bool clangExt_QualType_hasLocalQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasLocalQualifiers();
}
bool clangExt_QualType_hasQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasQualifiers();
}
bool clangExt_QualType_hasLocalNonFastQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasLocalNonFastQualifiers();
}
CXQualifiers clangExt_QualType_getLocalQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getLocalQualifiers().getAsOpaqueValue();
}
CXQualifiers clangExt_QualType_getQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getQualifiers().getAsOpaqueValue();
}
unsigned clangExt_QualType_getLocalCVRQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getLocalCVRQualifiers();
}
unsigned clangExt_QualType_getCVRQualifiers(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getCVRQualifiers();
}
bool clangExt_QualType_isConstant(const CXQualType Q, const ASTContext* Ctx) {
	return QualType::getFromOpaquePtr(Q).isConstant(*Ctx);
}
bool clangExt_QualType_isPODType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isPODType(*Context);
}
bool clangExt_QualType_isCXX98PODType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isCXX98PODType(*Context);
}
bool clangExt_QualType_isCXX11PODType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isCXX11PODType(*Context);
}
bool clangExt_QualType_isTrivialType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isTrivialType(*Context);
}
bool clangExt_QualType_isTriviallyCopyableType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isTriviallyCopyableType(*Context);
}
bool clangExt_QualType_isTriviallyRelocatableType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isTriviallyRelocatableType(*Context);
}
bool clangExt_QualType_mayBeDynamicClass(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).mayBeDynamicClass();
}
bool clangExt_QualType_mayBeNotDynamicClass(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).mayBeNotDynamicClass();
}
const CXQualType clangExt_QualType_getCanonicalType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getCanonicalType().getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getLocalUnqualifiedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getLocalUnqualifiedType().getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getUnqualifiedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getUnqualifiedType().getAsOpaquePtr();
}
CXSplitQualType clangExt_QualType_getSplitUnqualifiedType(const CXQualType Q) {
	SplitQualType q = QualType::getFromOpaquePtr(Q).getSplitUnqualifiedType();
	return CXSplitQualType{ q.Ty, q.Quals.getAsOpaqueValue() };
}
bool clangExt_QualType_isMoreQualifiedThan(const CXQualType Q, const CXQualType Other) {
	return QualType::getFromOpaquePtr(Q).isMoreQualifiedThan(QualType::getFromOpaquePtr(Other));
}
bool clangExt_QualType_isAtLeastAsQualifiedAs(const CXQualType Q, const CXQualType Other) {
	return QualType::getFromOpaquePtr(Q).isAtLeastAsQualifiedAs(QualType::getFromOpaquePtr(Other));
}
const CXQualType clangExt_QualType_getNonReferenceType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getNonReferenceType().getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getNonLValueExprType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).getNonLValueExprType(*Context).getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getNonPackExpansionType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getNonPackExpansionType().getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getDesugaredType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).getDesugaredType(*Context).getAsOpaquePtr();
}
CXSplitQualType clangExt_QualType_getSplitDesugaredType(const CXQualType Q) {
	SplitQualType q = QualType::getFromOpaquePtr(Q).getSplitDesugaredType();
	return CXSplitQualType{ q.Ty, q.Quals.getAsOpaqueValue() };
}
const CXQualType clangExt_QualType_getSingleStepDesugaredType(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).getSingleStepDesugaredType(*Context).getAsOpaquePtr();
}
const CXQualType clangExt_QualType_IgnoreParens(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).IgnoreParens().getAsOpaquePtr();
}
CXString clangExt_QualType_getAsStringSplitQualType(CXSplitQualType Q, const CXPrintingPolicy Policy) {
	SplitQualType q = { Q.Ty, Qualifiers::fromOpaqueValue(Q.Quals) };
	return cxstring::createDup(StringRef(
		QualType::getAsString(q, *static_cast<PrintingPolicy*>(Policy))
	));
}
CXString clangExt_QualType_getAsStringTypeQualifiers(const Type* ty, CXQualifiers qs, const CXPrintingPolicy Policy) {
	return cxstring::createDup(StringRef(
		QualType::getAsString(ty, Qualifiers::fromOpaqueValue(qs), *static_cast<PrintingPolicy*>(Policy))
	));
}
CXString clangExt_QualType_getAsString(const CXQualType Q) {
	return cxstring::createDup(StringRef(QualType::getFromOpaquePtr(Q).getAsString()));
}
CXString clangExt_QualType_getAsStringPrintingPolicy(const CXQualType Q, const CXPrintingPolicy Policy) {
	return cxstring::createDup(StringRef(
		QualType::getFromOpaquePtr(Q).getAsString(*static_cast<PrintingPolicy*>(Policy))
	));
}
bool clangExt_QualType_hasAddressSpace(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasAddressSpace();
}
LangAS clangExt_QualType_getAddressSpace(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getAddressSpace();
}
bool clangExt_QualType_isAddressSpaceOverlapping(const CXQualType Q, const CXQualType T) {
	return QualType::getFromOpaquePtr(Q).isAddressSpaceOverlapping(QualType::getFromOpaquePtr(T));
}
bool clangExt_QualType_isObjCGCWeak(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isObjCGCWeak();
}
bool clangExt_QualType_isObjCGCStrong(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isObjCGCStrong();
}
bool clangExt_QualType_hasNonTrivialObjCLifetime(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasNonTrivialObjCLifetime();
}
bool clangExt_QualType_hasStrongOrWeakObjCLifetime(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasStrongOrWeakObjCLifetime();
}
bool clangExt_QualType_isNonWeakInMRRWithObjCWeak(const CXQualType Q, const ASTContext* Context) {
	return QualType::getFromOpaquePtr(Q).isNonWeakInMRRWithObjCWeak(*Context);
}
QualType::PrimitiveDefaultInitializeKind clangExt_QualType_isNonTrivialToPrimitiveDefaultInitialize(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isNonTrivialToPrimitiveDefaultInitialize();
}
QualType::PrimitiveCopyKind clangExt_QualType_isNonTrivialToPrimitiveCopy(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isNonTrivialToPrimitiveCopy();
}
QualType::PrimitiveCopyKind clangExt_QualType_isNonTrivialToPrimitiveDestructiveMove(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isNonTrivialToPrimitiveDestructiveMove();
}
QualType::DestructionKind clangExt_QualType_isDestructedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isDestructedType();
}
bool clangExt_QualType_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasNonTrivialToPrimitiveDefaultInitializeCUnion();
}
bool clangExt_QualType_hasNonTrivialToPrimitiveDestructCUnion(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasNonTrivialToPrimitiveDestructCUnion();
}
bool clangExt_QualType_hasNonTrivialToPrimitiveCopyCUnion(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).hasNonTrivialToPrimitiveCopyCUnion();
}
bool clangExt_QualType_isCForbiddenLValueType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).isCForbiddenLValueType();
}
const CXQualType clangExt_QualType_stripObjCKindOfType(const CXQualType Q, const ASTContext* ctx) {
	return QualType::getFromOpaquePtr(Q).stripObjCKindOfType(*ctx).getAsOpaquePtr();
}
const CXQualType clangExt_QualType_getAtomicUnqualifiedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q).getAtomicUnqualifiedType().getAsOpaquePtr();
}
const BuiltinType* clangExt_QualType_castAs_BuiltinType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<BuiltinType>();
}
const ComplexType* clangExt_QualType_castAs_ComplexType(const CXQualType Q) { 
	return QualType::getFromOpaquePtr(Q)->castAs<ComplexType>();
}
const ParenType* clangExt_QualType_castAs_ParenType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ParenType>();
}
const PointerType* clangExt_QualType_castAs_PointerType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<PointerType>();
}
const AdjustedType* clangExt_QualType_castAs_AdjustedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<AdjustedType>();
}
const DecayedType* clangExt_QualType_castAs_DecayedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DecayedType>();
}
const BlockPointerType* clangExt_QualType_castAs_BlockPointerType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<BlockPointerType>();
}
const ReferenceType* clangExt_QualType_castAs_ReferenceType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ReferenceType>();
}
const LValueReferenceType* clangExt_QualType_castAs_LValueReferenceType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<LValueReferenceType>();
}
const RValueReferenceType* clangExt_QualType_castAs_RValueReferenceType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<RValueReferenceType>();
}
const MemberPointerType* clangExt_QualType_castAs_MemberPointerType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<MemberPointerType>();
}
const DependentAddressSpaceType* clangExt_QualType_castAs_DependentAddressSpaceType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentAddressSpaceType>();
}
const DependentSizedExtVectorType* clangExt_QualType_castAs_DependentSizedExtVectorType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentSizedExtVectorType>();
}
const VectorType* clangExt_QualType_castAs_VectorType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<VectorType>();
}
const DependentVectorType* clangExt_QualType_castAs_DependentVectorType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentVectorType>();
}
const ExtVectorType* clangExt_QualType_castAs_ExtVectorType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ExtVectorType>();
}
const MatrixType* clangExt_QualType_castAs_MatrixType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<MatrixType>();
}
const ConstantMatrixType* clangExt_QualType_castAs_ConstantMatrixType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ConstantMatrixType>();
}
const DependentSizedMatrixType* clangExt_QualType_castAs_DependentSizedMatrixType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentSizedMatrixType>();
}
const FunctionType* clangExt_QualType_castAs_FunctionType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<FunctionType>();
}
const FunctionNoProtoType* clangExt_QualType_castAs_FunctionNoProtoType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<FunctionNoProtoType>();
}
const FunctionProtoType* clangExt_QualType_castAs_FunctionProtoType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<FunctionProtoType>();
}
const UnresolvedUsingType* clangExt_QualType_castAs_UnresolvedUsingType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<UnresolvedUsingType>();
}
const UsingType* clangExt_QualType_castAs_UsingType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<UsingType>();
}
const TypedefType* clangExt_QualType_castAs_TypedefType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TypedefType>();
}
const MacroQualifiedType* clangExt_QualType_castAs_MacroQualifiedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<MacroQualifiedType>();
}
const TypeOfExprType* clangExt_QualType_castAs_TypeOfExprType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TypeOfExprType>();
}
const DependentTypeOfExprType* clangExt_QualType_castAs_DependentTypeOfExprType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentTypeOfExprType>();
}
const TypeOfType* clangExt_QualType_castAs_TypeOfType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TypeOfType>();
}
const DecltypeType* clangExt_QualType_castAs_DecltypeType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DecltypeType>();
}
const DependentDecltypeType* clangExt_QualType_castAs_DependentDecltypeType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentDecltypeType>();
}
const UnaryTransformType* clangExt_QualType_castAs_UnaryTransformType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<UnaryTransformType>();
}
const DependentUnaryTransformType* clangExt_QualType_castAs_DependentUnaryTransformType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentUnaryTransformType>();
}
const TagType* clangExt_QualType_castAs_TagType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TagType>();
}
const RecordType* clangExt_QualType_castAs_RecordType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<RecordType>();
}
const EnumType* clangExt_QualType_castAs_EnumType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<EnumType>();
}
const AttributedType* clangExt_QualType_castAs_AttributedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<AttributedType>();
}
const BTFTagAttributedType* clangExt_QualType_castAs_BTFTagAttributedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<BTFTagAttributedType>();
}
const TemplateTypeParmType* clangExt_QualType_castAs_TemplateTypeParmType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TemplateTypeParmType>();
}
const SubstTemplateTypeParmType* clangExt_QualType_castAs_SubstTemplateTypeParmType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<SubstTemplateTypeParmType>();
}
const SubstTemplateTypeParmPackType* clangExt_QualType_castAs_SubstTemplateTypeParmPackType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<SubstTemplateTypeParmPackType>();
}
const DeducedType* clangExt_QualType_castAs_DeducedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DeducedType>();
}
const AutoType* clangExt_QualType_castAs_AutoType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<AutoType>();
}
const DeducedTemplateSpecializationType* clangExt_QualType_castAs_DeducedTemplateSpecializationType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DeducedTemplateSpecializationType>();
}
const TemplateSpecializationType* clangExt_QualType_castAs_TemplateSpecializationType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<TemplateSpecializationType>();
}
const InjectedClassNameType* clangExt_QualType_castAs_InjectedClassNameType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<InjectedClassNameType>();
}
const ElaboratedType* clangExt_QualType_castAs_ElaboratedType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ElaboratedType>();
}
const DependentNameType* clangExt_QualType_castAs_DependentNameType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentNameType>();
}
const DependentTemplateSpecializationType* clangExt_QualType_castAs_DependentTemplateSpecializationType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentTemplateSpecializationType>();
}
const PackExpansionType* clangExt_QualType_castAs_PackExpansionType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<PackExpansionType>();
}
const ObjCTypeParamType* clangExt_QualType_castAs_ObjCTypeParamType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ObjCTypeParamType>();
}
const ObjCObjectType* clangExt_QualType_castAs_ObjCObjectType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ObjCObjectType>();
}
const ObjCObjectPointerType* clangExt_QualType_castAs_ObjCObjectPointerType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<ObjCObjectPointerType>();
}
const AtomicType* clangExt_QualType_castAs_AtomicType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<AtomicType>();
}
const PipeType* clangExt_QualType_castAs_PipeType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<PipeType>();
}
const BitIntType* clangExt_QualType_castAs_BitIntType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<BitIntType>();
}
const DependentBitIntType* clangExt_QualType_castAs_DependentBitIntType(const CXQualType Q) {
	return QualType::getFromOpaquePtr(Q)->castAs<DependentBitIntType>();
}
//=======================================================================================================================
const CXQualType clangExt_TypeSourceInfo_getType(const TypeSourceInfo* T) {
	return T->getType().getAsOpaquePtr();
}
CXTypeLoc clangExt_TypeSourceInfo_getTypeLoc(const TypeSourceInfo* T) {
	TypeLoc ty = T->getTypeLoc();
	return { ty.getTypePtr(), ty.getOpaqueData() };
}
//=======================================================================================================================
int clangExt_Type_EnumGetTypeClassLength() {
	return Type::TypeClass::TypeLast;
}
CXString clangExt_Type_EnumGetTypeClassName(Type::TypeClass i) {
	const char* s = nullptr;
#define TCLASS(X) case Type::TypeClass::##X: s = ""  #X  ""; break

	switch (i) {
#define ABSTRACT_TYPE(Derived, Base)
#define TYPE(Derived, Base) TCLASS(Derived);
#include "clang/AST/TypeNodes.inc"
	}
#undef TCLASS

	return cxstring::createRef(s);
}
Type::TypeClass clangExt_Type_getTypeClass(const Type* T) {
	return T->getTypeClass();
}
bool clangExt_Type_isFromAST(const Type* T) {
	return T->isFromAST();
}
bool clangExt_Type_containsUnexpandedParameterPack(const Type* T) {
	return T->containsUnexpandedParameterPack();
}
bool clangExt_Type_isCanonicalUnqualified(const Type* T) {
	return T->isCanonicalUnqualified();
}
const CXQualType clangExt_Type_getLocallyUnqualifiedSingleStepDesugaredType(const Type* T) {
	return T->getLocallyUnqualifiedSingleStepDesugaredType().getAsOpaquePtr();
}
bool clangExt_Type_isSizelessType(const Type* T) {
	return T->isSizelessType();
}
bool clangExt_Type_isSizelessBuiltinType(const Type* T) {
	return T->isSizelessBuiltinType();
}
bool clangExt_Type_isVLSTBuiltinType(const Type* T) {
	return T->isVLSTBuiltinType();
}
const CXQualType clangExt_Type_getSveEltType(const Type* T, const ASTContext* Ctx) {
	return T->getSveEltType(*Ctx).getAsOpaquePtr();
}
bool clangExt_Type_isIncompleteType(const Type* T, NamedDecl** Def) {
	return T->isIncompleteType(Def);
}
bool clangExt_Type_isIncompleteOrObjectType(const Type* T) {
	return T->isIncompleteOrObjectType();
}
bool clangExt_Type_isObjectType(const Type* T) {
	return T->isObjectType();
}
bool clangExt_Type_isLiteralType(const Type* T, const ASTContext* Ctx) {
	return T->isLiteralType(*Ctx);
}
bool clangExt_Type_isStructuralType(const Type* T) {
	return T->isStructuralType();
}
bool clangExt_Type_isStandardLayoutType(const Type* T) {
	return T->isStandardLayoutType();
}
bool clangExt_Type_isBuiltinType(const Type* T) {
	return T->isBuiltinType();
}
bool clangExt_Type_isSpecificBuiltinType(const Type* T, unsigned K) {
	return T->isSpecificBuiltinType(K);
}
bool clangExt_Type_isPlaceholderType(const Type* T) {
	return T->isPlaceholderType();
}
const BuiltinType* clangExt_Type_getAsPlaceholderType(const Type* T) {
	return T->getAsPlaceholderType();
}
bool clangExt_Type_isSpecificPlaceholderType(const Type* T, unsigned K) {
	return T->isSpecificPlaceholderType(K);
}
bool clangExt_Type_isNonOverloadPlaceholderType(const Type* T) {
	return T->isNonOverloadPlaceholderType();
}
bool clangExt_Type_isIntegerType(const Type* T) {
	return T->isIntegerType();
}
bool clangExt_Type_isEnumeralType(const Type* T) {
	return T->isEnumeralType();
}
bool clangExt_Type_isScopedEnumeralType(const Type* T) {
	return T->isScopedEnumeralType();
}
bool clangExt_Type_isBooleanType(const Type* T) {
	return T->isBooleanType();
}
bool clangExt_Type_isCharType(const Type* T) {
	return T->isCharType();
}
bool clangExt_Type_isWideCharType(const Type* T) {
	return T->isWideCharType();
}
bool clangExt_Type_isChar8Type(const Type* T) {
	return T->isChar8Type();
}
bool clangExt_Type_isChar16Type(const Type* T) {
	return T->isChar16Type();
}
bool clangExt_Type_isChar32Type(const Type* T) {
	return T->isChar32Type();
}
bool clangExt_Type_isAnyCharacterType(const Type* T) {
	return T->isAnyCharacterType();
}
bool clangExt_Type_isIntegralType(const Type* T, const ASTContext* Ctx) {
	return T->isIntegralType(*Ctx);
}
bool clangExt_Type_isIntegralOrEnumerationType(const Type* T) {
	return T->isIntegralOrEnumerationType();
}
bool clangExt_Type_isIntegralOrUnscopedEnumerationType(const Type* T) {
	return T->isIntegralOrUnscopedEnumerationType();
}
bool clangExt_Type_isUnscopedEnumerationType(const Type* T) {
	return T->isUnscopedEnumerationType();
}
bool clangExt_Type_isRealFloatingType(const Type* T) {
	return T->isRealFloatingType();
}
bool clangExt_Type_isComplexType(const Type* T) {
	return T->isComplexType();
}
bool clangExt_Type_isAnyComplexType(const Type* T) {
	return T->isAnyComplexType();
}
bool clangExt_Type_isFloatingType(const Type* T) {
	return T->isFloatingType();
}
bool clangExt_Type_isHalfType(const Type* T) {
	return T->isHalfType();
}
bool clangExt_Type_isFloat16Type(const Type* T) {
	return T->isFloat16Type();
}
bool clangExt_Type_isBFloat16Type(const Type* T) {
	return T->isBFloat16Type();
}
bool clangExt_Type_isFloat128Type(const Type* T) {
	return T->isFloat128Type();
}
bool clangExt_Type_isIbm128Type(const Type* T) {
	return T->isIbm128Type();
}
bool clangExt_Type_isRealType(const Type* T) {
	return T->isRealType();
}
bool clangExt_Type_isArithmeticType(const Type* T) {
	return T->isArithmeticType();
}
bool clangExt_Type_isVoidType(const Type* T) {
	return T->isVoidType();
}
bool clangExt_Type_isScalarType(const Type* T) {
	return T->isScalarType();
}
bool clangExt_Type_isAggregateType(const Type* T) {
	return T->isAggregateType();
}
bool clangExt_Type_isFundamentalType(const Type* T) {
	return T->isFundamentalType();
}
bool clangExt_Type_isCompoundType(const Type* T) {
	return T->isCompoundType();
}
bool clangExt_Type_isFunctionType(const Type* T) {
	return T->isFunctionType();
}
bool clangExt_Type_isFunctionNoProtoType(const Type* T) {
	return T->isFunctionNoProtoType();
}
bool clangExt_Type_isFunctionProtoType(const Type* T) {
	return T->isFunctionProtoType();
}
bool clangExt_Type_isPointerType(const Type* T) {
	return T->isPointerType();
}
bool clangExt_Type_isAnyPointerType(const Type* T) {
	return T->isAnyPointerType();
}
bool clangExt_Type_isBlockPointerType(const Type* T) {
	return T->isBlockPointerType();
}
bool clangExt_Type_isVoidPointerType(const Type* T) {
	return T->isVoidPointerType();
}
bool clangExt_Type_isReferenceType(const Type* T) {
	return T->isReferenceType();
}
bool clangExt_Type_isLValueReferenceType(const Type* T) {
	return T->isLValueReferenceType();
}
bool clangExt_Type_isRValueReferenceType(const Type* T) {
	return T->isRValueReferenceType();
}
bool clangExt_Type_isObjectPointerType(const Type* T) {
	return T->isObjectPointerType();
}
bool clangExt_Type_isFunctionPointerType(const Type* T) {
	return T->isFunctionPointerType();
}
bool clangExt_Type_isFunctionReferenceType(const Type* T) {
	return T->isFunctionReferenceType();
}
bool clangExt_Type_isMemberPointerType(const Type* T) {
	return T->isMemberPointerType();
}
bool clangExt_Type_isMemberFunctionPointerType(const Type* T) {
	return T->isMemberFunctionPointerType();
}
bool clangExt_Type_isMemberDataPointerType(const Type* T) {
	return T->isMemberDataPointerType();
}
bool clangExt_Type_isArrayType(const Type* T) {
	return T->isArrayType();
}
bool clangExt_Type_isConstantArrayType(const Type* T) {
	return T->isConstantArrayType();
}
bool clangExt_Type_isIncompleteArrayType(const Type* T) {
	return T->isIncompleteArrayType();
}
bool clangExt_Type_isVariableArrayType(const Type* T) {
	return T->isVariableArrayType();
}
bool clangExt_Type_isDependentSizedArrayType(const Type* T) {
	return T->isDependentSizedArrayType();
}
bool clangExt_Type_isRecordType(const Type* T) {
	return T->isRecordType();
}
bool clangExt_Type_isClassType(const Type* T) {
	return T->isClassType();
}
bool clangExt_Type_isStructureType(const Type* T) {
	return T->isStructureType();
}
bool clangExt_Type_isObjCBoxableRecordType(const Type* T) {
	return T->isObjCBoxableRecordType();
}
bool clangExt_Type_isInterfaceType(const Type* T) {
	return T->isInterfaceType();
}
bool clangExt_Type_isStructureOrClassType(const Type* T) {
	return T->isStructureOrClassType();
}
bool clangExt_Type_isUnionType(const Type* T) {
	return T->isUnionType();
}
bool clangExt_Type_isComplexIntegerType(const Type* T) {
	return T->isComplexIntegerType();
}
bool clangExt_Type_isVectorType(const Type* T) {
	return T->isVectorType();
}
bool clangExt_Type_isExtVectorType(const Type* T) {
	return T->isExtVectorType();
}
bool clangExt_Type_isExtVectorBoolType(const Type* T) {
	return T->isExtVectorBoolType();
}
bool clangExt_Type_isMatrixType(const Type* T) {
	return T->isMatrixType();
}
bool clangExt_Type_isConstantMatrixType(const Type* T) {
	return T->isConstantMatrixType();
}
bool clangExt_Type_isDependentAddressSpaceType(const Type* T) {
	return T->isDependentAddressSpaceType();
}
bool clangExt_Type_isObjCObjectPointerType(const Type* T) {
	return T->isObjCObjectPointerType();
}
bool clangExt_Type_isObjCRetainableType(const Type* T) {
	return T->isObjCRetainableType();
}
bool clangExt_Type_isObjCLifetimeType(const Type* T) {
	return T->isObjCLifetimeType();
}
bool clangExt_Type_isObjCIndirectLifetimeType(const Type* T) {
	return T->isObjCIndirectLifetimeType();
}
bool clangExt_Type_isObjCNSObjectType(const Type* T) {
	return T->isObjCNSObjectType();
}
bool clangExt_Type_isObjCIndependentClassType(const Type* T) {
	return T->isObjCIndependentClassType();
}
bool clangExt_Type_isObjCObjectType(const Type* T) {
	return T->isObjCObjectType();
}
bool clangExt_Type_isObjCQualifiedInterfaceType(const Type* T) {
	return T->isObjCQualifiedInterfaceType();
}
bool clangExt_Type_isObjCQualifiedIdType(const Type* T) {
	return T->isObjCQualifiedIdType();
}
bool clangExt_Type_isObjCQualifiedClassType(const Type* T) {
	return T->isObjCQualifiedClassType();
}
bool clangExt_Type_isObjCObjectOrInterfaceType(const Type* T) {
	return T->isObjCObjectOrInterfaceType();
}
bool clangExt_Type_isObjCIdType(const Type* T) {
	return T->isObjCIdType();
}
bool clangExt_Type_isDecltypeType(const Type* T) {
	return T->isDecltypeType();
}
bool clangExt_Type_isObjCInertUnsafeUnretainedType(const Type* T) {
	return T->isObjCInertUnsafeUnretainedType();
}
bool clangExt_Type_isObjCClassType(const Type* T) {
	return T->isObjCClassType();
}
bool clangExt_Type_isObjCClassOrClassKindOfType(const Type* T) {
	return T->isObjCClassOrClassKindOfType();
}
bool clangExt_Type_isBlockCompatibleObjCPointerType(const Type* T, ASTContext* ctx) {
	return T->isBlockCompatibleObjCPointerType(*ctx);
}
bool clangExt_Type_isObjCSelType(const Type* T) {
	return T->isObjCSelType();
}
bool clangExt_Type_isObjCBuiltinType(const Type* T) {
	return T->isObjCBuiltinType();
}
bool clangExt_Type_isObjCARCBridgableType(const Type* T) {
	return T->isObjCARCBridgableType();
}
bool clangExt_Type_isCARCBridgableType(const Type* T) {
	return T->isCARCBridgableType();
}
bool clangExt_Type_isTemplateTypeParmType(const Type* T) {
	return T->isTemplateTypeParmType();
}
bool clangExt_Type_isNullPtrType(const Type* T) {
	return T->isNullPtrType();
}
bool clangExt_Type_isNothrowT(const Type* T) {
	return T->isNothrowT();
}
bool clangExt_Type_isAlignValT(const Type* T) {
	return T->isAlignValT();
}
bool clangExt_Type_isStdByteType(const Type* T) {
	return T->isStdByteType();
}
bool clangExt_Type_isAtomicType(const Type* T) {
	return T->isAtomicType();
}
bool clangExt_Type_isUndeducedAutoType(const Type* T) {
	return T->isUndeducedAutoType();
}
bool clangExt_Type_isTypedefNameType(const Type* T) {
	return T->isTypedefNameType();
}
Type::ScalarTypeKind clangExt_Type_getScalarTypeKind(const Type* T) {
	return T->getScalarTypeKind();
}
TypeDependence clangExt_Type_getDependence(const Type* T) {
	return T->getDependence();
}
bool clangExt_Type_containsErrors(const Type* T) {
	return T->containsErrors();
}
bool clangExt_Type_isDependentType(const Type* T) {
	return T->isDependentType();
}
bool clangExt_Type_isInstantiationDependentType(const Type* T) {
	return T->isInstantiationDependentType();
}
bool clangExt_Type_isUndeducedType(const Type* T) {
	return T->isUndeducedType();
}
bool clangExt_Type_isVariablyModifiedType(const Type* T) {
	return T->isVariablyModifiedType();
}
bool clangExt_Type_hasSizedVLAType(const Type* T) {
	return T->hasSizedVLAType();
}
bool clangExt_Type_hasUnnamedOrLocalType(const Type* T) {
	return T->hasUnnamedOrLocalType();
}
bool clangExt_Type_isOverloadableType(const Type* T) {
	return T->isOverloadableType();
}
bool clangExt_Type_isElaboratedTypeSpecifier(const Type* T) {
	return T->isElaboratedTypeSpecifier();
}
bool clangExt_Type_canDecayToPointerType(const Type* T) {
	return T->canDecayToPointerType();
}
bool clangExt_Type_hasPointerRepresentation(const Type* T) {
	return T->hasPointerRepresentation();
}
bool clangExt_Type_hasObjCPointerRepresentation(const Type* T) {
	return T->hasObjCPointerRepresentation();
}
bool clangExt_Type_hasIntegerRepresentation(const Type* T) {
	return T->hasIntegerRepresentation();
}
bool clangExt_Type_hasSignedIntegerRepresentation(const Type* T) {
	return T->hasSignedIntegerRepresentation();
}
bool clangExt_Type_hasUnsignedIntegerRepresentation(const Type* T) {
	return T->hasUnsignedIntegerRepresentation();
}
bool clangExt_Type_hasFloatingRepresentation(const Type* T) {
	return T->hasFloatingRepresentation();
}
const RecordType* clangExt_Type_getAsStructureType(const Type* T) {
	return T->getAsStructureType();
}
const RecordType* clangExt_Type_getAsUnionType(const Type* T) {
	return T->getAsUnionType();
}
const ComplexType* clangExt_Type_getAsComplexIntegerType(const Type* T) {
	return T->getAsComplexIntegerType();
}
const ObjCObjectType* clangExt_Type_getAsObjCInterfaceType(const Type* T) {
	return T->getAsObjCInterfaceType();
}
const ObjCObjectPointerType* clangExt_Type_getAsObjCInterfacePointerType(const Type* T) {
	return T->getAsObjCInterfacePointerType();
}
const ObjCObjectPointerType* clangExt_Type_getAsObjCQualifiedIdType(const Type* T) {
	return T->getAsObjCQualifiedIdType();
}
const ObjCObjectPointerType* clangExt_Type_getAsObjCQualifiedClassType(const Type* T) {
	return T->getAsObjCQualifiedClassType();
}
const ObjCObjectType* clangExt_Type_getAsObjCQualifiedInterfaceType(const Type* T) {
	return T->getAsObjCQualifiedInterfaceType();
}
const CXXRecordDecl* clangExt_Type_getAsCXXRecordDecl(const Type* T) {
	return T->getAsCXXRecordDecl();
}
const RecordDecl* clangExt_Type_getAsRecordDecl(const Type* T) {
	return T->getAsRecordDecl();
}
const TagDecl* clangExt_Type_getAsTagDecl(const Type* T) {
	return T->getAsTagDecl();
}
const CXXRecordDecl* clangExt_Type_getPointeeCXXRecordDecl(const Type* T) {
	return T->getPointeeCXXRecordDecl();
}
const DeducedType* clangExt_Type_getContainedDeducedType(const Type* T) {
	return T->getContainedDeducedType();
}
const AutoType* clangExt_Type_getContainedAutoType(const Type* T) {
	return T->getContainedAutoType();
}
bool clangExt_Type_hasAutoForTrailingReturnType(const Type* T) {
	return T->hasAutoForTrailingReturnType();
}
const ArrayType* clangExt_Type_getAsArrayTypeUnsafe(const Type* T) {
	return T->getAsArrayTypeUnsafe();
}
const ArrayType* clangExt_Type_castAsArrayTypeUnsafe(const Type* T) {
	return T->castAsArrayTypeUnsafe();
}
bool clangExt_Type_hasAttr(const Type* T, attr::Kind AK) {
	return T->hasAttr(AK);
}
const Type* clangExt_Type_getBaseElementTypeUnsafe(const Type* T) {
	return T->getBaseElementTypeUnsafe();
}
const Type* clangExt_Type_getArrayElementTypeNoTypeQual(const Type* T) {
	return T->getArrayElementTypeNoTypeQual();
}
const Type* clangExt_Type_getPointeeOrArrayElementType(const Type* T) {
	return T->getPointeeOrArrayElementType();
}
const CXQualType clangExt_Type_getPointeeType(const Type* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
const Type* clangExt_Type_getUnqualifiedDesugaredType(const Type* T) {
	return T->getUnqualifiedDesugaredType();
}
bool clangExt_Type_isPromotableIntegerType(const Type* T) {
	return T->isPromotableIntegerType();
}
bool clangExt_Type_isSignedIntegerType(const Type* T) {
	return T->isSignedIntegerType();
}
bool clangExt_Type_isUnsignedIntegerType(const Type* T) {
	return T->isUnsignedIntegerType();
}
bool clangExt_Type_isSignedIntegerOrEnumerationType(const Type* T) {
	return T->isSignedIntegerOrEnumerationType();
}
bool clangExt_Type_isUnsignedIntegerOrEnumerationType(const Type* T) {
	return T->isUnsignedIntegerOrEnumerationType();
}
bool clangExt_Type_isFixedPointType(const Type* T) {
	return T->isFixedPointType();
}
bool clangExt_Type_isFixedPointOrIntegerType(const Type* T) {
	return T->isFixedPointOrIntegerType();
}
bool clangExt_Type_isSaturatedFixedPointType(const Type* T) {
	return T->isSaturatedFixedPointType();
}
bool clangExt_Type_isUnsaturatedFixedPointType(const Type* T) {
	return T->isUnsaturatedFixedPointType();
}
bool clangExt_Type_isSignedFixedPointType(const Type* T) {
	return T->isSignedFixedPointType();
}
bool clangExt_Type_isUnsignedFixedPointType(const Type* T) {
	return T->isUnsignedFixedPointType();
}
bool clangExt_Type_isConstantSizeType(const Type* T) {
	return T->isConstantSizeType();
}
bool clangExt_Type_isSpecifierType(const Type* T) {
	return T->isSpecifierType();
}
Linkage clangExt_Type_getLinkage(const Type* T) {
	return T->getLinkage();
}
Visibility clangExt_Type_getVisibility(const Type* T) {
	return T->getVisibility();
}
bool clangExt_Type_isVisibilityExplicit(const Type* T) {
	return T->isVisibilityExplicit();
}
//LinkageInfo clangExt_Type_getLinkageAndVisibility(const Type* T) {
//	return T->getLinkageAndVisibility();
//}
bool clangExt_Type_isLinkageValid(const Type* T) {
	return T->isLinkageValid();
}
bool clangExt_Type_canHaveNullability(const Type* T, bool ResultIfUnknown) {
	return T->canHaveNullability(ResultIfUnknown);
}
bool clangExt_Type_acceptsObjCTypeParams(const Type* T) {
	return T->acceptsObjCTypeParams();
}
const char* clangExt_Type_getTypeClassName(const Type* T) {
	return T->getTypeClassName();
}
const CXQualType clangExt_Type_getCanonicalTypeInternal(const Type* T) {
	return T->getCanonicalTypeInternal().getAsOpaquePtr();
}
CXString clangExt_Type_dump(const Type* T, const ASTContext* Context) {
	std::string infoFile;
	llvm::raw_string_ostream infoOut(infoFile);
	T->dump(infoOut, *Context);
	return cxstring::createDup(infoFile.c_str());
}
//=======================================================================================================================
unsigned clangExt_BuiltinType_Kind_LastKind() {
	return BuiltinType::Kind::LastKind;
}
CXString clangExt_BuiltinType_Kind_GetKindName(BuiltinType::Kind i) {
	const char* s = nullptr;
#define TKIND(X) case BuiltinType::Kind::##X: s = ""  #X  ""; break

	switch (i) {
		// OpenCL image types
#define IMAGE_TYPE(ImgType, Id, SingletonId, Access, Suffix) TKIND(Id);
#include "clang/Basic/OpenCLImageTypes.def"
// OpenCL extension types
#define EXT_OPAQUE_TYPE(ExtType, Id, Ext) TKIND(Id);
#include "clang/Basic/OpenCLExtensionTypes.def"
// SVE Types
#define SVE_TYPE(Name, Id, SingletonId) TKIND(Id);
#include "clang/Basic/AArch64SVEACLETypes.def"
// PPC MMA Types
#define PPC_VECTOR_TYPE(Name, Id, Size) TKIND(Id);
#include "clang/Basic/PPCTypes.def"
// RVV Types
#define RVV_TYPE(Name, Id, SingletonId) TKIND(Id);
#include "clang/Basic/RISCVVTypes.def"
// All other builtin types
#define BUILTIN_TYPE(Id, SingletonId) TKIND(Id);
//#define LAST_BUILTIN_TYPE(Id) LastKind = TKIND(Id)
#include "clang/AST/BuiltinTypes.def"
	}
#undef TKIND

	return cxstring::createRef(s);
}
BuiltinType::Kind clangExt_BuiltinType_getKind(const BuiltinType* T) {
	return T->getKind();
}
CXString clangExt_BuiltinType_getName(const BuiltinType* T, const CXPrintingPolicy Policy) {
	return cxstring::createDup(T->getName(*static_cast<PrintingPolicy*>(Policy)));
}
const char* clangExt_BuiltinType_getNameAsCString(const BuiltinType* T, const CXPrintingPolicy Policy) {
	return T->getNameAsCString(*static_cast<PrintingPolicy*>(Policy));
}
bool clangExt_BuiltinType_isSugared(const BuiltinType* T) {
	return T->isSugared();
}
const CXQualType clangExt_BuiltinType_desugar(const BuiltinType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_BuiltinType_isInteger(const BuiltinType* T) {
	return T->isInteger();
}
bool clangExt_BuiltinType_isSignedInteger(const BuiltinType* T) {
	return T->isSignedInteger();
}
bool clangExt_BuiltinType_isUnsignedInteger(const BuiltinType* T) {
	return T->isUnsignedInteger();
}
bool clangExt_BuiltinType_isFloatingPoint(const BuiltinType* T) {
	return T->isFloatingPoint();
}
bool clangExt_BuiltinType_isSVEBool(const BuiltinType* T) {
	return T->isSVEBool();
}
bool clangExt_BuiltinType_isPlaceholderTypeKind(BuiltinType::Kind K) {
	return BuiltinType::isPlaceholderTypeKind(K);
}
bool clangExt_BuiltinType_isPlaceholderType(const BuiltinType* T) {
	return T->isPlaceholderType();
}
bool clangExt_BuiltinType_isNonOverloadPlaceholderType(const BuiltinType* T) {
	return T->isNonOverloadPlaceholderType();
}
bool clangExt_BuiltinType_classof(const Type* T) {
	return BuiltinType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_ComplexType_getElementType(const ComplexType* T) {
	return T->getElementType().getAsOpaquePtr();
}
bool clangExt_ComplexType_isSugared(const ComplexType* T) {
	return T->isSugared();
}
const CXQualType clangExt_ComplexType_desugar(const ComplexType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_ComplexType_classof(const Type* T) {
	return ComplexType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_ParenType_getInnerType(const ParenType* T) {
	return T->getInnerType().getAsOpaquePtr();
}
bool clangExt_ParenType_isSugared(const ParenType* T) {
	return T->isSugared();
}
const CXQualType clangExt_ParenType_desugar(const ParenType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_ParenType_classof(const Type* T) {
	return ParenType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_PointerType_getPointeeType(const PointerType* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
bool clangExt_PointerType_isSugared(const PointerType* T) {
	return T->isSugared();
}
const CXQualType clangExt_PointerType_desugar(const PointerType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_PointerType_classof(const Type* T) {
	return PointerType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_AdjustedType_getOriginalType(const AdjustedType* T) {
	return T->getOriginalType().getAsOpaquePtr();
}
const CXQualType clangExt_AdjustedType_getAdjustedType(const AdjustedType* T) {
	return T->getAdjustedType().getAsOpaquePtr();
}
bool clangExt_AdjustedType_isSugared(const AdjustedType* T) {
	return T->isSugared();
}
const CXQualType clangExt_AdjustedType_desugar(const AdjustedType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_AdjustedType_classof(const Type* T) {
	return AdjustedType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_DecayedType_getDecayedType(const DecayedType* T) {
	return T->getDecayedType().getAsOpaquePtr();
}
const CXQualType clangExt_DecayedType_getPointeeType(const DecayedType* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
bool clangExt_DecayedType_classof(const Type* T) {
	return DecayedType::classof(T);
}
//=======================================================================================================================
//=======================================================================================================================
CXQualType clangExt_BlockPointerType_getPointeeType(const BlockPointerType* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
bool clangExt_BlockPointerType_isSugared(const BlockPointerType* T) {
	return T->isSugared();
}
CXQualType clangExt_BlockPointerType_desugar(const BlockPointerType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_BlockPointerType_classof(const Type* T) {
	return BlockPointerType::classof(T);
}
//=======================================================================================================================
bool clangExt_ReferenceType_isSpelledAsLValue(const ReferenceType* T) {
	return T->isSpelledAsLValue();
}
bool clangExt_ReferenceType_isInnerRef(const ReferenceType* T) {
	return T->isInnerRef();
}
const CXQualType clangExt_ReferenceType_getPointeeTypeAsWritten(const ReferenceType* T) {
	return T->getPointeeTypeAsWritten().getAsOpaquePtr();
}
const CXQualType clangExt_ReferenceType_getPointeeType(const ReferenceType* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
bool clangExt_ReferenceType_classof(const Type* T) {
	return ReferenceType::classof(T);
}
//=======================================================================================================================
bool clangExt_LValueReferenceType_isSugared(const LValueReferenceType* T) {
	return T->isSugared();
}
const CXQualType clangExt_LValueReferenceType_desugar(const LValueReferenceType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_LValueReferenceType_classof(const Type* T) {
	return LValueReferenceType::classof(T);
}
//=======================================================================================================================
bool clangExt_RValueReferenceType_isSugared(const RValueReferenceType* T) {
	return T->isSugared();
}
const CXQualType clangExt_RValueReferenceType_desugar(const RValueReferenceType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_RValueReferenceType_classof(const Type* T) {
	return RValueReferenceType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_MemberPointerType_getPointeeType(const MemberPointerType* T) {
	return T->getPointeeType().getAsOpaquePtr();
}
bool clangExt_MemberPointerType_isMemberFunctionPointer(const MemberPointerType* T) {
	return T->isMemberFunctionPointer();
}
bool clangExt_MemberPointerType_isMemberDataPointer(const MemberPointerType* T) {
	return T->isMemberDataPointer();
}
const Type* clangExt_MemberPointerType_getClass(const MemberPointerType* T) {
	return T->getClass();
}
const CXXRecordDecl* clangExt_MemberPointerType_getMostRecentCXXRecordDecl(const MemberPointerType* T) {
	return T->getMostRecentCXXRecordDecl();
}
bool clangExt_MemberPointerType_isSugared(const MemberPointerType* T) {
	return T->isSugared();
}
const CXQualType clangExt_MemberPointerType_desugar(const MemberPointerType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_MemberPointerType_classof(const Type* T) {
	return MemberPointerType::classof(T);
}
//=======================================================================================================================
const CXQualType clangExt_ArrayType_getElementType(const ArrayType* T) {
	return T->getElementType().getAsOpaquePtr();
}
ArrayType::ArraySizeModifier clangExt_ArrayType_getSizeModifier(const ArrayType* T) {
	return T->getSizeModifier();
}
CXQualifiers clangExt_ArrayType_getIndexTypeQualifiers(const ArrayType* T) {
	return T->getIndexTypeQualifiers().getAsOpaqueValue();
}
unsigned clangExt_ArrayType_getIndexTypeCVRQualifiers(const ArrayType* T) {
	return T->getIndexTypeCVRQualifiers();
}
bool clangExt_ArrayType_classof(const Type* T) {
	return ArrayType::classof(T);
}
//=======================================================================================================================
const llvm::APInt* clangExt_ConstantArrayType_getSize(const ConstantArrayType* T) {
	return new llvm::APInt(T->getSize());
}
const Expr* clangExt_ConstantArrayType_getSizeExpr(const ConstantArrayType* T) {
	return T->getSizeExpr();
}
bool clangExt_ConstantArrayType_isSugared(const ConstantArrayType* T) {
	return T->isSugared();
}
const CXQualType clangExt_ConstantArrayType_desugar(const ConstantArrayType* T) {
	return T->desugar().getAsOpaquePtr();
}
unsigned clangExt_ConstantArrayType_getNumAddressingBits(const ASTContext* Context, const CXQualType ElementType, const llvm::APInt* NumElements) {
	return ConstantArrayType::getNumAddressingBits(*Context, QualType::getFromOpaquePtr(ElementType), *NumElements);
}
unsigned clangExt_ConstantArrayType_getMaxSizeBits(const ASTContext* Context) {
	return ConstantArrayType::getMaxSizeBits(*Context);
}
bool clangExt_ConstantArrayType_classof(const Type* T) {
	return ConstantArrayType::classof(T);
}
//=======================================================================================================================
bool clangExt_IncompleteArrayType_isSugared(const IncompleteArrayType* T) {
	return T->isSugared();
}
const CXQualType clangExt_IncompleteArrayType_desugar(const IncompleteArrayType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_IncompleteArrayType_classof(const Type* T) {
	return IncompleteArrayType::classof(T);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
const CXQualType clangExt_FunctionType_getReturnType(const FunctionType* T) {
	return T->getReturnType().getAsOpaquePtr();
}
bool clangExt_FunctionType_getHasRegParm(const FunctionType* T) {
	return T->getHasRegParm();
}
unsigned clangExt_FunctionType_getRegParmType(const FunctionType* T) {
	return T->getRegParmType();
}
bool clangExt_FunctionType_getNoReturnAttr(const FunctionType* T) {
	return T->getNoReturnAttr();
}
bool clangExt_FunctionType_getCmseNSCallAttr(const FunctionType* T) {
	return T->getCmseNSCallAttr();
}
CallingConv clangExt_FunctionType_getCallConv(const FunctionType* T) {
	return T->getCallConv();
}
// ExtInfo getExtInfo(const FunctionType* T);
bool clangExt_FunctionType_isConst(const FunctionType* T) {
	return T->isConst();
}
bool clangExt_FunctionType_isVolatile(const FunctionType* T) {
	return T->isVolatile();
}
bool clangExt_FunctionType_isRestrict(const FunctionType* T) {
	return T->isRestrict();
}
const CXQualType clangExt_FunctionType_getCallResultType(const FunctionType* T, const ASTContext* Context) {
	return T->getCallResultType(*Context).getAsOpaquePtr();
}
CXString clangExt_FunctionType_getNameForCallConv(CallingConv CC) {
	return cxstring::createDup(FunctionType::getNameForCallConv(CC));
}
bool clangExt_FunctionType_classof(const Type* T) {
	return FunctionType::classof(T);
}
//=======================================================================================================================
bool clangExt_FunctionNoProtoType_isSugared(const FunctionNoProtoType* T) {
	return T->isSugared();
}
const CXQualType clangExt_FunctionNoProtoType_desugar(const FunctionNoProtoType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_FunctionNoProtoType_classof(const Type* T) {
	return FunctionNoProtoType::classof(T);
}
//=======================================================================================================================
unsigned clangExt_FunctionProtoType_getNumParams(const FunctionProtoType* T) {
	return T->getNumParams();
}
const CXQualType clangExt_FunctionProtoType_getParamType(const FunctionProtoType* T, unsigned i) {
	if (i < T->getNumParams())
		return T->getParamType(i).getAsOpaquePtr();
	else
		return nullptr;
}
ExceptionSpecificationType clangExt_FunctionProtoType_getExceptionSpecType(const FunctionProtoType* T) {
	return T->getExceptionSpecType();
}
bool clangExt_FunctionProtoType_hasExceptionSpec(const FunctionProtoType* T) {
	return T->hasExceptionSpec();
}
bool clangExt_FunctionProtoType_hasDynamicExceptionSpec(const FunctionProtoType* T) {
	return T->hasDynamicExceptionSpec();
}
bool clangExt_FunctionProtoType_hasNoexceptExceptionSpec(const FunctionProtoType* T) {
	return T->hasNoexceptExceptionSpec();
}
bool clangExt_FunctionProtoType_hasDependentExceptionSpec(const FunctionProtoType* T) {
	return T->hasDependentExceptionSpec();
}
bool clangExt_FunctionProtoType_hasInstantiationDependentExceptionSpec(const FunctionProtoType* T) {
	return T->hasInstantiationDependentExceptionSpec();
}
unsigned clangExt_FunctionProtoType_getNumExceptions(const FunctionProtoType* T) {
	return T->getNumExceptions();
}
const CXQualType clangExt_FunctionProtoType_getExceptionType(const FunctionProtoType* T, unsigned i) {
	return T->getExceptionType(i).getAsOpaquePtr();
}
const Expr* clangExt_FunctionProtoType_getNoexceptExpr(const FunctionProtoType* T) {
	return T->getNoexceptExpr();
}
const FunctionDecl* clangExt_FunctionProtoType_getExceptionSpecDecl(const FunctionProtoType* T) {
	return T->getExceptionSpecDecl();
}
const FunctionDecl* clangExt_FunctionProtoType_getExceptionSpecTemplate(const FunctionProtoType* T) {
	return T->getExceptionSpecTemplate();
}
CanThrowResult clangExt_FunctionProtoType_canThrow(const FunctionProtoType* T) {
	return T->canThrow();
}
bool clangExt_FunctionProtoType_isNothrow(const FunctionProtoType* T, bool ResultIfDependent) {
	return T->isNothrow(ResultIfDependent);
}
bool clangExt_FunctionProtoType_isVariadic(const FunctionProtoType* T) {
	return T->isVariadic();
}
CXSourceLocation clangExt_FunctionProtoType_getEllipsisLoc(const FunctionProtoType* T, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), T->getEllipsisLoc());
}
bool clangExt_FunctionProtoType_isTemplateVariadic(const FunctionProtoType* T) {
	return T->isTemplateVariadic();
}
bool clangExt_FunctionProtoType_hasTrailingReturn(const FunctionProtoType* T) {
	return T->hasTrailingReturn();
}
CXQualifiers clangExt_FunctionProtoType_getMethodQuals(const FunctionProtoType* T) {
	return T->getMethodQuals().getAsOpaqueValue();
}
RefQualifierKind clangExt_FunctionProtoType_getRefQualifier(const FunctionProtoType* T) {
	return T->getRefQualifier();
}
bool clangExt_FunctionProtoType_hasExtParameterInfos(const FunctionProtoType* T) {
	return T->hasExtParameterInfos();
}
unsigned clangExt_FunctionProtoType_getNumExtParameterInfo(const FunctionProtoType* T) {
	return T->getExtParameterInfos().size();
}
const FunctionProtoType::ExtParameterInfo* clangExt_FunctionProtoType_getExtParameterInfo(const FunctionProtoType* T, unsigned i) {
	if (i < T->getExtParameterInfos().size())
		return &T->getExtParameterInfos()[i];
	else
		return nullptr;
}
ParameterABI clangExt_FunctionProtoType_getParameterABI(const FunctionProtoType* T, unsigned I) {
	return T->getParameterABI(I);
}
bool clangExt_FunctionProtoType_isParamConsumed(const FunctionProtoType* T, unsigned I) {
	return T->isParamConsumed(I);
}
bool clangExt_FunctionProtoType_isSugared(const FunctionProtoType* T) {
	return T->isSugared();
}
const CXQualType clangExt_FunctionProtoType_desugar(const FunctionProtoType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_FunctionProtoType_classof(const Type* T) {
	return FunctionProtoType::classof(T);
}
//=======================================================================================================================
const UnresolvedUsingTypenameDecl* clangExt_UnresolvedUsingType_getDecl(const UnresolvedUsingType* T) {
	return T->getDecl();
}
bool clangExt_UnresolvedUsingType_isSugared(const UnresolvedUsingType* T) {
	return T->isSugared();
}
const CXQualType clangExt_UnresolvedUsingType_desugar(const UnresolvedUsingType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_UnresolvedUsingType_classof(const Type* T) {
	return UnresolvedUsingType::classof(T);
}
//=======================================================================================================================
const UsingShadowDecl* clangExt_UsingType_getFoundDecl(const UsingType* T) {
	return T->getFoundDecl();
}
const CXQualType clangExt_UsingType_getUnderlyingType(const UsingType* T) {
	return T->getUnderlyingType().getAsOpaquePtr();
}
bool clangExt_UsingType_isSugared(const UsingType* T) {
	return T->isSugared();
}
const CXQualType clangExt_UsingType_desugar(const UsingType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_UsingType_classof(const Type* T) {
	return UsingType::classof(T);
}
//=======================================================================================================================
const TypedefNameDecl* clangExt_TypedefType_getDecl(const TypedefType* T) {
	return T->getDecl();
}
bool clangExt_TypedefType_isSugared(const TypedefType* T) {
	return T->isSugared();
}
const CXQualType clangExt_TypedefType_desugar(const TypedefType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_TypedefType_classof(const Type* T) {
	return TypedefType::classof(T);
}
//=======================================================================================================================
const TagDecl* clangExt_TagType_getDecl(const TagType* T) {
	return T->getDecl();
}
bool clangExt_TagType_isBeingDefined(const TagType* T) {
	return T->isBeingDefined();
}
bool clangExt_TagType_classof(const Type* T) {
	return TagType::classof(T);
}
//=======================================================================================================================
const RecordDecl* clangExt_RecordType_getDecl(const RecordType* T) {
	return T->getDecl();
}
bool clangExt_RecordType_hasConstFields(const RecordType* T) {
	return T->hasConstFields();
}
bool clangExt_RecordType_isSugared(const RecordType* T) {
	return T->isSugared();
}
const CXQualType clangExt_RecordType_desugar(const RecordType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_RecordType_classof(const Type* T) {
	return RecordType::classof(T);
}
//=======================================================================================================================
const EnumDecl* clangExt_EnumType_getDecl(const EnumType* T) {
	return T->getDecl();
}
bool clangExt_EnumType_isSugared(const EnumType* T) {
	return T->isSugared();
}
const CXQualType clangExt_EnumType_desugar(const EnumType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_EnumType_classof(const Type* T) {
	return EnumType::classof(T);
}
//=======================================================================================================================
AttributedType::Kind clangExt_AttributedType_getAttrKind(const AttributedType* T) {
	return T->getAttrKind();
}
const CXQualType clangExt_AttributedType_getModifiedType(const AttributedType* T) {
	return T->getModifiedType().getAsOpaquePtr();
}
const CXQualType clangExt_AttributedType_getEquivalentType(const AttributedType* T) {
	return T->getEquivalentType().getAsOpaquePtr();
}
bool clangExt_AttributedType_isSugared(const AttributedType* T) {
	return T->isSugared();
}
const CXQualType clangExt_AttributedType_desugar(const AttributedType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_AttributedType_isQualifier(const AttributedType* T) {
	return T->isQualifier();
}
bool clangExt_AttributedType_isMSTypeSpec(const AttributedType* T) {
	return T->isMSTypeSpec();
}
bool clangExt_AttributedType_isCallingConv(const AttributedType* T) {
	return T->isCallingConv();
}
bool clangExt_AttributedType_classof(const Type* T) {
	return AttributedType::classof(T);
}
//=======================================================================================================================
//=======================================================================================================================
bool clangExt_DeducedType_isSugared(const DeducedType* T) {
	return T->isSugared();
}
const CXQualType clangExt_DeducedType_desugar(const DeducedType* T) {
	return T->desugar().getAsOpaquePtr();
}
const CXQualType clangExt_DeducedType_getDeducedType(const DeducedType* T) {
	return T->getDeducedType().getAsOpaquePtr();
}
bool clangExt_DeducedType_isDeduced(const DeducedType* T) {
	return T->isDeduced();
}
bool clangExt_DeducedType_classof(const Type* T) {
	return DeducedType::classof(T);
}
//=======================================================================================================================
const TemplateArgument* clangExt_AutoType_getArgs(const AutoType* T) {
	return T->getArgs();
}
unsigned clangExt_AutoType_getNumArgs(const AutoType* T) {
	return T->getNumArgs();
}
const TemplateArgument* clangExt_AutoType_getArg(const AutoType* T, unsigned Idx) {
	return &T->getArg(Idx);
}
unsigned clangExt_AutoType_getNumTypeConstraintArgument(const AutoType* T) {
	return T->getTypeConstraintArguments().size();
}
const TemplateArgument* clangExt_AutoType_getTypeConstraintArgument(const AutoType* T, unsigned Idx) {
	if (Idx < T->getTypeConstraintArguments().size())
		return &T->getTypeConstraintArguments()[Idx];
	else
		return nullptr;
}
const ConceptDecl* clangExt_AutoType_getTypeConstraintConcept(const AutoType* T) {
	return T->getTypeConstraintConcept();
}
bool clangExt_AutoType_isConstrained(const AutoType* T) {
	return T->isConstrained();
}
bool clangExt_AutoType_isDecltypeAuto(const AutoType* T) {
	return T->isDecltypeAuto();
}
bool clangExt_AutoType_isGNUAutoType(const AutoType* T) {
	return T->isGNUAutoType();
}
AutoTypeKeyword clangExt_AutoType_getKeyword(const AutoType* T) {
	return T->getKeyword();
}
bool clangExt_AutoType_classof(const Type* T) {
	return AutoType::classof(T);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeyword(const TypeWithKeyword* T) {
	return T->getKeyword();
}
ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeywordForTypeSpec(unsigned TypeSpec) {
	return TypeWithKeyword::getKeywordForTypeSpec(TypeSpec);
}
TagTypeKind clangExt_TypeWithKeyword_getTagTypeKindForTypeSpec(unsigned TypeSpec) {
	return TypeWithKeyword::getTagTypeKindForTypeSpec(TypeSpec);
}
ElaboratedTypeKeyword clangExt_TypeWithKeyword_getKeywordForTagTypeKind(TagTypeKind Tag) {
	return TypeWithKeyword::getKeywordForTagTypeKind(Tag);
}
TagTypeKind clangExt_TypeWithKeyword_getTagTypeKindForKeyword(ElaboratedTypeKeyword Keyword) {
	return TypeWithKeyword::getTagTypeKindForKeyword(Keyword);
}
bool clangExt_TypeWithKeyword_KeywordIsTagTypeKind(ElaboratedTypeKeyword Keyword) {
	return TypeWithKeyword::KeywordIsTagTypeKind(Keyword);
}
CXString clangExt_TypeWithKeyword_getKeywordName(ElaboratedTypeKeyword Keyword) {
	return cxstring::createDup(TypeWithKeyword::getKeywordName(Keyword));
}
CXString clangExt_TypeWithKeyword_getTagTypeKindName(TagTypeKind Kind) {
	return cxstring::createDup(TypeWithKeyword::getTagTypeKindName(Kind));
}
//=======================================================================================================================
const NestedNameSpecifier* clangExt_ElaboratedType_getQualifier(const ElaboratedType* T) {
	return T->getQualifier();
}
const CXQualType clangExt_ElaboratedType_getNamedType(const ElaboratedType* T) {
	return T->getNamedType().getAsOpaquePtr();
}
const CXQualType clangExt_ElaboratedType_desugar(const ElaboratedType* T) {
	return T->desugar().getAsOpaquePtr();
}
bool clangExt_ElaboratedType_isSugared(const ElaboratedType* T) {
	return T->isSugared();
}
const TagDecl* clangExt_ElaboratedType_getOwnedTagDecl(const ElaboratedType* T) {
	return T->getOwnedTagDecl();
}
bool clangExt_ElaboratedType_classof(const Type* T) {
	return ElaboratedType::classof(T);
}