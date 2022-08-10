unit LibClang.Ext.AST.DeclBaseU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.AST.AttrH,   
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.DeclBaseH,    
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.ModuleU,
  LibClang.Ext.AST.TypeH
  ;

function clangExt_Cursor_getDeclKind(C: CXCursor): CX_DeclKind; cdecl; external LibClang_dll;

{$region 'CX_DeclKind'}
function clangExt_Decl_Kind_getLastDecl(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_getName(K: CX_DeclKind): CXString; cdecl; external LibClang_dll;
//

//
function clangExt_Decl_Kind_BaseUsing_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_BaseUsing_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ObjCImpl_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ObjCImpl_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ObjCContainer_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ObjCContainer_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_RedeclarableTemplate_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_RedeclarableTemplate_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Template_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Template_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ClassTemplateSpecialization_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_ClassTemplateSpecialization_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_CXXRecord_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_CXXRecord_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Record_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Record_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Tag_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Tag_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_TypedefName_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_TypedefName_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Type_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Type_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_UsingShadow_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_UsingShadow_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Field_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Field_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_CXXMethod_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_CXXMethod_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Function_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Function_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_VarTemplateSpecialization_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_VarTemplateSpecialization_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Var_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Var_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Declarator_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Declarator_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Value_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Value_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Named_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Named_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Decl_getFirst(): Integer; cdecl; external LibClang_dll;
function clangExt_Decl_Kind_Decl_getLast(): Integer; cdecl; external LibClang_dll;
{$endregion 'CX_DeclKind'}

{$region 'DeclBase'}
function clangExt_Decl_getSourceRange(const D: Decl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_Decl_getBeginLoc(const D: Decl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Decl_getEndLoc(const D: Decl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Decl_getLocation(const D: Decl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Decl_getKind(const D: Decl): CX_DeclKind; cdecl; external LibClang_dll;
function clangExt_Decl_getDeclKindName(const D: Decl): PChar {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getNextDeclInContext(const D: Decl): PChar {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getDeclContext(const D: Decl): DeclContext {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getNonClosureContext(const D: Decl): Decl {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getTranslationUnitDecl(const D: Decl): TranslationUnitDecl {const}; cdecl; external LibClang_dll;
function clangExt_Decl_isInAnonymousNamespace(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isInStdNamespace(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getASTContext(const D: Decl): ASTContext; cdecl; external LibClang_dll;
function clangExt_Decl_getLangOpts(const D: Decl): LangOptions; cdecl; external LibClang_dll;
function clangExt_Decl_getAccess(const D: Decl): AccessSpecifier; cdecl; external LibClang_dll;
function clangExt_Decl_getAccessUnsafe(const D: Decl): AccessSpecifier; cdecl; external LibClang_dll;
function clangExt_Decl_hasAttrs(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getAttr(const D: Decl; i: Cardinal): Attr {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getAttrCount(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_getMaxAlignment(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_isInvalidDecl(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isImplicit(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isUsed(const D: Decl; CheckUsedAttr: Boolean = True): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isReferenced(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isThisDeclarationReferenced(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isTopLevelDeclInObjCContainer(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getExternalSourceSymbolAttr(const D: Decl): ExternalSourceSymbolAttr; cdecl; external LibClang_dll;
function clangExt_Decl_isModulePrivate(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isInExportDeclContext(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_hasDefiningAttr(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getDefiningAttr(const D: Decl): Attr; cdecl; external LibClang_dll;
function clangExt_Decl_isWeakImported(const D: Decl): Attr; cdecl; external LibClang_dll;
function clangExt_Decl_isFromASTFile(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getGlobalID(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_getOwningModuleID(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_getImportedOwningModule(const D: Decl): Module; cdecl; external LibClang_dll;
function clangExt_Decl_getLocalOwningModule(const D: Decl): Module; cdecl; external LibClang_dll;
function clangExt_Decl_hasOwningModule(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getOwningModule(const D: Decl): Module; cdecl; external LibClang_dll;
function clangExt_Decl_getOwningModuleForLinkage(const D: Decl; IgnoreLinkage: Boolean = False): Module; cdecl; external LibClang_dll;
function clangExt_Decl_isUnconditionallyVisible(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getModuleOwnershipKind(const D: Decl): CX_Decl_ModuleOwnershipKind; cdecl; external LibClang_dll;
function clangExt_Decl_getIdentifierNamespace(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_isInIdentifierNamespace(const D: Decl; NS: Cardinal): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getIdentifierNamespaceForKind(DK: CX_DeclKind): Cardinal; cdecl; external LibClang_dll; // static
function clangExt_Decl_hasTagIdentifierNamespace(const D: Decl): Boolean; cdecl; external LibClang_dll;    
function clangExt_Decl_isTagIdentifierNamespace(NS: Cardinal): Boolean; cdecl; external LibClang_dll; // static
function clangExt_Decl_getLexicalDeclContext(const D: Decl): DeclContext; cdecl; external LibClang_dll;
function clangExt_Decl_isOutOfLine(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isTemplated(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getTemplateDepth(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_isDefinedOutsideFunctionOrMethod(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isInLocalScopeForInstantiation(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getParentFunctionOrMethod(const D: Decl): DeclContext {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getCanonicalDecl(const D: Decl): Decl {const}; cdecl; external LibClang_dll;
function clangExt_Decl_isCanonicalDecl(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getNumRedecls(const D: Decl): Cardinal; cdecl; external LibClang_dll;
function clangExt_Decl_getRedecls(const D: Decl; i: Cardinal): Decl; cdecl; external LibClang_dll;
function clangExt_Decl_getPreviousDecl(const D: Decl): Decl {const}; cdecl; external LibClang_dll;
function clangExt_Decl_isFirstDecl(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getMostRecentDecl(const D: Decl): Decl {const}; cdecl; external LibClang_dll;
function clangExt_Decl_getBody(const D: Decl): Stmt {const}; cdecl; external LibClang_dll;
function clangExt_Decl_hasBody(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getBodyRBrace(const D: Decl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Decl_isTemplateParameter(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isTemplateParameterPack(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isParameterPack(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isTemplateDecl(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_isFunctionOrFunctionTemplate(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getDescribedTemplate(const D: Decl): TemplateDecl; cdecl; external LibClang_dll;
function clangExt_Decl_getDescribedTemplateParams(const D: Decl): TemplateParameterList; cdecl; external LibClang_dll;
function clangExt_Decl_getAsFunction(const D: Decl): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_Decl_isLocalExternDecl(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_Decl_getFriendObjectKind(const D: Decl): CX_Decl_FriendObjectKind; cdecl; external LibClang_dll;
function clangExt_Decl_castToDeclContext(const D: Decl): DeclContext; cdecl; external LibClang_dll;
function clangExt_Decl_getID(const D: Decl): Int64; cdecl; external LibClang_dll;
function clangExt_Decl_getFunctionType(const D: Decl; BlocksToo: Boolean = True): FunctionType; cdecl; external LibClang_dll;
function clangExt_Decl_declaresSameEntity(const D1: Decl; const D2: Decl): Boolean; cdecl; external LibClang_dll;
procedure clangExt_Decl_dumpToFile(const D: Decl; const fileName: PChar; Deserialize: Boolean = False; OutputFormat: ASTDumpOutputFormat = ADOF_Default); cdecl; external LibClang_dll;
function clangExt_Decl_dumpToString(const D: Decl; Deserialize: Boolean = False; OutputFormat: ASTDumpOutputFormat = ADOF_Default): CXString; cdecl; external LibClang_dll;
//
function clangExt_Decl_castFromDeclContext(const D: DeclContext): Decl; cdecl; external LibClang_dll;
{$endregion 'DeclBase'}

{$region 'DeclContext'}

function clangExt_DeclContext_getDeclKind(const D: DeclContext): CX_DeclKind; cdecl; external LibClang_dll;
function clangExt_DeclContext_getDeclKindName(const D: DeclContext): PChar; cdecl; external LibClang_dll;
function clangExt_DeclContext_getParent(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getLexicalParent(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getLookupParent(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getParentASTContext(const D: DeclContext): ASTContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_isClosure(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_getInnermostBlockDecl(const D: DeclContext): BlockDecl; cdecl; external LibClang_dll;
function clangExt_DeclContext_isObjCContainer(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isFunctionOrMethod(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isLookupContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isFileContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isTranslationUnit(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isRecord(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isNamespace(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isStdNamespace(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isInlineNamespace(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isDependentContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isTransparentContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_isExternCContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_getExternCContext(const D: DeclContext): LinkageSpecDecl; cdecl; external LibClang_dll;
function clangExt_DeclContext_isExternCXXContext(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_Equals(const D: DeclContext; const DC: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_Encloses(const D: DeclContext; const DC: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_getNonClosureAncestor(const D: DeclContext): Decl; cdecl; external LibClang_dll;
function clangExt_DeclContext_getNonTransparentContext(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getPrimaryContext(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getRedeclContext(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getEnclosingNamespaceContext(const D: DeclContext): DeclContext; cdecl; external LibClang_dll;
function clangExt_DeclContext_getOuterLexicalRecordContext(const D: DeclContext): RecordDecl; cdecl; external LibClang_dll;
function clangExt_DeclContext_InEnclosingNamespaceSetOf(const D: DeclContext; const NS: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_getNumDecls(const D: DeclContext): Cardinal; cdecl; external LibClang_dll;
function clangExt_DeclContext_getDecls(const D: DeclContext; i: Cardinal): Decl; cdecl; external LibClang_dll;
function clangExt_DeclContext_decls_empty(const D: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_containsDecl(const D: DeclContext; const decl: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclContext_classof(const decl: Decl): Boolean; cdecl; external LibClang_dll;

{$endregion 'DeclContext'}

implementation

end.

