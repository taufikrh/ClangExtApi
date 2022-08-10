#include <llvm/Support/FileSystem.h>
#include "Clang_Ext_AST_DeclBase.h"
#include "CXSourceLocation.h"
#include "CXString.h"

using namespace clang;

int clangExt_Decl_Kind_getLastDecl() {
    return Decl::Kind::lastDecl;
}
CXString clangExt_Decl_Kind_getName(Decl::Kind K) {
    const char* s = nullptr;
#define TDECLKIND(X) case Decl::Kind::##X: s = ""  #X  ""; break

    switch (K) {
#define DECL(DERIVED, BASE) TDECLKIND(DERIVED);
#define ABSTRACT_DECL(DECL)
#include "clang/AST/DeclNodes.inc"
    }
#undef TDECLKIND

    return cxstring::createRef(s);
}
int clangExt_Decl_Kind_BaseUsing_getFirst() {
    return Decl::Kind::firstBaseUsing;
}
int clangExt_Decl_Kind_BaseUsing_getLast() {
    return Decl::Kind::lastBaseUsing;
}
int clangExt_Decl_Kind_ObjCImpl_getFirst() {
    return Decl::Kind::firstObjCImpl;
}
int clangExt_Decl_Kind_ObjCImpl_getLast() {
    return Decl::Kind::lastObjCImpl;
}
int clangExt_Decl_Kind_ObjCContainer_getFirst() {
    return Decl::Kind::firstObjCContainer;
}
int clangExt_Decl_Kind_ObjCContainer_getLast() {
    return Decl::Kind::lastObjCContainer;
}
int clangExt_Decl_Kind_RedeclarableTemplate_getFirst() {
    return Decl::Kind::firstRedeclarableTemplate;
}
int clangExt_Decl_Kind_RedeclarableTemplate_getLast() {
    return Decl::Kind::lastRedeclarableTemplate;
}
int clangExt_Decl_Kind_Template_getFirst() {
    return Decl::Kind::firstTemplate;
}
int clangExt_Decl_Kind_Template_getLast() {
    return Decl::Kind::lastTemplate;
}
int clangExt_Decl_Kind_ClassTemplateSpecialization_getFirst() {
    return Decl::Kind::firstClassTemplateSpecialization;
}
int clangExt_Decl_Kind_ClassTemplateSpecialization_getLast() {
    return Decl::Kind::lastClassTemplateSpecialization;
}
int clangExt_Decl_Kind_CXXRecord_getFirst() {
    return Decl::Kind::firstCXXRecord;
}
int clangExt_Decl_Kind_CXXRecord_getLast() {
    return Decl::Kind::lastCXXRecord;
}
int clangExt_Decl_Kind_Record_getFirst() {
    return Decl::Kind::firstRecord;
}
int clangExt_Decl_Kind_Record_getLast() {
    return Decl::Kind::lastRecord;
}
int clangExt_Decl_Kind_Tag_getFirst() {
    return Decl::Kind::firstTag;
}
int clangExt_Decl_Kind_Tag_getLast() {
    return Decl::Kind::lastTag;
}
int clangExt_Decl_Kind_TypedefName_getFirst() {
    return Decl::Kind::firstTypedefName;
}
int clangExt_Decl_Kind_TypedefName_getLast() {
    return Decl::Kind::lastTypedefName;
}
int clangExt_Decl_Kind_Type_getFirst() {
    return Decl::Kind::firstType;
}
int clangExt_Decl_Kind_Type_getLast() {
    return Decl::Kind::lastType;
}
int clangExt_Decl_Kind_UsingShadow_getFirst() {
    return Decl::Kind::firstUsingShadow;
}
int clangExt_Decl_Kind_UsingShadow_getLast() {
    return Decl::Kind::lastUsingShadow;
}
int clangExt_Decl_Kind_Field_getFirst() {
    return Decl::Kind::firstField;
}
int clangExt_Decl_Kind_Field_getLast() {
    return Decl::Kind::lastField;
}
int clangExt_Decl_Kind_CXXMethod_getFirst() {
    return Decl::Kind::firstCXXMethod;
}
int clangExt_Decl_Kind_CXXMethod_getLast() {
    return Decl::Kind::lastCXXMethod;
}
int clangExt_Decl_Kind_Function_getFirst() {
    return Decl::Kind::firstFunction;
}
int clangExt_Decl_Kind_Function_getLast() {
    return Decl::Kind::lastFunction;
}
int clangExt_Decl_Kind_VarTemplateSpecialization_getFirst() {
    return Decl::Kind::firstVarTemplateSpecialization;
}
int clangExt_Decl_Kind_VarTemplateSpecialization_getLast() {
    return Decl::Kind::lastVarTemplateSpecialization;
}
int clangExt_Decl_Kind_Var_getFirst() {
    return Decl::Kind::firstVar;
}
int clangExt_Decl_Kind_Var_getLast() {
    return Decl::Kind::lastVar;
}
int clangExt_Decl_Kind_Declarator_getFirst() {
    return Decl::Kind::firstDeclarator;
}
int clangExt_Decl_Kind_Declarator_getLast() {
    return Decl::Kind::lastDeclarator;
}
int clangExt_Decl_Kind_Value_getFirst() {
    return Decl::Kind::firstValue;
}
int clangExt_Decl_Kind_Value_getLast() {
    return Decl::Kind::lastValue;
}
int clangExt_Decl_Kind_Named_getFirst() {
    return Decl::Kind::firstNamed;
}
int clangExt_Decl_Kind_Named_getLast() {
    return Decl::Kind::lastNamed;
}
int clangExt_Decl_Kind_Decl_getFirst() {
    return Decl::Kind::firstDecl;
}
int clangExt_Decl_Kind_Decl_getLast() {
    return Decl::Kind::lastDecl;
}
//-----------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------
CXSourceRange clangExt_Decl_getSourceRange(const Decl* D) {
    return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
CXSourceLocation clangExt_Decl_getBeginLoc(const Decl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getBeginLoc());
}
CXSourceLocation clangExt_Decl_getEndLoc(const Decl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getEndLoc());
}
CXSourceLocation clangExt_Decl_getLocation(const Decl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getLocation());
}
Decl::Kind clangExt_Decl_getKind(const Decl *D) { 
    return D->getKind();
}
const char* clangExt_Decl_getDeclKindName(const Decl* D) {
    return D->getDeclKindName();
}
const Decl* clangExt_Decl_getNextDeclInContext(const Decl* D) {
    return D->getNextDeclInContext();
}
const DeclContext* clangExt_Decl_getDeclContext(const Decl* D) {
    return D->getDeclContext();
}
const Decl* clangExt_Decl_getNonClosureContext(const Decl* D) {
    return D->getNonClosureContext();
}
const TranslationUnitDecl *clangExt_Decl_getTranslationUnitDecl(const Decl *D) {
    return D->getTranslationUnitDecl();
}
bool clangExt_Decl_isInAnonymousNamespace(const Decl* D) {
    return D->isInAnonymousNamespace();
}
const ASTContext* clangExt_Decl_getASTContext(const Decl* D) {
    return &D->getASTContext();
}
const LangOptions* clangExt_Decl_getLangOpts(const Decl* D) {
    return &D->getLangOpts();
}
bool clangExt_Decl_isInStdNamespace(const Decl* D) {
    return D->isInStdNamespace();
}
AccessSpecifier clangExt_Decl_getAccess(const Decl* D) {
    return D->getAccess();
}
AccessSpecifier clangExt_Decl_getAccessUnsafe(const Decl* D) {
    return D->getAccessUnsafe();
}
bool clangExt_Decl_hasAttrs(const Decl* D) {
    return D->hasAttrs();
}
const Attr *clangExt_Decl_getAttr(const Decl *D, unsigned i) {
    SmallVector<Attr *, 4> attrs = D->getAttrs();

    if (i < attrs.size())
        return attrs[i];
    else
        return nullptr;
}
unsigned clangExt_Decl_getAttrCount(const Decl* D) {
    return D->getAttrs().size();
}
unsigned clangExt_Decl_getMaxAlignment(const Decl* D) {
    return D->getMaxAlignment();
}
bool clangExt_Decl_isInvalidDecl(const Decl* D) {
    return D->isInvalidDecl();
}
bool clangExt_Decl_isImplicit(const Decl* D) {
    return D->isImplicit();
}
bool clangExt_Decl_isUsed(const Decl *D, bool CheckUsedAttr) {
    return D->isUsed(CheckUsedAttr);
}
bool clangExt_Decl_isReferenced(const Decl* D) {
    return D->isReferenced();
}
bool clangExt_Decl_isThisDeclarationReferenced(const Decl* D) {
    return D->isThisDeclarationReferenced();
}
bool clangExt_Decl_isTopLevelDeclInObjCContainer(const Decl* D) {
    return D->isTopLevelDeclInObjCContainer();
}
const ExternalSourceSymbolAttr* clangExt_Decl_getExternalSourceSymbolAttr(const Decl* D) {
    return D->getExternalSourceSymbolAttr();
}
bool clangExt_Decl_isModulePrivate(const Decl* D) {
    return D->isModulePrivate();
}
bool clangExt_Decl_isInExportDeclContext(const Decl *D) {
    return D->isInExportDeclContext();
}
bool clangExt_Decl_hasDefiningAttr(const Decl *D) {
    return D->hasDefiningAttr();
}
const Attr* clangExt_Decl_getDefiningAttr(const Decl* D) {
    return D->getDefiningAttr();
}
bool clangExt_Decl_isWeakImported(const Decl* D) {
    return D->isWeakImported();
}
bool clangExt_Decl_isFromASTFile(const Decl* D) {
    return D->isFromASTFile();
}
unsigned clangExt_Decl_getGlobalID(const Decl* D) {
    return D->getGlobalID();
}
unsigned clangExt_Decl_getOwningModuleID(const Decl* D) {
    return D->getOwningModuleID();
}
const Module* clangExt_Decl_getImportedOwningModule(const Decl* D) {
    return D->getImportedOwningModule();
}
const Module* clangExt_Decl_getLocalOwningModule(const Decl* D) {
    return D->getLocalOwningModule();
}
bool clangExt_Decl_hasOwningModule(const Decl* D) {
    return D->hasOwningModule();
}
const Module* clangExt_Decl_getOwningModule(const Decl* D) {
    return D->getOwningModule();
}
const Module* clangExt_Decl_getOwningModuleForLinkage(const Decl* D, bool IgnoreLinkage) {
    return D->getOwningModuleForLinkage(IgnoreLinkage);
}
bool clangExt_Decl_isUnconditionallyVisible(const Decl* D) {
    return D->isUnconditionallyVisible();
}
Decl::ModuleOwnershipKind clangExt_Decl_getModuleOwnershipKind(const Decl* D) {
    return D->getModuleOwnershipKind();
}
unsigned clangExt_Decl_getIdentifierNamespace(const Decl* D) {
    return D->getIdentifierNamespace();
}
bool clangExt_Decl_isInIdentifierNamespace(const Decl* D, unsigned NS) {
    return D->isInIdentifierNamespace(NS);
}
unsigned clangExt_Decl_getIdentifierNamespaceForKind(Decl::Kind DK) {
    return Decl::getIdentifierNamespaceForKind(DK);
}
bool clangExt_Decl_hasTagIdentifierNamespace(const Decl* D) {
    return D->hasTagIdentifierNamespace();
}
bool clangExt_Decl_isTagIdentifierNamespace(unsigned NS) {
    return Decl::isTagIdentifierNamespace(NS);
}
const DeclContext* clangExt_Decl_getLexicalDeclContext(const Decl* D) {
  return D->getLexicalDeclContext();
}
bool clangExt_Decl_isOutOfLine(const Decl* D) {
    return D->isOutOfLine();
}
bool clangExt_Decl_isTemplated(const Decl* D) {
    return D->isTemplated();
}
unsigned clangExt_Decl_getTemplateDepth(const Decl* D) {
    return D->getTemplateDepth();
}
bool clangExt_Decl_isDefinedOutsideFunctionOrMethod(const Decl* D) {
    return D->isDefinedOutsideFunctionOrMethod();
}
bool clangExt_Decl_isInLocalScopeForInstantiation(const Decl* D) {
    return D->isInLocalScopeForInstantiation();
}
const DeclContext* clangExt_Decl_getParentFunctionOrMethod(const Decl* D) {
    return D->getParentFunctionOrMethod();
}
const Decl* clangExt_Decl_getCanonicalDecl(const Decl* D) {
    return D->getCanonicalDecl();
}
bool clangExt_Decl_isCanonicalDecl(const Decl* D) {
    return D->isCanonicalDecl();
}
unsigned clangExt_Decl_getNumRedecls(const Decl* D) {
    SmallVector<const Decl*, 4> redecls = { D->redecls_begin(), D->redecls_end() };
    return redecls.size();
}
const Decl* clangExt_Decl_getRedecls(const Decl* D, unsigned i) {
    SmallVector<const Decl*, 4> redecls = { D->redecls_begin(), D->redecls_end() };
    if (i < redecls.size())
        return redecls[i];
    else
        return nullptr;
}
const Decl* clangExt_Decl_getPreviousDecl(const Decl* D) {
    return D->getPreviousDecl();
}
bool clangExt_Decl_isFirstDecl(const Decl* D) {
    return D->isFirstDecl();
}
const Decl* clangExt_Decl_getMostRecentDecl(const Decl* D) {
    return D->getMostRecentDecl();
}
const Stmt *clangExt_Decl_getBody(const Decl* D) {
    return D->getBody();
}
bool clangExt_Decl_hasBody(const Decl* D) {
    return D->hasBody();
}
CXSourceLocation clangExt_Decl_getBodyRBrace(const Decl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getBodyRBrace());
}
bool clangExt_Decl_isTemplateParameter(const Decl* D) {
    return D->isTemplateParameter();
}
bool clangExt_Decl_isTemplateParameterPack(const Decl* D) {
    return D->isTemplateParameterPack();
}
bool clangExt_Decl_isParameterPack(const Decl* D) {
    return D->isParameterPack();
}
bool clangExt_Decl_isTemplateDecl(const Decl* D) {
    return D->isTemplateDecl();
}
bool clangExt_Decl_isFunctionOrFunctionTemplate(const Decl* D) {
    return D->isFunctionOrFunctionTemplate();
}
const TemplateDecl* clangExt_Decl_getDescribedTemplate(const Decl* D) {
    return D->getDescribedTemplate();
}
const TemplateParameterList* clangExt_Decl_getDescribedTemplateParams(const Decl* D) {
    return D->getDescribedTemplateParams();
}
const FunctionDecl* clangExt_Decl_getAsFunction(const Decl* D) {
    return D->getAsFunction();
}
bool clangExt_Decl_isLocalExternDecl(Decl* D) {
    return D->isLocalExternDecl();
}
Decl::FriendObjectKind clangExt_Decl_getFriendObjectKind(const Decl* D) {
    return D->getFriendObjectKind();
}
const DeclContext* clangExt_Decl_castToDeclContext(const Decl* D) {
    return Decl::castToDeclContext(D);
}
const Decl* clangExt_Decl_castFromDeclContext(const DeclContext* D) {
    return Decl::castFromDeclContext(D);
}
int64_t clangExt_Decl_getID(const Decl* D) {
    return D->getID();
}
const FunctionType* clangExt_Decl_getFunctionType(const Decl* D, bool BlocksToo) {
    return D->getFunctionType(BlocksToo);
}
bool clangExt_Decl_declaresSameEntity(const Decl* D1, const Decl* D2) {
    return declaresSameEntity(D1, D2);
}
void clangExt_Decl_dumpToFile(const Decl* D, const char* fileName, bool Deserialize, enum ASTDumpOutputFormat OutputFormat) {

    std::error_code EC;
    std::string infoFile = std::string(fileName);
    llvm::raw_fd_ostream infoOut(infoFile, EC, llvm::sys::fs::OF_Text);
    D->dump(infoOut, Deserialize, OutputFormat);
}
CXString clangExt_Decl_dumpToString(const Decl* D, bool Deserialize, enum ASTDumpOutputFormat OutputFormat) {
    std::string infoFile;
    llvm::raw_string_ostream infoOut(infoFile);
    D->dump(infoOut, Deserialize, OutputFormat);
    return cxstring::createDup(infoFile.c_str());
}
//-----------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------
Decl::Kind clangExt_DeclContext_getDeclKind(const DeclContext* D) {
    return D->getDeclKind();
}
const char* clangExt_DeclContext_getDeclKindName(const DeclContext* D) {
    return D->getDeclKindName();
}
const DeclContext* clangExt_DeclContext_getParent(const DeclContext* D) {
    return D->getParent();
}
const DeclContext* clangExt_DeclContext_getLexicalParent(const DeclContext* D) {
    return D->getLexicalParent();
}
const DeclContext* clangExt_DeclContext_getLookupParent(const DeclContext* D) {
    return D->getLookupParent();
}
const ASTContext* clangExt_DeclContext_getParentASTContext(const DeclContext* D) {
    //const ASTContext& Context = D->getParentASTContext();
    //return static_cast<const ASTContext*>(&Context);
    return const_cast<const ASTContext*>(&D->getParentASTContext());
}
bool clangExt_DeclContext_isClosure(const DeclContext* D) {
    return D->isClosure();
}
const BlockDecl* clangExt_DeclContext_getInnermostBlockDecl(const DeclContext* D) {
    return D->getInnermostBlockDecl();
}
bool clangExt_DeclContext_isObjCContainer(const DeclContext* D) {
    return D->isObjCContainer();
}
bool clangExt_DeclContext_isFunctionOrMethod(const DeclContext* D) {
    return D->isFunctionOrMethod();
}
bool clangExt_DeclContext_isLookupContext(const DeclContext* D) {
    return D->isLookupContext();
}
bool clangExt_DeclContext_isFileContext(const DeclContext* D) {
    return D->isFileContext();
}
bool clangExt_DeclContext_isTranslationUnit(const DeclContext* D) {
    return D->isTranslationUnit();
}
bool clangExt_DeclContext_isRecord(const DeclContext* D) {
    return D->isRecord();
}
bool clangExt_DeclContext_isNamespace(const DeclContext* D) {
    return D->isNamespace();
}
bool clangExt_DeclContext_isStdNamespace(const DeclContext* D) {
    return D->isStdNamespace();
}
bool clangExt_DeclContext_isInlineNamespace(const DeclContext* D) {
    return D->isInlineNamespace();
}
bool clangExt_DeclContext_isDependentContext(const DeclContext* D) {
    return D->isDependentContext();
}
bool clangExt_DeclContext_isTransparentContext(const DeclContext* D) {
    return D->isTransparentContext();
}
bool clangExt_DeclContext_isExternCContext(const DeclContext* D) {
    return D->isExternCContext();
}
const LinkageSpecDecl* clangExt_DeclContext_getExternCContext(const DeclContext* D) {
    return D->getExternCContext();
}
bool clangExt_DeclContext_isExternCXXContext(const DeclContext* D) {
    return D->isExternCXXContext();
}
bool clangExt_DeclContext_Equals(const DeclContext* D, const DeclContext* DC) {
    return D->Equals(DC);
}
bool clangExt_DeclContext_Encloses(const DeclContext* D, const DeclContext* DC) {
    return D->Encloses(DC);
}
const Decl* clangExt_DeclContext_getNonClosureAncestor(const DeclContext* D) {
    return D->getNonClosureAncestor();
}
const DeclContext* clangExt_DeclContext_getNonTransparentContext(const DeclContext* D) {
    return D->getNonTransparentContext();
}
const DeclContext* clangExt_DeclContext_getPrimaryContext(const DeclContext* D) {
    return D->getPrimaryContext();
}
const DeclContext* clangExt_DeclContext_getRedeclContext(const DeclContext* D) {
    return D->getRedeclContext();
}
const DeclContext* clangExt_DeclContext_getEnclosingNamespaceContext(const DeclContext* D) {
    return D->getEnclosingNamespaceContext();
}
const RecordDecl* clangExt_DeclContext_getOuterLexicalRecordContext(const DeclContext* D) {
    return D->getOuterLexicalRecordContext();
}
bool clangExt_DeclContext_InEnclosingNamespaceSetOf(const DeclContext* D, const DeclContext* NS) {
    return D->InEnclosingNamespaceSetOf(NS);
}
unsigned clangExt_DeclContext_getNumDecls(const DeclContext* D) {
    SmallVector<const Decl*, 4> decls = { D->decls_begin(), D->decls_end() };
    return decls.size();
}
const Decl* clangExt_DeclContext_getDecls(const DeclContext* D, unsigned i) {
    SmallVector<const Decl*, 4> decls = { D->decls_begin(), D->decls_end() };
    if (i < decls.size())
        return decls[i];
    else
        return nullptr;
}
bool clangExt_DeclContext_decls_empty(const DeclContext* D) {
    return D->decls_empty();
}
bool clangExt_DeclContext_containsDecl(const DeclContext* D, const Decl* decl) {
    return D->containsDecl(const_cast<Decl*>(decl));
}
bool clangExt_DeclContext_classof(const Decl* D) {
    return DeclContext::classof(D);
}