#ifndef LIB_CLANG_EXT_DECL_H
#define LIB_CLANG_EXT_DECL_H

#include <clang/AST/Expr.h>
#include <clang/AST/Decl.h>

#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE const ASTContext* clangExt_TranslationUnitDecl_getASTContext(const TranslationUnitDecl* T);
CINDEX_LINKAGE const NamespaceDecl* clangExt_TranslationUnitDecl_getAnonymousNamespace(const TranslationUnitDecl* T);
CINDEX_LINKAGE bool clangExt_TranslationUnitDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TranslationUnitDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_TranslationUnitDecl_castToDeclContext(const TranslationUnitDecl* D);
CINDEX_LINKAGE const TranslationUnitDecl* clangExt_TranslationUnitDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE PragmaMSCommentKind clangExt_PragmaCommentDecl_getCommentKind(const PragmaCommentDecl* D);
CINDEX_LINKAGE CXString clangExt_PragmaCommentDecl_getArg(const PragmaCommentDecl* D);
CINDEX_LINKAGE bool clangExt_PragmaCommentDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_PragmaCommentDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXString clangExt_PragmaDetectMismatchDecl_getName(const PragmaDetectMismatchDecl* D);
CINDEX_LINKAGE CXString clangExt_PragmaDetectMismatchDecl_getValue(const PragmaDetectMismatchDecl* D);
CINDEX_LINKAGE bool clangExt_PragmaDetectMismatchDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_PragmaDetectMismatchDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_ExternCContextDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ExternCContextDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_ExternCContextDecl_castToDeclContext(const ExternCContextDecl* D);
CINDEX_LINKAGE const ExternCContextDecl* clangExt_ExternCContextDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE const IdentifierInfo* clangExt_NamedDecl_getIdentifier(const NamedDecl* D);
CINDEX_LINKAGE CXString clangExt_NamedDecl_getName(const NamedDecl* D);
CINDEX_LINKAGE CXString clangExt_NamedDecl_getNameAsString(const NamedDecl* D);
CINDEX_LINKAGE const CXDeclarationName clangExt_NamedDecl_getDeclName(const NamedDecl* D);
CINDEX_LINKAGE CXString clangExt_NamedDecl_getQualifiedNameAsString(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_hasLinkage(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_isCXXClassMember(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_isCXXInstanceMember(const NamedDecl* D);
CINDEX_LINKAGE ReservedIdentifierStatus clangExt_NamedDecl_isReserved(const NamedDecl* D, const LangOptions* LangOpts);
CINDEX_LINKAGE Linkage clangExt_NamedDecl_getLinkageInternal(const NamedDecl* D);
CINDEX_LINKAGE Linkage clangExt_NamedDecl_getFormalLinkage(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_hasExternalFormalLinkage(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_isExternallyVisible(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_isExternallyDeclarable(const NamedDecl* D);
CINDEX_LINKAGE Visibility clangExt_NamedDecl_getVisibility(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_isLinkageValid(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_hasLinkageBeenComputed(const NamedDecl* D);
CINDEX_LINKAGE const NamedDecl* clangExt_NamedDecl_getUnderlyingDecl(const NamedDecl* D);
CINDEX_LINKAGE const NamedDecl* clangExt_NamedDecl_getMostRecentDecl(const NamedDecl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_NamedDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const LabelStmt* clangExt_LabelDecl_getStmt(const LabelDecl* D);
CINDEX_LINKAGE bool clangExt_LabelDecl_isGnuLocal(const LabelDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_LabelDecl_getSourceRange(const LabelDecl* D);
CINDEX_LINKAGE bool clangExt_LabelDecl_isMSAsmLabel(const LabelDecl* D);
CINDEX_LINKAGE bool clangExt_LabelDecl_isResolvedMSAsmLabel(const LabelDecl* D);
CINDEX_LINKAGE CXString clangExt_LabelDecl_getMSAsmLabel(const LabelDecl* D);
CINDEX_LINKAGE bool clangExt_LabelDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_LabelDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_NamespaceDecl_isAnonymousNamespace(const NamespaceDecl* D);
CINDEX_LINKAGE bool clangExt_NamespaceDecl_isInline(const NamespaceDecl* D);
CINDEX_LINKAGE bool clangExt_NamespaceDecl_isRedundantInlineQualifierFor(const NamespaceDecl* D, const CXDeclarationName Name);
CINDEX_LINKAGE const NamespaceDecl* clangExt_NamespaceDecl_getOriginalNamespace(const NamespaceDecl* D);
CINDEX_LINKAGE bool clangExt_NamespaceDecl_isOriginalNamespace(const NamespaceDecl* D);
CINDEX_LINKAGE const NamespaceDecl* clangExt_NamespaceDecl_getAnonymousNamespace(const NamespaceDecl* D);
CINDEX_LINKAGE const NamespaceDecl* clangExt_NamespaceDecl_getCanonicalDecl(const NamespaceDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_NamespaceDecl_getSourceRange(const NamespaceDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_NamespaceDecl_getBeginLoc(const NamespaceDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_NamespaceDecl_getRBraceLoc(const NamespaceDecl* D);
CINDEX_LINKAGE bool clangExt_NamespaceDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_NamespaceDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_NamespaceDecl_castToDeclContext(const NamespaceDecl* D);
CINDEX_LINKAGE const NamespaceDecl* clangExt_NamespaceDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_ValueDecl_getType(const ValueDecl* D);
CINDEX_LINKAGE bool clangExt_ValueDecl_isWeak(const ValueDecl* D);
CINDEX_LINKAGE bool clangExt_ValueDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ValueDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const TypeSourceInfo* clangExt_DeclaratorDecl_getTypeSourceInfo(const DeclaratorDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclaratorDecl_getInnerLocStart(const DeclaratorDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclaratorDecl_getOuterLocStart(const DeclaratorDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_DeclaratorDecl_getSourceRange(const DeclaratorDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclaratorDecl_getBeginLoc(const DeclaratorDecl* D);
CINDEX_LINKAGE const NestedNameSpecifier* clangExt_DeclaratorDecl_getQualifier(const DeclaratorDecl* D);
CINDEX_LINKAGE const Expr* clangExt_DeclaratorDecl_getTrailingRequiresClause(const DeclaratorDecl* D);
CINDEX_LINKAGE unsigned clangExt_DeclaratorDecl_getNumTemplateParameterLists(const DeclaratorDecl* D);
CINDEX_LINKAGE const TemplateParameterList* clangExt_DeclaratorDecl_getTemplateParameterList(const DeclaratorDecl* D, unsigned index);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclaratorDecl_getTypeSpecStartLoc(const DeclaratorDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclaratorDecl_getTypeSpecEndLoc(const DeclaratorDecl* D);
CINDEX_LINKAGE bool clangExt_DeclaratorDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_DeclaratorDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_WasEvaluated(const EvaluatedStmt* e);
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_IsEvaluating(const EvaluatedStmt* e);
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_HasConstantInitialization(const EvaluatedStmt* e);
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_HasConstantDestruction(const EvaluatedStmt* e);
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_HasICEInit(const EvaluatedStmt* e);
CINDEX_LINKAGE bool clangExt_EvaluatedStmt_CheckedForICEInit(const EvaluatedStmt* e);
CINDEX_LINKAGE const Stmt* clangExt_EvaluatedStmt_GetValue(const EvaluatedStmt* e);
CINDEX_LINKAGE const APValue* clangExt_EvaluatedStmt_GetEvaluated(const EvaluatedStmt* e);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_VarDecl_getSourceRange(const VarDecl* D);
CINDEX_LINKAGE StorageClass clangExt_VarDecl_getStorageClass(const VarDecl* D);
CINDEX_LINKAGE ThreadStorageClassSpecifier clangExt_VarDecl_getTSCSpec(const VarDecl* D);
CINDEX_LINKAGE VarDecl::TLSKind clangExt_VarDecl_getTLSKind(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasLocalStorage(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isStaticLocal(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasExternalStorage(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasGlobalStorage(const VarDecl* D);
CINDEX_LINKAGE StorageDuration clangExt_VarDecl_getStorageDuration(const VarDecl* D);
CINDEX_LINKAGE LanguageLinkage clangExt_VarDecl_getLanguageLinkage(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isExternC(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isInExternCContext(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isInExternCXXContext(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isLocalVarDecl(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isLocalVarDeclOrParm(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isFunctionOrMethodVarDecl(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isStaticDataMember(const VarDecl* D);
CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getCanonicalDecl(const VarDecl* D);
CINDEX_LINKAGE VarDecl::DefinitionKind clangExt_VarDecl_isThisDeclarationADefinition(const VarDecl* D);
CINDEX_LINKAGE VarDecl::DefinitionKind clangExt_VarDecl_hasDefinition(const VarDecl* D);
CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getActingDefinition(const VarDecl* D);
CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getDefinition(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isOutOfLine(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isFileVarDecl(const VarDecl* D);
CINDEX_LINKAGE const Expr* clangExt_VarDecl_getAnyInitializer(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasInit(const VarDecl* D);
CINDEX_LINKAGE const Expr* clangExt_VarDecl_getInit(const VarDecl* D);
CINDEX_LINKAGE Stmt** clangExt_VarDecl_getInitAddress(VarDecl* D);
CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getInitializingDeclaration(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_mightBeUsableInConstantExpressions(const VarDecl* D, const ASTContext* C);
CINDEX_LINKAGE bool clangExt_VarDecl_isUsableInConstantExpressions(const VarDecl* D, const ASTContext* C);
CINDEX_LINKAGE const EvaluatedStmt* clangExt_VarDecl_ensureEvaluatedStmt(const VarDecl* D);
CINDEX_LINKAGE const EvaluatedStmt* clangExt_VarDecl_getEvaluatedStmt(const VarDecl* D);
CINDEX_LINKAGE const APValue* clangExt_VarDecl_evaluateValue(const VarDecl* D);
CINDEX_LINKAGE const APValue* clangExt_VarDecl_getEvaluatedValue(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasConstantInitialization(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasICEInitializer(const VarDecl* D, const ASTContext* Context);
CINDEX_LINKAGE VarDecl::InitializationStyle clangExt_VarDecl_getInitStyle(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isDirectInit(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isThisDeclarationADemotedDefinition(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isExceptionVariable(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isNRVOVariable(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isCXXForRangeDecl(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isObjCForDecl(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isARCPseudoStrong(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isInline(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isInlineSpecified(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isConstexpr(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isInitCapture(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isParameterPack(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isPreviousDeclInSameBlockScope(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isEscapingByref(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isNonEscapingByref(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_hasDependentAlignment(const VarDecl* D);

CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getTemplateInstantiationPattern(const VarDecl* D);
CINDEX_LINKAGE const VarDecl* clangExt_VarDecl_getInstantiatedFromStaticDataMember(const VarDecl* D);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_VarDecl_getTemplateSpecializationKind(const VarDecl* D);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_VarDecl_getTemplateSpecializationKindForInstantiation(const VarDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_VarDecl_getPointOfInstantiation(const VarDecl* D);
CINDEX_LINKAGE const MemberSpecializationInfo* clangExt_VarDecl_getMemberSpecializationInfo(const VarDecl* D);
CINDEX_LINKAGE const VarTemplateDecl* clangExt_VarDecl_getDescribedVarTemplate(const VarDecl* D);

CINDEX_LINKAGE bool clangExt_VarDecl_isKnownToBeDefined(const VarDecl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_isNoDestroy(const VarDecl* D, const ASTContext* Ctx);
CINDEX_LINKAGE QualType::DestructionKind clangExt_VarDecl_needsDestruction(const VarDecl* D, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_VarDecl_hasFlexibleArrayInit(const VarDecl* D, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_VarDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_VarDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE CXString clangExt_VarDecl_getMangling(const VarDecl* D);
//=======================================================================================================================
CINDEX_LINKAGE ImplicitParamDecl::ImplicitParamKind clangExt_ImplicitParamDecl_getParameterKind(const ImplicitParamDecl* D);
CINDEX_LINKAGE bool clangExt_ImplicitParamDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ImplicitParamDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_ParmVarDecl_getSourceRange(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_isObjCMethodParameter(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_isDestroyedInCallee(const ParmVarDecl* D);
CINDEX_LINKAGE unsigned clangExt_ParmVarDecl_getFunctionScopeDepth(const ParmVarDecl* D);
CINDEX_LINKAGE unsigned clangExt_ParmVarDecl_getFunctionScopeIndex(const ParmVarDecl* D);
CINDEX_LINKAGE Decl::ObjCDeclQualifier clangExt_ParmVarDecl_getObjCDeclQualifier(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_isKNRPromoted(const ParmVarDecl* D);
CINDEX_LINKAGE const Expr* clangExt_ParmVarDecl_getDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_ParmVarDecl_getDefaultArgRange(const ParmVarDecl* D);
CINDEX_LINKAGE const Expr* clangExt_ParmVarDecl_getUninstantiatedDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_hasDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_hasUnparsedDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_hasUninstantiatedDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_hasInheritedDefaultArg(const ParmVarDecl* D);
CINDEX_LINKAGE const CXQualType clangExt_ParmVarDecl_getOriginalType(const ParmVarDecl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ParmVarDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionDecl_getEllipsisLoc(const FunctionDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionDecl_getSourceRange(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasBody(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasBody2(const FunctionDecl* D, const FunctionDecl** Definition);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasTrivialBody(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isDefined(const FunctionDecl* D);
CINDEX_LINKAGE const FunctionDecl* clangExt_FunctionDecl_getDefinition(const FunctionDecl* D);
CINDEX_LINKAGE const Stmt* clangExt_FunctionDecl_getBody(const FunctionDecl* D);
CINDEX_LINKAGE const Stmt* clangExt_FunctionDecl_getBody2(const FunctionDecl* D, const FunctionDecl** Definition);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isThisDeclarationADefinition(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isThisDeclarationInstantiatedFromAFriendDefinition(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_doesThisDeclarationHaveABody(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isVariadic(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isVirtualAsWritten(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isPure(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isLateTemplateParsed(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isTrivial(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isTrivialForCall(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isDefaulted(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isExplicitlyDefaulted(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isUserProvided(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasImplicitReturnZero(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasPrototype(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasWrittenPrototype(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasInheritedPrototype(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isConstexpr(const FunctionDecl* D);
CINDEX_LINKAGE ConstexprSpecKind clangExt_FunctionDecl_getConstexprKind(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isConstexprSpecified(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isConsteval(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_instantiationIsPending(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_usesSEHTry(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isDeleted(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isDeletedAsWritten(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isMain(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isMSVCRTEntryPoint(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isReservedGlobalPlacementOperator(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInlineBuiltinDeclaration(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isDestroyingOperatorDelete(const FunctionDecl* D);
CINDEX_LINKAGE LanguageLinkage clangExt_FunctionDecl_getLanguageLinkage(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isExternC(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInExternCContext(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInExternCXXContext(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isGlobal(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isNoReturn(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasSkippedBody(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_willHaveBody(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isMultiVersion(const FunctionDecl* D);
CINDEX_LINKAGE MultiVersionKind clangExt_FunctionDecl_getMultiVersionKind(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isCPUDispatchMultiVersion(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isCPUSpecificMultiVersion(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isTargetMultiVersion(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isTargetClonesMultiVersion(const FunctionDecl* D);
CINDEX_LINKAGE const FunctionDecl* clangExt_FunctionDecl_getCanonicalDecl(const FunctionDecl* D);
CINDEX_LINKAGE unsigned clangExt_FunctionDecl_getBuiltinID(const FunctionDecl* D, bool ConsiderWrapperFunctions = false);
CINDEX_LINKAGE bool clangExt_FunctionDecl_param_empty(const FunctionDecl* D);
CINDEX_LINKAGE size_t clangExt_FunctionDecl_param_size(const FunctionDecl* D);
CINDEX_LINKAGE unsigned clangExt_FunctionDecl_getNumParams(const FunctionDecl* D);
CINDEX_LINKAGE const ParmVarDecl* clangExt_FunctionDecl_getParamDecl(const FunctionDecl* D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_FunctionDecl_getMinRequiredArguments(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_hasOneParamOrDefaultArgs(const FunctionDecl* D);
CINDEX_LINKAGE CXTypeLoc clangExt_FunctionDecl_getFunctionTypeLoc(const FunctionDecl* D); // FunctionTypeLoc
CINDEX_LINKAGE const CXQualType clangExt_FunctionDecl_getReturnType(const FunctionDecl* D); // QualType
CINDEX_LINKAGE CXSourceRange clangExt_FunctionDecl_getReturnTypeSourceRange(const FunctionDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionDecl_getParametersSourceRange(const FunctionDecl* D);
CINDEX_LINKAGE const CXQualType clangExt_FunctionDecl_getDeclaredReturnType(const FunctionDecl* D); // QualType
CINDEX_LINKAGE ExceptionSpecificationType clangExt_FunctionDecl_getExceptionSpecType(const FunctionDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionDecl_getExceptionSpecSourceRange(const FunctionDecl* D);
CINDEX_LINKAGE const CXQualType clangExt_FunctionDecl_getCallResultType(const FunctionDecl* D); // QualType
CINDEX_LINKAGE StorageClass clangExt_FunctionDecl_getStorageClass(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInlineSpecified(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_UsesFPIntrin(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInlined(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isInlineDefinitionExternallyVisible(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isMSExternInline(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_doesDeclarationForceExternallyVisibleDefinition(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isStatic(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isOverloadedOperator(const FunctionDecl* D);
CINDEX_LINKAGE OverloadedOperatorKind clangExt_FunctionDecl_getOverloadedOperator(const FunctionDecl* D);
CINDEX_LINKAGE const IdentifierInfo* clangExt_FunctionDecl_getLiteralIdentifier(const FunctionDecl* D);
CINDEX_LINKAGE FunctionDecl* clangExt_FunctionDecl_getInstantiatedFromMemberFunction(const FunctionDecl* D);
CINDEX_LINKAGE FunctionDecl::TemplatedKind clangExt_FunctionDecl_getTemplatedKind(const FunctionDecl* D);
CINDEX_LINKAGE MemberSpecializationInfo* clangExt_FunctionDecl_getMemberSpecializationInfo(const FunctionDecl* D);
CINDEX_LINKAGE FunctionTemplateDecl* clangExt_FunctionDecl_getDescribedFunctionTemplate(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isFunctionTemplateSpecialization(const FunctionDecl* D);
CINDEX_LINKAGE FunctionTemplateSpecializationInfo* clangExt_FunctionDecl_getTemplateSpecializationInfo(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isImplicitlyInstantiable(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isTemplateInstantiation(const FunctionDecl* D);
CINDEX_LINKAGE FunctionDecl* clangExt_FunctionDecl_getTemplateInstantiationPattern(const FunctionDecl* D, bool ForDefinition = true);
CINDEX_LINKAGE FunctionTemplateDecl* clangExt_FunctionDecl_getPrimaryTemplate(const FunctionDecl* D);
CINDEX_LINKAGE const TemplateArgumentList* clangExt_FunctionDecl_getTemplateSpecializationArgs(const FunctionDecl* D);
CINDEX_LINKAGE const ASTTemplateArgumentListInfo* clangExt_FunctionDecl_getTemplateSpecializationArgsAsWritten(const FunctionDecl* D);
CINDEX_LINKAGE const DependentFunctionTemplateSpecializationInfo* clangExt_FunctionDecl_getDependentSpecializationInfo(const FunctionDecl* D);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_FunctionDecl_getTemplateSpecializationKind(const FunctionDecl* D);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_FunctionDecl_getTemplateSpecializationKindForInstantiation(const FunctionDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionDecl_getPointOfInstantiation(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_isOutOfLine(const FunctionDecl* D);
CINDEX_LINKAGE unsigned clangExt_FunctionDecl_getMemoryFunctionKind(const FunctionDecl* D);
CINDEX_LINKAGE unsigned clangExt_FunctionDecl_getODRHash(const FunctionDecl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_FunctionDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE DeclContext* clangExt_FunctionDecl_castToDeclContext(const FunctionDecl* D);
CINDEX_LINKAGE FunctionDecl* clangExt_FunctionDecl_castFromDeclContext(const DeclContext* DC);
CINDEX_LINKAGE CXString clangExt_FunctionDecl_getMangling(const FunctionDecl* D);
//=======================================================================================================================
CINDEX_LINKAGE unsigned clangExt_FieldDecl_getFieldIndex(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_isMutable(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_isBitField(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_isUnnamedBitfield(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_isAnonymousStructOrUnion(const FieldDecl* F);
CINDEX_LINKAGE const Expr* clangExt_FieldDecl_getBitWidth(const FieldDecl* F);
CINDEX_LINKAGE unsigned clangExt_FieldDecl_getBitWidthValue(const FieldDecl* F, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_FieldDecl_isZeroLengthBitField(const FieldDecl* F, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_FieldDecl_isZeroSize(const FieldDecl* F, const ASTContext* Ctx);
CINDEX_LINKAGE InClassInitStyle clangExt_FieldDecl_getInClassInitStyle(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_hasInClassInitializer(const FieldDecl* F);
CINDEX_LINKAGE const Expr* clangExt_FieldDecl_getInClassInitializer(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_hasCapturedVLAType(const FieldDecl* F);
CINDEX_LINKAGE const VariableArrayType* clangExt_FieldDecl_getCapturedVLAType(const FieldDecl* F);
CINDEX_LINKAGE const RecordDecl* clangExt_FieldDecl_getParent(const FieldDecl* F);
CINDEX_LINKAGE CXSourceRange clangExt_FieldDecl_getSourceRange(const FieldDecl* F);
CINDEX_LINKAGE const FieldDecl* clangExt_FieldDecl_getCanonicalDecl(const FieldDecl* F);
CINDEX_LINKAGE bool clangExt_FieldDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_FieldDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const Expr* clangExt_EnumConstantDecl_getInitExpr(const EnumConstantDecl* E);
CINDEX_LINKAGE const llvm::APSInt* clangExt_EnumConstantDecl_getInitVal(const EnumConstantDecl* E);
CINDEX_LINKAGE CXSourceRange clangExt_EnumConstantDecl_getSourceRange(const EnumConstantDecl* E);
CINDEX_LINKAGE const EnumConstantDecl* clangExt_EnumConstantDecl_getCanonicalDecl(const EnumConstantDecl* E);
CINDEX_LINKAGE bool clangExt_EnumConstantDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_EnumConstantDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const NamedDecl* clangExt_IndirectFieldDecl_getChain(const IndirectFieldDecl* I, unsigned i);
CINDEX_LINKAGE unsigned clangExt_IndirectFieldDecl_getChainingSize(const IndirectFieldDecl* I);
CINDEX_LINKAGE const FieldDecl* clangExt_IndirectFieldDecl_getAnonField(const IndirectFieldDecl* I);
CINDEX_LINKAGE const VarDecl* clangExt_IndirectFieldDecl_getVarDecl(const IndirectFieldDecl* I);
CINDEX_LINKAGE const IndirectFieldDecl* clangExt_IndirectFieldDecl_getCanonicalDecl(const IndirectFieldDecl* I);
CINDEX_LINKAGE bool clangExt_IndirectFieldDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_IndirectFieldDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const Type* clangExt_TypeDecl_getTypeForDecl(const TypeDecl* T);
CINDEX_LINKAGE CXSourceLocation clangExt_TypeDecl_getBeginLoc(const TypeDecl* T);
CINDEX_LINKAGE CXSourceRange clangExt_TypeDecl_getSourceRange(const TypeDecl* T);
CINDEX_LINKAGE bool clangExt_TypeDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TypeDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_TypedefNameDecl_isModed(const TypedefNameDecl* T);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_TypedefNameDecl_getTypeSourceInfo(const TypedefNameDecl* T);
CINDEX_LINKAGE const CXQualType clangExt_TypedefNameDecl_getUnderlyingType(const TypedefNameDecl* T);
CINDEX_LINKAGE const TypedefNameDecl* clangExt_TypedefNameDecl_getCanonicalDecl(const TypedefNameDecl* T);
CINDEX_LINKAGE const TagDecl* clangExt_TypedefNameDecl_getAnonDeclWithTypedefName(const TypedefNameDecl* T, bool AnyRedecl = false);
CINDEX_LINKAGE bool clangExt_TypedefNameDecl_isTransparentTag(const TypedefNameDecl* T);
CINDEX_LINKAGE bool clangExt_TypedefNameDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TypedefNameDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_TypedefDecl_getSourceRange(const TypedefDecl* T);
CINDEX_LINKAGE bool clangExt_TypedefDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TypedefDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_TypeAliasDecl_getSourceRange(const TypeAliasDecl* T);
CINDEX_LINKAGE const TypeAliasTemplateDecl* clangExt_TypeAliasDecl_getDescribedAliasTemplate(const TypeAliasDecl* T);
CINDEX_LINKAGE bool clangExt_TypeAliasDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TypeAliasDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_TagDecl_getBraceRange(const TagDecl* T);
CINDEX_LINKAGE CXSourceLocation clangExt_TagDecl_getInnerLocStart(const TagDecl* T);
CINDEX_LINKAGE CXSourceLocation clangExt_TagDecl_getOuterLocStart(const TagDecl* T);
CINDEX_LINKAGE CXSourceRange clangExt_TagDecl_getSourceRange(const TagDecl* T);
CINDEX_LINKAGE const TagDecl* clangExt_TagDecl_getCanonicalDecl(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isThisDeclarationADefinition(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isCompleteDefinition(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isCompleteDefinitionRequired(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isBeingDefined(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isEmbeddedInDeclarator(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isFreeStanding(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_mayHaveOutOfDateDef(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isDependentType(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isThisDeclarationADemotedDefinition(const TagDecl* T);
CINDEX_LINKAGE TagDecl* clangExt_TagDecl_getDefinition(const TagDecl* T);
CINDEX_LINKAGE CXString clangExt_TagDecl_getKindName(const TagDecl* T);
CINDEX_LINKAGE TagDecl::TagKind clangExt_TagDecl_getTagKind(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isStruct(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isInterface(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isClass(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isUnion(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_isEnum(const TagDecl* T);
CINDEX_LINKAGE bool clangExt_TagDecl_hasNameForLinkage(const TagDecl* T);
CINDEX_LINKAGE const TypedefNameDecl* clangExt_TagDecl_getTypedefNameForAnonDecl(const TagDecl* T);
CINDEX_LINKAGE const NestedNameSpecifier* clangExt_TagDecl_getQualifier(const TagDecl* T);
CINDEX_LINKAGE unsigned clangExt_TagDecl_getNumTemplateParameterLists(const TagDecl* T);
CINDEX_LINKAGE TemplateParameterList* clangExt_TagDecl_getTemplateParameterList(const TagDecl* T, unsigned i);
CINDEX_LINKAGE bool clangExt_TagDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_TagDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_TagDecl_castToDeclContext(const TagDecl* D);
CINDEX_LINKAGE const TagDecl* clangExt_TagDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getCanonicalDecl(const EnumDecl* E);
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getPreviousDecl(const EnumDecl* E);
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getMostRecentDecl(const EnumDecl* E);
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getDefinition(const EnumDecl* E);
CINDEX_LINKAGE CXSourceRange clangExt_EnumDecl_getSourceRange(const EnumDecl* E);
CINDEX_LINKAGE unsigned clangExt_EnumDecl_getNumEnumerators(const EnumDecl* E);
CINDEX_LINKAGE const EnumConstantDecl* clangExt_EnumDecl_getNameEnumerators(const EnumDecl* E, unsigned i);
CINDEX_LINKAGE const CXQualType clangExt_EnumDecl_getPromotionType(const EnumDecl* E);
CINDEX_LINKAGE const CXQualType clangExt_EnumDecl_getIntegerType(const EnumDecl* E);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_EnumDecl_getIntegerTypeSourceInfo(const EnumDecl* E);
CINDEX_LINKAGE CXSourceRange clangExt_EnumDecl_getIntegerTypeRange(const EnumDecl* E);
CINDEX_LINKAGE unsigned clangExt_EnumDecl_getNumPositiveBits(const EnumDecl* E);
CINDEX_LINKAGE unsigned clangExt_EnumDecl_getNumNegativeBits(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isScoped(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isScopedUsingClassTag(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isFixed(const EnumDecl* E);
CINDEX_LINKAGE unsigned clangExt_EnumDecl_getODRHash(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isComplete(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isClosed(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isClosedFlag(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_isClosedNonFlag(const EnumDecl* E);
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getTemplateInstantiationPattern(const EnumDecl* E);
CINDEX_LINKAGE const EnumDecl* clangExt_EnumDecl_getInstantiatedFromMemberEnum(const EnumDecl* E);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_EnumDecl_getTemplateSpecializationKind(const EnumDecl* E);
CINDEX_LINKAGE const MemberSpecializationInfo* clangExt_EnumDecl_getMemberSpecializationInfo(const EnumDecl* E);
CINDEX_LINKAGE bool clangExt_EnumDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_EnumDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE const RecordDecl* clangExt_RecordDecl_getPreviousDecl(const RecordDecl* R);
CINDEX_LINKAGE const RecordDecl* clangExt_RecordDecl_getMostRecentDecl(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasFlexibleArrayMember(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isAnonymousStructOrUnion(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasObjectMember(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasVolatileMember(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasLoadedFieldsFromExternalStorage(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isNonTrivialToPrimitiveDefaultInitialize(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isNonTrivialToPrimitiveCopy(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isNonTrivialToPrimitiveDestroy(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasNonTrivialToPrimitiveDestructCUnion(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_hasNonTrivialToPrimitiveCopyCUnion(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_canPassInRegisters(const RecordDecl* R);
CINDEX_LINKAGE RecordDecl::ArgPassingKind clangExt_RecordDecl_getArgPassingRestrictions(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isParamDestroyedInCallee(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isRandomized(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isInjectedClassName(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isLambda(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isCapturedRecord(const RecordDecl* R);
CINDEX_LINKAGE const RecordDecl* clangExt_RecordDecl_getDefinition(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_isOrContainsUnion(const RecordDecl* R);
CINDEX_LINKAGE unsigned clangExt_RecordDecl_getNumFields(const RecordDecl* R);
CINDEX_LINKAGE const FieldDecl* clangExt_RecordDecl_getField(const RecordDecl* R, unsigned i);
CINDEX_LINKAGE bool clangExt_RecordDecl_field_empty(const RecordDecl* R);
CINDEX_LINKAGE bool clangExt_RecordDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_RecordDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE bool clangExt_RecordDecl_isMsStruct(const RecordDecl* R, const ASTContext* C);
CINDEX_LINKAGE bool clangExt_RecordDecl_mayInsertExtraPadding(const RecordDecl* R, bool EmitRemark = false);
CINDEX_LINKAGE const FieldDecl* clangExt_RecordDecl_findFirstNamedDataMember(const RecordDecl* R);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_FileScopeAsmDecl_getAsmLoc(const FileScopeAsmDecl* A);
CINDEX_LINKAGE CXSourceLocation clangExt_FileScopeAsmDecl_getRParenLoc(const FileScopeAsmDecl* A);
CINDEX_LINKAGE CXSourceRange clangExt_FileScopeAsmDecl_getSourceRange(const FileScopeAsmDecl* A);
CINDEX_LINKAGE const StringLiteral* clangExt_FileScopeAsmDecl_getAsmString(const FileScopeAsmDecl* A);
CINDEX_LINKAGE bool clangExt_FileScopeAsmDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_FileScopeAsmDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_BlockDecl_getCaretLocation(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_isVariadic(const BlockDecl* B);
CINDEX_LINKAGE const CompoundStmt* clangExt_BlockDecl_getCompoundBody(const BlockDecl* B);
CINDEX_LINKAGE const Stmt* clangExt_BlockDecl_getBody(const BlockDecl* B);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_BlockDecl_getSignatureAsWritten(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_param_empty(const BlockDecl* B);
CINDEX_LINKAGE size_t clangExt_BlockDecl_param_size(const BlockDecl* B);
CINDEX_LINKAGE unsigned clangExt_BlockDecl_getNumParams(const BlockDecl* B);
CINDEX_LINKAGE const ParmVarDecl* clangExt_BlockDecl_getParamDecl(const BlockDecl* B, unsigned i);
CINDEX_LINKAGE bool clangExt_BlockDecl_hasCaptures(const BlockDecl* B);
CINDEX_LINKAGE unsigned clangExt_BlockDecl_getNumCaptures(const BlockDecl* B);
CINDEX_LINKAGE const BlockDecl::Capture* clangExt_BlockDecl_getCaptures(const BlockDecl* B, unsigned i);
CINDEX_LINKAGE bool clangExt_BlockDecl_capturesCXXThis(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_blockMissingReturnType(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_isConversionFromLambda(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_doesNotEscape(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_canAvoidCopyToHeap(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_capturesVariable(const BlockDecl* B, const VarDecl* var);
CINDEX_LINKAGE unsigned clangExt_BlockDecl_getBlockManglingNumber(const BlockDecl* B);
CINDEX_LINKAGE const Decl* clangExt_BlockDecl_getBlockManglingContextDecl(const BlockDecl* B);
CINDEX_LINKAGE CXSourceRange clangExt_BlockDecl_getSourceRange(const BlockDecl* B);
CINDEX_LINKAGE bool clangExt_BlockDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_BlockDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_BlockDecl_castToDeclContext(const BlockDecl* D);
CINDEX_LINKAGE const BlockDecl* clangExt_BlockDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE const VarDecl* clangExt_BlockDecl_Capture_getVariable(const BlockDecl::Capture* C);
CINDEX_LINKAGE bool clangExt_BlockDecl_Capture_isByRef(const BlockDecl::Capture* C);
CINDEX_LINKAGE bool clangExt_BlockDecl_Capture_isEscapingByref(const BlockDecl::Capture* C);
CINDEX_LINKAGE bool clangExt_BlockDecl_Capture_isNonEscapingByref(const BlockDecl::Capture* C);
CINDEX_LINKAGE bool clangExt_BlockDecl_Capture_isNested(const BlockDecl::Capture* C);
CINDEX_LINKAGE bool clangExt_BlockDecl_Capture_hasCopyExpr(const BlockDecl::Capture* C);
CINDEX_LINKAGE const Expr* clangExt_BlockDecl_Capture_getCopyExpr(const BlockDecl::Capture* C);
//=======================================================================================================================
CINDEX_LINKAGE const Stmt* clangExt_CapturedDecl_getBody(const CapturedDecl* C);
CINDEX_LINKAGE bool clangExt_CapturedDecl_isNothrow(const CapturedDecl* C);
CINDEX_LINKAGE unsigned clangExt_CapturedDecl_getNumParams(const CapturedDecl* C);
CINDEX_LINKAGE const ImplicitParamDecl* clangExt_CapturedDecl_getParam(const CapturedDecl* C, unsigned i);
CINDEX_LINKAGE const ImplicitParamDecl* clangExt_CapturedDecl_getContextParam(const CapturedDecl* C);
CINDEX_LINKAGE unsigned clangExt_CapturedDecl_getContextParamPosition(const CapturedDecl* C);
CINDEX_LINKAGE bool clangExt_CapturedDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_CapturedDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_CapturedDecl_castToDeclContext(const CapturedDecl* D);
CINDEX_LINKAGE const CapturedDecl* clangExt_CapturedDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE const Module* clangExt_ImportDecl_getImportedModule(const ImportDecl* D);
CINDEX_LINKAGE unsigned clangExt_ImportDecl_getNumIdentifierLocs(const ImportDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_ImportDecl_getIdentifierLocs(const ImportDecl* D, unsigned i);
CINDEX_LINKAGE CXSourceRange clangExt_ImportDecl_getSourceRange(const ImportDecl* D);
CINDEX_LINKAGE bool clangExt_ImportDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ImportDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_ExportDecl_getExportLoc(const ExportDecl* E);
CINDEX_LINKAGE CXSourceLocation clangExt_ExportDecl_getRBraceLoc(const ExportDecl* E);
CINDEX_LINKAGE bool clangExt_ExportDecl_hasBraces(const ExportDecl* E);
CINDEX_LINKAGE CXSourceLocation clangExt_ExportDecl_getEndLoc(const ExportDecl* E);
CINDEX_LINKAGE CXSourceRange clangExt_ExportDecl_getSourceRange(const ExportDecl* E);
CINDEX_LINKAGE bool clangExt_ExportDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_ExportDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_ExportDecl_castToDeclContext(const ExportDecl* D);
CINDEX_LINKAGE const ExportDecl* clangExt_ExportDecl_castFromDeclContext(const DeclContext* DC);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_EmptyDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_EmptyDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif