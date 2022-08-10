#include "Clang_Ext_AST_APValue.h"
#include "CXString.h"

//=======================================================================================================================
void clangExt_APValue_LValueBase_Dispose(APValue::LValueBase* a) {
    delete(a);
}
bool clangExt_APValue_LValueBase_is_ValueDecl(const APValue::LValueBase* a) {
    return a->is<const ValueDecl*>();
}
bool clangExt_APValue_LValueBase_is_Expr(const APValue::LValueBase* a) {
    return a->is<const Expr*>();
}
bool clangExt_APValue_LValueBase_is_TypeInfoLValue(const APValue::LValueBase* a) {
    return a->is<TypeInfoLValue>();
}
bool clangExt_APValue_LValueBase_is_DynamicAllocLValue(const APValue::LValueBase* a) {
    return a->is<DynamicAllocLValue>();
}

const ValueDecl* clangExt_APValue_LValueBase_get_ValueDecl(const APValue::LValueBase* a) {
    return a->get<const ValueDecl*>();
}
const Expr* clangExt_APValue_LValueBase_get_Expr(const APValue::LValueBase* a) {
    return a->get<const Expr*>();
}
const APValue_TypeInfoLValue clangExt_APValue_LValueBase_get_TypeInfoLValue(const APValue::LValueBase* a) {
    return a->get<TypeInfoLValue>().getOpaqueValue();
}
const APValue_DynamicAllocLValue clangExt_APValue_LValueBase_get_DynamicAllocLValue(const APValue::LValueBase* a) {
    return a->get<DynamicAllocLValue>().getOpaqueValue();
}

const ValueDecl* clangExt_APValue_LValueBase_dyn_cast_ValueDecl(const APValue::LValueBase* a) {
    return a->dyn_cast<const ValueDecl*>();
}
const Expr* clangExt_APValue_LValueBase_dyn_cast_Expr(const APValue::LValueBase* a) {
    return a->dyn_cast<const Expr*>();
}
const APValue_TypeInfoLValue clangExt_APValue_LValueBase_dyn_cast_TypeInfoLValue(const APValue::LValueBase* a) {
    return a->dyn_cast<TypeInfoLValue>().getOpaqueValue();
}
const APValue_DynamicAllocLValue clangExt_APValue_LValueBase_dyn_cast_DynamicAllocLValue(const APValue::LValueBase* a) {
    return a->dyn_cast<DynamicAllocLValue>().getOpaqueValue();
}

