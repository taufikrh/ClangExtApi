unit LibClang.Ext.AST.DeclU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.LinkageH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.Basic.ExceptionSpecificationTypeU,
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.Basic.VisibilityH,
  LibClang.Ext.AST.DeclarationNameH,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.Basic.ModuleH,
  LibClang.Ext.llvm.ADT.APSIntH
  ;

{$region 'TranslationUnitDecl'}
function clangExt_TranslationUnitDecl_getASTContext(const T: TranslationUnitDecl): ASTContext; cdecl; external LibClang_dll;
function clangExt_TranslationUnitDecl_getAnonymousNamespace(const T: TranslationUnitDecl): NamespaceDecl; cdecl; external LibClang_dll;
function clangExt_TranslationUnitDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TranslationUnitDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TranslationUnitDecl_castToDeclContext(const D: TranslationUnitDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_TranslationUnitDecl_castFromDeclContext(const DC: DeclContext): TranslationUnitDecl; cdecl; external LibClang_dll;
{$endregion 'TranslationUnitDecl'}

{$region 'PragmaCommentDecl'}
function clangExt_PragmaCommentDecl_getCommentKind(const D: PragmaCommentDecl): PragmaMSCommentKind; cdecl; external LibClang_dll;
function clangExt_PragmaCommentDecl_getArg(const D: PragmaCommentDecl): CXString; cdecl; external LibClang_dll;
function clangExt_PragmaCommentDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_PragmaCommentDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'PragmaCommentDecl'}
                   
{$region 'PragmaDetectMismatchDecl'}
function clangExt_PragmaDetectMismatchDecl_getName(const D: PragmaDetectMismatchDecl): CXString; cdecl; external LibClang_dll;
function clangExt_PragmaDetectMismatchDecl_getValue(const D: PragmaDetectMismatchDecl): CXString; cdecl; external LibClang_dll;
function clangExt_PragmaDetectMismatchDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_PragmaDetectMismatchDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'PragmaDetectMismatchDecl'}

