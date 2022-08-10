#include "Clang_Ext_AST_Expr.h"
#include "CXString.h"
#include "CXSourceLocation.h"

const CXQualType clangExt_Expr_getType(const Expr* e) {
	return e->getType().getAsOpaquePtr();
}
ExprDependence clangExt_Expr_getDependence(const Expr* e) {
	return e->getDependence();
}
bool clangExt_Expr_isValueDependent(const Expr* e) {
    return e->isValueDependent();
}
bool clangExt_Expr_isTypeDependent(const Expr* e) {
    return e->isTypeDependent();
}
bool clangExt_Expr_isInstantiationDependent(const Expr* e) {
    return e->isInstantiationDependent();
}
bool clangExt_Expr_containsUnexpandedParameterPack(const Expr* e) {
    return e->containsUnexpandedParameterPack();
}
bool clangExt_Expr_containsErrors(const Expr* e) {
    return e->containsErrors();
}
CXSourceLocation clangExt_Expr_getExprLoc(const Expr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getExprLoc());
}
bool clangExt_Expr_isReadIfDiscardedInCPlusPlus11(const Expr* e) {
    return e->isReadIfDiscardedInCPlusPlus11();
}
bool clangExt_Expr_isLValue(const Expr* e) {
    return e->isLValue();
}
bool clangExt_Expr_isPRValue(const Expr* e) {
    return e->isPRValue();
}
bool clangExt_Expr_isXValue(const Expr* e) {
    return e->isXValue();
}
bool clangExt_Expr_isGLValue(const Expr* e) {
    return e->isGLValue();
}
Expr::LValueClassification clangExt_Expr_ClassifyLValue(const Expr* e, const ASTContext* Ctx) {
    return e->ClassifyLValue(const_cast<ASTContext&>(*Ctx));
}
Expr::isModifiableLvalueResult clangExt_Expr_isModifiableLvalue(const Expr* e, const ASTContext* Ctx, CXSourceLocation* Loc) {
    if (Loc) {
        SourceLocation l = cxloc::translateSourceLocation(*Loc);
        Expr::isModifiableLvalueResult ret = e->isModifiableLvalue(const_cast<ASTContext&>(*Ctx), &l);
        *Loc = cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), l);
        return ret;
    }
    return e->isModifiableLvalue(const_cast<ASTContext&>(*Ctx), nullptr);
}
FPOptions::storage_type clangExt_Expr_getFPFeaturesInEffect(const Expr* e, const LangOptions* LO) {
    return e->getFPFeaturesInEffect(const_cast<LangOptions&>(*LO)).getAsOpaqueInt();
}
ExprValueKind clangExt_Expr_getValueKind(const Expr* e) {
    return e->getValueKind();
}
ExprObjectKind clangExt_Expr_getObjectKind(const Expr* e) {
    return e->getObjectKind();
}
bool clangExt_Expr_isOrdinaryOrBitFieldObject(const Expr* e) {
    return e->isOrdinaryOrBitFieldObject();
}
bool clangExt_Expr_refersToBitField(const Expr* e) {
    return e->refersToBitField();
}
const FieldDecl* clangExt_Expr_getSourceBitField(const Expr* e) {
    return e->getSourceBitField();
}
const Decl* clangExt_Expr_getReferencedDeclOfCallee(const Expr* e) {
    return e->getReferencedDeclOfCallee();
}
const ObjCPropertyRefExpr* clangExt_Expr_getObjCProperty(const Expr* e) {
    return e->getObjCProperty();
}
bool clangExt_Expr_isObjCSelfExpr(const Expr* e) {
    return e->isObjCSelfExpr();
}
bool clangExt_Expr_refersToVectorElement(const Expr* e) {
    return e->refersToVectorElement();
}
bool clangExt_Expr_refersToMatrixElement(const Expr* e) {
    return e->refersToMatrixElement();
}
bool clangExt_Expr_refersToGlobalRegisterVar(const Expr* e) {
    return e->refersToGlobalRegisterVar();
}
bool clangExt_Expr_hasPlaceholderType(const Expr* e) {
    return e->hasPlaceholderType();
}
bool clangExt_Expr_hasPlaceholderTypeKind(const Expr* e, BuiltinType::Kind K) {
    return e->hasPlaceholderType(K);
}
bool clangExt_Expr_isKnownToHaveBooleanValue(const Expr* e, bool Semantic) {
    return e->isKnownToHaveBooleanValue();
}
bool clangExt_Expr_isIntegerConstantExpr(const Expr* e, const ASTContext* Ctx, CXSourceLocation* Loc) {
    if (Loc) {
        SourceLocation l = cxloc::translateSourceLocation(*Loc);
        bool ret = e->isIntegerConstantExpr(const_cast<ASTContext&>(*Ctx), &l);
        *Loc = cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), l);
        return ret;
    }
    return e->isIntegerConstantExpr(const_cast<ASTContext&>(*Ctx), nullptr);
}
bool clangExt_Expr_isCXX98IntegralConstantExpr(const Expr* e, const ASTContext* Ctx) {
    return e->isCXX98IntegralConstantExpr(const_cast<ASTContext&>(*Ctx));
}
bool clangExt_Expr_isCXX11ConstantExpr(const Expr* e, const ASTContext* Ctx, APValue* Result, CXSourceLocation* Loc) {
    if (Loc) {
        SourceLocation l = cxloc::translateSourceLocation(*Loc);
        bool ret = e->isCXX11ConstantExpr(const_cast<ASTContext&>(*Ctx), Result ,&l);
        *Loc = cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), l);
        return ret;
    }
    return e->isCXX11ConstantExpr(const_cast<ASTContext&>(*Ctx), Result, nullptr);
}
bool clangExt_Expr_isConstantInitializer(const Expr* e, const ASTContext* Ctx, bool ForRef, const Expr** Culprit) {
    return e->isConstantInitializer(const_cast<ASTContext&>(*Ctx), ForRef, Culprit);
}
const ValueDecl* clangExt_Expr_getAsBuiltinConstantDeclRef(const Expr* e, const ASTContext* Ctx) {
    return e->getAsBuiltinConstantDeclRef(const_cast<ASTContext&>(*Ctx));
}
bool clangExt_Expr_tryEvaluateStrLen(const Expr* e, uint64_t* Result, const ASTContext* Ctx) {
    return e->tryEvaluateStrLen(*Result, const_cast<ASTContext&>(*Ctx));
}
Expr::NullPointerConstantKind clangExt_Expr_isNullPointerConstant(const Expr* e, const ASTContext* Ctx, Expr::NullPointerConstantValueDependence NPC) {
    return e->isNullPointerConstant(const_cast<ASTContext&>(*Ctx), NPC);
}
bool clangExt_Expr_isOBJCGCCandidate(const Expr* e, const ASTContext* Ctx) {
    return e->isOBJCGCCandidate(const_cast<ASTContext&>(*Ctx));
}
bool clangExt_Expr_isBoundMemberFunction(const Expr* e, const ASTContext* Ctx) {
    return e->isBoundMemberFunction(const_cast<ASTContext&>(*Ctx));
}
const Expr* clangExt_Expr_IgnoreUnlessSpelledInSource(const Expr* e) {
    return e->IgnoreUnlessSpelledInSource();
}
const Expr* clangExt_Expr_IgnoreImpCasts(const Expr* e) {
    return e->IgnoreImpCasts();
}
const Expr* clangExt_Expr_IgnoreCasts(const Expr* e) {
    return e->IgnoreCasts();
}
const Expr* clangExt_Expr_IgnoreImplicit(const Expr* e) {
    return e->IgnoreImplicit();
}
const Expr* clangExt_Expr_IgnoreImplicitAsWritten(const Expr* e) {
    return e->IgnoreImplicitAsWritten();
}
const Expr* clangExt_Expr_IgnoreParens(const Expr* e) {
    return e->IgnoreParens();
}
const Expr* clangExt_Expr_IgnoreParenImpCasts(const Expr* e) {
    return e->IgnoreParenImpCasts();
}
const Expr* clangExt_Expr_IgnoreParenCasts(const Expr* e) {
    return e->IgnoreParenCasts();
}
const Expr* clangExt_Expr_IgnoreConversionOperatorSingleStep(const Expr* e) {
    return e->IgnoreConversionOperatorSingleStep();
}
const Expr* clangExt_Expr_IgnoreParenLValueCasts(const Expr* e) {
    return e->IgnoreParenLValueCasts();
}
const Expr* clangExt_Expr_IgnoreParenNoopCasts(const Expr* e, const ASTContext* Ctx) {
    return e->IgnoreParenNoopCasts(const_cast<ASTContext&>(*Ctx));
}
const Expr* clangExt_Expr_IgnoreParenBaseCasts(const Expr* e) {
    return e->IgnoreParenBaseCasts();
}
bool clangExt_Expr_isDefaultArgument(const Expr* e) {
    return e->isDefaultArgument();
}
bool clangExt_Expr_isTemporaryObject(const Expr* e, const ASTContext* Ctx, const CXXRecordDecl* TempTy) {
    return e->isTemporaryObject(const_cast<ASTContext&>(*Ctx), TempTy);
}
bool clangExt_Expr_isImplicitCXXThis(const Expr* e) {
    return e->isImplicitCXXThis();
}
const CXXRecordDecl* clangExt_Expr_getBestDynamicClassType(const Expr* e) {
    return e->getBestDynamicClassType();
}
const Expr* clangExt_Expr_getBestDynamicClassTypeExpr(const Expr* e) {
    return e->getBestDynamicClassTypeExpr();
}
bool clangExt_Expr_isSameComparisonOperand(const Expr* E1, const Expr* E2) {
    return Expr::isSameComparisonOperand(E1, E2);
}
bool clangExt_Expr_classof(const Stmt* T) {
	return Expr::classof(T);
}
//=======================================================================================================================
const Expr* clangExt_FullExpr_getSubExpr(const FullExpr* e) {
    return e->getSubExpr();
}
bool clangExt_FullExpr_classof(const Stmt* T) {
    return FullExpr::classof(T);
}
//=======================================================================================================================
CXSourceLocation clangExt_ConstantExpr_getBeginLoc(const ConstantExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_ConstantExpr_getEndLoc(const ConstantExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_ConstantExpr_classof(const Stmt* T) {
    return ConstantExpr::classof(T);
}
APValue::ValueKind clangExt_ConstantExpr_getResultAPValueKind(const ConstantExpr* e) {
    return e->getResultAPValueKind();
}
ConstantExpr::ResultStorageKind clangExt_ConstantExpr_getResultStorageKind(const ConstantExpr* e) {
    return e->getResultStorageKind();
}
bool clangExt_ConstantExpr_isImmediateInvocation(const ConstantExpr* e) {
    return e->isImmediateInvocation();
}
bool clangExt_ConstantExpr_hasAPValueResult(const ConstantExpr* e) {
    return e->hasAPValueResult();
}
const APValue* clangExt_ConstantExpr_getAPValueResult(const ConstantExpr* e) {
    return new APValue(e->getAPValueResult());
}
const APValue* clangExt_ConstantExpr_getResultAsAPValue(const ConstantExpr* e) {
    return new APValue(e->getResultAsAPValue());
}
const llvm::APSInt* clangExt_ConstantExpr_getResultAsAPSInt(const ConstantExpr* e) {
    return new llvm::APSInt(e->getResultAsAPSInt());
}
unsigned clangExt_ConstantExpr_getNumChildren(const ConstantExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_ConstantExpr_getChildren(const ConstantExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
const ValueDecl* clangExt_DeclRefExpr_getDecl(const DeclRefExpr* e) {
    return e->getDecl();
}
CXSourceLocation clangExt_DeclRefExpr_getLocation(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLocation());
}
CXSourceLocation clangExt_DeclRefExpr_getBeginLoc(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_DeclRefExpr_getEndLoc(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_DeclRefExpr_hasQualifier(const DeclRefExpr* e) {
    return e->hasQualifier();
}
const NestedNameSpecifierLoc* clangExt_DeclRefExpr_getQualifierLoc(const DeclRefExpr* e) {
    return new NestedNameSpecifierLoc(e->getQualifierLoc());
}
const NestedNameSpecifier* clangExt_DeclRefExpr_getQualifier(const DeclRefExpr* e) {
    return e->getQualifier();
}
const NamedDecl* clangExt_DeclRefExpr_getFoundDecl(const DeclRefExpr* e) {
    return e->getFoundDecl();
}
bool clangExt_DeclRefExpr_hasTemplateKWAndArgsInfo(const DeclRefExpr* e) {
    return e->hasTemplateKWAndArgsInfo();
}
CXSourceLocation clangExt_DeclRefExpr_getTemplateKeywordLoc(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getTemplateKeywordLoc());
}
CXSourceLocation clangExt_DeclRefExpr_getLAngleLoc(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLAngleLoc());
}
CXSourceLocation clangExt_DeclRefExpr_getRAngleLoc(const DeclRefExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getRAngleLoc());
}
bool clangExt_DeclRefExpr_hasTemplateKeyword(const DeclRefExpr* e) {
    return e->hasTemplateKeyword();
}
bool clangExt_DeclRefExpr_hasExplicitTemplateArgs(const DeclRefExpr* e) {
    return e->hasExplicitTemplateArgs();
}
const TemplateArgumentLoc* clangExt_DeclRefExpr_getTemplateArgs(const DeclRefExpr* e) {
    return e->getTemplateArgs();
}
unsigned clangExt_DeclRefExpr_getNumTemplateArgs(const DeclRefExpr* e) {
    return e->getNumTemplateArgs();
}
const TemplateArgumentLoc* clangExt_DeclRefExpr_template_arguments(const DeclRefExpr* e, unsigned i) {
    if (i < e->template_arguments().size())
        return &e->template_arguments()[i];
    else
        return nullptr;
}
bool clangExt_DeclRefExpr_hadMultipleCandidates(const DeclRefExpr* e) {
    return e->hadMultipleCandidates();
}
NonOdrUseReason clangExt_DeclRefExpr_isNonOdrUse(const DeclRefExpr* e) {
    return e->isNonOdrUse();
}
bool clangExt_DeclRefExpr_refersToEnclosingVariableOrCapture(const DeclRefExpr* e) {
    return e->refersToEnclosingVariableOrCapture();
}
bool clangExt_DeclRefExpr_classof(const Stmt* T) {
    return DeclRefExpr::classof(T);
}
unsigned clangExt_DeclRefExpr_getNumChildren(const DeclRefExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_DeclRefExpr_getChildren(const DeclRefExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
CXSourceLocation clangExt_IntegerLiteral_getBeginLoc(const IntegerLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_IntegerLiteral_getEndLoc(const IntegerLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
CXSourceLocation clangExt_IntegerLiteral_getLocation(const IntegerLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLocation());
}
unsigned clangExt_IntegerLiteral_getNumChildren(const IntegerLiteral* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_IntegerLiteral_getChildren(const IntegerLiteral* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
bool clangExt_IntegerLiteral_classof(const Stmt* T) {
    return IntegerLiteral::classof(T);
}
const llvm::APInt* clangExt_IntegerLiteral_getValue(const IntegerLiteral* e) {
    return new llvm::APInt(e->getValue());
}
//=======================================================================================================================
CXSourceLocation clangExt_CharacterLiteral_getLocation(const CharacterLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLocation());
}
CharacterLiteral::CharacterKind clangExt_CharacterLiteral_getKind(const CharacterLiteral* e) {
    return e->getKind();
}
CXSourceLocation clangExt_CharacterLiteral_getBeginLoc(const CharacterLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_CharacterLiteral_getEndLoc(const CharacterLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
unsigned clangExt_CharacterLiteral_getValue(const CharacterLiteral* e) {
    return e->getValue();
}
bool clangExt_CharacterLiteral_classof(const Stmt* T) {
    return CharacterLiteral::classof(T);
}
CXString clangExt_CharacterLiteral_print(unsigned val, CharacterLiteral::CharacterKind Kind) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    CharacterLiteral::print(val, Kind, infoOut);
    return cxstring::createDup(info.c_str());
}
unsigned clangExt_CharacterLiteral_getNumChildren(const CharacterLiteral* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_CharacterLiteral_getChildren(const CharacterLiteral* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
const llvm::APFloat* clangExt_FloatingLiteral_getValue(const FloatingLiteral* e) {
    return new llvm::APFloat(e->getValue());
}
bool clangExt_FloatingLiteral_isExact(const FloatingLiteral* e) {
    return e->isExact();
}
CXSourceLocation clangExt_FloatingLiteral_getLocation(const FloatingLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLocation());
}
CXSourceLocation clangExt_FloatingLiteral_getBeginLoc(const FloatingLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_FloatingLiteral_getEndLoc(const FloatingLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_FloatingLiteral_classof(const Stmt* T) {
    return FloatingLiteral::classof(T);
}
unsigned clangExt_FloatingLiteral_getNumChildren(const FloatingLiteral* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_FloatingLiteral_getChildren(const FloatingLiteral* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
CXString clangExt_StringLiteral_getString(const StringLiteral* e) {
    return cxstring::createDup(e->getString());
}
CXString clangExt_StringLiteral_getBytes(const StringLiteral* e) {
    return cxstring::createDup(e->getBytes());
}
CXString clangExt_StringLiteral_outputString(const StringLiteral* e) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    e->outputString(infoOut);
    return cxstring::createDup(info.c_str());
}
uint32_t clangExt_StringLiteral_getCodeUnit(const StringLiteral* e, size_t i) {
    return e->getCodeUnit(i);
}
unsigned clangExt_StringLiteral_getByteLength(const StringLiteral* e) {
    return e->getByteLength();
}
unsigned clangExt_StringLiteral_getLength(const StringLiteral* e) {
    return e->getLength();
}
unsigned clangExt_StringLiteral_getCharByteWidth(const StringLiteral* e) {
    return e->getCharByteWidth();
}
StringLiteral::StringKind clangExt_StringLiteral_getKind(const StringLiteral* e) {
    return e->getKind();
}
bool clangExt_StringLiteral_isOrdinary(const StringLiteral* e) {
    return e->isOrdinary();
}
bool clangExt_StringLiteral_isWide(const StringLiteral* e) {
    return e->isWide();
}
bool clangExt_StringLiteral_isUTF8(const StringLiteral* e) {
    return e->isUTF8();
}
bool clangExt_StringLiteral_isUTF16(const StringLiteral* e) {
    return e->isUTF16();
}
bool clangExt_StringLiteral_isUTF32(const StringLiteral* e) {
    return e->isUTF32();
}
bool clangExt_StringLiteral_isPascal(const StringLiteral* e) {
    return e->isPascal();
}
bool clangExt_StringLiteral_containsNonAscii(const StringLiteral* e) {
    return e->containsNonAscii();
}
bool clangExt_StringLiteral_containsNonAsciiOrNull(const StringLiteral* e) {
    return e->containsNonAsciiOrNull();
}
unsigned clangExt_StringLiteral_getNumConcatenated(const StringLiteral* e) {
    return e->getNumConcatenated();
}
CXSourceLocation clangExt_StringLiteral_getStrTokenLoc(const StringLiteral* e, unsigned TokNum, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getStrTokenLoc(TokNum));
}
CXSourceLocation clangExt_StringLiteral_getLocationOfByte(const StringLiteral* e, unsigned ByteNo, const SourceManager* SM, const LangOptions* Features, const TargetInfo* Target, const ASTContext* Ctx, unsigned* StartToken, unsigned* StartTokenByteOffset) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), 
        e->getLocationOfByte(ByteNo, *SM, *Features, *Target, StartToken, StartTokenByteOffset)
        );
}
unsigned clangExt_StringLiteral_GetToklocNum(const StringLiteral* e) {
    ArrayRef<StringLiteral::tokloc_iterator> t = { e->tokloc_begin(), e->tokloc_end() };
    return t.size();
}
CXSourceLocation clangExt_StringLiteral_GetTokloc(const StringLiteral* e, unsigned i, const ASTContext* Ctx) {
    ArrayRef<StringLiteral::tokloc_iterator> t = { e->tokloc_begin(), e->tokloc_end() };
    if (i < t.size())
        return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), *t[i]);
    else
        return clang_getNullLocation();
}
CXSourceLocation clangExt_StringLiteral_getBeginLoc(const StringLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_StringLiteral_getEndLoc(const StringLiteral* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_StringLiteral_classof(const Stmt* T) {
    return StringLiteral::classof(T);
}
unsigned clangExt_StringLiteral_getNumChildren(const StringLiteral* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_StringLiteral_getChildren(const StringLiteral* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
const Expr* clangExt_ParenExpr_getSubExpr(const ParenExpr* e) {
    return e->getSubExpr();
}
CXSourceLocation clangExt_ParenExpr_getBeginLoc(const ParenExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_ParenExpr_getEndLoc(const ParenExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
CXSourceLocation clangExt_ParenExpr_getLParen(const ParenExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLParen());
}
CXSourceLocation clangExt_ParenExpr_getRParen(const ParenExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getRParen());
}
bool clangExt_ParenExpr_classof(const Stmt* T) {
    return ParenExpr::classof(T);
}
unsigned clangExt_ParenExpr_getNumChildren(const ParenExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_ParenExpr_getChildren(const ParenExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
UnaryOperator::Opcode clangExt_UnaryOperator_getOpcode(const UnaryOperator* e) {
    return e->getOpcode();
}
const Expr* clangExt_UnaryOperator_getSubExpr(const UnaryOperator* e) {
    return e->getSubExpr();
}
CXSourceLocation clangExt_UnaryOperator_getOperatorLoc(const UnaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getOperatorLoc());
}
bool clangExt_UnaryOperator_canOverflow(const UnaryOperator* e) {
    return e->canOverflow();
}
bool clangExt_UnaryOperator_isFPContractableWithinStatement(const UnaryOperator* e, const LangOptions* LO) {
    return e->isFPContractableWithinStatement(const_cast<LangOptions&>(*LO));
}
bool clangExt_UnaryOperator_isFEnvAccessOn(const UnaryOperator* e, const LangOptions* LO) {
    return e->isFEnvAccessOn(const_cast<LangOptions&>(*LO));
}
bool clangExt_UnaryOperator_isPostfixStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isPostfix(Op);
}
bool clangExt_UnaryOperator_isPrefixStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isPrefix(Op);
}
bool clangExt_UnaryOperator_isPrefix(const UnaryOperator* e) {
    return e->isPrefix();
}
bool clangExt_UnaryOperator_isPostfix(const UnaryOperator* e) {
    return e->isPostfix();
}
bool clangExt_UnaryOperator_isIncrementOpStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isIncrementOp(Op);
}
bool clangExt_UnaryOperator_isIncrementOp(const UnaryOperator* e) {
    return e->isIncrementOp();
}
bool clangExt_UnaryOperator_isDecrementOpStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isDecrementOp(Op);
}
bool clangExt_UnaryOperator_isDecrementOp(const UnaryOperator* e) {
    return e->isDecrementOp();
}
bool clangExt_UnaryOperator_isIncrementDecrementOpStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isIncrementDecrementOp(Op);
}
bool clangExt_UnaryOperator_isIncrementDecrementOp(const UnaryOperator* e) {
    return e->isIncrementDecrementOp();
}
bool clangExt_UnaryOperator_isArithmeticOpStatic(UnaryOperator::Opcode Op) {
    return UnaryOperator::isArithmeticOp(Op);
}
bool clangExt_UnaryOperator_isArithmeticOp(const UnaryOperator* e) {
    return e->isArithmeticOp();
}
CXString clangExt_UnaryOperator_getOpcodeStr(UnaryOperator::Opcode Op) {
    return cxstring::createDup(UnaryOperator::getOpcodeStr(Op));
}
UnaryOperator::Opcode clangExt_UnaryOperator_getOverloadedOpcode(OverloadedOperatorKind OO, bool Postfix) {
    return UnaryOperator::getOverloadedOpcode(OO, Postfix);
}
OverloadedOperatorKind clangExt_UnaryOperator_getOverloadedOperator(UnaryOperator::Opcode Opc) {
    return UnaryOperator::getOverloadedOperator(Opc);
}
CXSourceLocation clangExt_UnaryOperator_getBeginLoc(const UnaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_UnaryOperator_getEndLoc(const UnaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
CXSourceLocation clangExt_UnaryOperator_getExprLoc(const UnaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getExprLoc());
}
bool clangExt_UnaryOperator_classof(const Stmt* T) {
    return UnaryOperator::classof(T);
}
unsigned clangExt_UnaryOperator_getNumChildren(const UnaryOperator* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_UnaryOperator_getChildren(const UnaryOperator* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
bool clangExt_UnaryOperator_hasStoredFPFeatures(const UnaryOperator* e) {
    return e->hasStoredFPFeatures();
}
FPOptionsOverride::storage_type clangExt_UnaryOperator_getStoredFPFeatures(const UnaryOperator* e) {
    return e->getStoredFPFeatures().getAsOpaqueInt();
}
FPOptions::storage_type clangExt_UnaryOperator_getFPFeaturesInEffect(const UnaryOperator* e, const LangOptions* LO) {
    return e->getFPFeaturesInEffect(const_cast<LangOptions&>(*LO)).getAsOpaqueInt();
}
FPOptionsOverride::storage_type clangExt_UnaryOperator_getFPOptionsOverride(const UnaryOperator* e) {
    return e->getFPOptionsOverride().getAsOpaqueInt();
}
//=======================================================================================================================
UnaryExprOrTypeTrait clangExt_UnaryExprOrTypeTraitExpr_getKind(const UnaryExprOrTypeTraitExpr* e) {
    return e->getKind();
}
bool clangExt_UnaryExprOrTypeTraitExpr_isArgumentType(const UnaryExprOrTypeTraitExpr* e) {
    return e->isArgumentType();
}
const CXQualType clangExt_UnaryExprOrTypeTraitExpr_getArgumentType(const UnaryExprOrTypeTraitExpr* e) {
    return e->getArgumentType().getAsOpaquePtr();
}
const TypeSourceInfo* clangExt_UnaryExprOrTypeTraitExpr_getArgumentTypeInfo(const UnaryExprOrTypeTraitExpr* e) {
    return e->getArgumentTypeInfo();
}
const Expr* clangExt_UnaryExprOrTypeTraitExpr_getArgumentExpr(const UnaryExprOrTypeTraitExpr* e) {
    return e->getArgumentExpr();
}
const CXQualType clangExt_UnaryExprOrTypeTraitExpr_getTypeOfArgument(const UnaryExprOrTypeTraitExpr* e) {
    return e->getTypeOfArgument().getAsOpaquePtr();
}
CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getOperatorLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getOperatorLoc());
}
CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getRParenLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getRParenLoc());
}
CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getBeginLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getEndLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_UnaryExprOrTypeTraitExpr_classof(const Stmt* T) {
    return UnaryExprOrTypeTraitExpr::classof(T);
}
unsigned clangExt_UnaryExprOrTypeTraitExpr_getNumChildren(const UnaryExprOrTypeTraitExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_UnaryExprOrTypeTraitExpr_getChildren(const UnaryExprOrTypeTraitExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
CastKind clangExt_CastExpr_getCastKind(const CastExpr* e) {
    return e->getCastKind();
}
const char* clangExt_CastExpr_CastKindName(CastKind CK) {
    return CastExpr::getCastKindName(CK);
}
const char* clangExt_CastExpr_getCastKindName(const CastExpr* e) {
    return e->getCastKindName();
}
const Expr* clangExt_CastExpr_getSubExpr(const CastExpr* e) {
    return e->getSubExpr();
}
const Expr* clangExt_CastExpr_getSubExprAsWritten(const CastExpr* e) {
    return e->getSubExprAsWritten();
}
NamedDecl* clangExt_CastExpr_getConversionFunction(const CastExpr* e) {
    return e->getConversionFunction();
}
bool clangExt_CastExpr_path_empty(const CastExpr* e) {
    return e->path_empty();
}
unsigned clangExt_CastExpr_path_size(const CastExpr* e) {
    return e->path_size();
}
const CXXBaseSpecifier* clangExt_CastExpr_getPath(const CastExpr* e, unsigned i) {
    SmallVector<const CXXBaseSpecifier*, 4> base = { e->path_begin(), e->path_end() };
    if (i < base.size())
        return base[i];
    else
        return nullptr;
}
const FieldDecl* clangExt_CastExpr_getTargetUnionField(const CastExpr* e) {
    return e->getTargetUnionField();
}
bool clangExt_CastExpr_hasStoredFPFeatures(const CastExpr* e) {
    return e->hasStoredFPFeatures();
}
FPOptionsOverride::storage_type clangExt_CastExpr_getStoredFPFeatures(const CastExpr* e) {
    return e->getStoredFPFeatures().getAsOpaqueInt();
}
FPOptions::storage_type clangExt_CastExpr_getFPFeaturesInEffect(const CastExpr* e, const LangOptions* LO) {
    return e->getFPFeaturesInEffect(*LO).getAsOpaqueInt();
}
FPOptionsOverride::storage_type clangExt_CastExpr_getFPFeatures(const CastExpr* e) {
    return e->getFPFeatures().getAsOpaqueInt();
}
const FieldDecl* clangExt_CastExpr_getTargetFieldForToUnionCast(const CXQualType unionType, const CXQualType opType) {
    return CastExpr::getTargetFieldForToUnionCast(QualType::getFromOpaquePtr(unionType), QualType::getFromOpaquePtr(opType));
}
const FieldDecl* clangExt_CastExpr_getTargetFieldForToUnionCastRecordDecl(const RecordDecl* RD, const CXQualType opType) {
    return CastExpr::getTargetFieldForToUnionCast(RD, QualType::getFromOpaquePtr(opType));
}
bool clangExt_CastExpr_classof(const Stmt* T) {
    return CastExpr::classof(T);
}
unsigned clangExt_CastExpr_getNumChildren(const CastExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_CastExpr_getChildren(const CastExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
bool clangExt_ImplicitCastExpr_isPartOfExplicitCast(const ImplicitCastExpr* e) {
    return e->isPartOfExplicitCast();
}
CXSourceLocation clangExt_ImplicitCastExpr_getBeginLoc(const ImplicitCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_ImplicitCastExpr_getEndLoc(const ImplicitCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_ImplicitCastExpr_classof(const Stmt* T) {
    return ImplicitCastExpr::classof(T);
}
//=======================================================================================================================
const TypeSourceInfo* clangExt_ExplicitCastExpr_getTypeInfoAsWritten(const ExplicitCastExpr* e) {
    return e->getTypeInfoAsWritten();
}
const CXQualType clangExt_ExplicitCastExpr_getTypeAsWritten(const ExplicitCastExpr* e) {
    return e->getTypeAsWritten().getAsOpaquePtr();
}
bool clangExt_ExplicitCastExpr_classof(const Stmt* T) {
    return ExplicitCastExpr::classof(T);
}
//=======================================================================================================================
CXSourceLocation clangExt_CStyleCastExpr_getLParenLoc(const CStyleCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLParenLoc());
}
CXSourceLocation clangExt_CStyleCastExpr_getRParenLoc(const CStyleCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getRParenLoc());
}
CXSourceLocation clangExt_CStyleCastExpr_getBeginLoc(const CStyleCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_CStyleCastExpr_getEndLoc(const CStyleCastExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_CStyleCastExpr_classof(const Stmt* T) {
    return CStyleCastExpr::classof(T);
}
//=======================================================================================================================
CXSourceLocation clangExt_BinaryOperator_getExprLoc(const BinaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getExprLoc());
}
CXSourceLocation clangExt_BinaryOperator_getOperatorLoc(const BinaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getOperatorLoc());
}
BinaryOperator::Opcode clangExt_BinaryOperator_getOpcode(const BinaryOperator* e) {
    return e->getOpcode();
}
const Expr* clangExt_BinaryOperator_getLHS(const BinaryOperator* e) {
    return e->getLHS();
}
const Expr* clangExt_BinaryOperator_getRHS(const BinaryOperator* e) {
    return e->getRHS();
}
CXSourceLocation clangExt_BinaryOperator_getBeginLoc(const BinaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_BinaryOperator_getEndLoc(const BinaryOperator* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
CXString clangExt_BinaryOperator_getOpcodeStrStatic(BinaryOperator::Opcode Op) {
    return cxstring::createDup(BinaryOperator::getOpcodeStr(Op));
}
CXString clangExt_BinaryOperator_getOpcodeStr(const BinaryOperator* e) {
    return cxstring::createDup(e->getOpcodeStr());
}
BinaryOperator::Opcode clangExt_BinaryOperator_getOverloadedOpcode(OverloadedOperatorKind OO) {
    return BinaryOperator::getOverloadedOpcode(OO);
}
OverloadedOperatorKind clangExt_BinaryOperator_getOverloadedOperator(BinaryOperator::Opcode Opc) {
    return BinaryOperator::getOverloadedOperator(Opc);
}
bool clangExt_BinaryOperator_isPtrMemOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isPtrMemOp(Opc);
}
bool clangExt_BinaryOperator_isPtrMemOp(const BinaryOperator* e) {
    return e->isPtrMemOp();
}
bool clangExt_BinaryOperator_isMultiplicativeOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isMultiplicativeOp(Opc);
}
bool clangExt_BinaryOperator_isMultiplicativeOp(const BinaryOperator* e) {
    return e->isMultiplicativeOp();
}
bool clangExt_BinaryOperator_isAdditiveOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isAdditiveOp(Opc);
}
bool clangExt_BinaryOperator_isAdditiveOp(const BinaryOperator* e) {
    return e->isAdditiveOp();
}
bool clangExt_BinaryOperator_isShiftOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isShiftOp(Opc);
}
bool clangExt_BinaryOperator_isShiftOp(const BinaryOperator* e) {
    return e->isShiftOp();
}
bool clangExt_BinaryOperator_isBitwiseOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isBitwiseOp(Opc);
}
bool clangExt_BinaryOperator_isBitwiseOp(const BinaryOperator* e) {
    return e->isBitwiseOp();
}
bool clangExt_BinaryOperator_isRelationalOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isRelationalOp(Opc);
}
bool clangExt_BinaryOperator_isRelationalOp(const BinaryOperator* e) {
    return e->isRelationalOp();
}
bool clangExt_BinaryOperator_isEqualityOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isEqualityOp(Opc);
}
bool clangExt_BinaryOperator_isEqualityOp(const BinaryOperator* e) {
    return e->isEqualityOp();
}
bool clangExt_BinaryOperator_isComparisonOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isComparisonOp(Opc);
}
bool clangExt_BinaryOperator_isComparisonOp(const BinaryOperator* e) {
    return e->isComparisonOp();
}
bool clangExt_BinaryOperator_isCommaOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isCommaOp(Opc);
}
bool clangExt_BinaryOperator_isCommaOp(const BinaryOperator* e) {
    return e->isCommaOp();
}
BinaryOperator::Opcode clangExt_BinaryOperator_negateComparisonOp(BinaryOperator::Opcode Opc) {
    return BinaryOperator::negateComparisonOp(Opc);
}
BinaryOperator::Opcode clangExt_BinaryOperator_reverseComparisonOp(BinaryOperator::Opcode Opc) {
    return BinaryOperator::reverseComparisonOp(Opc);
}
bool clangExt_BinaryOperator_isLogicalOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isLogicalOp(Opc);
}
bool clangExt_BinaryOperator_isLogicalOp(const BinaryOperator* e) {
    return e->isLogicalOp();
}
bool clangExt_BinaryOperator_isAssignmentOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isAssignmentOp(Opc);
}
bool clangExt_BinaryOperator_isAssignmentOp(const BinaryOperator* e) {
    return e->isAssignmentOp();
}
bool clangExt_BinaryOperator_isCompoundAssignmentOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isShiftAssignOp(Opc);
}
bool clangExt_BinaryOperator_isCompoundAssignmentOp(const BinaryOperator* e) {
    return e->isCompoundAssignmentOp();
}
BinaryOperator::Opcode clangExt_BinaryOperator_getOpForCompoundAssignment(BinaryOperator::Opcode Opc) {
    return BinaryOperator::getOpForCompoundAssignment(Opc);
}
bool clangExt_BinaryOperator_isShiftAssignOpStatic(BinaryOperator::Opcode Opc) {
    return BinaryOperator::isShiftAssignOp(Opc);
}
bool clangExt_BinaryOperator_isShiftAssignOp(const BinaryOperator* e) {
    return e->isShiftAssignOp();
}
bool clangExt_BinaryOperator_isNullPointerArithmeticExtension(const ASTContext* Ctx, BinaryOperator::Opcode Opc, Expr* LHS, Expr* RHS) {
    return BinaryOperator::isNullPointerArithmeticExtension(
        const_cast<ASTContext&>(*Ctx), Opc, LHS, RHS
    );
}
bool clangExt_BinaryOperator_classof(const Stmt* S) {
    return BinaryOperator::classof(S);
}
unsigned clangExt_BinaryOperator_getNumChildren(const BinaryOperator* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_BinaryOperator_getChildren(const BinaryOperator* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
bool clangExt_BinaryOperator_hasStoredFPFeatures(const BinaryOperator* e) {
    return e->hasStoredFPFeatures();
}
FPOptionsOverride::storage_type clangExt_BinaryOperator_getStoredFPFeatures(const BinaryOperator* e) {
    return e->getStoredFPFeatures().getAsOpaqueInt();
}
FPOptions::storage_type clangExt_BinaryOperator_getFPFeaturesInEffect(const BinaryOperator* e, const LangOptions* LO) {
    return e->getFPFeaturesInEffect(const_cast<LangOptions&>(*LO)).getAsOpaqueInt();
}
FPOptionsOverride::storage_type clangExt_BinaryOperator_getFPFeatures(const BinaryOperator* e, const LangOptions* LO) {
    return e->getFPFeatures(const_cast<LangOptions&>(*LO)).getAsOpaqueInt();
}
bool clangExt_BinaryOperator_isFPContractableWithinStatement(const BinaryOperator* e, const LangOptions* LO) {
    return e->isFPContractableWithinStatement(const_cast<LangOptions&>(*LO));
}
bool clangExt_BinaryOperator_isFEnvAccessOn(const BinaryOperator* e, const LangOptions* LO) {
    return e->isFEnvAccessOn(const_cast<LangOptions&>(*LO));
}
//=======================================================================================================================
//=======================================================================================================================
unsigned clangExt_InitListExpr_getNumInits(const InitListExpr* e) {
    return e->getNumInits();
}
const Expr* clangExt_InitListExpr_getInit(const InitListExpr* e, unsigned Init) {
    return e->getInit(Init);
}
const Expr* clangExt_InitListExpr_getArrayFiller(const InitListExpr* e) {
    return e->getArrayFiller();
}
bool clangExt_InitListExpr_hasArrayFiller(const InitListExpr* e) {
    return e->hasArrayFiller();
}
const FieldDecl* clangExt_InitListExpr_getInitializedFieldInUnion(const InitListExpr* e) {
    return e->getInitializedFieldInUnion();
}
bool clangExt_InitListExpr_isExplicit(const InitListExpr* e) {
    return e->isExplicit();
}
bool clangExt_InitListExpr_isStringLiteralInit(const InitListExpr* e) {
    return e->isStringLiteralInit();
}
bool clangExt_InitListExpr_isTransparent(const InitListExpr* e) {
    return e->isTransparent();
}
bool clangExt_InitListExpr_isIdiomaticZeroInitializer(const InitListExpr* e, const LangOptions* LangOpts) {
    return e->isIdiomaticZeroInitializer(const_cast<LangOptions&>(*LangOpts));
}
CXSourceLocation clangExt_InitListExpr_getLBraceLoc(const InitListExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getLBraceLoc());
}
CXSourceLocation clangExt_InitListExpr_getRBraceLoc(const InitListExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getRBraceLoc());
}
bool clangExt_InitListExpr_isSemanticForm(const InitListExpr* e) {
    return e->isSemanticForm();
}
const InitListExpr* clangExt_InitListExpr_getSemanticForm(const InitListExpr* e) {
    return e->getSemanticForm();
}
bool clangExt_InitListExpr_isSyntacticForm(const InitListExpr* e) {
    return e->isSyntacticForm();
}
const InitListExpr* clangExt_InitListExpr_getSyntacticForm(const InitListExpr* e) {
    return e->getSyntacticForm();
}
bool clangExt_InitListExpr_hadArrayRangeDesignator(const InitListExpr* e) {
    return e->hadArrayRangeDesignator();
}
CXSourceLocation clangExt_InitListExpr_getBeginLoc(const InitListExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getBeginLoc());
}
CXSourceLocation clangExt_InitListExpr_getEndLoc(const InitListExpr* e, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), e->getEndLoc());
}
bool clangExt_InitListExpr_classof(const Stmt* T) {
    return InitListExpr::classof(T);
}
unsigned clangExt_InitListExpr_getNumChildren(const InitListExpr* e) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    return stmts.size();
}
const Stmt* clangExt_InitListExpr_getChildren(const InitListExpr* e, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { e->children().begin(), e->children().end() };
    if (i < stmts.size())
        return stmts[i];
    else
        return nullptr;
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================