const void* clangExt_APValue_LValueBase_getOpaqueValue(const APValue::LValueBase* a) {
    return a->getOpaqueValue();
}
bool clangExt_APValue_LValueBase_isNull(const APValue::LValueBase* a) {
    return a->isNull();
}
unsigned clangExt_APValue_LValueBase_getCallIndex(const APValue::LValueBase* a) {
    return a->getCallIndex();
}
unsigned clangExt_APValue_LValueBase_getVersion(const APValue::LValueBase* a) {
    return a->getVersion();
}
const CXQualType clangExt_APValue_LValueBase_getTypeInfoType(const APValue::LValueBase* a) {
    return a->getTypeInfoType().getAsOpaquePtr();
}
const CXQualType clangExt_APValue_LValueBase_getDynamicAllocType(const APValue::LValueBase* a) {
    return a->getDynamicAllocType().getAsOpaquePtr();
}
const CXQualType clangExt_APValue_LValueBase_getType(const APValue::LValueBase* a) {
    return a->getType().getAsOpaquePtr();
}
//=======================================================================================================================
void clangExt_APValue_Dispose(APValue* a) {
    delete(a);
}
bool clangExt_APValue_needsCleanup(const APValue* a) {
    return a->needsCleanup();
}
APValue::ValueKind clangExt_APValue_getKind(const APValue* a) {
    return a->getKind();
}
bool clangExt_APValue_isAbsent(const APValue* a) {
    return a->isAbsent();
}
bool clangExt_APValue_isIndeterminate(const APValue* a) {
    return a->isIndeterminate();
}
bool clangExt_APValue_hasValue(const APValue* a) {
    return a->hasValue();
}
bool clangExt_APValue_isInt(const APValue* a) {
    return a->isInt();
}
bool clangExt_APValue_isFloat(const APValue* a) {
    return a->isFloat();
}
bool clangExt_APValue_isFixedPoint(const APValue* a) {
    return a->isFixedPoint();
}
bool clangExt_APValue_isComplexInt(const APValue* a) {
    return a->isComplexInt();
}
bool clangExt_APValue_isComplexFloat(const APValue* a) {
    return a->isComplexFloat();
}
bool clangExt_APValue_isLValue(const APValue* a) {
    return a->isLValue();
}
bool clangExt_APValue_isVector(const APValue* a) {
    return a->isVector();
}
bool clangExt_APValue_isArray(const APValue* a) {
    return a->isArray();
}
bool clangExt_APValue_isStruct(const APValue* a) {
    return a->isStruct();
}
bool clangExt_APValue_isUnion(const APValue* a) {
    return a->isUnion();
}
bool clangExt_APValue_isMemberPointer(const APValue* a) {
    return a->isMemberPointer();
}
bool clangExt_APValue_isAddrLabelDiff(const APValue* a) {
    return a->isAddrLabelDiff();
}
CXString clangExt_APValue_dump(const APValue* a, const ASTContext* Context) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    a->dump(infoOut, const_cast<ASTContext&>(*Context));
    return cxstring::createDup(info.c_str());
}
CXString clangExt_APValue_printPretty(const APValue* a, const ASTContext* Ctx, const CXQualType Ty) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    a->printPretty(infoOut, const_cast<ASTContext&>(*Ctx), QualType::getFromOpaquePtr(Ty));
    return cxstring::createDup(info.c_str());
}
CXString clangExt_APValue_printPretty2(const APValue* a, const CXPrintingPolicy Policy, const CXQualType Ty, const ASTContext* Ctx) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    a->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy), QualType::getFromOpaquePtr(Ty), Ctx);
    return cxstring::createDup(info.c_str());
}
CXString clangExt_APValue_getAsString(const APValue* a, const ASTContext* Ctx, const CXQualType Ty) {
    return cxstring::createDup(a->getAsString(const_cast<ASTContext&>(*Ctx), QualType::getFromOpaquePtr(Ty)).c_str());
}
const APSInt* clangExt_APValue_getInt(const APValue* a) {
    return &a->getInt();
}
const APFloat* clangExt_APValue_getFloat(const APValue* a) {
    return &a->getFloat();
}
const APFixedPoint* clangExt_APValue_getFixedPoint(const APValue* a) {
    return &a->getFixedPoint();
}
const APSInt* clangExt_APValue_getComplexIntReal(const APValue* a) {
    return &a->getComplexIntReal();
}
const APSInt* clangExt_APValue_getComplexIntImag(const APValue* a) {
    return &a->getComplexIntImag();
}
const APFloat* clangExt_APValue_getComplexFloatReal(const APValue* a) {
    return &a->getComplexFloatReal();
}
const APFloat* clangExt_APValue_getComplexFloatImag(const APValue* a) {
    return &a->getComplexFloatImag();
}
const APValue::LValueBase* clangExt_APValue_getLValueBase(const APValue* a) {
    return new APValue::LValueBase(a->getLValueBase());
}
const CharUnits* clangExt_APValue_getLValueOffset(const APValue* a) {
    return &a->getLValueOffset();
}
bool clangExt_APValue_isLValueOnePastTheEnd(const APValue* a) {
    return a->isLValueOnePastTheEnd();
}
bool clangExt_APValue_hasLValuePath(const APValue* a) {
    return a->hasLValuePath();
}
unsigned clangExt_APValue_getNumLValuePath(const APValue* a) {
    return a->getLValuePath().size();
}
const APValue::LValuePathEntry* clangExt_APValue_getLValuePath(const APValue* a, unsigned i) {
    if (i < a->getLValuePath().size())
        return &a->getLValuePath()[i];
    else
        return nullptr;
}
unsigned clangExt_APValue_getLValueCallIndex(const APValue* a) {
    return a->getLValueCallIndex();
}
unsigned clangExt_APValue_getLValueVersion(const APValue* a) {
    return a->getLValueVersion();
}
bool clangExt_APValue_isNullPointer(const APValue* a) {
    return a->isNullPointer();
}
const APValue* clangExt_APValue_getVectorElt(const APValue* a, unsigned I) {
    return &a->getVectorElt(I);
}
unsigned clangExt_APValue_getVectorLength(const APValue* a) {
    return a->getVectorLength();
}
const APValue* clangExt_APValue_getArrayInitializedElt(const APValue* a, unsigned I) {
    return &a->getArrayInitializedElt(I);
}
bool clangExt_APValue_hasArrayFiller(const APValue* a) {
    return a->hasArrayFiller();
}
const APValue* clangExt_APValue_getArrayFiller(const APValue* a) {
    return &a->getArrayFiller();
}
unsigned clangExt_APValue_getArrayInitializedElts(const APValue* a) {
    return a->getArrayInitializedElts();
}
unsigned clangExt_APValue_getArraySize(const APValue* a) {
    return a->getArraySize();
}
unsigned clangExt_APValue_getStructNumBases(const APValue* a) {
    return a->getStructNumBases();
}
unsigned clangExt_APValue_getStructNumFields(const APValue* a) {
    return a->getStructNumFields();
}
const APValue* clangExt_APValue_getStructBase(const APValue* a, unsigned i) {
    return &a->getStructBase(i);
}
const APValue* clangExt_APValue_getStructField(const APValue* a, unsigned i) {
    return &a->getStructField(i);
}
const FieldDecl* clangExt_APValue_getUnionField(const APValue* a) {
    return a->getUnionField();
}
const APValue* clangExt_APValue_getUnionValue(const APValue* a) {
    return &a->getUnionValue();
}
const ValueDecl* clangExt_APValue_getMemberPointerDecl(const APValue* a) {
    return a->getMemberPointerDecl();
}
bool clangExt_APValue_isMemberPointerToDerivedMember(const APValue* a) {
    return a->isMemberPointerToDerivedMember();
}
const AddrLabelExpr* clangExt_APValue_getAddrLabelDiffLHS(const APValue* a) {
    return a->getAddrLabelDiffLHS();
}
const AddrLabelExpr* clangExt_APValue_getAddrLabelDiffRHS(const APValue* a) {
    return a->getAddrLabelDiffRHS();
}
//=======================================================================================================================