{$region 'ExternCContextDecl'}
function clangExt_ExternCContextDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ExternCContextDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_ExternCContextDecl_castToDeclContext(const D: ExternCContextDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_ExternCContextDecl_castFromDeclContext(const DC: DeclContext): ExternCContextDecl; cdecl; external LibClang_dll;
{$endregion 'ExternCContextDecl'}

{$region 'NamedDecl'}
// NamedDecl >> Decl
function clangExt_NamedDecl_getIdentifier(const D: NamedDecl): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getName(const D: NamedDecl): CXString; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getNameAsString(const D: NamedDecl): CXString; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getDeclName(const D: NamedDecl): CXDeclarationName; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getQualifiedNameAsString(const D: NamedDecl): CXString; cdecl; external LibClang_dll;
function clangExt_NamedDecl_hasLinkage(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isCXXClassMember(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isCXXInstanceMember(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isReserved(const D: NamedDecl; const LangOpts: LangOptions): ReservedIdentifierStatus; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getLinkageInternal(const D: NamedDecl): Linkage; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getFormalLinkage(const D: NamedDecl): Linkage; cdecl; external LibClang_dll;
function clangExt_NamedDecl_hasExternalFormalLinkage(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isExternallyVisible(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isExternallyDeclarable(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getVisibility(const D: NamedDecl): Visibility; cdecl; external LibClang_dll;
function clangExt_NamedDecl_isLinkageValid(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_hasLinkageBeenComputed(const D: NamedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getUnderlyingDecl(const D: NamedDecl): NamedDecl; cdecl; external LibClang_dll;
function clangExt_NamedDecl_getMostRecentDecl(const D: NamedDecl): NamedDecl; cdecl; external LibClang_dll;
function clangExt_NamedDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamedDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'NamedDecl'}

{$region 'LabelDecl'}
function clangExt_LabelDecl_getStmt(const D: LabelDecl): LabelStmt; cdecl; external LibClang_dll;
function clangExt_LabelDecl_isGnuLocal(const D: LabelDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_LabelDecl_getSourceRange(const D: LabelDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_LabelDecl_isMSAsmLabel(const D: LabelDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_LabelDecl_isResolvedMSAsmLabel(const D: LabelDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_LabelDecl_getMSAsmLabel(const D: LabelDecl): CXString; cdecl; external LibClang_dll;
function clangExt_LabelDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_LabelDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'LabelDecl'}

{$region 'NamespaceDecl'}
function clangExt_NamespaceDecl_isAnonymousNamespace(const D: NamespaceDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_isInline(const D: NamespaceDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_isRedundantInlineQualifierFor(const D: NamespaceDecl; const Name: CXDeclarationName): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_getOriginalNamespace(const D: NamespaceDecl): NamespaceDecl; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_isOriginalNamespace(const D: NamespaceDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_getAnonymousNamespace(const D: NamespaceDecl): NamespaceDecl; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_getCanonicalDecl(const D: NamespaceDecl): NamespaceDecl; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_getBeginLoc(const D: NamespaceDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_getRBraceLoc(const D: NamespaceDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_castToDeclContext(const D: NamespaceDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_NamespaceDecl_castFromDeclContext(const DC: DeclContext): NamespaceDecl; cdecl; external LibClang_dll;
{$endregion 'NamespaceDecl'}

{$region 'ValueDecl'}
// ValueDecl >> NamedDecl >> Decl
function clangExt_ValueDecl_getType(const D: ValueDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_ValueDecl_isWeak(const D: ValueDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ValueDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ValueDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'ValueDecl'}
                      
{$region 'DeclaratorDecl'}
// DeclaratorDecl >> ValueDecl >> NamedDecl >> Decl
function clangExt_DeclaratorDecl_getTypeSourceInfo(const D: DeclaratorDecl): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getInnerLocStart(const D: DeclaratorDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getOuterLocStart(const D: DeclaratorDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getSourceRange(const D: DeclaratorDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getBeginLoc(const D: DeclaratorDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getQualifier(const D: DeclaratorDecl): NestedNameSpecifier; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getTrailingRequiresClause(const D: DeclaratorDecl): Expr; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getNumTemplateParameterLists(const D: DeclaratorDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getTemplateParameterList(const D: DeclaratorDecl; index: Cardinal): TemplateParameterList; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getTypeSpecStartLoc(const D: DeclaratorDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_getTypeSpecEndLoc(const D: DeclaratorDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclaratorDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'DeclaratorDecl'}

{$region 'EvaluatedStmt'}
function clangExt_EvaluatedStmt_WasEvaluated(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_IsEvaluating(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_HasConstantInitialization(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_HasConstantDestruction(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_HasICEInit(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_CheckedForICEInit(const e: EvaluatedStmt): Boolean; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_GetValue(const e: EvaluatedStmt): Stmt; cdecl; external LibClang_dll;
function clangExt_EvaluatedStmt_GetEvaluated(const e: EvaluatedStmt): APValue; cdecl; external LibClang_dll;
{$endregion 'EvaluatedStmt'}

{$region 'VarDecl'}
// VarDecl >> DeclaratorDecl >> ValueDecl >> NamedDecl >> Decl
function clangExt_VarDecl_getSourceRange(const D: VarDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_VarDecl_getStorageClass(const D: VarDecl): StorageClass; cdecl; external LibClang_dll;
function clangExt_VarDecl_getTSCSpec(const D: VarDecl): ThreadStorageClassSpecifier; cdecl; external LibClang_dll;
function clangExt_VarDecl_getTLSKind(const D: VarDecl): CX_VarDecl_TLSKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasLocalStorage(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isStaticLocal(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasExternalStorage(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasGlobalStorage(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getStorageDuration(const D: VarDecl): StorageDuration; cdecl; external LibClang_dll;
function clangExt_VarDecl_getLanguageLinkage(const D: VarDecl): LanguageLinkage; cdecl; external LibClang_dll;
function clangExt_VarDecl_isExternC(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isInExternCContext(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isInExternCXXContext(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isLocalVarDecl(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isLocalVarDeclOrParm(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isFunctionOrMethodVarDecl(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isStaticDataMember(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getCanonicalDecl(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_isThisDeclarationADefinition(const D: VarDecl): CX_VarDecl_DefinitionKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasDefinition(const D: VarDecl): CX_VarDecl_DefinitionKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_getActingDefinition(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_getDefinition(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_isOutOfLine(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isFileVarDecl(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getAnyInitializer(const D: VarDecl): Expr; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasInit(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getInit(const D: VarDecl): Expr; cdecl; external LibClang_dll;
function clangExt_VarDecl_getInitAddress(D: VarDecl): PStmt; cdecl; external LibClang_dll;
function clangExt_VarDecl_getInitializingDeclaration(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_mightBeUsableInConstantExpressions(const D: VarDecl; const C: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isUsableInConstantExpressions(const D: VarDecl; const C: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_ensureEvaluatedStmt(const D: VarDecl): EvaluatedStmt; cdecl; external LibClang_dll;
function clangExt_VarDecl_getEvaluatedStmt(const D: VarDecl): EvaluatedStmt; cdecl; external LibClang_dll;
function clangExt_VarDecl_evaluateValue(const D: VarDecl): APValue; cdecl; external LibClang_dll;
function clangExt_VarDecl_getEvaluatedValue(const D: VarDecl): APValue; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasConstantInitialization(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getInitStyle(const D: VarDecl): CX_VarDecl_InitializationStyle; cdecl; external LibClang_dll;
function clangExt_VarDecl_isDirectInit(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isThisDeclarationADemotedDefinition(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isExceptionVariable(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isNRVOVariable(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isCXXForRangeDecl(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isObjCForDecl(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isARCPseudoStrong(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isInline(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isInlineSpecified(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isConstexpr(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isInitCapture(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isParameterPack(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isPreviousDeclInSameBlockScope(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isEscapingByref(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isNonEscapingByref(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasDependentAlignment(const D: VarDecl): Boolean; cdecl; external LibClang_dll;

function clangExt_VarDecl_getTemplateInstantiationPattern(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_getInstantiatedFromStaticDataMember(const D: VarDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_getTemplateSpecializationKind(const D: VarDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_getTemplateSpecializationKindForInstantiation(const D: VarDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_getPointOfInstantiation(const D: VarDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_VarDecl_getMemberSpecializationInfo(const D: VarDecl): MemberSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_VarDecl_getDescribedVarTemplate(const D: VarDecl): VarTemplateDecl; cdecl; external LibClang_dll;
function clangExt_VarDecl_isKnownToBeDefined(const D: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_isNoDestroy(const D: VarDecl; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_needsDestruction(const D: VarDecl; const Ctx: ASTContext): QualType_DestructionKind; cdecl; external LibClang_dll;
function clangExt_VarDecl_hasFlexibleArrayInit(const D: VarDecl; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;

function clangExt_VarDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_VarDecl_getMangling(const D: VarDecl): CXString; cdecl; external LibClang_dll;
{$endregion 'VarDecl'}

{$region 'ImplicitParamDecl'}
function clangExt_ImplicitParamDecl_getParameterKind(const D: ImplicitParamDecl): CX_ImplicitParamDecl_ImplicitParamKind; cdecl; external LibClang_dll;
function clangExt_ImplicitParamDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ImplicitParamDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'ImplicitParamDecl'}

{$region 'ParmVarDecl'}
// ParmVarDecl >> VarDecl >> DeclaratorDecl >> ValueDecl >> NamedDecl >> Decl
function clangExt_ParmVarDecl_getSourceRange(const D: ParmVarDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_isObjCMethodParameter(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_isDestroyedInCallee(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getFunctionScopeDepth(const D: ParmVarDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getFunctionScopeIndex(const D: ParmVarDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getObjCDeclQualifier(const D: ParmVarDecl): CX_Decl_ObjCDeclQualifier; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_isKNRPromoted(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getDefaultArg(const D: ParmVarDecl): Expr; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getDefaultArgRange(const D: ParmVarDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getUninstantiatedDefaultArg(const D: ParmVarDecl): Expr; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_hasDefaultArg(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_hasUnparsedDefaultArg(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_hasUninstantiatedDefaultArg(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_hasInheritedDefaultArg(const D: ParmVarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_getOriginalType(const D: ParmVarDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ParmVarDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'ParmVarDecl'}

{$region 'FunctionDecl'}
// FunctionDecl >> DeclaratorDecl >> ValueDecl >> NamedDecl >> Decl
function clangExt_FunctionDecl_getEllipsisLoc(const D: FunctionDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getSourceRange(const D: FunctionDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasBody(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasTrivialBody(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isDefined(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getDefinition(const D: FunctionDecl): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getBody(const D: FunctionDecl): Stmt; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isThisDeclarationADefinition(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isThisDeclarationInstantiatedFromAFriendDefinition(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_doesThisDeclarationHaveABody(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isVariadic(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isVirtualAsWritten(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isPure(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isLateTemplateParsed(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isTrivial(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isTrivialForCall(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isDefaulted(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isExplicitlyDefaulted(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isUserProvided(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasImplicitReturnZero(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasPrototype(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasWrittenPrototype(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasInheritedPrototype(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isConstexpr(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getConstexprKind(const D: FunctionDecl): ConstexprSpecKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isConstexprSpecified(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isConsteval(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_instantiationIsPending(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_usesSEHTry(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isDeleted(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isDeletedAsWritten(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isMain(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isMSVCRTEntryPoint(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isReservedGlobalPlacementOperator(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInlineBuiltinDeclaration(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isDestroyingOperatorDelete(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getLanguageLinkage(const D: FunctionDecl): LanguageLinkage; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isExternC(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInExternCContext(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInExternCXXContext(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isGlobal(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isNoReturn(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasSkippedBody(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_willHaveBody(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isMultiVersion(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getMultiVersionKind(const D: FunctionDecl): MultiVersionKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isCPUDispatchMultiVersion(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isCPUSpecificMultiVersion(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isTargetMultiVersion(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isTargetClonesMultiVersion(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getCanonicalDecl(const D: FunctionDecl): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getBuiltinID(const D: FunctionDecl; ConsiderWrapperFunctions: Boolean = False): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_param_empty(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_param_size(const D: FunctionDecl): SIZE_T; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getNumParams(const D: FunctionDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getParamDecl(const D: FunctionDecl; i: Cardinal): ParmVarDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getMinRequiredArguments(const D: FunctionDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_hasOneParamOrDefaultArgs(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getFunctionTypeLoc(const D: FunctionDecl): FunctionTypeLoc; cdecl; external LibClang_dll; // FunctionTypeLoc
function clangExt_FunctionDecl_getReturnType(const D: FunctionDecl): CXQualType; cdecl; external LibClang_dll; // QualType
function clangExt_FunctionDecl_getReturnTypeSourceRange(const D: FunctionDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getParametersSourceRange(const D: FunctionDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getDeclaredReturnType(const D: FunctionDecl): CXQualType; cdecl; external LibClang_dll; // QualType
function clangExt_FunctionDecl_getExceptionSpecType(const D: FunctionDecl): ExceptionSpecificationType; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getExceptionSpecSourceRange(const D: FunctionDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getCallResultType(const D: FunctionDecl): CXQualType; cdecl; external LibClang_dll; // QualType
function clangExt_FunctionDecl_getStorageClass(const D: FunctionDecl): StorageClass; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInlineSpecified(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_UsesFPIntrin(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInlined(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isInlineDefinitionExternallyVisible(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isMSExternInline(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_doesDeclarationForceExternallyVisibleDefinition(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isStatic(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isOverloadedOperator(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getOverloadedOperator(const D: FunctionDecl): OverloadedOperatorKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getLiteralIdentifier(const D: FunctionDecl): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getInstantiatedFromMemberFunction(const D: FunctionDecl): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplatedKind(const D: FunctionDecl): CX_FunctionDecl_TemplatedKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getMemberSpecializationInfo(const D: FunctionDecl): MemberSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getDescribedFunctionTemplate(const D: FunctionDecl): FunctionTemplateDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isFunctionTemplateSpecialization(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateSpecializationInfo(const D: FunctionDecl): FunctionTemplateSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isImplicitlyInstantiable(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isTemplateInstantiation(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateInstantiationPattern(const D: FunctionDecl; ForDefinition: Boolean = True): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getPrimaryTemplate(const D: FunctionDecl):FunctionTemplateDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateSpecializationArgs(const D: FunctionDecl): TemplateArgumentList; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateSpecializationArgsAsWritten(const D: FunctionDecl): ASTTemplateArgumentListInfo; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getDependentSpecializationInfo(const D: FunctionDecl): DependentFunctionTemplateSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateSpecializationKind(const D: FunctionDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getTemplateSpecializationKindForInstantiation(const D: FunctionDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getPointOfInstantiation(const D: FunctionDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_isOutOfLine(const D: FunctionDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getMemoryFunctionKind(const D: FunctionDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getODRHash(const D: FunctionDecl): Cardinal; cdecl; external LibClang_dll;

function clangExt_FunctionDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_castToDeclContext(const D: FunctionDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_castFromDeclContext(const DC: DeclContext): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionDecl_getMangling(const D: FunctionDecl): CXString; cdecl; external LibClang_dll;
{$endregion 'FunctionDecl'}

{$region 'FieldDecl'}
function clangExt_FieldDecl_getFieldIndex(const F: FieldDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isMutable(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isBitField(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isUnnamedBitfield(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isAnonymousStructOrUnion(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getBitWidth(const F: FieldDecl): Expr; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getBitWidthValue(const F: FieldDecl; const Ctx: ASTContext): Cardinal; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isZeroLengthBitField(const F: FieldDecl; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_isZeroSize(const F: FieldDecl; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getInClassInitStyle(const F: FieldDecl): InClassInitStyle; cdecl; external LibClang_dll;
function clangExt_FieldDecl_hasInClassInitializer(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getInClassInitializer(const F: FieldDecl): Expr; cdecl; external LibClang_dll;
function clangExt_FieldDecl_hasCapturedVLAType(const F: FieldDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getCapturedVLAType(const F: FieldDecl): VariableArrayType; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getParent(const F: FieldDecl): RecordDecl; cdecl; external LibClang_dll;
function clangExt_FieldDecl_getSourceRange(const F: FieldDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FieldDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_FieldDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'FieldDecl'}

{$region 'EnumConstantDecl'}
function clangExt_EnumConstantDecl_getInitExpr(const E: EnumConstantDecl): Expr; cdecl; external LibClang_dll;
function clangExt_EnumConstantDecl_getInitVal(const E: EnumConstantDecl): APSInt; cdecl; external LibClang_dll;
function clangExt_EnumConstantDecl_getSourceRange(const E: EnumConstantDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_EnumConstantDecl_getCanonicalDecl(const E: EnumConstantDecl): EnumConstantDecl; cdecl; external LibClang_dll;
function clangExt_EnumConstantDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumConstantDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'EnumConstantDecl'}

{$region 'IndirectFieldDecl'}
function clangExt_IndirectFieldDecl_getChain(const I: IndirectFieldDecl; x: Cardinal): NamedDecl; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_getChainingSize(const I: IndirectFieldDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_getAnonField(const I: IndirectFieldDecl): FieldDecl; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_getVarDecl(const I: IndirectFieldDecl): VarDecl; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_getCanonicalDecl(const I: IndirectFieldDecl): IndirectFieldDecl; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_IndirectFieldDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'IndirectFieldDecl'}

{$region 'TypeDecl'}
function clangExt_TypeDecl_getTypeForDecl(const T: TypeDecl): AstType; cdecl; external LibClang_dll;
function clangExt_TypeDecl_getBeginLoc(const T: TypeDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TypeDecl_getSourceRange(const T: TypeDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TypeDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypeDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypeDecl'}

{$region 'TypedefNameDecl'}
function clangExt_TypedefNameDecl_isModed(const T: TypedefNameDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_getTypeSourceInfo(const T: TypedefNameDecl): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_getUnderlyingType(const T: TypedefNameDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_getCanonicalDecl(const T: TypedefNameDecl): TypedefNameDecl; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_getAnonDeclWithTypedefName(const T: TypedefNameDecl; AnyRedecl: Boolean = False): TagDecl; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_isTransparentTag(const T: TypedefNameDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypedefNameDecl'}

{$region 'TypedefDecl'}
function clangExt_TypedefDecl_getSourceRange(const T: TypedefDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TypedefDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypedefDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypedefDecl'}
                           
{$region 'TypeAliasDecl'}
function clangExt_TypeAliasDecl_getSourceRange(const T: TypeAliasDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TypeAliasDecl_getDescribedAliasTemplate(const T: TypeAliasDecl): TypeAliasTemplateDecl; cdecl; external LibClang_dll;
function clangExt_TypeAliasDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TypeAliasDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypeAliasDecl'}
                          
{$region 'TagDecl'}
function clangExt_TagDecl_getBraceRange(const T: TagDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TagDecl_getInnerLocStart(const T: TagDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TagDecl_getOuterLocStart(const T: TagDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TagDecl_getSourceRange(const T: TagDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TagDecl_getCanonicalDecl(const T: TagDecl): TagDecl; cdecl; external LibClang_dll;
function clangExt_TagDecl_isThisDeclarationADefinition(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isCompleteDefinition(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isCompleteDefinitionRequired(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isBeingDefined(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isEmbeddedInDeclarator(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isFreeStanding(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_mayHaveOutOfDateDef(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isDependentType(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isThisDeclarationADemotedDefinition(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_getDefinition(const T: TagDecl): TagDecl; cdecl; external LibClang_dll;
function clangExt_TagDecl_getKindName(const T: TagDecl): CXString; cdecl; external LibClang_dll;
function clangExt_TagDecl_getTagKind(const T: TagDecl): CX_TagDecl_TagKind; cdecl; external LibClang_dll;
function clangExt_TagDecl_isStruct(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isInterface(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isClass(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isUnion(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_isEnum(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_hasNameForLinkage(const T: TagDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_getTypedefNameForAnonDecl(const T: TagDecl): TypedefNameDecl; cdecl; external LibClang_dll;
function clangExt_TagDecl_getQualifier(const T: TagDecl): NestedNameSpecifier; cdecl; external LibClang_dll;
function clangExt_TagDecl_getNumTemplateParameterLists(const T: TagDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_TagDecl_getTemplateParameterList(const T: TagDecl; i: Cardinal): TemplateParameterList; cdecl; external LibClang_dll;
function clangExt_TagDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TagDecl_castToDeclContext(const D: TagDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_TagDecl_castFromDeclContext(const DC: DeclContext): TagDecl; cdecl; external LibClang_dll;
{$endregion 'TagDecl'}

{$region 'EnumDecl'}
function clangExt_EnumDecl_getCanonicalDecl(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getPreviousDecl(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getMostRecentDecl(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getDefinition(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getSourceRange(const E: EnumDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getNumEnumerators(const E: EnumDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getNameEnumerators(const E: EnumDecl; i: Cardinal): EnumConstantDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getPromotionType(const E: EnumDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getIntegerType(const E: EnumDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getIntegerTypeSourceInfo(const E: EnumDecl): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getIntegerTypeRange(const E: EnumDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getNumPositiveBits(const E: EnumDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getNumNegativeBits(const E: EnumDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isScoped(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isScopedUsingClassTag(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isFixed(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getODRHash(const E: EnumDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isComplete(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isClosed(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isClosedFlag(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_isClosedNonFlag(const E: EnumDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getTemplateInstantiationPattern(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getInstantiatedFromMemberEnum(const E: EnumDecl): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getTemplateSpecializationKind(const E: EnumDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_EnumDecl_getMemberSpecializationInfo(const E: EnumDecl): MemberSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_EnumDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'EnumDecl'}
              
{$region 'RecordDecl'}
function clangExt_RecordDecl_getPreviousDecl(const R: RecordDecl): RecordDecl; cdecl; external LibClang_dll;
function clangExt_RecordDecl_getMostRecentDecl(const R: RecordDecl): RecordDecl; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasFlexibleArrayMember(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isAnonymousStructOrUnion(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasObjectMember(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasVolatileMember(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasLoadedFieldsFromExternalStorage(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isNonTrivialToPrimitiveDefaultInitialize(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isNonTrivialToPrimitiveCopy(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isNonTrivialToPrimitiveDestroy(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasNonTrivialToPrimitiveDestructCUnion(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_hasNonTrivialToPrimitiveCopyCUnion(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_canPassInRegisters(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_getArgPassingRestrictions(const R: RecordDecl): CX_RecordDecl_ArgPassingKind; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isParamDestroyedInCallee(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isRandomized(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isInjectedClassName(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isLambda(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isCapturedRecord(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_getDefinition(const R: RecordDecl): RecordDecl; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isOrContainsUnion(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_getNumFields(const R: RecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_RecordDecl_getField(const R: RecordDecl; i: Cardinal): FieldDecl; cdecl; external LibClang_dll;
function clangExt_RecordDecl_field_empty(const R: RecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_isMsStruct(const R: RecordDecl; const C: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_mayInsertExtraPadding(const R: RecordDecl; EmitRemark: Boolean = False): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordDecl_findFirstNamedDataMember(const R: RecordDecl): FieldDecl; cdecl; external LibClang_dll;
{$endregion 'RecordDecl'}
                                                                                                                   
{$region 'FileScopeAsmDecl'}
function clangExt_FileScopeAsmDecl_getAsmLoc(const A: FileScopeAsmDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FileScopeAsmDecl_getRParenLoc(const A: FileScopeAsmDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FileScopeAsmDecl_getSourceRange(const A: FileScopeAsmDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FileScopeAsmDecl_getAsmString(const A: FileScopeAsmDecl): StringLiteral; cdecl; external LibClang_dll;
function clangExt_FileScopeAsmDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_FileScopeAsmDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'FileScopeAsmDecl'}

{$region 'BlockDecl_Capture'}
function clangExt_BlockDecl_Capture_getVariable(const C: BlockDecl_Capture): VarDecl; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_isByRef(const C: BlockDecl_Capture): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_isEscapingByref(const C: BlockDecl_Capture): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_isNonEscapingByref(const C: BlockDecl_Capture): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_isNested(const C: BlockDecl_Capture): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_hasCopyExpr(const C: BlockDecl_Capture): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_Capture_getCopyExpr(const C: BlockDecl_Capture): Expr; cdecl; external LibClang_dll;
{$endregion 'BlockDecl_Capture'}

{$region 'BlockDecl'}
function clangExt_BlockDecl_getCaretLocation(const B: BlockDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_BlockDecl_isVariadic(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getCompoundBody(const B: BlockDecl): CompoundStmt; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getBody(const B: BlockDecl): Stmt; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getSignatureAsWritten(const B: BlockDecl): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_BlockDecl_param_empty(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_param_size(const B: BlockDecl): SIZE_T; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getNumParams(const B: BlockDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getParamDecl(const B: BlockDecl; i: Cardinal): ParmVarDecl; cdecl; external LibClang_dll;
function clangExt_BlockDecl_hasCaptures(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getNumCaptures(const B: BlockDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getCaptures(const B: BlockDecl; i: Cardinal): BlockDecl_Capture; cdecl; external LibClang_dll;
function clangExt_BlockDecl_capturesCXXThis(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_blockMissingReturnType(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_isConversionFromLambda(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_doesNotEscape(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_canAvoidCopyToHeap(const B: BlockDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_capturesVariable(const B: BlockDecl; const vDecl: VarDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getBlockManglingNumber(const B: BlockDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getBlockManglingContextDecl(const B: BlockDecl): Decl; cdecl; external LibClang_dll;
function clangExt_BlockDecl_getSourceRange(const B: BlockDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_BlockDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockDecl_castToDeclContext(const D: BlockDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_BlockDecl_castFromDeclContext(const DC: DeclContext): BlockDecl; cdecl; external LibClang_dll;
{$endregion 'BlockDecl'}
                       
{$region 'CapturedDecl'}
function clangExt_CapturedDecl_getBody(const C: CapturedDecl): Stmt; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_isNothrow(const C: CapturedDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_getNumParams(const C: CapturedDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_getParam(const C: CapturedDecl; i: Cardinal): ImplicitParamDecl; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_getContextParam(const C: CapturedDecl): ImplicitParamDecl; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_getContextParamPosition(const C: CapturedDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_castToDeclContext(const D: CapturedDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_CapturedDecl_castFromDeclContext(const DC: DeclContext): CapturedDecl; cdecl; external LibClang_dll;
{$endregion 'CapturedDecl'}
                             
{$region 'ImportDecl'}
function clangExt_ImportDecl_getImportedModule(const D: ImportDecl): Module; cdecl; external LibClang_dll;
function clangExt_ImportDecl_getNumIdentifierLocs(const D: ImportDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_ImportDecl_getIdentifierLocs(const D: ImportDecl; i: Cardinal): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ImportDecl_getSourceRange(const D: ImportDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ImportDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ImportDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'ImportDecl'}

{$region 'ExportDecl'}
function clangExt_ExportDecl_getExportLoc(const E: ExportDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ExportDecl_getRBraceLoc(const E: ExportDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ExportDecl_hasBraces(const E: ExportDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_ExportDecl_getEndLoc(const E: ExportDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ExportDecl_getSourceRange(const E: ExportDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ExportDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_ExportDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_ExportDecl_castToDeclContext(const D: ExportDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_ExportDecl_castFromDeclContext(const DC: DeclContext): ExportDecl; cdecl; external LibClang_dll;
{$endregion 'ExportDecl'}
                   
{$region 'EmptyDecl'}
function clangExt_EmptyDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_EmptyDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'EmptyDecl'}

implementation

end.

