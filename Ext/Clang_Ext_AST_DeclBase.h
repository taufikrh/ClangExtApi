#ifndef LIB_CLANG_EXT_DECL_BASE_H
#define LIB_CLANG_EXT_DECL_BASE_H

#include <clang/AST/Decl.h>
#include <clang-c/Index.h>

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=================================================================================================================
CINDEX_LINKAGE int clangExt_Decl_Kind_getLastDecl();
CINDEX_LINKAGE CXString clangExt_Decl_Kind_getName(Decl::Kind K);
//
CINDEX_LINKAGE int clangExt_Decl_Kind_BaseUsing_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_BaseUsing_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_ObjCImpl_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_ObjCImpl_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_ObjCContainer_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_ObjCContainer_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_RedeclarableTemplate_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_RedeclarableTemplate_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Template_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Template_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_ClassTemplateSpecialization_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_ClassTemplateSpecialization_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_CXXRecord_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_CXXRecord_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Record_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Record_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Tag_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Tag_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_TypedefName_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_TypedefName_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Type_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Type_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_UsingShadow_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_UsingShadow_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Field_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Field_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_CXXMethod_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_CXXMethod_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Function_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Function_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_VarTemplateSpecialization_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_VarTemplateSpecialization_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Var_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Var_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Declarator_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Declarator_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Value_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Value_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Named_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Named_getLast();
CINDEX_LINKAGE int clangExt_Decl_Kind_Decl_getFirst();
CINDEX_LINKAGE int clangExt_Decl_Kind_Decl_getLast();
//=================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_Decl_getSourceRange(const Decl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_Decl_getBeginLoc(const Decl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_Decl_getEndLoc(const Decl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_Decl_getLocation(const Decl* D);
CINDEX_LINKAGE Decl::Kind clangExt_Decl_getKind(const Decl *D);
CINDEX_LINKAGE const char *clangExt_Decl_getDeclKindName(const Decl *D);
CINDEX_LINKAGE const Decl *clangExt_Decl_getNextDeclInContext(const Decl *D);
CINDEX_LINKAGE const DeclContext *clangExt_Decl_getDeclContext(const Decl *D);
CINDEX_LINKAGE const Decl *clangExt_Decl_getNonClosureContext(const Decl *D);
CINDEX_LINKAGE const TranslationUnitDecl *clangExt_Decl_getTranslationUnitDecl(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isInAnonymousNamespace(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isInStdNamespace(const Decl *D);
CINDEX_LINKAGE const ASTContext* clangExt_Decl_getASTContext(const Decl* D);
CINDEX_LINKAGE const LangOptions* clangExt_Decl_getLangOpts(const Decl* D);
CINDEX_LINKAGE AccessSpecifier clangExt_Decl_getAccess(const Decl* D);
CINDEX_LINKAGE AccessSpecifier clangExt_Decl_getAccessUnsafe(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_hasAttrs(const Decl *D);
CINDEX_LINKAGE const Attr *clangExt_Decl_getAttr(const Decl *D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_Decl_getAttrCount(const Decl *D);
CINDEX_LINKAGE unsigned clangExt_Decl_getMaxAlignment(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isInvalidDecl(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isImplicit(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isUsed(const Decl* D, bool CheckUsedAttr = true);
CINDEX_LINKAGE bool clangExt_Decl_isReferenced(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isThisDeclarationReferenced(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isTopLevelDeclInObjCContainer(const Decl* D);
CINDEX_LINKAGE const ExternalSourceSymbolAttr* clangExt_Decl_getExternalSourceSymbolAttr(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isModulePrivate(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isInExportDeclContext(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_hasDefiningAttr(const Decl *D);
CINDEX_LINKAGE const Attr *clangExt_Decl_getDefiningAttr(const Decl *D);
CINDEX_LINKAGE bool clangExt_Decl_isWeakImported(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isFromASTFile(const Decl *D);
CINDEX_LINKAGE unsigned clangExt_Decl_getGlobalID(const Decl* D);
CINDEX_LINKAGE unsigned clangExt_Decl_getOwningModuleID(const Decl* D);
CINDEX_LINKAGE const Module* clangExt_Decl_getImportedOwningModule(const Decl* D);
CINDEX_LINKAGE const Module* clangExt_Decl_getLocalOwningModule(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_hasOwningModule(const Decl* D);
CINDEX_LINKAGE const Module* clangExt_Decl_getOwningModule(const Decl* D);
CINDEX_LINKAGE const Module* clangExt_Decl_getOwningModuleForLinkage(const Decl* D, bool IgnoreLinkage = false);
CINDEX_LINKAGE bool clangExt_Decl_isUnconditionallyVisible(const Decl* D);
CINDEX_LINKAGE Decl::ModuleOwnershipKind clangExt_Decl_getModuleOwnershipKind(const Decl* D);
CINDEX_LINKAGE unsigned clangExt_Decl_getIdentifierNamespace(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isInIdentifierNamespace(const Decl* D, unsigned NS);
CINDEX_LINKAGE unsigned clangExt_Decl_getIdentifierNamespaceForKind(Decl::Kind DK); // static
CINDEX_LINKAGE bool clangExt_Decl_hasTagIdentifierNamespace(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isTagIdentifierNamespace(unsigned NS); // static
CINDEX_LINKAGE const DeclContext *clangExt_Decl_getLexicalDeclContext(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isOutOfLine(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isTemplated(const Decl* D);
CINDEX_LINKAGE unsigned clangExt_Decl_getTemplateDepth(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isDefinedOutsideFunctionOrMethod(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isInLocalScopeForInstantiation(const Decl* D);
CINDEX_LINKAGE const DeclContext *clangExt_Decl_getParentFunctionOrMethod(const Decl *D);
CINDEX_LINKAGE const Decl *clangExt_Decl_getCanonicalDecl(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isCanonicalDecl(const Decl* D);
CINDEX_LINKAGE unsigned clangExt_Decl_getNumRedecls(const Decl* D);
CINDEX_LINKAGE const Decl* clangExt_Decl_getRedecls(const Decl* D, unsigned i);
CINDEX_LINKAGE const Decl* clangExt_Decl_getPreviousDecl(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isFirstDecl(const Decl* D);
CINDEX_LINKAGE const Decl* clangExt_Decl_getMostRecentDecl(const Decl* D);
CINDEX_LINKAGE const Stmt *clangExt_Decl_getBody(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_hasBody(const Decl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_Decl_getBodyRBrace(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isTemplateParameter(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isTemplateParameterPack(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isParameterPack(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isTemplateDecl(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isFunctionOrFunctionTemplate(const Decl* D);
CINDEX_LINKAGE const TemplateDecl* clangExt_Decl_getDescribedTemplate(const Decl* D);
CINDEX_LINKAGE const TemplateParameterList* clangExt_Decl_getDescribedTemplateParams(const Decl* D);
CINDEX_LINKAGE const FunctionDecl* clangExt_Decl_getAsFunction(const Decl* D);
CINDEX_LINKAGE bool clangExt_Decl_isLocalExternDecl(const Decl* D);
CINDEX_LINKAGE Decl::FriendObjectKind clangExt_Decl_getFriendObjectKind(const Decl* D);
CINDEX_LINKAGE const DeclContext* clangExt_Decl_castToDeclContext(const Decl* D);
CINDEX_LINKAGE const Decl* clangExt_Decl_castFromDeclContext(const DeclContext* D);
CINDEX_LINKAGE int64_t clangExt_Decl_getID(const Decl* D);
CINDEX_LINKAGE const FunctionType* clangExt_Decl_getFunctionType(const Decl* D, bool BlocksToo = true);
CINDEX_LINKAGE bool clangExt_Decl_declaresSameEntity(const Decl* D1, const Decl* D2);
CINDEX_LINKAGE void clangExt_Decl_dumpToFile(const Decl* D, const char* fileName, bool Deserialize = false, enum ASTDumpOutputFormat OutputFormat = ASTDumpOutputFormat::ADOF_Default);
CINDEX_LINKAGE CXString clangExt_Decl_dumpToString(const Decl* D, bool Deserialize = false, enum ASTDumpOutputFormat OutputFormat = ASTDumpOutputFormat::ADOF_Default);
//=================================================================================================================
CINDEX_LINKAGE Decl::Kind clangExt_DeclContext_getDeclKind(const DeclContext* D);
CINDEX_LINKAGE const char* clangExt_DeclContext_getDeclKindName(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getParent(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getLexicalParent(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getLookupParent(const DeclContext* D);
CINDEX_LINKAGE const ASTContext* clangExt_DeclContext_getParentASTContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isClosure(const DeclContext* D);
CINDEX_LINKAGE const BlockDecl* clangExt_DeclContext_getInnermostBlockDecl(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isObjCContainer(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isFunctionOrMethod(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isLookupContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isFileContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isTranslationUnit(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isRecord(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isNamespace(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isStdNamespace(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isInlineNamespace(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isDependentContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isTransparentContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isExternCContext(const DeclContext* D);
CINDEX_LINKAGE const LinkageSpecDecl* clangExt_DeclContext_getExternCContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_isExternCXXContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_Equals(const DeclContext* D, const DeclContext* DC);
CINDEX_LINKAGE bool clangExt_DeclContext_Encloses(const DeclContext* D, const DeclContext* DC);
CINDEX_LINKAGE const Decl* clangExt_DeclContext_getNonClosureAncestor(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getNonTransparentContext(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getPrimaryContext(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getRedeclContext(const DeclContext* D);
CINDEX_LINKAGE const DeclContext* clangExt_DeclContext_getEnclosingNamespaceContext(const DeclContext* D);
CINDEX_LINKAGE const RecordDecl* clangExt_DeclContext_getOuterLexicalRecordContext(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_InEnclosingNamespaceSetOf(const DeclContext* D, const DeclContext* NS);
CINDEX_LINKAGE unsigned clangExt_DeclContext_getNumDecls(const DeclContext* D);
CINDEX_LINKAGE const Decl* clangExt_DeclContext_getDecls(const DeclContext* D, unsigned i);
CINDEX_LINKAGE bool clangExt_DeclContext_decls_empty(const DeclContext* D);
CINDEX_LINKAGE bool clangExt_DeclContext_containsDecl(const DeclContext* D, const Decl* decl);
CINDEX_LINKAGE bool clangExt_DeclContext_classof(const Decl* D);
//=================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif