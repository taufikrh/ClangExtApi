#include "Clang_Ext_AST_Decl.h"
#include <clang/AST/TypeLoc.h>
#include "CXSourceLocation.h"
#include "CXString.h"
#include "clang/AST/Mangle.h"

using namespace clang;

//=======================================================================================================================
const ASTContext* clangExt_TranslationUnitDecl_getASTContext(const TranslationUnitDecl* T) {
	return const_cast<const ASTContext*>(&T->getASTContext());
}
const NamespaceDecl* clangExt_TranslationUnitDecl_getAnonymousNamespace(const TranslationUnitDecl* T) {
	return T->getAnonymousNamespace();
}
bool clangExt_TranslationUnitDecl_classof(const Decl* D) {
	return TranslationUnitDecl::classof(D);
}
bool clangExt_TranslationUnitDecl_classofKind(Decl::Kind K) {
	return TranslationUnitDecl::classofKind(K);
}
const DeclContext* clangExt_TranslationUnitDecl_castToDeclContext(const TranslationUnitDecl* D) {
	return TranslationUnitDecl::castToDeclContext(D);
}
const TranslationUnitDecl* clangExt_TranslationUnitDecl_castFromDeclContext(const DeclContext* DC) {
	return TranslationUnitDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
PragmaMSCommentKind clangExt_PragmaCommentDecl_getCommentKind(const PragmaCommentDecl* D) {
	return D->getCommentKind();
}
CXString clangExt_PragmaCommentDecl_getArg(const PragmaCommentDecl* D) {
	return cxstring::createDup(D->getArg());
}
bool clangExt_PragmaCommentDecl_classof(const Decl* D) {
	return PragmaCommentDecl::classof(D);
}
bool clangExt_PragmaCommentDecl_classofKind(Decl::Kind K) {
	return PragmaCommentDecl::classofKind(K);
}
//=======================================================================================================================
CXString clangExt_PragmaDetectMismatchDecl_getName(const PragmaDetectMismatchDecl* D) {
	return cxstring::createDup(D->getName());
}
CXString clangExt_PragmaDetectMismatchDecl_getValue(const PragmaDetectMismatchDecl* D) {
	return cxstring::createDup(D->getValue());
}
bool clangExt_PragmaDetectMismatchDecl_classof(const Decl* D) {
	return PragmaDetectMismatchDecl::classof(D);
}
bool clangExt_PragmaDetectMismatchDecl_classofKind(Decl::Kind K) {
	return PragmaDetectMismatchDecl::classofKind(K);
}
//=======================================================================================================================
bool clangExt_ExternCContextDecl_classof(const Decl* D) {
	return ExternCContextDecl::classof(D);
}
bool clangExt_ExternCContextDecl_classofKind(Decl::Kind K) {
	return ExternCContextDecl::classofKind(K);
}
const DeclContext* clangExt_ExternCContextDecl_castToDeclContext(const ExternCContextDecl* D) {
	return ExternCContextDecl::castToDeclContext(D);
}
const ExternCContextDecl* clangExt_ExternCContextDecl_castFromDeclContext(const DeclContext* DC) {
	return ExternCContextDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
const IdentifierInfo* clangExt_NamedDecl_getIdentifier(const NamedDecl* D) {
	return D->getIdentifier();
}
CXString clangExt_NamedDecl_getName(const NamedDecl* D) {
	return cxstring::createDup(D->getName());
}
CXString clangExt_NamedDecl_getNameAsString(const NamedDecl* D) {
	return cxstring::createDup(StringRef(D->getNameAsString()));
}
const CXDeclarationName clangExt_NamedDecl_getDeclName(const NamedDecl* D) {
	return D->getDeclName().getAsOpaquePtr();
}
CXString clangExt_NamedDecl_getQualifiedNameAsString(const NamedDecl* D) {
	return cxstring::createDup(StringRef(D->getQualifiedNameAsString()));
}
bool clangExt_NamedDecl_hasLinkage(const NamedDecl* D) {
	return D->hasLinkage();
}
bool clangExt_NamedDecl_isCXXClassMember(const NamedDecl* D) {
	return D->isCXXClassMember();
}
bool clangExt_NamedDecl_isCXXInstanceMember(const NamedDecl* D) {
	return D->isCXXInstanceMember();
}
ReservedIdentifierStatus clangExt_NamedDecl_isReserved(const NamedDecl* D, const LangOptions* LangOpts) {
	return D->isReserved(const_cast<LangOptions&>(*LangOpts));
}
Linkage clangExt_NamedDecl_getLinkageInternal(const NamedDecl* D) {
	return D->getLinkageInternal();
}
Linkage clangExt_NamedDecl_getFormalLinkage(const NamedDecl* D) {
	return D->getFormalLinkage();
}
bool clangExt_NamedDecl_hasExternalFormalLinkage(const NamedDecl* D) {
	return D->hasExternalFormalLinkage();
}
bool clangExt_NamedDecl_isExternallyVisible(const NamedDecl* D) {
	return D->isExternallyVisible();
}
bool clangExt_NamedDecl_isExternallyDeclarable(const NamedDecl* D) {
	return D->isExternallyDeclarable();
}
Visibility clangExt_NamedDecl_getVisibility(const NamedDecl* D) {
	return D->getVisibility();
}
bool clangExt_NamedDecl_isLinkageValid(const NamedDecl* D) {
	return D->isLinkageValid();
}
bool clangExt_NamedDecl_hasLinkageBeenComputed(const NamedDecl* D) {
	return D->hasLinkageBeenComputed();
}
const NamedDecl* clangExt_NamedDecl_getUnderlyingDecl(const NamedDecl* D) {
	return D->getUnderlyingDecl();
}
const NamedDecl* clangExt_NamedDecl_getMostRecentDecl(const NamedDecl* D) {
	return D->getMostRecentDecl();
}
bool clangExt_NamedDecl_classof(const Decl* D) {
	return NamedDecl::classof(D);
}
bool clangExt_NamedDecl_classofKind(Decl::Kind K) {
	return NamedDecl::classofKind(K);
}
//=======================================================================================================================
const LabelStmt* clangExt_LabelDecl_getStmt(const LabelDecl* D) {
	return D->getStmt();
}
bool clangExt_LabelDecl_isGnuLocal(const LabelDecl* D) {
	return D->isGnuLocal();
}
CXSourceRange clangExt_LabelDecl_getSourceRange(const LabelDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
bool clangExt_LabelDecl_isMSAsmLabel(const LabelDecl* D) {
	return D->isMSAsmLabel();
}
bool clangExt_LabelDecl_isResolvedMSAsmLabel(const LabelDecl* D) {
	return D->isResolvedMSAsmLabel();
}
CXString clangExt_LabelDecl_getMSAsmLabel(const LabelDecl* D) {
	return cxstring::createDup(D->getMSAsmLabel());
}
bool clangExt_LabelDecl_classof(const Decl* D) {
	return LabelDecl::classof(D);
}
bool clangExt_LabelDecl_classofKind(Decl::Kind K) {
	return LabelDecl::classofKind(K);
}
//=======================================================================================================================
bool clangExt_NamespaceDecl_isAnonymousNamespace(const NamespaceDecl* D) {
	return D->isAnonymousNamespace();
}
bool clangExt_NamespaceDecl_isInline(const NamespaceDecl* D) {
	return D->isInline();
}
bool clangExt_NamespaceDecl_isRedundantInlineQualifierFor(const NamespaceDecl* D, const CXDeclarationName Name) {
	return D->isRedundantInlineQualifierFor(DeclarationName::getFromOpaquePtr(Name));
}
const NamespaceDecl* clangExt_NamespaceDecl_getOriginalNamespace(const NamespaceDecl* D) {
	return D->getOriginalNamespace();
}
bool clangExt_NamespaceDecl_isOriginalNamespace(const NamespaceDecl* D) {
	return D->isOriginalNamespace();
}
const NamespaceDecl* clangExt_NamespaceDecl_getAnonymousNamespace(const NamespaceDecl* D) {
	return D->getAnonymousNamespace();
}
const NamespaceDecl* clangExt_NamespaceDecl_getCanonicalDecl(const NamespaceDecl* D) {
	return D->getCanonicalDecl();
}
CXSourceRange clangExt_NamespaceDecl_getSourceRange(const NamespaceDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
CXSourceLocation clangExt_NamespaceDecl_getBeginLoc(const NamespaceDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getBeginLoc());
}
CXSourceLocation clangExt_NamespaceDecl_getRBraceLoc(const NamespaceDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getRBraceLoc());
}
bool clangExt_NamespaceDecl_classof(const Decl* D) {
	return NamespaceDecl::classof(D);
}
bool clangExt_NamespaceDecl_classofKind(Decl::Kind K) {
	return NamespaceDecl::classofKind(K);
}
const DeclContext* clangExt_NamespaceDecl_castToDeclContext(const NamespaceDecl* D) {
	return NamespaceDecl::castToDeclContext(D);
}
const NamespaceDecl* clangExt_NamespaceDecl_castFromDeclContext(const DeclContext* DC) {
	return NamespaceDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
const CXQualType clangExt_ValueDecl_getType(const ValueDecl* D) {
	return D->getType().getAsOpaquePtr();
}
bool clangExt_ValueDecl_isWeak(const ValueDecl* D) {
	return D->isWeak();
}
bool clangExt_ValueDecl_classof(const Decl* D) {
	return ValueDecl::classof(D);
}
bool clangExt_ValueDecl_classofKind(Decl::Kind K) {
	return ValueDecl::classofKind(K);
}
//=======================================================================================================================
const TypeSourceInfo* clangExt_DeclaratorDecl_getTypeSourceInfo(const DeclaratorDecl* D) {
	return D->getTypeSourceInfo();
}
CXSourceLocation clangExt_DeclaratorDecl_getInnerLocStart(const DeclaratorDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getInnerLocStart());
}
CXSourceLocation clangExt_DeclaratorDecl_getOuterLocStart(const DeclaratorDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getOuterLocStart());
}
CXSourceRange clangExt_DeclaratorDecl_getSourceRange(const DeclaratorDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
CXSourceLocation clangExt_DeclaratorDecl_getBeginLoc(const DeclaratorDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getBeginLoc());
}
const NestedNameSpecifier* clangExt_DeclaratorDecl_getQualifier(const DeclaratorDecl* D) {
	return D->getQualifier();
}
const Expr* clangExt_DeclaratorDecl_getTrailingRequiresClause(const DeclaratorDecl* D) {
	return D->getTrailingRequiresClause();
}
unsigned clangExt_DeclaratorDecl_getNumTemplateParameterLists(const DeclaratorDecl* D) {
	return D->getNumTemplateParameterLists();
}
const TemplateParameterList* clangExt_DeclaratorDecl_getTemplateParameterList(const DeclaratorDecl* D, unsigned index) {
	return D->getTemplateParameterList(index);
}
CXSourceLocation clangExt_DeclaratorDecl_getTypeSpecStartLoc(const DeclaratorDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getTypeSpecStartLoc());
}
CXSourceLocation clangExt_DeclaratorDecl_getTypeSpecEndLoc(const DeclaratorDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getTypeSpecEndLoc());
}
bool clangExt_DeclaratorDecl_classof(const Decl* D) {
	return DeclaratorDecl::classof(D);
}
bool clangExt_DeclaratorDecl_classofKind(Decl::Kind K) {
	return DeclaratorDecl::classofKind(K);
}
//=======================================================================================================================
bool clangExt_EvaluatedStmt_WasEvaluated(const EvaluatedStmt* e) {
	return e->WasEvaluated;
}
bool clangExt_EvaluatedStmt_IsEvaluating(const EvaluatedStmt* e) {
	return e->IsEvaluating;
}
bool clangExt_EvaluatedStmt_HasConstantInitialization(const EvaluatedStmt* e) {
	return e->HasConstantInitialization;
}
bool clangExt_EvaluatedStmt_HasConstantDestruction(const EvaluatedStmt* e) {
	return e->HasConstantDestruction;
}
bool clangExt_EvaluatedStmt_HasICEInit(const EvaluatedStmt* e) {
	return e->HasICEInit;
}
bool clangExt_EvaluatedStmt_CheckedForICEInit(const EvaluatedStmt* e) {
	return e->CheckedForICEInit;
}
const Stmt* clangExt_EvaluatedStmt_GetValue(const EvaluatedStmt* e) {
	return e->Value;
}
const APValue* clangExt_EvaluatedStmt_GetEvaluated(const EvaluatedStmt* e) {
	return &e->Evaluated;
}
//=======================================================================================================================
CXSourceRange clangExt_VarDecl_getSourceRange(const VarDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
StorageClass clangExt_VarDecl_getStorageClass(const VarDecl* D) {
	return D->getStorageClass();
}
ThreadStorageClassSpecifier clangExt_VarDecl_getTSCSpec(const VarDecl* D) {
	return D->getTSCSpec();
}
VarDecl::TLSKind clangExt_VarDecl_getTLSKind(const VarDecl* D) {
	return D->getTLSKind();
}
bool clangExt_VarDecl_hasLocalStorage(const VarDecl* D) {
	return D->hasLocalStorage();
}
bool clangExt_VarDecl_isStaticLocal(const VarDecl* D) {
	return D->isStaticLocal();
}
bool clangExt_VarDecl_hasExternalStorage(const VarDecl* D) {
	return D->hasExternalStorage();
}
bool clangExt_VarDecl_hasGlobalStorage(const VarDecl* D) {
	return D->hasGlobalStorage();
}
StorageDuration clangExt_VarDecl_getStorageDuration(const VarDecl* D) {
	return D->getStorageDuration();
}
LanguageLinkage clangExt_VarDecl_getLanguageLinkage(const VarDecl* D) {
	return D->getLanguageLinkage();
}
bool clangExt_VarDecl_isExternC(const VarDecl* D) {
	return D->isExternC();
}
bool clangExt_VarDecl_isInExternCContext(const VarDecl* D) {
	return D->isInExternCContext();
}
bool clangExt_VarDecl_isInExternCXXContext(const VarDecl* D) {
	return D->isInExternCXXContext();
}
bool clangExt_VarDecl_isLocalVarDecl(const VarDecl* D) {
	return D->isLocalVarDecl();
}
bool clangExt_VarDecl_isLocalVarDeclOrParm(const VarDecl* D) {
	return D->isLocalVarDeclOrParm();
}
bool clangExt_VarDecl_isFunctionOrMethodVarDecl(const VarDecl* D) {
	return D->isFunctionOrMethodVarDecl();
}
bool clangExt_VarDecl_isStaticDataMember(const VarDecl* D) {
	return D->isStaticDataMember();
}
const VarDecl* clangExt_VarDecl_getCanonicalDecl(const VarDecl* D) {
	return D->getCanonicalDecl();
}
VarDecl::DefinitionKind clangExt_VarDecl_isThisDeclarationADefinition(const VarDecl* D) {
	return D->isThisDeclarationADefinition();
}
VarDecl::DefinitionKind clangExt_VarDecl_hasDefinition(const VarDecl* D) {
	return D->hasDefinition();
}
const VarDecl* clangExt_VarDecl_getActingDefinition(const VarDecl* D) {
	return D->getActingDefinition();
}
const VarDecl* clangExt_VarDecl_getDefinition(const VarDecl* D) {
	return D->getDefinition();
}
bool clangExt_VarDecl_isOutOfLine(const VarDecl* D) {
	return D->isOutOfLine();
}
bool clangExt_VarDecl_isFileVarDecl(const VarDecl* D) {
	return D->isFileVarDecl();
}
const Expr* clangExt_VarDecl_getAnyInitializer(const VarDecl* D) {
	return D->getAnyInitializer();
}
bool clangExt_VarDecl_hasInit(const VarDecl* D) {
	return D->hasInit();
}
const Expr* clangExt_VarDecl_getInit(const VarDecl* D) {
	return D->getInit();
}
Stmt** clangExt_VarDecl_getInitAddress(VarDecl* D) {
	return D->getInitAddress();
}
const VarDecl* clangExt_VarDecl_getInitializingDeclaration(const VarDecl* D) {
	return D->getInitializingDeclaration();
}
bool clangExt_VarDecl_mightBeUsableInConstantExpressions(const VarDecl* D, const ASTContext* C) {
	return D->mightBeUsableInConstantExpressions(const_cast<const ASTContext&>(*C));
}
bool clangExt_VarDecl_isUsableInConstantExpressions(const VarDecl* D, const ASTContext* C) {
	return D->isUsableInConstantExpressions(const_cast<const ASTContext&>(*C));
}
const EvaluatedStmt* clangExt_VarDecl_ensureEvaluatedStmt(const VarDecl* D) {
	return D->ensureEvaluatedStmt();
}
const EvaluatedStmt* clangExt_VarDecl_getEvaluatedStmt(const VarDecl* D) {
	return D->getEvaluatedStmt();
}
const APValue* clangExt_VarDecl_evaluateValue(const VarDecl* D) {
	return D->evaluateValue();
}
const APValue* clangExt_VarDecl_getEvaluatedValue(const VarDecl* D) {
	return D->getEvaluatedValue();
}
bool clangExt_VarDecl_hasConstantInitialization(const VarDecl* D) {
	return D->hasConstantInitialization();
}
bool clangExt_VarDecl_hasICEInitializer(const VarDecl* D, const ASTContext* Context) {
	return D->hasICEInitializer(const_cast<const ASTContext&>(*Context));
}
VarDecl::InitializationStyle clangExt_VarDecl_getInitStyle(const VarDecl* D) {
	return D->getInitStyle();
}
bool clangExt_VarDecl_isDirectInit(const VarDecl* D) {
	return D->isDirectInit();
}
bool clangExt_VarDecl_isThisDeclarationADemotedDefinition(const VarDecl* D) {
	return D->isThisDeclarationADemotedDefinition();
}
bool clangExt_VarDecl_isExceptionVariable(const VarDecl* D) {
	return D->isExceptionVariable();
}
bool clangExt_VarDecl_isNRVOVariable(const VarDecl* D) {
	return D->isNRVOVariable();
}
bool clangExt_VarDecl_isCXXForRangeDecl(const VarDecl* D) {
	return D->isCXXForRangeDecl();
}
bool clangExt_VarDecl_isObjCForDecl(const VarDecl* D) {
	return D->isObjCForDecl();
}
bool clangExt_VarDecl_isARCPseudoStrong(const VarDecl* D) {
	return D->isARCPseudoStrong();
}
bool clangExt_VarDecl_isInline(const VarDecl* D) {
	return D->isInline();
}
bool clangExt_VarDecl_isInlineSpecified(const VarDecl* D) {
	return D->isInlineSpecified();
}
bool clangExt_VarDecl_isConstexpr(const VarDecl* D) {
	return D->isConstexpr();
}
bool clangExt_VarDecl_isInitCapture(const VarDecl* D) {
	return D->isInitCapture();
}
bool clangExt_VarDecl_isParameterPack(const VarDecl* D) {
	return D->isParameterPack();
}
bool clangExt_VarDecl_isPreviousDeclInSameBlockScope(const VarDecl* D) {
	return D->isPreviousDeclInSameBlockScope();
}
bool clangExt_VarDecl_isEscapingByref(const VarDecl* D) {
	return D->isEscapingByref();
}
bool clangExt_VarDecl_isNonEscapingByref(const VarDecl* D) {
	return D->isNonEscapingByref();
}
bool clangExt_VarDecl_hasDependentAlignment(const VarDecl* D) {
	return D->hasDependentAlignment();
}
const VarDecl* clangExt_VarDecl_getTemplateInstantiationPattern(const VarDecl* D) {
	return D->getTemplateInstantiationPattern();
}
const VarDecl* clangExt_VarDecl_getInstantiatedFromStaticDataMember(const VarDecl* D) {
	return D->getInstantiatedFromStaticDataMember();
}
TemplateSpecializationKind clangExt_VarDecl_getTemplateSpecializationKind(const VarDecl* D) {
	return D->getTemplateSpecializationKind();
}
TemplateSpecializationKind clangExt_VarDecl_getTemplateSpecializationKindForInstantiation(const VarDecl* D) {
	return D->getTemplateSpecializationKindForInstantiation();
}
CXSourceLocation clangExt_VarDecl_getPointOfInstantiation(const VarDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getPointOfInstantiation());
}
const MemberSpecializationInfo* clangExt_VarDecl_getMemberSpecializationInfo(const VarDecl* D) {
	return D->getMemberSpecializationInfo();
}
const VarTemplateDecl* clangExt_VarDecl_getDescribedVarTemplate(const VarDecl* D) {
	return D->getDescribedVarTemplate();
}
bool clangExt_VarDecl_isKnownToBeDefined(const VarDecl* D) {
	return D->isKnownToBeDefined();
}
bool clangExt_VarDecl_isNoDestroy(const VarDecl* D, const ASTContext* Ctx) {
	return D->isNoDestroy(const_cast<const ASTContext&>(*Ctx));
}
QualType::DestructionKind clangExt_VarDecl_needsDestruction(const VarDecl* D, const ASTContext* Ctx) {
	return D->needsDestruction(const_cast<const ASTContext&>(*Ctx));
}
bool clangExt_VarDecl_hasFlexibleArrayInit(const VarDecl* D, const ASTContext* Ctx) {
	return D->hasFlexibleArrayInit(const_cast<const ASTContext&>(*Ctx));
}
bool clangExt_VarDecl_classof(const Decl* D) {
	return VarDecl::classof(D);
}
bool clangExt_VarDecl_classofKind(Decl::Kind K) {
	return VarDecl::classofKind(K);
}
CXString clangExt_VarDecl_getMangling(const VarDecl* D) {
	ASTContext& Ctx = D->getASTContext();
	ASTNameGenerator ASTNameGen(Ctx);
	return cxstring::createDup(ASTNameGen.getName(D));
}
//=======================================================================================================================
ImplicitParamDecl::ImplicitParamKind clangExt_ImplicitParamDecl_getParameterKind(const ImplicitParamDecl* D) {
	return D->getParameterKind();
}
bool clangExt_ImplicitParamDecl_classof(const Decl* D) {
	return ImplicitParamDecl::classof(D);
}
bool clangExt_ImplicitParamDecl_classofKind(Decl::Kind K) {
	return ImplicitParamDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceRange clangExt_ParmVarDecl_getSourceRange(const ParmVarDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
bool clangExt_ParmVarDecl_isObjCMethodParameter(const ParmVarDecl* D) {
	return D->isObjCMethodParameter();
}
bool clangExt_ParmVarDecl_isDestroyedInCallee(const ParmVarDecl* D) {
	return D->isDestroyedInCallee();
}
unsigned clangExt_ParmVarDecl_getFunctionScopeDepth(const ParmVarDecl* D) {
	return D->getFunctionScopeDepth();
}
unsigned clangExt_ParmVarDecl_getFunctionScopeIndex(const ParmVarDecl* D) {
	return D->getFunctionScopeIndex();
}
Decl::ObjCDeclQualifier clangExt_ParmVarDecl_getObjCDeclQualifier(const ParmVarDecl* D) {
	return D->getObjCDeclQualifier();
}
bool clangExt_ParmVarDecl_isKNRPromoted(const ParmVarDecl* D) {
	return D->isKNRPromoted();
}
const Expr* clangExt_ParmVarDecl_getDefaultArg(const ParmVarDecl* D) {
	return D->getDefaultArg();
}
CXSourceRange clangExt_ParmVarDecl_getDefaultArgRange(const ParmVarDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getDefaultArgRange());
}
const Expr* clangExt_ParmVarDecl_getUninstantiatedDefaultArg(const ParmVarDecl* D) {
	return D->getUninstantiatedDefaultArg();
}
bool clangExt_ParmVarDecl_hasDefaultArg(const ParmVarDecl* D) {
	return D->hasDefaultArg();
}
bool clangExt_ParmVarDecl_hasUnparsedDefaultArg(const ParmVarDecl* D) {
	return D->hasUnparsedDefaultArg();
}
bool clangExt_ParmVarDecl_hasUninstantiatedDefaultArg(const ParmVarDecl* D) {
	return D->hasUninstantiatedDefaultArg();
}
bool clangExt_ParmVarDecl_hasInheritedDefaultArg(const ParmVarDecl* D) {
	return D->hasInheritedDefaultArg();
}
const CXQualType clangExt_ParmVarDecl_getOriginalType(const ParmVarDecl* D) { // QualType
	return D->getOriginalType().getAsOpaquePtr();
}
bool clangExt_ParmVarDecl_classof(const Decl* D) {
	return ParmVarDecl::classof(D);
}
bool clangExt_ParmVarDecl_classofKind(Decl::Kind K) {
	return ParmVarDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceLocation clangExt_FunctionDecl_getEllipsisLoc(const FunctionDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getEllipsisLoc());
}
CXSourceRange clangExt_FunctionDecl_getSourceRange(const FunctionDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
bool clangExt_FunctionDecl_hasBody(const FunctionDecl* D) {
	return D->hasBody();
}
bool clangExt_FunctionDecl_hasBody2(const FunctionDecl* D, const FunctionDecl** Definition) {
	return D->hasBody(*Definition);
}
bool clangExt_FunctionDecl_hasTrivialBody(const FunctionDecl* D) {
	return D->hasTrivialBody();
}
bool clangExt_FunctionDecl_isDefined(const FunctionDecl* D) {
	return D->isDefined();
}
const FunctionDecl* clangExt_FunctionDecl_getDefinition(const FunctionDecl* D) {
	return D->getDefinition();
}
const Stmt* clangExt_FunctionDecl_getBody(const FunctionDecl* D) {
	return D->getBody();
}
const Stmt* clangExt_FunctionDecl_getBody2(const FunctionDecl* D, const FunctionDecl** Definition) {
	return D->getBody(*Definition);
}
bool clangExt_FunctionDecl_isThisDeclarationADefinition(const FunctionDecl* D) {
	return D->isThisDeclarationADefinition();
}
bool clangExt_FunctionDecl_isThisDeclarationInstantiatedFromAFriendDefinition(const FunctionDecl* D) {
	return D->isThisDeclarationInstantiatedFromAFriendDefinition();
}
bool clangExt_FunctionDecl_doesThisDeclarationHaveABody(const FunctionDecl* D) {
	return D->doesThisDeclarationHaveABody();
}
bool clangExt_FunctionDecl_isVariadic(const FunctionDecl* D) {
	return D->isVariadic();
}
bool clangExt_FunctionDecl_isVirtualAsWritten(const FunctionDecl* D) {
	return D->isVirtualAsWritten();
}
bool clangExt_FunctionDecl_isPure(const FunctionDecl* D) {
	return D->isPure();
}
bool clangExt_FunctionDecl_isLateTemplateParsed(const FunctionDecl* D) {
	return D->isLateTemplateParsed();
}
bool clangExt_FunctionDecl_isTrivial(const FunctionDecl* D) {
	return D->isTrivial();
}
bool clangExt_FunctionDecl_isTrivialForCall(const FunctionDecl* D) {
	return D->isTrivialForCall();
}
bool clangExt_FunctionDecl_isDefaulted(const FunctionDecl* D) {
	return D->isDefaulted();
}
bool clangExt_FunctionDecl_isExplicitlyDefaulted(const FunctionDecl* D) {
	return D->isExplicitlyDefaulted();
}
bool clangExt_FunctionDecl_isUserProvided(const FunctionDecl* D) {
	return D->isUserProvided();
}
bool clangExt_FunctionDecl_hasImplicitReturnZero(const FunctionDecl* D) {
	return D->hasImplicitReturnZero();
}
bool clangExt_FunctionDecl_hasPrototype(const FunctionDecl* D) {
	return D->hasPrototype();
}
bool clangExt_FunctionDecl_hasWrittenPrototype(const FunctionDecl* D) {
	return D->hasWrittenPrototype();
}
bool clangExt_FunctionDecl_hasInheritedPrototype(const FunctionDecl* D) {
	return D->hasInheritedPrototype();
}
bool clangExt_FunctionDecl_isConstexpr(const FunctionDecl* D) {
	return D->isConstexpr();
}
ConstexprSpecKind clangExt_FunctionDecl_getConstexprKind(const FunctionDecl* D) {
	return D->getConstexprKind();
}
bool clangExt_FunctionDecl_isConstexprSpecified(const FunctionDecl* D) {
	return D->isConstexprSpecified();
}
bool clangExt_FunctionDecl_isConsteval(const FunctionDecl* D) {
	return D->isConsteval();
}
bool clangExt_FunctionDecl_instantiationIsPending(const FunctionDecl* D) {
	return D->instantiationIsPending();
}
bool clangExt_FunctionDecl_usesSEHTry(const FunctionDecl* D) {
	return D->usesSEHTry();
}
bool clangExt_FunctionDecl_isDeleted(const FunctionDecl* D) {
	return D->isDeleted();
}
bool clangExt_FunctionDecl_isDeletedAsWritten(const FunctionDecl* D) {
	return D->isDeletedAsWritten();
}
bool clangExt_FunctionDecl_isMain(const FunctionDecl* D) {
	return D->isMain();
}
bool clangExt_FunctionDecl_isMSVCRTEntryPoint(const FunctionDecl* D) {
	return D->isMSVCRTEntryPoint();
}
bool clangExt_FunctionDecl_isReservedGlobalPlacementOperator(const FunctionDecl* D) {
	return D->isReservedGlobalPlacementOperator();
}
bool clangExt_FunctionDecl_isInlineBuiltinDeclaration(const FunctionDecl* D) {
	return D->isInlineBuiltinDeclaration();
}
bool clangExt_FunctionDecl_isDestroyingOperatorDelete(const FunctionDecl* D) {
	return D->isDestroyingOperatorDelete();
}
LanguageLinkage clangExt_FunctionDecl_getLanguageLinkage(const FunctionDecl* D) {
	return D->getLanguageLinkage();
}
bool clangExt_FunctionDecl_isExternC(const FunctionDecl* D) {
	return D->isExternC();
}
bool clangExt_FunctionDecl_isInExternCContext(const FunctionDecl* D) {
	return D->isInExternCContext();
}
bool clangExt_FunctionDecl_isInExternCXXContext(const FunctionDecl* D) {
	return D->isInExternCXXContext();
}
bool clangExt_FunctionDecl_isGlobal(const FunctionDecl* D) {
	return D->isGlobal();
}
bool clangExt_FunctionDecl_isNoReturn(const FunctionDecl* D) {
	return D->isNoReturn();
}
bool clangExt_FunctionDecl_hasSkippedBody(const FunctionDecl* D) {
	return D->hasSkippedBody();
}
bool clangExt_FunctionDecl_willHaveBody(const FunctionDecl* D) {
	return D->willHaveBody();
}
bool clangExt_FunctionDecl_isMultiVersion(const FunctionDecl* D) {
	return D->isMultiVersion();
}
MultiVersionKind clangExt_FunctionDecl_getMultiVersionKind(const FunctionDecl* D) {
	return D->getMultiVersionKind();
}
bool clangExt_FunctionDecl_isCPUDispatchMultiVersion(const FunctionDecl* D) {
	return D->isCPUDispatchMultiVersion();
}
bool clangExt_FunctionDecl_isCPUSpecificMultiVersion(const FunctionDecl* D) {
	return D->isCPUSpecificMultiVersion();
}
bool clangExt_FunctionDecl_isTargetMultiVersion(const FunctionDecl* D) {
	return D->isTargetMultiVersion();
}
bool clangExt_FunctionDecl_isTargetClonesMultiVersion(const FunctionDecl* D) {
	return D->isTargetClonesMultiVersion();
}
const FunctionDecl* clangExt_FunctionDecl_getCanonicalDecl(const FunctionDecl* D) {
	return D->getCanonicalDecl();
}
unsigned clangExt_FunctionDecl_getBuiltinID(const FunctionDecl* D, bool ConsiderWrapperFunctions) {
	return D->getBuiltinID(ConsiderWrapperFunctions);
}
bool clangExt_FunctionDecl_param_empty(const FunctionDecl* D) {
	return D->param_empty();
}
size_t clangExt_FunctionDecl_param_size(const FunctionDecl* D) {
	return D->param_size();
}
unsigned clangExt_FunctionDecl_getNumParams(const FunctionDecl* D) {
	return D->getNumParams();
}
const ParmVarDecl* clangExt_FunctionDecl_getParamDecl(const FunctionDecl* D, unsigned i) {
	return D->getParamDecl(i);
}
unsigned clangExt_FunctionDecl_getMinRequiredArguments(const FunctionDecl* D) {
	return D->getMinRequiredArguments();
}
bool clangExt_FunctionDecl_hasOneParamOrDefaultArgs(const FunctionDecl* D) {
	return D->hasOneParamOrDefaultArgs();
}
CXTypeLoc clangExt_FunctionDecl_getFunctionTypeLoc(const FunctionDecl* D) { // FunctionTypeLoc
	FunctionTypeLoc ty = D->getFunctionTypeLoc();
	return { ty.getTypePtr(), ty.getOpaqueData() };
}
const CXQualType clangExt_FunctionDecl_getReturnType(const FunctionDecl* D) {
	return D->getReturnType().getAsOpaquePtr();
}
CXSourceRange clangExt_FunctionDecl_getReturnTypeSourceRange(const FunctionDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getReturnTypeSourceRange());
}
CXSourceRange clangExt_FunctionDecl_getParametersSourceRange(const FunctionDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getParametersSourceRange());
}
const CXQualType clangExt_FunctionDecl_getDeclaredReturnType(const FunctionDecl* D) { // QualType
	return D->getDeclaredReturnType().getAsOpaquePtr();
}
ExceptionSpecificationType clangExt_FunctionDecl_getExceptionSpecType(const FunctionDecl* D) {
	return D->getExceptionSpecType();
}
CXSourceRange clangExt_FunctionDecl_getExceptionSpecSourceRange(const FunctionDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getExceptionSpecSourceRange());
}
const CXQualType clangExt_FunctionDecl_getCallResultType(const FunctionDecl* D) { // QualType
	return D->getCallResultType().getAsOpaquePtr();
}
StorageClass clangExt_FunctionDecl_getStorageClass(const FunctionDecl* D) {
	return D->getStorageClass();
}
bool clangExt_FunctionDecl_isInlineSpecified(const FunctionDecl* D) {
	return D->isInlineSpecified();
}
bool clangExt_FunctionDecl_UsesFPIntrin(const FunctionDecl* D) {
	return D->UsesFPIntrin();
}
bool clangExt_FunctionDecl_isInlined(const FunctionDecl* D) {
	return D->isInlined();
}
bool clangExt_FunctionDecl_isInlineDefinitionExternallyVisible(const FunctionDecl* D) {
	return D->isInlineDefinitionExternallyVisible();
}
bool clangExt_FunctionDecl_isMSExternInline(const FunctionDecl* D) {
	return D->isMSExternInline();
}
bool clangExt_FunctionDecl_doesDeclarationForceExternallyVisibleDefinition(const FunctionDecl* D) {
	return D->doesDeclarationForceExternallyVisibleDefinition();
}
bool clangExt_FunctionDecl_isStatic(const FunctionDecl* D) {
	return D->isStatic();
}
bool clangExt_FunctionDecl_isOverloadedOperator(const FunctionDecl* D) {
	return D->isOverloadedOperator();
}
OverloadedOperatorKind clangExt_FunctionDecl_getOverloadedOperator(const FunctionDecl* D) {
	return D->getOverloadedOperator();
}
const IdentifierInfo* clangExt_FunctionDecl_getLiteralIdentifier(const FunctionDecl* D) {
	return D->getLiteralIdentifier();
}
FunctionDecl* clangExt_FunctionDecl_getInstantiatedFromMemberFunction(const FunctionDecl* D) {
	return D->getInstantiatedFromMemberFunction();
}
FunctionDecl::TemplatedKind clangExt_FunctionDecl_getTemplatedKind(const FunctionDecl* D) {
	return D->getTemplatedKind();
}
MemberSpecializationInfo* clangExt_FunctionDecl_getMemberSpecializationInfo(const FunctionDecl* D) {
	return D->getMemberSpecializationInfo();
}
FunctionTemplateDecl* clangExt_FunctionDecl_getDescribedFunctionTemplate(const FunctionDecl* D) {
	return D->getDescribedFunctionTemplate();
}
bool clangExt_FunctionDecl_isFunctionTemplateSpecialization(const FunctionDecl* D) {
	return D->isFunctionTemplateSpecialization();
}
FunctionTemplateSpecializationInfo* clangExt_FunctionDecl_getTemplateSpecializationInfo(const FunctionDecl* D) {
	return D->getTemplateSpecializationInfo();
}
bool clangExt_FunctionDecl_isImplicitlyInstantiable(const FunctionDecl* D) {
	return D->isImplicitlyInstantiable();
}
bool clangExt_FunctionDecl_isTemplateInstantiation(const FunctionDecl* D) {
	return D->isTemplateInstantiation();
}
FunctionDecl* clangExt_FunctionDecl_getTemplateInstantiationPattern(const FunctionDecl* D, bool ForDefinition) {
	return D->getTemplateInstantiationPattern();
}
FunctionTemplateDecl* clangExt_FunctionDecl_getPrimaryTemplate(const FunctionDecl* D) {
	return D->getPrimaryTemplate();
}
const TemplateArgumentList* clangExt_FunctionDecl_getTemplateSpecializationArgs(const FunctionDecl* D) {
	return D->getTemplateSpecializationArgs();
}
const ASTTemplateArgumentListInfo* clangExt_FunctionDecl_getTemplateSpecializationArgsAsWritten(const FunctionDecl* D) {
	return D->getTemplateSpecializationArgsAsWritten();
}
const DependentFunctionTemplateSpecializationInfo* clangExt_FunctionDecl_getDependentSpecializationInfo(const FunctionDecl* D) {
	return D->getDependentSpecializationInfo();
}
TemplateSpecializationKind clangExt_FunctionDecl_getTemplateSpecializationKind(const FunctionDecl* D) {
	return D->getTemplateSpecializationKind();
}
TemplateSpecializationKind clangExt_FunctionDecl_getTemplateSpecializationKindForInstantiation(const FunctionDecl* D) {
	return D->getTemplateSpecializationKindForInstantiation();
}
CXSourceLocation clangExt_FunctionDecl_getPointOfInstantiation(const FunctionDecl* D) {
	return cxloc::translateSourceLocation(D->getASTContext(), D->getPointOfInstantiation());
}
bool clangExt_FunctionDecl_isOutOfLine(const FunctionDecl* D) {
	return D->isOutOfLine();
}
unsigned clangExt_FunctionDecl_getMemoryFunctionKind(const FunctionDecl* D) {
	return D->getMemoryFunctionKind();
}
unsigned clangExt_FunctionDecl_getODRHash(const FunctionDecl* D) {
	return D->getODRHash();
}
bool clangExt_FunctionDecl_classof(const Decl* D) {
	return FunctionDecl::classof(D);
}
bool clangExt_FunctionDecl_classofKind(Decl::Kind K) {
	return FunctionDecl::classofKind(K);
}
DeclContext* clangExt_FunctionDecl_castToDeclContext(const FunctionDecl* D) {
	return FunctionDecl::castToDeclContext(D);
}
FunctionDecl* clangExt_FunctionDecl_castFromDeclContext(const DeclContext* DC) {
	return FunctionDecl::castFromDeclContext(DC);
}
CXString clangExt_FunctionDecl_getMangling(const FunctionDecl* D) {
	ASTContext& Ctx = D->getASTContext();
	ASTNameGenerator ASTNameGen(Ctx);
	return cxstring::createDup(ASTNameGen.getName(D));
}
//=======================================================================================================================
unsigned clangExt_FieldDecl_getFieldIndex(const FieldDecl* F) {
	return F->getFieldIndex();
}
bool clangExt_FieldDecl_isMutable(const FieldDecl* F) {
	return F->isMutable();
}
bool clangExt_FieldDecl_isBitField(const FieldDecl* F) {
	return F->isBitField();
}
bool clangExt_FieldDecl_isUnnamedBitfield(const FieldDecl* F) {
	return F->isUnnamedBitfield();
}
bool clangExt_FieldDecl_isAnonymousStructOrUnion(const FieldDecl* F) {
	return F->isAnonymousStructOrUnion();
}
const Expr* clangExt_FieldDecl_getBitWidth(const FieldDecl* F) {
	return F->getBitWidth();
}
unsigned clangExt_FieldDecl_getBitWidthValue(const FieldDecl* F, const ASTContext* Ctx) {
	return F->getBitWidthValue(*Ctx);
}
bool clangExt_FieldDecl_isZeroLengthBitField(const FieldDecl* F, const ASTContext* Ctx) {
	return F->isZeroLengthBitField(*Ctx);
}
bool clangExt_FieldDecl_isZeroSize(const FieldDecl* F, const ASTContext* Ctx) {
	return F->isZeroSize(*Ctx);
}
InClassInitStyle clangExt_FieldDecl_getInClassInitStyle(const FieldDecl* F) {
	return F->getInClassInitStyle();
}
bool clangExt_FieldDecl_hasInClassInitializer(const FieldDecl* F) {
	return F->hasInClassInitializer();
}
const Expr* clangExt_FieldDecl_getInClassInitializer(const FieldDecl* F) {
	return F->getInClassInitializer();
}
bool clangExt_FieldDecl_hasCapturedVLAType(const FieldDecl* F) {
	return F->hasCapturedVLAType();
}
const VariableArrayType* clangExt_FieldDecl_getCapturedVLAType(const FieldDecl* F) {
	return F->getCapturedVLAType();
}
const RecordDecl* clangExt_FieldDecl_getParent(const FieldDecl* F) {
	return F->getParent();
}
CXSourceRange clangExt_FieldDecl_getSourceRange(const FieldDecl* F) {
	return cxloc::translateSourceRange(F->getASTContext(), F->getSourceRange());
}
const FieldDecl* clangExt_FieldDecl_getCanonicalDecl(const FieldDecl* F) {
	return F->getCanonicalDecl();
}
bool clangExt_FieldDecl_classof(const Decl* D) {
	return FieldDecl::classof(D);
}
bool clangExt_FieldDecl_classofKind(Decl::Kind K) {
	return FieldDecl::classofKind(K);
}
//=======================================================================================================================
const Expr* clangExt_EnumConstantDecl_getInitExpr(const EnumConstantDecl* E) {
	return E->getInitExpr();
}
const llvm::APSInt* clangExt_EnumConstantDecl_getInitVal(const EnumConstantDecl* E) {
	return new llvm::APSInt(E->getInitVal());
}
CXSourceRange clangExt_EnumConstantDecl_getSourceRange(const EnumConstantDecl* E) {
	return cxloc::translateSourceRange(E->getASTContext(), E->getSourceRange());
}
const EnumConstantDecl* clangExt_EnumConstantDecl_getCanonicalDecl(const EnumConstantDecl* E) {
	return E->getCanonicalDecl();
}
bool clangExt_EnumConstantDecl_classof(const Decl* D) {
	return EnumConstantDecl::classof(D);
}
bool clangExt_EnumConstantDecl_classofKind(Decl::Kind K) {
	return EnumConstantDecl::classofKind(K);
}
//=======================================================================================================================
const NamedDecl* clangExt_IndirectFieldDecl_getChain(const IndirectFieldDecl* I, unsigned i) {
	ArrayRef<NamedDecl*> c = I->chain();
	if (i < c.size())
		return c[i];
	return nullptr;
}
unsigned clangExt_IndirectFieldDecl_getChainingSize(const IndirectFieldDecl* I) {
	return I->getChainingSize();
}
const FieldDecl* clangExt_IndirectFieldDecl_getAnonField(const IndirectFieldDecl* I) {
	return I->getAnonField();
}
const VarDecl* clangExt_IndirectFieldDecl_getVarDecl(const IndirectFieldDecl* I) {
	return I->getVarDecl();
}
const IndirectFieldDecl* clangExt_IndirectFieldDecl_getCanonicalDecl(const IndirectFieldDecl* I) {
	return I->getCanonicalDecl();
}
bool clangExt_IndirectFieldDecl_classof(const Decl* D) {
	return IndirectFieldDecl::classof(D);
}
bool clangExt_IndirectFieldDecl_classofKind(Decl::Kind K) {
	return IndirectFieldDecl::classofKind(K);
}
//=======================================================================================================================
const Type* clangExt_TypeDecl_getTypeForDecl(const TypeDecl* T) {
	return T->getTypeForDecl();
}
CXSourceLocation clangExt_TypeDecl_getBeginLoc(const TypeDecl* T) {
	return cxloc::translateSourceLocation(T->getASTContext(), T->getBeginLoc());
}
CXSourceRange clangExt_TypeDecl_getSourceRange(const TypeDecl* T) {
	return cxloc::translateSourceRange(T->getASTContext(), T->getSourceRange());
}
bool clangExt_TypeDecl_classof(const Decl* D) {
	return TypeDecl::classof(D);
}
bool clangExt_TypeDecl_classofKind(Decl::Kind K) {
	return TypeDecl::classofKind(K);
}
//=======================================================================================================================
bool clangExt_TypedefNameDecl_isModed(const TypedefNameDecl* T) {
	return T->isModed();
}
const TypeSourceInfo* clangExt_TypedefNameDecl_getTypeSourceInfo(const TypedefNameDecl* T) {
	return T->getTypeSourceInfo();
}
const CXQualType clangExt_TypedefNameDecl_getUnderlyingType(const TypedefNameDecl* T) {
	return T->getUnderlyingType().getAsOpaquePtr();
}
const TypedefNameDecl* clangExt_TypedefNameDecl_getCanonicalDecl(const TypedefNameDecl* T) {
	return T->getCanonicalDecl();
}
const TagDecl* clangExt_TypedefNameDecl_getAnonDeclWithTypedefName(const TypedefNameDecl* T, bool AnyRedecl) {
	return T->getAnonDeclWithTypedefName(AnyRedecl);
}
bool clangExt_TypedefNameDecl_isTransparentTag(const TypedefNameDecl* T) {
	return T->isTransparentTag();
}
bool clangExt_TypedefNameDecl_classof(const Decl* D) {
	return TypedefNameDecl::classof(D);
}
bool clangExt_TypedefNameDecl_classofKind(Decl::Kind K) {
	return TypedefNameDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceRange clangExt_TypedefDecl_getSourceRange(const TypedefDecl* T) {
	return cxloc::translateSourceRange(T->getASTContext(), T->getSourceRange());
}
bool clangExt_TypedefDecl_classof(const Decl* D) {
	return TypedefDecl::classof(D);
}
bool clangExt_TypedefDecl_classofKind(Decl::Kind K) {
	return TypedefDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceRange clangExt_TypeAliasDecl_getSourceRange(const TypeAliasDecl* T) {
	return cxloc::translateSourceRange(T->getASTContext(), T->getSourceRange());
}
const TypeAliasTemplateDecl* clangExt_TypeAliasDecl_getDescribedAliasTemplate(const TypeAliasDecl* T) {
	return T->getDescribedAliasTemplate();
}
bool clangExt_TypeAliasDecl_classof(const Decl* D) {
	return TypeAliasDecl::classof(D);
}
bool clangExt_TypeAliasDecl_classofKind(Decl::Kind K) {
	return TypeAliasDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceRange clangExt_TagDecl_getBraceRange(const TagDecl* T) {
	return cxloc::translateSourceRange(T->getASTContext(), T->getBraceRange());
}
CXSourceLocation clangExt_TagDecl_getInnerLocStart(const TagDecl* T) {
	return cxloc::translateSourceLocation(T->getASTContext(), T->getInnerLocStart());
}
CXSourceLocation clangExt_TagDecl_getOuterLocStart(const TagDecl* T) {
	return cxloc::translateSourceLocation(T->getASTContext(), T->getOuterLocStart());
}
CXSourceRange clangExt_TagDecl_getSourceRange(const TagDecl* T) {
	return cxloc::translateSourceRange(T->getASTContext(), T->getSourceRange());
}
const TagDecl* clangExt_TagDecl_getCanonicalDecl(const TagDecl* T) {
	return T->getCanonicalDecl();
}
bool clangExt_TagDecl_isThisDeclarationADefinition(const TagDecl* T) {
	return T->isThisDeclarationADefinition();
}
bool clangExt_TagDecl_isCompleteDefinition(const TagDecl* T) {
	return T->isCompleteDefinition();
}
bool clangExt_TagDecl_isCompleteDefinitionRequired(const TagDecl* T) {
	return T->isCompleteDefinitionRequired();
}
bool clangExt_TagDecl_isBeingDefined(const TagDecl* T) {
	return T->isBeingDefined();
}
bool clangExt_TagDecl_isEmbeddedInDeclarator(const TagDecl* T) {
	return T->isEmbeddedInDeclarator();
}
bool clangExt_TagDecl_isFreeStanding(const TagDecl* T) {
	return T->isFreeStanding();
}
bool clangExt_TagDecl_mayHaveOutOfDateDef(const TagDecl* T) {
	return T->mayHaveOutOfDateDef();
}
bool clangExt_TagDecl_isDependentType(const TagDecl* T) {
	return T->isDependentType();
}
bool clangExt_TagDecl_isThisDeclarationADemotedDefinition(const TagDecl* T) {
	return T->isThisDeclarationADemotedDefinition();
}
TagDecl* clangExt_TagDecl_getDefinition(const TagDecl* T) {
	return T->getDefinition();
}
CXString clangExt_TagDecl_getKindName(const TagDecl* T) {
	return cxstring::createDup(T->getKindName());
}
TagDecl::TagKind clangExt_TagDecl_getTagKind(const TagDecl* T) {
	return T->getTagKind();
}
bool clangExt_TagDecl_isStruct(const TagDecl* T) {
	return T->isStruct();
}
bool clangExt_TagDecl_isInterface(const TagDecl* T) {
	return T->isInterface();
}
bool clangExt_TagDecl_isClass(const TagDecl* T) {
	return T->isClass();
}
bool clangExt_TagDecl_isUnion(const TagDecl* T) {
	return T->isUnion();
}
bool clangExt_TagDecl_isEnum(const TagDecl* T) {
	return T->isEnum();
}
bool clangExt_TagDecl_hasNameForLinkage(const TagDecl* T) {
	return T->hasNameForLinkage();
}
const TypedefNameDecl* clangExt_TagDecl_getTypedefNameForAnonDecl(const TagDecl* T) {
	return T->getTypedefNameForAnonDecl();
}
const NestedNameSpecifier* clangExt_TagDecl_getQualifier(const TagDecl* T) {
	return T->getQualifier();
}
unsigned clangExt_TagDecl_getNumTemplateParameterLists(const TagDecl* T) {
	return T->getNumTemplateParameterLists();
}
TemplateParameterList* clangExt_TagDecl_getTemplateParameterList(const TagDecl* T, unsigned i) {
	return T->getTemplateParameterList(i);
}
bool clangExt_TagDecl_classof(const Decl* D) {
	return TagDecl::classof(D);
}
bool clangExt_TagDecl_classofKind(Decl::Kind K) {
	return TagDecl::classofKind(K);
}
const DeclContext* clangExt_TagDecl_castToDeclContext(const TagDecl* D) {
	return TagDecl::castToDeclContext(D);
}
const TagDecl* clangExt_TagDecl_castFromDeclContext(const DeclContext* DC) {
	return TagDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
const EnumDecl* clangExt_EnumDecl_getCanonicalDecl(const EnumDecl* E) {
	return E->getCanonicalDecl();
}
const EnumDecl* clangExt_EnumDecl_getPreviousDecl(const EnumDecl* E) {
	return E->getPreviousDecl();
}
const EnumDecl* clangExt_EnumDecl_getMostRecentDecl(const EnumDecl* E) {
	return E->getMostRecentDecl();
}
const EnumDecl* clangExt_EnumDecl_getDefinition(const EnumDecl* E) {
	return E->getDefinition();
}
CXSourceRange clangExt_EnumDecl_getSourceRange(const EnumDecl* E) {
	return cxloc::translateSourceRange(E->getASTContext(), E->getSourceRange());
}
unsigned clangExt_EnumDecl_getNumEnumerators(const EnumDecl* E) {
	SmallVector<const Decl*, 4> enums = { E->enumerator_begin(), E->enumerator_end() };
	return enums.size();
}
const EnumConstantDecl* clangExt_EnumDecl_getNameEnumerators(const EnumDecl* E, unsigned i) {
	SmallVector<const EnumConstantDecl*, 4> enums = { E->enumerator_begin(), E->enumerator_end() };
	if (i < enums.size())
		return enums[i];
	else
		return nullptr;
}
const CXQualType clangExt_EnumDecl_getPromotionType(const EnumDecl* E) {
	return E->getPromotionType().getAsOpaquePtr();
}
const CXQualType clangExt_EnumDecl_getIntegerType(const EnumDecl* E) {
	return E->getIntegerType().getAsOpaquePtr();
}
const TypeSourceInfo* clangExt_EnumDecl_getIntegerTypeSourceInfo(const EnumDecl* E) {
	return E->getIntegerTypeSourceInfo();
}
CXSourceRange clangExt_EnumDecl_getIntegerTypeRange(const EnumDecl* E) {
	return cxloc::translateSourceRange(E->getASTContext(), E->getIntegerTypeRange());
}
unsigned clangExt_EnumDecl_getNumPositiveBits(const EnumDecl* E) {
	return E->getNumPositiveBits();
}
unsigned clangExt_EnumDecl_getNumNegativeBits(const EnumDecl* E) {
	return E->getNumNegativeBits();
}
bool clangExt_EnumDecl_isScoped(const EnumDecl* E) {
	return E->isScoped();
}
bool clangExt_EnumDecl_isScopedUsingClassTag(const EnumDecl* E) {
	return E->isScopedUsingClassTag();
}
bool clangExt_EnumDecl_isFixed(const EnumDecl* E) {
	return E->isFixed();
}
unsigned clangExt_EnumDecl_getODRHash(const EnumDecl* E) {
	return const_cast<EnumDecl*>(E)->getODRHash();
}
bool clangExt_EnumDecl_isComplete(const EnumDecl* E) {
	return E->isComplete();
}
bool clangExt_EnumDecl_isClosed(const EnumDecl* E) {
	return E->isClosed();
}
bool clangExt_EnumDecl_isClosedFlag(const EnumDecl* E) {
	return E->isClosedFlag();
}
bool clangExt_EnumDecl_isClosedNonFlag(const EnumDecl* E) {
	return E->isClosedNonFlag();
}
const EnumDecl* clangExt_EnumDecl_getTemplateInstantiationPattern(const EnumDecl* E) {
	return E->getTemplateInstantiationPattern();
}
const EnumDecl* clangExt_EnumDecl_getInstantiatedFromMemberEnum(const EnumDecl* E) {
	return E->getInstantiatedFromMemberEnum();
}
TemplateSpecializationKind clangExt_EnumDecl_getTemplateSpecializationKind(const EnumDecl* E) {
	return E->getTemplateSpecializationKind();
}
const MemberSpecializationInfo* clangExt_EnumDecl_getMemberSpecializationInfo(const EnumDecl* E) {
	return E->getMemberSpecializationInfo();
}
bool clangExt_EnumDecl_classof(const Decl* D) {
	return EnumDecl::classof(D);
}
bool clangExt_EnumDecl_classofKind(Decl::Kind K) {
	return EnumDecl::classofKind(K);
}
//=======================================================================================================================
const RecordDecl* clangExt_RecordDecl_getPreviousDecl(const RecordDecl* R) {
	return R->getPreviousDecl();
}
const RecordDecl* clangExt_RecordDecl_getMostRecentDecl(const RecordDecl* R) {
	return R->getMostRecentDecl();
}
bool clangExt_RecordDecl_hasFlexibleArrayMember(const RecordDecl* R) {
	return R->hasFlexibleArrayMember();
}
bool clangExt_RecordDecl_isAnonymousStructOrUnion(const RecordDecl* R) {
	return R->isAnonymousStructOrUnion();
}
bool clangExt_RecordDecl_hasObjectMember(const RecordDecl* R) {
	return R->hasObjectMember();
}
bool clangExt_RecordDecl_hasVolatileMember(const RecordDecl* R) {
	return R->hasVolatileMember();
}
bool clangExt_RecordDecl_hasLoadedFieldsFromExternalStorage(const RecordDecl* R) {
	return R->hasLoadedFieldsFromExternalStorage();
}
bool clangExt_RecordDecl_isNonTrivialToPrimitiveDefaultInitialize(const RecordDecl* R) {
	return R->isNonTrivialToPrimitiveDefaultInitialize();
}
bool clangExt_RecordDecl_isNonTrivialToPrimitiveCopy(const RecordDecl* R) {
	return R->isNonTrivialToPrimitiveCopy();
}
bool clangExt_RecordDecl_isNonTrivialToPrimitiveDestroy(const RecordDecl* R) {
	return R->isNonTrivialToPrimitiveDestroy();
}
bool clangExt_RecordDecl_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const RecordDecl* R) {
	return R->hasNonTrivialToPrimitiveDefaultInitializeCUnion();
}
bool clangExt_RecordDecl_hasNonTrivialToPrimitiveDestructCUnion(const RecordDecl* R) {
	return R->hasNonTrivialToPrimitiveDestructCUnion();
}
bool clangExt_RecordDecl_hasNonTrivialToPrimitiveCopyCUnion(const RecordDecl* R) {
	return R->hasNonTrivialToPrimitiveCopyCUnion();
}
bool clangExt_RecordDecl_canPassInRegisters(const RecordDecl* R) {
	return R->canPassInRegisters();
}
RecordDecl::ArgPassingKind clangExt_RecordDecl_getArgPassingRestrictions(const RecordDecl* R) {
	return R->getArgPassingRestrictions();
}
bool clangExt_RecordDecl_isParamDestroyedInCallee(const RecordDecl* R) {
	return R->isParamDestroyedInCallee();
}
bool clangExt_RecordDecl_isRandomized(const RecordDecl* R) {
	return R->isRandomized();
}
bool clangExt_RecordDecl_isInjectedClassName(const RecordDecl* R) {
	return R->isInjectedClassName();
}
bool clangExt_RecordDecl_isLambda(const RecordDecl* R) {
	return R->isLambda();
}
bool clangExt_RecordDecl_isCapturedRecord(const RecordDecl* R) {
	return R->isCapturedRecord();
}
const RecordDecl* clangExt_RecordDecl_getDefinition(const RecordDecl* R) {
	return R->getDefinition();
}
bool clangExt_RecordDecl_isOrContainsUnion(const RecordDecl* R) {
	return R->isOrContainsUnion();
}
unsigned clangExt_RecordDecl_getNumFields(const RecordDecl* R) {
	SmallVector<const FieldDecl*, 4> fields = { R->field_begin(), R->field_end() };
	return fields.size();
}
const FieldDecl* clangExt_RecordDecl_getField(const RecordDecl* R, unsigned i) {
	SmallVector<const FieldDecl*, 4> fields = { R->field_begin(), R->field_end() };
	if (i < fields.size())
		return fields[i];
	else
		return nullptr;
}
bool clangExt_RecordDecl_field_empty(const RecordDecl* R) {
	return R->field_empty();
}
bool clangExt_RecordDecl_classof(const Decl* D) {
	return RecordDecl::classof(D);
}
bool clangExt_RecordDecl_classofKind(Decl::Kind K) {
	return RecordDecl::classofKind(K);
}
bool clangExt_RecordDecl_isMsStruct(const RecordDecl* R, const ASTContext* C) {
	return R->isMsStruct(const_cast<ASTContext&>(*C));
}
bool clangExt_RecordDecl_mayInsertExtraPadding(const RecordDecl* R, bool EmitRemark) {
	return R->mayInsertExtraPadding(EmitRemark);
}
const FieldDecl* clangExt_RecordDecl_findFirstNamedDataMember(const RecordDecl* R) {
	return R->findFirstNamedDataMember();
}
//=======================================================================================================================
CXSourceLocation clangExt_FileScopeAsmDecl_getAsmLoc(const FileScopeAsmDecl* A) {
	return cxloc::translateSourceLocation(A->getASTContext(), A->getAsmLoc());
}
CXSourceLocation clangExt_FileScopeAsmDecl_getRParenLoc(const FileScopeAsmDecl* A) {
	return cxloc::translateSourceLocation(A->getASTContext(), A->getRParenLoc());
}
CXSourceRange clangExt_FileScopeAsmDecl_getSourceRange(const FileScopeAsmDecl* A) {
	return cxloc::translateSourceRange(A->getASTContext(), A->getSourceRange());
}
const StringLiteral* clangExt_FileScopeAsmDecl_getAsmString(const FileScopeAsmDecl* A) {
	return A->getAsmString();
}
bool clangExt_FileScopeAsmDecl_classof(const Decl* D) {
	return FileScopeAsmDecl::classof(D);
}
bool clangExt_FileScopeAsmDecl_classofKind(Decl::Kind K) {
	return FileScopeAsmDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceLocation clangExt_BlockDecl_getCaretLocation(const BlockDecl* B) {
	return cxloc::translateSourceLocation(B->getASTContext(), B->getCaretLocation());
}
bool clangExt_BlockDecl_isVariadic(const BlockDecl* B) {
	return B->isVariadic();
}
const CompoundStmt* clangExt_BlockDecl_getCompoundBody(const BlockDecl* B) {
	return B->getCompoundBody();
}
const Stmt* clangExt_BlockDecl_getBody(const BlockDecl* B) {
	return B->getBody();
}
const TypeSourceInfo* clangExt_BlockDecl_getSignatureAsWritten(const BlockDecl* B) {
	return B->getSignatureAsWritten();
}
bool clangExt_BlockDecl_param_empty(const BlockDecl* B) {
	return B->param_empty();
}
size_t clangExt_BlockDecl_param_size(const BlockDecl* B) {
	return B->param_size();
}
unsigned clangExt_BlockDecl_getNumParams(const BlockDecl* B) {
	return B->getNumParams();
}
const ParmVarDecl* clangExt_BlockDecl_getParamDecl(const BlockDecl* B, unsigned i) {
	return B->getParamDecl(i);
}
bool clangExt_BlockDecl_hasCaptures(const BlockDecl* B) {
	return B->hasCaptures();
}
unsigned clangExt_BlockDecl_getNumCaptures(const BlockDecl* B) {
	return B->getNumCaptures();
}
const BlockDecl::Capture* clangExt_BlockDecl_getCaptures(const BlockDecl* B, unsigned i) {
	if (i < B->getNumCaptures())
		return &B->captures()[i];
	else
		return nullptr;
}
bool clangExt_BlockDecl_capturesCXXThis(const BlockDecl* B) {
	return B->capturesCXXThis();
}
bool clangExt_BlockDecl_blockMissingReturnType(const BlockDecl* B) {
	return B->blockMissingReturnType();
}
bool clangExt_BlockDecl_isConversionFromLambda(const BlockDecl* B) {
	return B->isConversionFromLambda();
}
bool clangExt_BlockDecl_doesNotEscape(const BlockDecl* B) {
	return B->doesNotEscape();
}
bool clangExt_BlockDecl_canAvoidCopyToHeap(const BlockDecl* B) {
	return B->canAvoidCopyToHeap();
}
bool clangExt_BlockDecl_capturesVariable(const BlockDecl* B, const VarDecl* var) {
	return B->capturesVariable(var);
}
unsigned clangExt_BlockDecl_getBlockManglingNumber(const BlockDecl* B) {
	return B->getBlockManglingNumber();
}
const Decl* clangExt_BlockDecl_getBlockManglingContextDecl(const BlockDecl* B) {
	return B->getBlockManglingContextDecl();
}
CXSourceRange clangExt_BlockDecl_getSourceRange(const BlockDecl* B) {
	return cxloc::translateSourceRange(B->getASTContext(), B->getSourceRange());
}
bool clangExt_BlockDecl_classof(const Decl* D) {
	return BlockDecl::classof(D);
}
bool clangExt_BlockDecl_classofKind(Decl::Kind K) {
	return BlockDecl::classofKind(K);
}
const DeclContext* clangExt_BlockDecl_castToDeclContext(const BlockDecl* D) {
	return BlockDecl::castToDeclContext(D);
}
const BlockDecl* clangExt_BlockDecl_castFromDeclContext(const DeclContext* DC) {
	return BlockDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
const VarDecl* clangExt_BlockDecl_Capture_getVariable(const BlockDecl::Capture* C) {
	return C->getVariable();
}
bool clangExt_BlockDecl_Capture_isByRef(const BlockDecl::Capture* C) {
	return C->isByRef();
}
bool clangExt_BlockDecl_Capture_isEscapingByref(const BlockDecl::Capture* C) {
	return C->isEscapingByref();
}
bool clangExt_BlockDecl_Capture_isNonEscapingByref(const BlockDecl::Capture* C) {
	return C->isNonEscapingByref();
}
bool clangExt_BlockDecl_Capture_isNested(const BlockDecl::Capture* C) {
	return C->isNested();
}
bool clangExt_BlockDecl_Capture_hasCopyExpr(const BlockDecl::Capture* C) {
	return C->hasCopyExpr();
}
const Expr* clangExt_BlockDecl_Capture_getCopyExpr(const BlockDecl::Capture* C) {
	return C->getCopyExpr();
}
//=======================================================================================================================
const Stmt* clangExt_CapturedDecl_getBody(const CapturedDecl* C) {
	return C->getBody();
}
bool clangExt_CapturedDecl_isNothrow(const CapturedDecl* C) {
	return C->isNothrow();
}
unsigned clangExt_CapturedDecl_getNumParams(const CapturedDecl* C) {
	return C->getNumParams();
}
const ImplicitParamDecl* clangExt_CapturedDecl_getParam(const CapturedDecl* C, unsigned i) {
	return C->getParam(i);
}
const ImplicitParamDecl* clangExt_CapturedDecl_getContextParam(const CapturedDecl* C) {
	return C->getContextParam();
}
unsigned clangExt_CapturedDecl_getContextParamPosition(const CapturedDecl* C) {
	return C->getContextParamPosition();
}
bool clangExt_CapturedDecl_classof(const Decl* D) {
	return CapturedDecl::classof(D);
}
bool clangExt_CapturedDecl_classofKind(Decl::Kind K) {
	return CapturedDecl::classofKind(K);
}
const DeclContext* clangExt_CapturedDecl_castToDeclContext(const CapturedDecl* D) {
	return CapturedDecl::castToDeclContext(D);
}
const CapturedDecl* clangExt_CapturedDecl_castFromDeclContext(const DeclContext* DC) {
	return CapturedDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
const Module* clangExt_ImportDecl_getImportedModule(const ImportDecl* D) {
	return D->getImportedModule();
}
unsigned clangExt_ImportDecl_getNumIdentifierLocs(const ImportDecl* D) {
	return D->getIdentifierLocs().size();
}
CXSourceLocation clangExt_ImportDecl_getIdentifierLocs(const ImportDecl* D, unsigned i) {
	if (i < D->getIdentifierLocs().size())
		return cxloc::translateSourceLocation(D->getASTContext(), D->getIdentifierLocs()[i]);
	else
		return CXSourceLocation();
}
CXSourceRange clangExt_ImportDecl_getSourceRange(const ImportDecl* D) {
	return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
bool clangExt_ImportDecl_classof(const Decl* D) {
	return ImportDecl::classof(D);
}
bool clangExt_ImportDecl_classofKind(Decl::Kind K) {
	return ImportDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceLocation clangExt_ExportDecl_getExportLoc(const ExportDecl* E) {
	return cxloc::translateSourceLocation(E->getASTContext(), E->getExportLoc());
}
CXSourceLocation clangExt_ExportDecl_getRBraceLoc(const ExportDecl* E) {
	return cxloc::translateSourceLocation(E->getASTContext(), E->getRBraceLoc());
}
bool clangExt_ExportDecl_hasBraces(const ExportDecl* E) {
	return E->hasBraces();
}
CXSourceLocation clangExt_ExportDecl_getEndLoc(const ExportDecl* E) {
	return cxloc::translateSourceLocation(E->getASTContext(), E->getEndLoc());
}
CXSourceRange clangExt_ExportDecl_getSourceRange(const ExportDecl* E) {
	return cxloc::translateSourceRange(E->getASTContext(), E->getSourceRange());
}
bool clangExt_ExportDecl_classof(const Decl* D) {
	return ExportDecl::classof(D);
}
bool clangExt_ExportDecl_classofKind(Decl::Kind K) {
	return ExportDecl::classofKind(K);
}
const DeclContext* clangExt_ExportDecl_castToDeclContext(const ExportDecl* D) {
	return ExportDecl::castToDeclContext(D);
}
const ExportDecl* clangExt_ExportDecl_castFromDeclContext(const DeclContext* DC) {
	return ExportDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
bool clangExt_EmptyDecl_classof(const Decl* D) {
	return EmptyDecl::classof(D);
}
bool clangExt_EmptyDecl_classofKind(Decl::Kind K) {
	return EmptyDecl::classofKind(K);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
