unit LibClang.Ext.AST.DeclW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.DeclarationNameH,
  LibClang.Ext.Basic.LinkageH,
  LibClang.Ext.Basic.VisibilityH,
  LibClang.Index,
  LibClang.Ext.Basic.ExceptionSpecificationTypeU,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.AST.DeclU,
  LibClang.Ext.AST.DeclBaseW,
  LibClang.Ext.Basic.ModuleH,
  //LibClang.Ext.llvm.ADT.APSIntH,
  LibClang.Ext.llvm.ADT.APSIntW
  ;

type

  { TTranslationUnitDeclW }

  TTranslationUnitDeclW = object(TDeclW)
  public
    class function Create(const aDecl: TranslationUnitDecl; out oDecl: TTranslationUnitDeclW): Boolean; static;
  public
    function getASTContext: ASTContext;
    function getAnonymousNamespace: NamespaceDecl;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TTranslationUnitDeclW): Boolean; static;
  end;   

  { TPragmaCommentDeclW }

  TPragmaCommentDeclW = object(TDeclW)
  public
    class function Create(const aDecl: PragmaCommentDecl; out
      oDecl: TPragmaCommentDeclW): Boolean; static;
  public
    function getCommentKind: PragmaMSCommentKind;
    function getArg: string;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;     

  { TPragmaDetectMismatchDeclW }

  TPragmaDetectMismatchDeclW = object(TDeclW)
  public
    class function Create(const aDecl: PragmaDetectMismatchDecl; out oDecl: TPragmaDetectMismatchDeclW): Boolean; static;
  public
    function getName: string;
    function getValue: string;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;   

  { TExternCContextDeclW }

  TExternCContextDeclW = object(TDeclW)
  public
    class function Create(const aDecl: ExternCContextDecl; out oDecl: TExternCContextDeclW): Boolean; static;
  public
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TExternCContextDeclW): Boolean; static;
  end;

  { TNamedDeclW }

  TNamedDeclW = object(TDeclW)
  public
    class function Create(const aDecl: NamedDecl; out oDecl: TNamedDeclW): Boolean; static;
  public
    function getIdentifier: IdentifierInfo;
    function getName: string;
    function getNameAsString: string;
    function getDeclName: CXDeclarationName;
    function getQualifiedNameAsString: string;
    function hasLinkage: Boolean;
    function isCXXClassMember: Boolean;
    function isCXXInstanceMember: Boolean;
    function isReserved(const LangOpts: LangOptions): ReservedIdentifierStatus;
    function getLinkageInternal: Linkage;
    function getFormalLinkage: Linkage;
    function hasExternalFormalLinkage: Boolean;
    function isExternallyVisible: Boolean;
    function isExternallyDeclarable: Boolean;
    function getVisibility: Visibility;
    function isLinkageValid: Boolean;
    function hasLinkageBeenComputed: Boolean;
    function getUnderlyingDecl: TNamedDeclW;
    function getMostRecentDecl: TNamedDeclW;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TValueDeclW }

  TValueDeclW = object(TNamedDeclW)
  public
    class function Create(const aDecl: ValueDecl; out oDecl: TValueDeclW): Boolean; static;
  public
    function getType: CXQualType;
    function isWeak: Boolean;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TDeclaratorDeclW }

  TDeclaratorDeclW = object(TValueDeclW)
  public
    class function Create(const aDecl: DeclaratorDecl; out oDecl: TDeclaratorDeclW): Boolean; static;
  public
    function getTypeSourceInfo: TypeSourceInfo;
    function getInnerLocStart: CXSourceLocation;
    function getOuterLocStart: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    function getBeginLoc: CXSourceLocation;
    function getQualifier: NestedNameSpecifier;
    function getTrailingRequiresClause: Expr;
    function getNumTemplateParameterLists: Cardinal;
    function getTemplateParameterList(index: Cardinal): TemplateParameterList;
    function getTypeSpecStartLoc: CXSourceLocation;
    function getTypeSpecEndLoc: CXSourceLocation;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end; 

  TEvaluatedStmtHelper = type helper for EvaluatedStmt
    function WasEvaluated: Boolean;
    function IsEvaluating: Boolean;
    function HasConstantInitialization: Boolean;
    function HasConstantDestruction: Boolean;
    function HasICEInit: Boolean;
    function CheckedForICEInit: Boolean;
    function GetValue: Stmt;
    function GetEvaluated: APValue;
  end;

  { TVarDeclW }

  TVarDeclW = object(TDeclaratorDeclW)
  public
    class function Create(const aDecl: VarDecl; out oDecl: TVarDeclW): Boolean; static;
  public
    function getSourceRange: CXSourceRange;
    function getStorageClass: StorageClass;
    function getTSCSpec: ThreadStorageClassSpecifier;
    function getTLSKind: CX_VarDecl_TLSKind;
    function hasLocalStorage: Boolean;
    function isStaticLocal: Boolean;
    function hasExternalStorage: Boolean;
    function hasGlobalStorage: Boolean;
    function getStorageDuration: StorageDuration;
    function getLanguageLinkage: LanguageLinkage;
    function isExternC: Boolean;
    function isInExternCContext: Boolean;
    function isInExternCXXContext: Boolean;
    function isLocalVarDecl: Boolean;
    function isLocalVarDeclOrParm: Boolean;
    function isFunctionOrMethodVarDecl: Boolean;
    function isStaticDataMember: Boolean;
    function getCanonicalDecl: TVarDeclW;
    function isThisDeclarationADefinition: CX_VarDecl_DefinitionKind;
    function hasDefinition: CX_VarDecl_DefinitionKind;
    function getActingDefinition: TVarDeclW;
    function getDefinition: TVarDeclW;
    function isOutOfLine: Boolean;
    function isFileVarDecl: Boolean;
    function getAnyInitializer: Expr;
    function hasInit: Boolean;
    function getInit: Expr;
    function getInitAddress: PStmt;
    function getInitializingDeclaration: TVarDeclW;

    function mightBeUsableInConstantExpressions(const C: ASTContext): Boolean;
    function isUsableInConstantExpressions(const C: ASTContext): Boolean;
    function ensureEvaluatedStmt: EvaluatedStmt;
    function getEvaluatedStmt: EvaluatedStmt;
    function evaluateValue: APValue;
    function getEvaluatedValue: APValue;

    function hasConstantInitialization: Boolean;
    function getInitStyle: CX_VarDecl_InitializationStyle;
    function isDirectInit: Boolean;
    function isThisDeclarationADemotedDefinition: Boolean;
    function isExceptionVariable: Boolean;
    function isNRVOVariable: Boolean;
    function isCXXForRangeDecl: Boolean;
    function isObjCForDecl: Boolean;
    function isARCPseudoStrong: Boolean;
    function isInline: Boolean;
    function isInlineSpecified: Boolean;
    function isConstexpr: Boolean;
    function isInitCapture: Boolean;
    function isParameterPack: Boolean;
    function isPreviousDeclInSameBlockScope: Boolean;
    function isEscapingByref: Boolean;
    function isNonEscapingByref: Boolean;
    function hasDependentAlignment: Boolean;
    function getTemplateInstantiationPattern: TVarDeclW;
    function getInstantiatedFromStaticDataMember: TVarDeclW;
    function getTemplateSpecializationKind: TemplateSpecializationKind;
    function getTemplateSpecializationKindForInstantiation: TemplateSpecializationKind;
    function getPointOfInstantiation: CXSourceLocation;
    function getMemberSpecializationInfo: MemberSpecializationInfo;
    function getDescribedVarTemplate: VarTemplateDecl;
    function isKnownToBeDefined: Boolean;
    function isNoDestroy(const Ctx: ASTContext): Boolean;
    function needsDestruction(const Ctx: ASTContext): QualType_DestructionKind;
    function hasFlexibleArrayInit(const Ctx: ASTContext): Boolean;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function getMangling: string;
  end;

  { TParmVarDeclW }

  TParmVarDeclW = object(TVarDeclW)
  public
    class function Create(const aDecl: ParmVarDecl; out oDecl: TParmVarDeclW): Boolean; static;
  public
    function getSourceRange: CXSourceRange;
    function isObjCMethodParameter: Boolean;
    function isDestroyedInCallee: Boolean;
    function getFunctionScopeDepth: Cardinal;
    function getFunctionScopeIndex: Cardinal;
    function getObjCDeclQualifier: CX_Decl_ObjCDeclQualifier;
    function isKNRPromoted: Boolean;
    function getDefaultArg: Expr;
    function getDefaultArgRange: CXSourceRange;
    function getUninstantiatedDefaultArg: Expr;
    function hasDefaultArg: Boolean;
    function hasUnparsedDefaultArg: Boolean;
    function hasUninstantiatedDefaultArg: Boolean;
    function hasInheritedDefaultArg: Boolean;
    function getOriginalType: CXQualType;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TFunctionDeclW }

  TFunctionDeclW = object(TDeclaratorDeclW)
  public
    class function Create(const aDecl: FunctionDecl; out oDecl: TFunctionDeclW): Boolean; static;
  public
    function getEllipsisLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    function hasBody: Boolean;
    function hasTrivialBody: Boolean;
    function isDefined: Boolean;
    function getDefinition: TFunctionDeclW;
    function getBody: Stmt;
    function isThisDeclarationADefinition: Boolean;
    function isThisDeclarationInstantiatedFromAFriendDefinition: Boolean;
    function doesThisDeclarationHaveABody: Boolean;
    function isVariadic: Boolean;
    function isVirtualAsWritten: Boolean;
    function isPure: Boolean;
    function isLateTemplateParsed: Boolean;
    function isTrivial: Boolean;
    function isTrivialForCall: Boolean;
    function isDefaulted: Boolean;
    function isExplicitlyDefaulted: Boolean;
    function isUserProvided: Boolean;
    function hasImplicitReturnZero: Boolean;
    function hasPrototype: Boolean;
    function hasWrittenPrototype: Boolean;
    function hasInheritedPrototype: Boolean;
    function isConstexpr: Boolean;
    function getConstexprKind: ConstexprSpecKind;
    function isConstexprSpecified: Boolean;
    function isConsteval: Boolean;
    function instantiationIsPending: Boolean;
    function usesSEHTry: Boolean;
    function isDeleted: Boolean;
    function isDeletedAsWritten: Boolean;
    function isMain: Boolean;
    function isMSVCRTEntryPoint: Boolean;
    function isReservedGlobalPlacementOperator: Boolean;
    function isInlineBuiltinDeclaration: Boolean;
    function isDestroyingOperatorDelete: Boolean;
    function getLanguageLinkage: LanguageLinkage;
    function isExternC: Boolean;
    function isInExternCContext: Boolean;
    function isInExternCXXContext: Boolean;
    function isGlobal: Boolean;
    function isNoReturn: Boolean;
    function hasSkippedBody: Boolean;
    function willHaveBody: Boolean;
    function isMultiVersion: Boolean;
    function getMultiVersionKind: MultiVersionKind;
    function isCPUDispatchMultiVersion: Boolean;
    function isCPUSpecificMultiVersion: Boolean;
    function isTargetMultiVersion: Boolean;
    function isTargetClonesMultiVersion: Boolean;
    function getCanonicalDecl: TFunctionDeclW;
    function getBuiltinID(ConsiderWrapperFunctions: Boolean = False): Cardinal;
    function param_empty: Boolean;
    function param_size: SIZE_T;
    function getNumParams: Cardinal;
    function getParamDecl(i: Cardinal): TParmVarDeclW;
    function getMinRequiredArguments: Cardinal;
    function hasOneParamOrDefaultArgs: Boolean;
    function getFunctionTypeLoc: FunctionTypeLoc;
    function getReturnType: CXQualType;
    function getReturnTypeSourceRange: CXSourceRange;
    function getParametersSourceRange: CXSourceRange;
    function getDeclaredReturnType: CXQualType;
    function getExceptionSpecType: ExceptionSpecificationType;
    function getExceptionSpecSourceRange: CXSourceRange;
    function getCallResultType: CXQualType;
    function getStorageClass: StorageClass;
    function isInlineSpecified: Boolean;
    function UsesFPIntrin: Boolean;
    function isInlined: Boolean;
    function isInlineDefinitionExternallyVisible: Boolean;
    function isMSExternInline: Boolean;
    function doesDeclarationForceExternallyVisibleDefinition: Boolean;
    function isStatic: Boolean;
    function isOverloadedOperator: Boolean;
    function getOverloadedOperator: OverloadedOperatorKind;
    function getLiteralIdentifier: IdentifierInfo;
    function getInstantiatedFromMemberFunction: TFunctionDeclW;
    function getTemplatedKind: CX_FunctionDecl_TemplatedKind;
    function getMemberSpecializationInfo: MemberSpecializationInfo;
    function getDescribedFunctionTemplate: FunctionTemplateDecl;
    function isFunctionTemplateSpecialization: Boolean;
    function getTemplateSpecializationInfo: FunctionTemplateSpecializationInfo;
    function isImplicitlyInstantiable: Boolean;
    function isTemplateInstantiation: Boolean;
    function getTemplateInstantiationPattern(ForDefinition: Boolean = True): TFunctionDeclW;
    function getPrimaryTemplate:FunctionTemplateDecl;
    function getTemplateSpecializationArgs: TemplateArgumentList;
    function getTemplateSpecializationArgsAsWritten: ASTTemplateArgumentListInfo;
    function getDependentSpecializationInfo: DependentFunctionTemplateSpecializationInfo;
    function getTemplateSpecializationKind: TemplateSpecializationKind;
    function getTemplateSpecializationKindForInstantiation: TemplateSpecializationKind;
    function getPointOfInstantiation: CXSourceLocation;
    function isOutOfLine: Boolean;
    function getMemoryFunctionKind: Cardinal;
    function getODRHash: Cardinal;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext(out DC: TDeclContextW): Boolean;
    class function castFromDeclContext(const DC: TDeclContextW; out aDecl: TFunctionDeclW): Boolean; static;
    function getMangling: string;
  end;     

  { TFieldDeclW }

  TFieldDeclW = object(TDeclaratorDeclW)
  public
    class function Create(const aDecl: FieldDecl; out oDecl: TFieldDeclW): Boolean; static;
  public
    function getFieldIndex: Cardinal;
    function isMutable: Boolean;
    function isBitField: Boolean;
    function isUnnamedBitfield: Boolean;
    function isAnonymousStructOrUnion: Boolean;
    function getBitWidth: Expr;
    function getBitWidthValue(const Ctx: ASTContext = nil): Cardinal;
    function isZeroLengthBitField(const Ctx: ASTContext = nil): Boolean;
    function isZeroSize(const Ctx: ASTContext = nil): Boolean;
    function getInClassInitStyle: InClassInitStyle;
    function hasInClassInitializer: Boolean;
    function getInClassInitializer: Expr;
    function hasCapturedVLAType: Boolean;
    function getCapturedVLAType: VariableArrayType;
    function getParent: RecordDecl;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;      

  { TEnumConstantDeclW }

  TEnumConstantDeclW = object(TValueDeclW)
  public
    class function Create(const aDecl: EnumConstantDecl; out oDecl: TEnumConstantDeclW): Boolean; static;
  public
    function getInitExpr: Expr;
    function getInitVal: TAPSIntW;
    function getSourceRange: CXSourceRange;
    function getCanonicalDecl: TEnumConstantDeclW;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TIndirectFieldDeclW }

  TIndirectFieldDeclW = object(TValueDeclW)
  public
    class function Create(const aDecl: IndirectFieldDecl; out oDecl: TIndirectFieldDeclW): Boolean; static;
  public
    function getChain(x: Cardinal): NamedDecl;
    function getChainingSize: Cardinal;
    function getAnonField: TFieldDeclW;
    function getVarDecl: TVarDeclW;
    function getCanonicalDecl: TIndirectFieldDeclW;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;    

  { TTypeDeclW }

  TTypeDeclW = object(TNamedDeclW)
  public
    class function Create(const aDecl: TypeDecl; out oDecl: TTypeDeclW): Boolean; static;
  public
    function getTypeForDecl: AstType;
    function getBeginLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;    

  { TTypedefNameDeclW }

  TTypedefNameDeclW = object(TTypeDeclW)
  public
    class function Create(const aDecl: TypedefNameDecl; out oDecl: TTypedefNameDeclW): Boolean; static;
  public
    function isModed: Boolean;
    function getTypeSourceInfo: TypeSourceInfo;
    function getUnderlyingType: CXQualType;
    function getCanonicalDecl: TTypedefNameDeclW;
    function getAnonDeclWithTypedefName(AnyRedecl: Boolean = False): TagDecl;
    function isTransparentTag: Boolean;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TTypedefDeclW }

  TTypedefDeclW = object(TTypedefNameDeclW)
  public
    class function Create(const aDecl: TypedefDecl; out oDecl: TTypedefDeclW): Boolean; static;
  public
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TTypeAliasDeclW }

  TTypeAliasDeclW = object(TTypedefNameDeclW)
  public
    class function Create(const aDecl: TypeAliasDecl; out oDecl: TTypeAliasDeclW): Boolean; static;
  public
    function getSourceRange: CXSourceRange;
    function getDescribedAliasTemplate: TypeAliasTemplateDecl;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;     

  { TTagDeclW }

  TTagDeclW = object(TTypeDeclW)
  public
    class function Create(const aDecl: TagDecl; out oDecl: TTagDeclW): Boolean; static;
  public
    function getBraceRange: CXSourceRange;
    function getInnerLocStart: CXSourceLocation;
    function getOuterLocStart: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    function getCanonicalDecl: TTagDeclW;
    function isThisDeclarationADefinition: Boolean;
    function isCompleteDefinition: Boolean;
    function isCompleteDefinitionRequired: Boolean;
    function isBeingDefined: Boolean;
    function isEmbeddedInDeclarator: Boolean;
    function isFreeStanding: Boolean;
    function mayHaveOutOfDateDef: Boolean;
    function isDependentType: Boolean;
    function isThisDeclarationADemotedDefinition: Boolean;
    function getDefinition: TTagDeclW;
    function getKindName: string;
    function getTagKind: CX_TagDecl_TagKind;
    function isStruct: Boolean;
    function isInterface: Boolean;
    function isClass: Boolean;
    function isUnion: Boolean;
    function isEnum: Boolean;
    function hasNameForLinkage: Boolean;
    function getTypedefNameForAnonDecl: TTypedefNameDeclW;
    function getQualifier: NestedNameSpecifier;
    function getNumTemplateParameterLists: Cardinal;
    function getTemplateParameterList(i: Cardinal): TemplateParameterList;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TTagDeclW): Boolean; static;
  end;

  { TEnumDeclW }

  TEnumDeclW = object(TTagDeclW)
  public
    class function Create(const aDecl: EnumDecl; out oDecl: TEnumDeclW): Boolean; static;
  public
    function getCanonicalDecl: TEnumDeclW;
    function getPreviousDecl: TEnumDeclW;
    function getMostRecentDecl: TEnumDeclW;
    function getDefinition: TEnumDeclW;
    function getSourceRange: CXSourceRange;
    function getNumEnumerators: Cardinal;
    function getNameEnumerators(i: Cardinal): TEnumConstantDeclW;
    function getPromotionType: CXQualType;
    function getIntegerType: CXQualType;
    function getIntegerTypeSourceInfo: TypeSourceInfo;
    function getIntegerTypeRange: CXSourceRange;
    function getNumPositiveBits: Cardinal;
    function getNumNegativeBits: Cardinal;
    function isScoped: Boolean;
    function isScopedUsingClassTag: Boolean;
    function isFixed: Boolean;
    function getODRHash: Cardinal;
    function isComplete: Boolean;
    function isClosed: Boolean;
    function isClosedFlag: Boolean;
    function isClosedNonFlag: Boolean;
    function getTemplateInstantiationPattern: TEnumDeclW;
    function getInstantiatedFromMemberEnum: TEnumDeclW;
    function getTemplateSpecializationKind: TemplateSpecializationKind;
    function getMemberSpecializationInfo: MemberSpecializationInfo;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { TRecordDeclW }

  TRecordDeclW = object(TTagDeclW)
  public
    class function Create(const aDecl: RecordDecl; out oDecl: TRecordDeclW): Boolean; static;
  public
    function getPreviousDecl: TRecordDeclW;
    function getMostRecentDecl: TRecordDeclW;
    function hasFlexibleArrayMember: Boolean;
    function isAnonymousStructOrUnion: Boolean;
    function hasObjectMember: Boolean;
    function hasVolatileMember: Boolean;
    function hasLoadedFieldsFromExternalStorage: Boolean;
    function isNonTrivialToPrimitiveDefaultInitialize: Boolean;
    function isNonTrivialToPrimitiveCopy: Boolean;
    function isNonTrivialToPrimitiveDestroy: Boolean;
    function hasNonTrivialToPrimitiveDefaultInitializeCUnion: Boolean;
    function hasNonTrivialToPrimitiveDestructCUnion: Boolean;
    function hasNonTrivialToPrimitiveCopyCUnion: Boolean;
    function canPassInRegisters: Boolean;
    function getArgPassingRestrictions: CX_RecordDecl_ArgPassingKind;
    function isParamDestroyedInCallee: Boolean;
    function isRandomized: Boolean;
    function isInjectedClassName: Boolean;
    function isLambda: Boolean;
    function isCapturedRecord: Boolean;
    function getDefinition: TRecordDeclW;
    function isOrContainsUnion: Boolean;
    function getNumFields: Cardinal;
    function getField(i: Cardinal): TFieldDeclW;
    function field_empty: Boolean;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function isMsStruct(const C: ASTContext): Boolean;
    function mayInsertExtraPadding(EmitRemark: Boolean = False): Boolean;
    function findFirstNamedDataMember: TFieldDeclW;
  end;

  { TFileScopeAsmDeclW }

  TFileScopeAsmDeclW = object(TDeclW)
  public
    class function Create(const aDecl: FileScopeAsmDecl; out oDecl: TFileScopeAsmDeclW): Boolean; static;
  public
    function getAsmLoc: CXSourceLocation;
    function getRParenLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    function getAsmString: StringLiteral;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

  { BlockDecl_Capture_Helper }

  BlockDecl_Capture_Helper = type helper for BlockDecl_Capture
    function getVariable: TVarDeclW;
    function isByRef: Boolean;
    function isEscapingByref: Boolean;
    function isNonEscapingByref: Boolean;
    function isNested: Boolean;
    function hasCopyExpr: Boolean;
    function getCopyExpr: Expr;
  end;      

  { TBlockDeclW }

  TBlockDeclW = object(TDeclW)
  public
    class function Create(const aDecl: BlockDecl; out oDecl: TBlockDeclW): Boolean; static;
  public
    function getCaretLocation: CXSourceLocation;
    function isVariadic: Boolean;
    function getCompoundBody: CompoundStmt;
    function getBody: Stmt;
    function getSignatureAsWritten: TypeSourceInfo;
    function param_empty: Boolean;
    function param_size: SIZE_T;
    function getNumParams: Cardinal;
    function getParamDecl(i: Cardinal): TParmVarDeclW;
    function hasCaptures: Boolean;
    function getNumCaptures: Cardinal;
    function getCaptures(i: Cardinal): BlockDecl_Capture;
    function capturesCXXThis: Boolean;
    function blockMissingReturnType: Boolean;
    function isConversionFromLambda: Boolean;
    function doesNotEscape: Boolean;
    function canAvoidCopyToHeap: Boolean;
    function capturesVariable(aDecl: TVarDeclW): Boolean;
    function getBlockManglingNumber: Cardinal;
    function getBlockManglingContextDecl: Decl;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(const DC: TDeclContextW; out aDecl: TBlockDeclW): Boolean; static;

  end;

  { TCapturedDeclW }

  TCapturedDeclW = object(TDeclW)
  public
    class function Create(const aDecl: CapturedDecl; out oDecl: TCapturedDeclW): Boolean; static;
  public
    function getBody: Stmt;
    function isNothrow: Boolean;
    function getNumParams: Cardinal;
    function getParam(i: Cardinal): ImplicitParamDecl;
    function getContextParam: ImplicitParamDecl;
    function getContextParamPosition: Cardinal;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TCapturedDeclW): Boolean; static;
  end;

  { TImportDeclW }

  TImportDeclW = object(TDeclW)
  public
    class function Create(const aDecl: ImportDecl; out oDecl: TImportDeclW): Boolean; static;
  public
    function getImportedModule: Module;
    function getNumIdentifierLocs: Cardinal;
    function getIdentifierLocs(i: Cardinal): CXSourceLocation;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;     

  { TExportDeclW }

  TExportDeclW = object(TDeclW)
  public
    class function Create(const aDecl: ExportDecl; out oDecl: TExportDeclW): Boolean; static;
  public
    function getExportLoc: CXSourceLocation;
    function getRBraceLoc: CXSourceLocation;
    function hasBraces: Boolean;
    function getEndLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TExportDeclW): Boolean; static;
  end;

  { TEmptyDeclW }

  TEmptyDeclW = object(TDeclW)
  public   
    class function Create(const aDecl: EmptyDecl; out oDecl: TEmptyDeclW): Boolean; static;
  public 
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

{$region 'Helper'}

  { TranslationUnitDeclHelper }

  TranslationUnitDeclHelper = type helper for TranslationUnitDecl
    function Wrap(out D: TTranslationUnitDeclW): Boolean;
  end;

  { PragmaCommentDeclHelper }

  PragmaCommentDeclHelper = type helper for PragmaCommentDecl
    function Wrap(out D: TPragmaCommentDeclW): Boolean;
  end;

  { PragmaDetectMismatchDeclHelper }

  PragmaDetectMismatchDeclHelper = type helper for PragmaDetectMismatchDecl
    function Wrap(out D: TPragmaDetectMismatchDeclW): Boolean;
  end;

  { ExternCContextDeclHelper }

  ExternCContextDeclHelper = type helper for ExternCContextDecl
    function Wrap(out D: TExternCContextDeclW): Boolean;
  end;

  { NamedDeclHelper }

  NamedDeclHelper = type helper for NamedDecl
    function Wrap(out D: TNamedDeclW): Boolean;
  end;

  { ValueDeclHelper }

  ValueDeclHelper = type helper for ValueDecl
    function Wrap(out D: TValueDeclW): Boolean;
  end;

  { DeclaratorDeclHelper }

  DeclaratorDeclHelper = type helper for DeclaratorDecl
    function Wrap(out D: TDeclaratorDeclW): Boolean;
  end;

  { VarDeclHelper }

  VarDeclHelper = type helper for VarDecl
    function Wrap(out D: TVarDeclW): Boolean;
  end;

  { ParmVarDeclHelper }

  ParmVarDeclHelper = type helper for ParmVarDecl
    function Wrap(out D: TParmVarDeclW): Boolean;
  end;

  { FunctionDeclHelper }

  FunctionDeclHelper = type helper for FunctionDecl
    function Wrap(out D: TFunctionDeclW): Boolean;
  end;

  { FieldDeclHelper }

  FieldDeclHelper = type helper for FieldDecl
    function Wrap(out D: TFieldDeclW): Boolean;
  end;

  { EnumConstantDeclHelper }

  EnumConstantDeclHelper = type helper for EnumConstantDecl
    function Wrap(out D: TEnumConstantDeclW): Boolean;
  end;

  { IndirectFieldDeclHelper }

  IndirectFieldDeclHelper = type helper for IndirectFieldDecl
    function Wrap(out D: TIndirectFieldDeclW): Boolean;
  end;
       
  { TypeDeclHelper }

  TypeDeclHelper = type helper for TypeDecl
    function Wrap(out D: TTypedefNameDeclW): Boolean;
  end;

  { TypedefNameDeclHelper }

  TypedefNameDeclHelper = type helper for TypedefNameDecl
    function Wrap(out D: TTypedefNameDeclW): Boolean;
  end;

  { TypedefDeclHelper }

  TypedefDeclHelper = type helper for TypedefDecl
    function Wrap(out D: TTypedefDeclW): Boolean;
  end;

  { TypeAliasDeclHelper }

  TypeAliasDeclHelper = type helper for TypeAliasDecl
    function Wrap(out D: TTypeAliasDeclW): Boolean;
  end;

  { TagDeclHelper }

  TagDeclHelper = type helper for TagDecl
    function Wrap(out D: TTagDeclW): Boolean;
  end;

  { EnumDeclHelper }

  EnumDeclHelper = type helper for EnumDecl
    function Wrap(out D: TEnumDeclW): Boolean;
  end;

  { RecordDeclHelper }

  RecordDeclHelper = type helper for RecordDecl
    function Wrap(out D: TRecordDeclW): Boolean;
  end;

  { FileScopeAsmDeclHelper }

  FileScopeAsmDeclHelper = type helper for FileScopeAsmDecl
    function Wrap(out D: TFileScopeAsmDeclW): Boolean;
  end;

  { BlockDeclHelper }

  BlockDeclHelper = type helper for BlockDecl
    function Wrap(out D: TBlockDeclW): Boolean;
  end;

  { CapturedDeclHelper }

  CapturedDeclHelper = type helper for CapturedDecl
    function Wrap(out D: TCapturedDeclW): Boolean;
  end;

  { ImportDeclHelper }

  ImportDeclHelper = type helper for ImportDecl
    function Wrap(out D: TImportDeclW): Boolean;
  end;

  { ExportDeclHelper }

  ExportDeclHelper = type helper for ExportDecl
    function Wrap(out D: TExportDeclW): Boolean;
  end;

  { EmptyDeclHelper }

  EmptyDeclHelper = type helper for EmptyDecl
    function Wrap(out D: TEmptyDeclW): Boolean;
  end;

{$endregion 'Helper'}

implementation

{$region 'TTranslationUnitDeclW'}

class function TTranslationUnitDeclW.Create(const aDecl: TranslationUnitDecl;
  out oDecl: TTranslationUnitDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TTranslationUnitDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TranslationUnitDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTranslationUnitDeclW.getASTContext: ASTContext;
begin
  Result := clangExt_TranslationUnitDecl_getASTContext(Self.D);
end;

function TTranslationUnitDeclW.getAnonymousNamespace: NamespaceDecl;
begin
  Result := clangExt_TranslationUnitDecl_getAnonymousNamespace(Self.D);
end;

class function TTranslationUnitDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TranslationUnitDecl_classof(aDecl.D);
end;

class function TTranslationUnitDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TranslationUnitDecl_classofKind(K);
end;

function TTranslationUnitDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_TranslationUnitDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TTranslationUnitDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TTranslationUnitDeclW): Boolean;
begin
  Result := clangExt_TranslationUnitDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

{$endregion 'TTranslationUnitDeclW'}

{$region 'TPragmaCommentDeclW'}

class function TPragmaCommentDeclW.Create(const aDecl: PragmaCommentDecl; out
  oDecl: TPragmaCommentDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TPragmaCommentDeclW);
  if (not Assigned(aDecl)) or (not clangExt_PragmaCommentDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TPragmaCommentDeclW.getCommentKind: PragmaMSCommentKind;
begin
  Result := clangExt_PragmaCommentDecl_getCommentKind(Self.D);
end;

function TPragmaCommentDeclW.getArg: string;
begin
  Result := clangExt_PragmaCommentDecl_getArg(Self.D).ToString;
end;

class function TPragmaCommentDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_PragmaCommentDecl_classof(aDecl.D);
end;

class function TPragmaCommentDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_PragmaCommentDecl_classofKind(K);
end;

{$endregion 'TPragmaCommentDeclW'}

{$region 'TPragmaDetectMismatchDeclW'}

class function TPragmaDetectMismatchDeclW.Create(
  const aDecl: PragmaDetectMismatchDecl; out oDecl: TPragmaDetectMismatchDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TPragmaDetectMismatchDeclW);
  if (not Assigned(aDecl)) or (not clangExt_PragmaDetectMismatchDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TPragmaDetectMismatchDeclW.getName: string;
begin
  Result := clangExt_PragmaDetectMismatchDecl_getName(Self.D).ToString;
end;

function TPragmaDetectMismatchDeclW.getValue: string;
begin
  Result := clangExt_PragmaDetectMismatchDecl_getValue(Self.D).ToString;
end;

class function TPragmaDetectMismatchDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_PragmaDetectMismatchDecl_classof(aDecl.D);
end;

class function TPragmaDetectMismatchDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_PragmaDetectMismatchDecl_classofKind(K);
end;

{$endregion 'TPragmaDetectMismatchDeclW'}

{$region 'TExternCContextDeclW'}

class function TExternCContextDeclW.Create(const aDecl: ExternCContextDecl; out
  oDecl: TExternCContextDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TExternCContextDeclW);
  if (not Assigned(aDecl)) or (not clangExt_ExternCContextDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

class function TExternCContextDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_ExternCContextDecl_classof(aDecl.D);
end;

class function TExternCContextDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_ExternCContextDecl_classofKind(K);
end;

function TExternCContextDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_ExternCContextDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TExternCContextDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TExternCContextDeclW): Boolean;
begin
  Result := clangExt_ExternCContextDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

{$endregion 'TExternCContextDeclW'}

{$region 'TNamedDeclW'}

class function TNamedDeclW.Create(const aDecl: NamedDecl; out oDecl: TNamedDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TNamedDeclW);
  if (not Assigned(aDecl)) or (not clangExt_NamedDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TNamedDeclW.getIdentifier: IdentifierInfo;
begin
  Result := clangExt_NamedDecl_getIdentifier(D);
end;

function TNamedDeclW.getName: string;
begin
  Result := clangExt_NamedDecl_getName(D).ToString;
end;

function TNamedDeclW.getNameAsString: string;
begin
  Result := clangExt_NamedDecl_getNameAsString(Self.D).ToString;
end;

function TNamedDeclW.getDeclName: CXDeclarationName;
begin
  Result := clangExt_NamedDecl_getDeclName(D);
end;

function TNamedDeclW.getQualifiedNameAsString: string;
begin
  Result := clangExt_NamedDecl_getQualifiedNameAsString(D).ToString;
end;

function TNamedDeclW.hasLinkage: Boolean;
begin
  Result := clangExt_NamedDecl_hasLinkage(D);
end;

function TNamedDeclW.isCXXClassMember: Boolean;
begin
  Result := clangExt_NamedDecl_isCXXClassMember(D);
end;

function TNamedDeclW.isCXXInstanceMember: Boolean;
begin
  Result := clangExt_NamedDecl_isCXXInstanceMember(D);
end;

function TNamedDeclW.isReserved(const LangOpts: LangOptions
  ): ReservedIdentifierStatus;
begin
  Result := clangExt_NamedDecl_isReserved(Self.D, LangOpts);
end;

function TNamedDeclW.getLinkageInternal: Linkage;
begin
  Result := clangExt_NamedDecl_getLinkageInternal(D);
end;

function TNamedDeclW.getFormalLinkage: Linkage;
begin
  Result := clangExt_NamedDecl_getFormalLinkage(D);
end;

function TNamedDeclW.hasExternalFormalLinkage: Boolean;
begin
  Result := clangExt_NamedDecl_hasExternalFormalLinkage(D);
end;

function TNamedDeclW.isExternallyVisible: Boolean;
begin
  Result := clangExt_NamedDecl_isExternallyVisible(D);
end;

function TNamedDeclW.isExternallyDeclarable: Boolean;
begin
  Result := clangExt_NamedDecl_isExternallyDeclarable(D);
end;

function TNamedDeclW.getVisibility: Visibility;
begin
  Result := clangExt_NamedDecl_getVisibility(D);
end;

function TNamedDeclW.isLinkageValid: Boolean;
begin
  Result := clangExt_NamedDecl_isLinkageValid(D);
end;

function TNamedDeclW.hasLinkageBeenComputed: Boolean;
begin
  Result := clangExt_NamedDecl_hasLinkageBeenComputed(D);
end;

function TNamedDeclW.getUnderlyingDecl: TNamedDeclW;
begin
  clangExt_NamedDecl_getUnderlyingDecl(Self.D).Wrap(Result);
end;

function TNamedDeclW.getMostRecentDecl: TNamedDeclW;
begin
  clangExt_NamedDecl_getMostRecentDecl(Self.D).Wrap(Result);
end;

class function TNamedDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_NamedDecl_classof(aDecl.D);
end;

class function TNamedDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_NamedDecl_classofKind(K);
end;

{$endregion 'TNamedDeclW'}
                  
{$region 'TValueDeclW'}

class function TValueDeclW.Create(const aDecl: ValueDecl; out oDecl: TValueDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TValueDeclW);
  if (not Assigned(aDecl)) or (not clangExt_ValueDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TValueDeclW.getType: CXQualType;
begin
  Result := clangExt_ValueDecl_getType(D);
end;

function TValueDeclW.isWeak: Boolean;
begin
  Result := clangExt_ValueDecl_isWeak(D);
end;

class function TValueDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_ValueDecl_classof(aDecl.D);
end;

class function TValueDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_ValueDecl_classofKind(K);
end;
       
{$endregion 'TValueDeclW'}

{$region 'TDeclaratorDeclW'}

class function TDeclaratorDeclW.Create(const aDecl: DeclaratorDecl; out
  oDecl: TDeclaratorDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TDeclaratorDeclW);
  if (not Assigned(aDecl)) or (not clangExt_DeclaratorDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TDeclaratorDeclW.getTypeSourceInfo: TypeSourceInfo;
begin
  Result := clangExt_DeclaratorDecl_getTypeSourceInfo(D);
end;

function TDeclaratorDeclW.getInnerLocStart: CXSourceLocation;
begin
  Result := clangExt_DeclaratorDecl_getInnerLocStart(D);
end;

function TDeclaratorDeclW.getOuterLocStart: CXSourceLocation;
begin
  Result := clangExt_DeclaratorDecl_getOuterLocStart(D);
end;

function TDeclaratorDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_DeclaratorDecl_getSourceRange(D);
end;

function TDeclaratorDeclW.getBeginLoc: CXSourceLocation;
begin
  Result := clangExt_DeclaratorDecl_getBeginLoc(D);
end;

function TDeclaratorDeclW.getQualifier: NestedNameSpecifier;
begin
  Result := clangExt_DeclaratorDecl_getQualifier(D);
end;

function TDeclaratorDeclW.getTrailingRequiresClause: Expr;
begin
  Result := clangExt_DeclaratorDecl_getTrailingRequiresClause(D);
end;

function TDeclaratorDeclW.getNumTemplateParameterLists: Cardinal;
begin
  Result := clangExt_DeclaratorDecl_getNumTemplateParameterLists(D);
end;

function TDeclaratorDeclW.getTemplateParameterList(index: Cardinal
  ): TemplateParameterList;
begin
  Result := clangExt_DeclaratorDecl_getTemplateParameterList(D, index);
end;

function TDeclaratorDeclW.getTypeSpecStartLoc: CXSourceLocation;
begin
  Result := clangExt_DeclaratorDecl_getTypeSpecStartLoc(D);
end;

function TDeclaratorDeclW.getTypeSpecEndLoc: CXSourceLocation;
begin
  Result := clangExt_DeclaratorDecl_getTypeSpecEndLoc(D);
end;

class function TDeclaratorDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_DeclaratorDecl_classof(aDecl.D);
end;

class function TDeclaratorDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_DeclaratorDecl_classofKind(K);
end;
      
{$endregion 'TDeclaratorDeclW'}

{$region 'TEvaluatedStmtHelper'}

function TEvaluatedStmtHelper.WasEvaluated: Boolean;
begin
  Result := clangExt_EvaluatedStmt_WasEvaluated(Self);
end;

function TEvaluatedStmtHelper.IsEvaluating: Boolean;
begin
  Result := clangExt_EvaluatedStmt_IsEvaluating(Self);
end;

function TEvaluatedStmtHelper.HasConstantInitialization: Boolean;
begin
  Result := clangExt_EvaluatedStmt_HasConstantInitialization(Self);
end;

function TEvaluatedStmtHelper.HasConstantDestruction: Boolean;
begin
  Result := clangExt_EvaluatedStmt_HasConstantDestruction(Self);
end;

function TEvaluatedStmtHelper.HasICEInit: Boolean;
begin
  Result := clangExt_EvaluatedStmt_HasICEInit(Self);
end;

function TEvaluatedStmtHelper.CheckedForICEInit: Boolean;
begin
  Result := clangExt_EvaluatedStmt_CheckedForICEInit(Self);
end;

function TEvaluatedStmtHelper.GetValue: Stmt;
begin
  Result := clangExt_EvaluatedStmt_GetValue(Self);
end;

function TEvaluatedStmtHelper.GetEvaluated: APValue;
begin
  Result := clangExt_EvaluatedStmt_GetEvaluated(Self);
end;

{$endregion 'TEvaluatedStmtHelper'}

{$region 'TVarDeclW'}

class function TVarDeclW.Create(const aDecl: VarDecl; out oDecl: TVarDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TVarDeclW);
  if (not Assigned(aDecl)) or (not clangExt_VarDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TVarDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_VarDecl_getSourceRange(D);
end;

function TVarDeclW.getStorageClass: StorageClass;
begin
  Result := clangExt_VarDecl_getStorageClass(D);
end;

function TVarDeclW.getTSCSpec: ThreadStorageClassSpecifier;
begin
  Result := clangExt_VarDecl_getTSCSpec(D);
end;

function TVarDeclW.getTLSKind: CX_VarDecl_TLSKind;
begin
  Result := clangExt_VarDecl_getTLSKind(D);
end;

function TVarDeclW.hasLocalStorage: Boolean;
begin
  Result := clangExt_VarDecl_hasLocalStorage(D);
end;

function TVarDeclW.isStaticLocal: Boolean;
begin
  Result := clangExt_VarDecl_isStaticLocal(D);
end;

function TVarDeclW.hasExternalStorage: Boolean;
begin
  Result := clangExt_VarDecl_hasExternalStorage(D);
end;

function TVarDeclW.hasGlobalStorage: Boolean;
begin
  Result := clangExt_VarDecl_hasGlobalStorage(D);
end;

function TVarDeclW.getStorageDuration: StorageDuration;
begin
  Result := clangExt_VarDecl_getStorageDuration(D);
end;

function TVarDeclW.getLanguageLinkage: LanguageLinkage;
begin
  Result := clangExt_VarDecl_getLanguageLinkage(D);
end;

function TVarDeclW.isExternC: Boolean;
begin
  Result := clangExt_VarDecl_isExternC(D);
end;

function TVarDeclW.isInExternCContext: Boolean;
begin
  Result := clangExt_VarDecl_isInExternCContext(D);
end;

function TVarDeclW.isInExternCXXContext: Boolean;
begin
  Result := clangExt_VarDecl_isInExternCXXContext(D);
end;

function TVarDeclW.isLocalVarDecl: Boolean;
begin
  Result := clangExt_VarDecl_isLocalVarDecl(D);
end;

function TVarDeclW.isLocalVarDeclOrParm: Boolean;
begin
  Result := clangExt_VarDecl_isLocalVarDeclOrParm(D);
end;

function TVarDeclW.isFunctionOrMethodVarDecl: Boolean;
begin
  Result := clangExt_VarDecl_isFunctionOrMethodVarDecl(D);
end;

function TVarDeclW.isStaticDataMember: Boolean;
begin
  Result := clangExt_VarDecl_isStaticDataMember(D);
end;

function TVarDeclW.getCanonicalDecl: TVarDeclW;
begin
  TVarDeclW.Create(clangExt_VarDecl_getCanonicalDecl(D), Result);
end;

function TVarDeclW.isThisDeclarationADefinition: CX_VarDecl_DefinitionKind;
begin
  Result := clangExt_VarDecl_isThisDeclarationADefinition(D);
end;

function TVarDeclW.hasDefinition: CX_VarDecl_DefinitionKind;
begin
  Result := clangExt_VarDecl_hasDefinition(D);
end;

function TVarDeclW.getActingDefinition: TVarDeclW;
begin
  TVarDeclW.Create(clangExt_VarDecl_getActingDefinition(D), Result);
end;

function TVarDeclW.getDefinition: TVarDeclW;
begin
  TVarDeclW.Create(clangExt_VarDecl_getDefinition(D), Result);
end;

function TVarDeclW.isOutOfLine: Boolean;
begin
  Result := clangExt_VarDecl_isOutOfLine(D);
end;

function TVarDeclW.isFileVarDecl: Boolean;
begin
  Result := clangExt_VarDecl_isFileVarDecl(D);
end;

function TVarDeclW.getAnyInitializer: Expr;
begin
  Result := clangExt_VarDecl_getAnyInitializer(D);
end;

function TVarDeclW.hasInit: Boolean;
begin
  Result := clangExt_VarDecl_hasInit(D);
end;

function TVarDeclW.getInit: Expr;
begin
  Result := clangExt_VarDecl_getInit(D);
end;

function TVarDeclW.getInitAddress: PStmt;
begin
  Result := clangExt_VarDecl_getInitAddress(D);
end;

function TVarDeclW.getInitializingDeclaration: TVarDeclW;
begin
  TVarDeclW.Create(clangExt_VarDecl_getInitializingDeclaration(D), Result);
end;

function TVarDeclW.mightBeUsableInConstantExpressions(const C: ASTContext
  ): Boolean;
begin
  Result := clangExt_VarDecl_mightBeUsableInConstantExpressions(D, C);
end;

function TVarDeclW.isUsableInConstantExpressions(const C: ASTContext): Boolean;
begin
  Result := clangExt_VarDecl_isUsableInConstantExpressions(D, C);
end;

function TVarDeclW.ensureEvaluatedStmt: EvaluatedStmt;
begin
  Result := clangExt_VarDecl_ensureEvaluatedStmt(D);
end;

function TVarDeclW.getEvaluatedStmt: EvaluatedStmt;
begin
  Result := clangExt_VarDecl_getEvaluatedStmt(D);
end;

function TVarDeclW.evaluateValue: APValue;
begin
  Result := clangExt_VarDecl_evaluateValue(D);
end;

function TVarDeclW.getEvaluatedValue: APValue;
begin
  Result := clangExt_VarDecl_getEvaluatedValue(D);
end;

function TVarDeclW.hasConstantInitialization: Boolean;
begin
  Result := clangExt_VarDecl_hasConstantInitialization(D);
end;

function TVarDeclW.getInitStyle: CX_VarDecl_InitializationStyle;
begin
  Result := clangExt_VarDecl_getInitStyle(D);
end;

function TVarDeclW.isDirectInit: Boolean;
begin
  Result := clangExt_VarDecl_isDirectInit(D);
end;

function TVarDeclW.isThisDeclarationADemotedDefinition: Boolean;
begin
  Result := clangExt_VarDecl_isThisDeclarationADemotedDefinition(D);
end;

function TVarDeclW.isExceptionVariable: Boolean;
begin
  Result := clangExt_VarDecl_isExceptionVariable(D);
end;

function TVarDeclW.isNRVOVariable: Boolean;
begin
  Result := clangExt_VarDecl_isNRVOVariable(D);
end;

function TVarDeclW.isCXXForRangeDecl: Boolean;
begin
  Result := clangExt_VarDecl_isCXXForRangeDecl(D);
end;

function TVarDeclW.isObjCForDecl: Boolean;
begin
  Result := clangExt_VarDecl_isObjCForDecl(D);
end;

function TVarDeclW.isARCPseudoStrong: Boolean;
begin
  Result := clangExt_VarDecl_isARCPseudoStrong(D);
end;

function TVarDeclW.isInline: Boolean;
begin
  Result := clangExt_VarDecl_isInline(D);
end;

function TVarDeclW.isInlineSpecified: Boolean;
begin
  Result := clangExt_VarDecl_isInlineSpecified(D);
end;

function TVarDeclW.isConstexpr: Boolean;
begin
  Result := clangExt_VarDecl_isConstexpr(D);
end;

function TVarDeclW.isInitCapture: Boolean;
begin
  Result := clangExt_VarDecl_isInitCapture(D);
end;

function TVarDeclW.isParameterPack: Boolean;
begin
  Result := clangExt_VarDecl_isParameterPack(D);
end;

function TVarDeclW.isPreviousDeclInSameBlockScope: Boolean;
begin
  Result := clangExt_VarDecl_isPreviousDeclInSameBlockScope(D);
end;

function TVarDeclW.isEscapingByref: Boolean;
begin
  Result := clangExt_VarDecl_isEscapingByref(D);
end;

function TVarDeclW.isNonEscapingByref: Boolean;
begin
  Result := clangExt_VarDecl_isNonEscapingByref(D);
end;

function TVarDeclW.hasDependentAlignment: Boolean;
begin
  Result := clangExt_VarDecl_hasDependentAlignment(D);
end;

function TVarDeclW.getTemplateInstantiationPattern: TVarDeclW;
begin
  clangExt_VarDecl_getTemplateInstantiationPattern(D).Wrap(Result);
end;

function TVarDeclW.getInstantiatedFromStaticDataMember: TVarDeclW;
begin
  clangExt_VarDecl_getInstantiatedFromStaticDataMember(D).Wrap(Result);
end;

function TVarDeclW.getTemplateSpecializationKind: TemplateSpecializationKind;
begin
  Result := clangExt_VarDecl_getTemplateSpecializationKind(D);
end;

function TVarDeclW.getTemplateSpecializationKindForInstantiation: TemplateSpecializationKind;
begin
  Result := clangExt_VarDecl_getTemplateSpecializationKindForInstantiation(D);
end;

function TVarDeclW.getPointOfInstantiation: CXSourceLocation;
begin
  Result := clangExt_VarDecl_getPointOfInstantiation(D);
end;

function TVarDeclW.getMemberSpecializationInfo: MemberSpecializationInfo;
begin
  Result := clangExt_VarDecl_getMemberSpecializationInfo(D);
end;

function TVarDeclW.getDescribedVarTemplate: VarTemplateDecl;
begin
  Result := clangExt_VarDecl_getDescribedVarTemplate(D);
end;

function TVarDeclW.isKnownToBeDefined: Boolean;
begin
  Result := clangExt_VarDecl_isKnownToBeDefined(D);
end;

function TVarDeclW.isNoDestroy(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_VarDecl_isNoDestroy(D, Ctx);
end;

function TVarDeclW.needsDestruction(const Ctx: ASTContext): QualType_DestructionKind;
begin
  Result := clangExt_VarDecl_needsDestruction(D, Ctx);
end;

function TVarDeclW.hasFlexibleArrayInit(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_VarDecl_hasFlexibleArrayInit(D, Ctx);
end;

class function TVarDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_VarDecl_classof(aDecl.D);
end;

class function TVarDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_VarDecl_classofKind(K);
end;

function TVarDeclW.getMangling: string;
begin
  Result := clangExt_VarDecl_getMangling(Self.D).ToString;
end;

{$endregion 'TVarDeclW'}

{$region 'TParmVarDeclW'}

class function TParmVarDeclW.Create(const aDecl: ParmVarDecl; out
  oDecl: TParmVarDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TParmVarDeclW);
  if (not Assigned(aDecl)) or (not clangExt_ParmVarDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TParmVarDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_ParmVarDecl_getSourceRange(D);
end;

function TParmVarDeclW.isObjCMethodParameter: Boolean;
begin
  Result := clangExt_ParmVarDecl_isObjCMethodParameter(D);
end;

function TParmVarDeclW.isDestroyedInCallee: Boolean;
begin
  Result := clangExt_ParmVarDecl_isDestroyedInCallee(D);
end;

function TParmVarDeclW.getFunctionScopeDepth: Cardinal;
begin
  Result := clangExt_ParmVarDecl_getFunctionScopeDepth(D);
end;

function TParmVarDeclW.getFunctionScopeIndex: Cardinal;
begin
  Result := clangExt_ParmVarDecl_getFunctionScopeIndex(D);
end;

function TParmVarDeclW.getObjCDeclQualifier: CX_Decl_ObjCDeclQualifier;
begin
  Result := clangExt_ParmVarDecl_getObjCDeclQualifier(D);
end;

function TParmVarDeclW.isKNRPromoted: Boolean;
begin
  Result := clangExt_ParmVarDecl_isKNRPromoted(D);
end;

function TParmVarDeclW.getDefaultArg: Expr;
begin
  Result := clangExt_ParmVarDecl_getDefaultArg(D);
end;

function TParmVarDeclW.getDefaultArgRange: CXSourceRange;
begin
  Result := clangExt_ParmVarDecl_getDefaultArgRange(D);
end;

function TParmVarDeclW.getUninstantiatedDefaultArg: Expr;
begin
  Result := clangExt_ParmVarDecl_getUninstantiatedDefaultArg(D);
end;

function TParmVarDeclW.hasDefaultArg: Boolean;
begin
  Result := clangExt_ParmVarDecl_hasDefaultArg(D);
end;

function TParmVarDeclW.hasUnparsedDefaultArg: Boolean;
begin
  Result := clangExt_ParmVarDecl_hasUnparsedDefaultArg(D);
end;

function TParmVarDeclW.hasUninstantiatedDefaultArg: Boolean;
begin
  Result := clangExt_ParmVarDecl_hasUninstantiatedDefaultArg(D);
end;

function TParmVarDeclW.hasInheritedDefaultArg: Boolean;
begin
  Result := clangExt_ParmVarDecl_hasInheritedDefaultArg(D);
end;

function TParmVarDeclW.getOriginalType: CXQualType;
begin
  Result := clangExt_ParmVarDecl_getOriginalType(D);
end;

class function TParmVarDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_ParmVarDecl_classof(aDecl.D);
end;

class function TParmVarDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_ParmVarDecl_classofKind(K);
end;
   
{$endregion 'TParmVarDeclW'}

{$region 'TFunctionDeclW'}

class function TFunctionDeclW.Create(const aDecl: FunctionDecl; out
  oDecl: TFunctionDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TFunctionDeclW);
  if (not Assigned(aDecl)) or (not clangExt_FunctionDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TFunctionDeclW.getEllipsisLoc: CXSourceLocation;
begin
  Result := clangExt_FunctionDecl_getEllipsisLoc(D);
end;

function TFunctionDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_FunctionDecl_getSourceRange(D);
end;

function TFunctionDeclW.hasBody: Boolean;
begin
  Result := clangExt_FunctionDecl_hasBody(D);
end;

function TFunctionDeclW.hasTrivialBody: Boolean;
begin
  Result := clangExt_FunctionDecl_hasTrivialBody(D);
end;

function TFunctionDeclW.isDefined: Boolean;
begin
  Result := clangExt_FunctionDecl_isDefined(D);
end;

function TFunctionDeclW.getDefinition: TFunctionDeclW;
begin
  TFunctionDeclW.Create(clangExt_FunctionDecl_getDefinition(D), Result);
end;

function TFunctionDeclW.getBody: Stmt;
begin
  Result := clangExt_FunctionDecl_getBody(D);
end;

function TFunctionDeclW.isThisDeclarationADefinition: Boolean;
begin
  Result := clangExt_FunctionDecl_isThisDeclarationADefinition(D);
end;

function TFunctionDeclW.isThisDeclarationInstantiatedFromAFriendDefinition: Boolean;
begin
  Result := clangExt_FunctionDecl_isThisDeclarationInstantiatedFromAFriendDefinition(D);
end;

function TFunctionDeclW.doesThisDeclarationHaveABody: Boolean;
begin
  Result := clangExt_FunctionDecl_doesThisDeclarationHaveABody(D);
end;

function TFunctionDeclW.isVariadic: Boolean;
begin
  Result := clangExt_FunctionDecl_isVariadic(D);
end;

function TFunctionDeclW.isVirtualAsWritten: Boolean;
begin
  Result := clangExt_FunctionDecl_isVirtualAsWritten(D);
end;

function TFunctionDeclW.isPure: Boolean;
begin
  Result := clangExt_FunctionDecl_isPure(D);
end;

function TFunctionDeclW.isLateTemplateParsed: Boolean;
begin
  Result := clangExt_FunctionDecl_isLateTemplateParsed(D);
end;

function TFunctionDeclW.isTrivial: Boolean;
begin
  Result := clangExt_FunctionDecl_isTrivial(D);
end;

function TFunctionDeclW.isTrivialForCall: Boolean;
begin
  Result := clangExt_FunctionDecl_isTrivialForCall(D);
end;

function TFunctionDeclW.isDefaulted: Boolean;
begin
  Result := clangExt_FunctionDecl_isDefaulted(D);
end;

function TFunctionDeclW.isExplicitlyDefaulted: Boolean;
begin
  Result := clangExt_FunctionDecl_isExplicitlyDefaulted(D);
end;

function TFunctionDeclW.isUserProvided: Boolean;
begin
  Result := clangExt_FunctionDecl_isUserProvided(D);
end;

function TFunctionDeclW.hasImplicitReturnZero: Boolean;
begin
  Result := clangExt_FunctionDecl_hasImplicitReturnZero(D);
end;

function TFunctionDeclW.hasPrototype: Boolean;
begin
  Result := clangExt_FunctionDecl_hasPrototype(D);
end;

function TFunctionDeclW.hasWrittenPrototype: Boolean;
begin
  Result := clangExt_FunctionDecl_hasWrittenPrototype(D);
end;

function TFunctionDeclW.hasInheritedPrototype: Boolean;
begin
  Result := clangExt_FunctionDecl_hasInheritedPrototype(D);
end;

function TFunctionDeclW.isConstexpr: Boolean;
begin
  Result := clangExt_FunctionDecl_isConstexpr(D);
end;

function TFunctionDeclW.getConstexprKind: ConstexprSpecKind;
begin
  Result := clangExt_FunctionDecl_getConstexprKind(D);
end;

function TFunctionDeclW.isConstexprSpecified: Boolean;
begin
  Result := clangExt_FunctionDecl_isConstexprSpecified(D);
end;

function TFunctionDeclW.isConsteval: Boolean;
begin
  Result := clangExt_FunctionDecl_isConsteval(D);
end;

function TFunctionDeclW.instantiationIsPending: Boolean;
begin
  Result := clangExt_FunctionDecl_instantiationIsPending(D);
end;

function TFunctionDeclW.usesSEHTry: Boolean;
begin
  Result := clangExt_FunctionDecl_usesSEHTry(D);
end;

function TFunctionDeclW.isDeleted: Boolean;
begin
  Result := clangExt_FunctionDecl_isDeleted(D);
end;

function TFunctionDeclW.isDeletedAsWritten: Boolean;
begin
  Result := clangExt_FunctionDecl_isDeletedAsWritten(D);
end;

function TFunctionDeclW.isMain: Boolean;
begin
  Result := clangExt_FunctionDecl_isMain(D);
end;

function TFunctionDeclW.isMSVCRTEntryPoint: Boolean;
begin
  Result := clangExt_FunctionDecl_isMSVCRTEntryPoint(D);
end;

function TFunctionDeclW.isReservedGlobalPlacementOperator: Boolean;
begin
  Result := clangExt_FunctionDecl_isReservedGlobalPlacementOperator(D);
end;

function TFunctionDeclW.isInlineBuiltinDeclaration: Boolean;
begin
  Result := clangExt_FunctionDecl_isInlineBuiltinDeclaration(D);
end;

function TFunctionDeclW.isDestroyingOperatorDelete: Boolean;
begin
  Result := clangExt_FunctionDecl_isDestroyingOperatorDelete(D);
end;

function TFunctionDeclW.getLanguageLinkage: LanguageLinkage;
begin
  Result := clangExt_FunctionDecl_getLanguageLinkage(D);
end;

function TFunctionDeclW.isExternC: Boolean;
begin
  Result := clangExt_FunctionDecl_isExternC(D);
end;

function TFunctionDeclW.isInExternCContext: Boolean;
begin
  Result := clangExt_FunctionDecl_isInExternCContext(D);
end;

function TFunctionDeclW.isInExternCXXContext: Boolean;
begin
  Result := clangExt_FunctionDecl_isInExternCXXContext(D);
end;

function TFunctionDeclW.isGlobal: Boolean;
begin
  Result := clangExt_FunctionDecl_isGlobal(D);
end;

function TFunctionDeclW.isNoReturn: Boolean;
begin
  Result := clangExt_FunctionDecl_isNoReturn(D);
end;

function TFunctionDeclW.hasSkippedBody: Boolean;
begin
  Result := clangExt_FunctionDecl_hasSkippedBody(D);
end;

function TFunctionDeclW.willHaveBody: Boolean;
begin
  Result := clangExt_FunctionDecl_willHaveBody(D);
end;

function TFunctionDeclW.isMultiVersion: Boolean;
begin
  Result := clangExt_FunctionDecl_isMultiVersion(D);
end;

function TFunctionDeclW.getMultiVersionKind: MultiVersionKind;
begin
  Result := clangExt_FunctionDecl_getMultiVersionKind(D);
end;

function TFunctionDeclW.isCPUDispatchMultiVersion: Boolean;
begin
  Result := clangExt_FunctionDecl_isCPUDispatchMultiVersion(D);
end;

function TFunctionDeclW.isCPUSpecificMultiVersion: Boolean;
begin
  Result := clangExt_FunctionDecl_isCPUSpecificMultiVersion(D);
end;

function TFunctionDeclW.isTargetMultiVersion: Boolean;
begin
  Result := clangExt_FunctionDecl_isTargetMultiVersion(D);
end;

function TFunctionDeclW.isTargetClonesMultiVersion: Boolean;
begin
  Result := clangExt_FunctionDecl_isTargetClonesMultiVersion(D);
end;

function TFunctionDeclW.getCanonicalDecl: TFunctionDeclW;
begin
  clangExt_FunctionDecl_getCanonicalDecl(D).Wrap(Result);
end;

function TFunctionDeclW.getBuiltinID(ConsiderWrapperFunctions: Boolean
  ): Cardinal;
begin
  Result := clangExt_FunctionDecl_getBuiltinID(D, ConsiderWrapperFunctions);
end;

function TFunctionDeclW.param_empty: Boolean;
begin
  Result := clangExt_FunctionDecl_param_empty(D);
end;

function TFunctionDeclW.param_size: SIZE_T;
begin
  Result := clangExt_FunctionDecl_param_size(D);
end;

function TFunctionDeclW.getNumParams: Cardinal;
begin
  Result := clangExt_FunctionDecl_getNumParams(D);
end;

function TFunctionDeclW.getParamDecl(i: Cardinal): TParmVarDeclW;
begin
  TParmVarDeclW.Create(clangExt_FunctionDecl_getParamDecl(D, i), Result);
end;

function TFunctionDeclW.getMinRequiredArguments: Cardinal;
begin
  Result := clangExt_FunctionDecl_getMinRequiredArguments(D);
end;

function TFunctionDeclW.hasOneParamOrDefaultArgs: Boolean;
begin
  Result := clangExt_FunctionDecl_hasOneParamOrDefaultArgs(D);
end;

function TFunctionDeclW.getFunctionTypeLoc: FunctionTypeLoc;
begin
  Result := clangExt_FunctionDecl_getFunctionTypeLoc(D);
end;

function TFunctionDeclW.getReturnType: CXQualType;
begin
  Result := clangExt_FunctionDecl_getReturnType(D);
end;

function TFunctionDeclW.getReturnTypeSourceRange: CXSourceRange;
begin
  Result := clangExt_FunctionDecl_getReturnTypeSourceRange(D);
end;

function TFunctionDeclW.getParametersSourceRange: CXSourceRange;
begin
  Result := clangExt_FunctionDecl_getParametersSourceRange(D);
end;

function TFunctionDeclW.getDeclaredReturnType: CXQualType;
begin
  Result := clangExt_FunctionDecl_getDeclaredReturnType(D);
end;

function TFunctionDeclW.getExceptionSpecType: ExceptionSpecificationType;
begin
  Result := clangExt_FunctionDecl_getExceptionSpecType(D);
end;

function TFunctionDeclW.getExceptionSpecSourceRange: CXSourceRange;
begin
  Result := clangExt_FunctionDecl_getExceptionSpecSourceRange(D);
end;

function TFunctionDeclW.getCallResultType: CXQualType;
begin
  Result := clangExt_FunctionDecl_getCallResultType(D);
end;

function TFunctionDeclW.getStorageClass: StorageClass;
begin
  Result := clangExt_FunctionDecl_getStorageClass(D);
end;

function TFunctionDeclW.isInlineSpecified: Boolean;
begin
  Result := clangExt_FunctionDecl_isInlineSpecified(D);
end;

function TFunctionDeclW.UsesFPIntrin: Boolean;
begin
  Result := clangExt_FunctionDecl_UsesFPIntrin(D);
end;

function TFunctionDeclW.isInlined: Boolean;
begin
  Result := clangExt_FunctionDecl_isInlined(D);
end;

function TFunctionDeclW.isInlineDefinitionExternallyVisible: Boolean;
begin
  Result := clangExt_FunctionDecl_isInlineDefinitionExternallyVisible(D);
end;

function TFunctionDeclW.isMSExternInline: Boolean;
begin
  Result := clangExt_FunctionDecl_isMSExternInline(D);
end;

function TFunctionDeclW.doesDeclarationForceExternallyVisibleDefinition: Boolean;
begin
  Result := clangExt_FunctionDecl_doesDeclarationForceExternallyVisibleDefinition(D);
end;

function TFunctionDeclW.isStatic: Boolean;
begin
  Result := clangExt_FunctionDecl_isStatic(D);
end;

function TFunctionDeclW.isOverloadedOperator: Boolean;
begin
  Result := clangExt_FunctionDecl_isOverloadedOperator(D);
end;

function TFunctionDeclW.getOverloadedOperator: OverloadedOperatorKind;
begin
  Result := clangExt_FunctionDecl_getOverloadedOperator(D);
end;

function TFunctionDeclW.getLiteralIdentifier: IdentifierInfo;
begin
  Result := clangExt_FunctionDecl_getLiteralIdentifier(D);
end;

function TFunctionDeclW.getInstantiatedFromMemberFunction: TFunctionDeclW;
begin
  TFunctionDeclW.Create(
    clangExt_FunctionDecl_getInstantiatedFromMemberFunction(D),
    Result
    );
end;

function TFunctionDeclW.getTemplatedKind: CX_FunctionDecl_TemplatedKind;
begin
  Result := clangExt_FunctionDecl_getTemplatedKind(D);
end;

function TFunctionDeclW.getMemberSpecializationInfo: MemberSpecializationInfo;
begin
  Result := clangExt_FunctionDecl_getMemberSpecializationInfo(D);
end;

function TFunctionDeclW.getDescribedFunctionTemplate: FunctionTemplateDecl;
begin
  Result := clangExt_FunctionDecl_getDescribedFunctionTemplate(D);
end;

function TFunctionDeclW.isFunctionTemplateSpecialization: Boolean;
begin
  Result := clangExt_FunctionDecl_isFunctionTemplateSpecialization(D);
end;

function TFunctionDeclW.getTemplateSpecializationInfo: FunctionTemplateSpecializationInfo;
begin
  Result := clangExt_FunctionDecl_getTemplateSpecializationInfo(D);
end;

function TFunctionDeclW.isImplicitlyInstantiable: Boolean;
begin
  Result := clangExt_FunctionDecl_isImplicitlyInstantiable(D);
end;

function TFunctionDeclW.isTemplateInstantiation: Boolean;
begin
  Result := clangExt_FunctionDecl_isTemplateInstantiation(D);
end;

function TFunctionDeclW.getTemplateInstantiationPattern(ForDefinition: Boolean
  ): TFunctionDeclW;
begin
  TFunctionDeclW.Create(
    clangExt_FunctionDecl_getTemplateInstantiationPattern(D, ForDefinition),
    Result
    );
end;

function TFunctionDeclW.getPrimaryTemplate: FunctionTemplateDecl;
begin
  Result := clangExt_FunctionDecl_getPrimaryTemplate(D);
end;

function TFunctionDeclW.getTemplateSpecializationArgs: TemplateArgumentList;
begin
  Result := clangExt_FunctionDecl_getTemplateSpecializationArgs(D);
end;

function TFunctionDeclW.getTemplateSpecializationArgsAsWritten: ASTTemplateArgumentListInfo;
begin
  Result := clangExt_FunctionDecl_getTemplateSpecializationArgsAsWritten(D);
end;

function TFunctionDeclW.getDependentSpecializationInfo: DependentFunctionTemplateSpecializationInfo;
begin
  Result := clangExt_FunctionDecl_getDependentSpecializationInfo(D);
end;

function TFunctionDeclW.getTemplateSpecializationKind: TemplateSpecializationKind;
begin
  Result := clangExt_FunctionDecl_getTemplateSpecializationKind(D);
end;

function TFunctionDeclW.getTemplateSpecializationKindForInstantiation: TemplateSpecializationKind;
begin
  Result := clangExt_FunctionDecl_getTemplateSpecializationKindForInstantiation(D);
end;

function TFunctionDeclW.getPointOfInstantiation: CXSourceLocation;
begin
  Result := clangExt_FunctionDecl_getPointOfInstantiation(D);
end;

function TFunctionDeclW.isOutOfLine: Boolean;
begin
  Result := clangExt_FunctionDecl_isOutOfLine(D);
end;

function TFunctionDeclW.getMemoryFunctionKind: Cardinal;
begin
  Result := clangExt_FunctionDecl_getMemoryFunctionKind(D);
end;

function TFunctionDeclW.getODRHash: Cardinal;
begin
  Result := clangExt_FunctionDecl_getODRHash(D);
end;

class function TFunctionDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_FunctionDecl_classof(aDecl.D);
end;

class function TFunctionDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_FunctionDecl_classofKind(K);
end;

function TFunctionDeclW.castToDeclContext(out DC: TDeclContextW): Boolean;
begin
  Result := clangExt_FunctionDecl_castToDeclContext(Self.D).Wrap(DC);
end;

class function TFunctionDeclW.castFromDeclContext(const DC: TDeclContextW; out
  aDecl: TFunctionDeclW): Boolean;
begin
  Result := clangExt_FunctionDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

function TFunctionDeclW.getMangling: string;
begin
  Result := clangExt_FunctionDecl_getMangling(Self.D).ToString;
end;
       
{$endregion 'TFunctionDeclW'}

{$region 'TFieldDeclW'}

class function TFieldDeclW.Create(const aDecl: FieldDecl; out oDecl: TFieldDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TFieldDeclW);
  if (not Assigned(aDecl)) or (not clangExt_FieldDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TFieldDeclW.getFieldIndex: Cardinal;
begin
  Result := clangExt_FieldDecl_getFieldIndex(D);
end;

function TFieldDeclW.isMutable: Boolean;
begin
  Result := clangExt_FieldDecl_isMutable(D);
end;

function TFieldDeclW.isBitField: Boolean;
begin
  Result := clangExt_FieldDecl_isBitField(D);
end;

function TFieldDeclW.isUnnamedBitfield: Boolean;
begin
  Result := clangExt_FieldDecl_isUnnamedBitfield(D);
end;

function TFieldDeclW.isAnonymousStructOrUnion: Boolean;
begin
  Result := clangExt_FieldDecl_isAnonymousStructOrUnion(D);
end;

function TFieldDeclW.getBitWidth: Expr;
begin
  Result := clangExt_FieldDecl_getBitWidth(D);
end;

function TFieldDeclW.getBitWidthValue(const Ctx: ASTContext): Cardinal;
var
  ctx_: ASTContext;
begin
  if not Assigned(Ctx) then
    ctx_ := Ctx
  else
    ctx_ := getASTContext;
  Result := clangExt_FieldDecl_getBitWidthValue(D, ctx_);
end;

function TFieldDeclW.isZeroLengthBitField(const Ctx: ASTContext): Boolean;
var
  ctx_: ASTContext;
begin
  if not Assigned(Ctx) then
    ctx_ := Ctx
  else
    ctx_ := getASTContext;
  Result := clangExt_FieldDecl_isZeroLengthBitField(D, ctx_);
end;

function TFieldDeclW.isZeroSize(const Ctx: ASTContext): Boolean;
var
  ctx_: ASTContext;
begin
  if not Assigned(Ctx) then
    ctx_ := Ctx
  else
    ctx_ := getASTContext;
  Result := clangExt_FieldDecl_isZeroSize(D, ctx_);
end;

function TFieldDeclW.getInClassInitStyle: InClassInitStyle;
begin
  Result := clangExt_FieldDecl_getInClassInitStyle(D);
end;

function TFieldDeclW.hasInClassInitializer: Boolean;
begin
  Result := clangExt_FieldDecl_hasInClassInitializer(D);
end;

function TFieldDeclW.getInClassInitializer: Expr;
begin
  Result := clangExt_FieldDecl_getInClassInitializer(D);
end;

function TFieldDeclW.hasCapturedVLAType: Boolean;
begin
  Result := clangExt_FieldDecl_hasCapturedVLAType(D);
end;

function TFieldDeclW.getCapturedVLAType: VariableArrayType;
begin
  Result := clangExt_FieldDecl_getCapturedVLAType(D);
end;

function TFieldDeclW.getParent: RecordDecl;
begin
  Result := clangExt_FieldDecl_getParent(D);
end;

function TFieldDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_FieldDecl_getSourceRange(D);
end;

class function TFieldDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_FieldDecl_classof(aDecl.D);
end;

class function TFieldDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_FieldDecl_classofKind(K);
end;
     
{$endregion 'TFieldDeclW'}
   
{$region 'TEnumConstantDeclW'}

class function TEnumConstantDeclW.Create(const aDecl: EnumConstantDecl; out
  oDecl: TEnumConstantDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TEnumConstantDeclW);
  if (not Assigned(aDecl)) or (not clangExt_EnumConstantDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TEnumConstantDeclW.getInitExpr: Expr;
begin
  Result := clangExt_EnumConstantDecl_getInitExpr(D);
end;

function TEnumConstantDeclW.getInitVal: TAPSIntW;
begin
  clangExt_EnumConstantDecl_getInitVal(D).Wrap(Result);
end;

function TEnumConstantDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_EnumConstantDecl_getSourceRange(D);
end;

function TEnumConstantDeclW.getCanonicalDecl: TEnumConstantDeclW;
begin
  TEnumConstantDeclW.Create(
    clangExt_EnumConstantDecl_getCanonicalDecl(D),
    Result
    );
end;

class function TEnumConstantDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_EnumConstantDecl_classof(aDecl.D);
end;

class function TEnumConstantDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_EnumConstantDecl_classofKind(K);
end;

{$endregion 'TEnumConstantDeclW'}

{$region 'TIndirectFieldDeclW'}

class function TIndirectFieldDeclW.Create(const aDecl: IndirectFieldDecl; out
  oDecl: TIndirectFieldDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TIndirectFieldDeclW);
  if (not Assigned(aDecl)) or (not clangExt_IndirectFieldDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TIndirectFieldDeclW.getChain(x: Cardinal): NamedDecl;
begin
  Result := clangExt_IndirectFieldDecl_getChain(D, x);
end;

function TIndirectFieldDeclW.getChainingSize: Cardinal;
begin
  Result := clangExt_IndirectFieldDecl_getChainingSize(D);
end;

function TIndirectFieldDeclW.getAnonField: TFieldDeclW;
begin
  TFieldDeclW.Create(
    clangExt_IndirectFieldDecl_getAnonField(D),
    Result
    );
end;

function TIndirectFieldDeclW.getVarDecl: TVarDeclW;
begin
  TVarDeclW.Create(
    clangExt_IndirectFieldDecl_getVarDecl(D),
    Result
    );
end;

function TIndirectFieldDeclW.getCanonicalDecl: TIndirectFieldDeclW;
begin
  TIndirectFieldDeclW.Create(
    clangExt_IndirectFieldDecl_getCanonicalDecl(D),
    Result
    );
end;

class function TIndirectFieldDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_IndirectFieldDecl_classof(aDecl.D);
end;

class function TIndirectFieldDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_IndirectFieldDecl_classofKind(K);
end;

{$endregion 'TIndirectFieldDeclW'}

{$region 'TTypeDeclW'}

class function TTypeDeclW.Create(const aDecl: TypeDecl; out oDecl: TTypeDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TTypeDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TypeDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTypeDeclW.getTypeForDecl: AstType;
begin
  Result := clangExt_TypeDecl_getTypeForDecl(D);
end;

function TTypeDeclW.getBeginLoc: CXSourceLocation;
begin
  Result := clangExt_TypeDecl_getBeginLoc(D);
end;

function TTypeDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_TypeDecl_getSourceRange(D);
end;

class function TTypeDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TypeDecl_classof(aDecl.D);
end;

class function TTypeDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TypeDecl_classofKind(K);
end;
       
{$endregion 'TTypeDeclW'}

{$region 'TTypedefNameDeclW'}

class function TTypedefNameDeclW.Create(const aDecl: TypedefNameDecl; out
  oDecl: TTypedefNameDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TTypedefNameDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TypedefNameDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTypedefNameDeclW.isModed: Boolean;
begin
  Result := clangExt_TypedefNameDecl_isModed(D);
end;

function TTypedefNameDeclW.getTypeSourceInfo: TypeSourceInfo;
begin
  Result := clangExt_TypedefNameDecl_getTypeSourceInfo(D);
end;

function TTypedefNameDeclW.getUnderlyingType: CXQualType;
begin
  Result := clangExt_TypedefNameDecl_getUnderlyingType(D);
end;

function TTypedefNameDeclW.getCanonicalDecl: TTypedefNameDeclW;
begin
  TTypedefNameDeclW.Create(
    clangExt_TypedefNameDecl_getCanonicalDecl(D),
    Result
    );
end;

function TTypedefNameDeclW.getAnonDeclWithTypedefName(AnyRedecl: Boolean
  ): TagDecl;
begin
  Result := clangExt_TypedefNameDecl_getAnonDeclWithTypedefName(D, AnyRedecl);
end;

function TTypedefNameDeclW.isTransparentTag: Boolean;
begin
  Result := clangExt_TypedefNameDecl_isTransparentTag(D);
end;

class function TTypedefNameDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TypedefNameDecl_classof(aDecl.D);
end;

class function TTypedefNameDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TypedefNameDecl_classofKind(K);
end;
     
{$endregion 'TTypedefNameDeclW'}

{$region 'TTypedefDeclW'}

class function TTypedefDeclW.Create(const aDecl: TypedefDecl; out
  oDecl: TTypedefDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TTypedefDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TypedefDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTypedefDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_TypedefDecl_getSourceRange(D);
end;

class function TTypedefDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TypedefDecl_classof(aDecl.D);
end;

class function TTypedefDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TypedefDecl_classofKind(K);
end;

{$endregion 'TTypedefDeclW'}

{$region 'TTypeAliasDeclW'}

class function TTypeAliasDeclW.Create(const aDecl: TypeAliasDecl; out
  oDecl: TTypeAliasDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TTypeAliasDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TypeAliasDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTypeAliasDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_TypeAliasDecl_getSourceRange(Self.D);
end;

function TTypeAliasDeclW.getDescribedAliasTemplate: TypeAliasTemplateDecl;
begin
  Result := clangExt_TypeAliasDecl_getDescribedAliasTemplate(Self.D);
end;

class function TTypeAliasDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TypeAliasDecl_classof(aDecl.D);
end;

class function TTypeAliasDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TypeAliasDecl_classofKind(K);
end;

{$endregion 'TTypeAliasDeclW'}

{$region 'TTagDeclW'}

class function TTagDeclW.Create(const aDecl: TagDecl; out oDecl: TTagDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TTagDeclW);
  if (not Assigned(aDecl)) or (not clangExt_TagDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TTagDeclW.getBraceRange: CXSourceRange;
begin
  Result := clangExt_TagDecl_getBraceRange(Self.D);
end;

function TTagDeclW.getInnerLocStart: CXSourceLocation;
begin
  Result := clangExt_TagDecl_getInnerLocStart(Self.D);
end;

function TTagDeclW.getOuterLocStart: CXSourceLocation;
begin
  Result := clangExt_TagDecl_getOuterLocStart(Self.D);
end;

function TTagDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_TagDecl_getSourceRange(Self.D);
end;

function TTagDeclW.getCanonicalDecl: TTagDeclW;
begin
  clangExt_TagDecl_getCanonicalDecl(Self.D).Wrap(Result);
end;

function TTagDeclW.isThisDeclarationADefinition: Boolean;
begin
  Result := clangExt_TagDecl_isThisDeclarationADefinition(Self.D);
end;

function TTagDeclW.isCompleteDefinition: Boolean;
begin
  Result := clangExt_TagDecl_isCompleteDefinition(Self.D);
end;

function TTagDeclW.isCompleteDefinitionRequired: Boolean;
begin
  Result := clangExt_TagDecl_isCompleteDefinitionRequired(Self.D);
end;

function TTagDeclW.isBeingDefined: Boolean;
begin
  Result := clangExt_TagDecl_isBeingDefined(Self.D);
end;

function TTagDeclW.isEmbeddedInDeclarator: Boolean;
begin
  Result := clangExt_TagDecl_isEmbeddedInDeclarator(Self.D);
end;

function TTagDeclW.isFreeStanding: Boolean;
begin
  Result := clangExt_TagDecl_isFreeStanding(Self.D);
end;

function TTagDeclW.mayHaveOutOfDateDef: Boolean;
begin
  Result := clangExt_TagDecl_mayHaveOutOfDateDef(Self.D);
end;

function TTagDeclW.isDependentType: Boolean;
begin
  Result := clangExt_TagDecl_isDependentType(Self.D);
end;

function TTagDeclW.isThisDeclarationADemotedDefinition: Boolean;
begin
  Result := clangExt_TagDecl_isThisDeclarationADemotedDefinition(Self.D);
end;

function TTagDeclW.getDefinition: TTagDeclW;
begin
  clangExt_TagDecl_getDefinition(Self.D).Wrap(Result);
end;

function TTagDeclW.getKindName: string;
begin
  Result := clangExt_TagDecl_getKindName(Self.D).ToString;
end;

function TTagDeclW.getTagKind: CX_TagDecl_TagKind;
begin
  Result := clangExt_TagDecl_getTagKind(Self.D);
end;

function TTagDeclW.isStruct: Boolean;
begin
  Result := clangExt_TagDecl_isStruct(Self.D);
end;

function TTagDeclW.isInterface: Boolean;
begin
  Result := clangExt_TagDecl_isInterface(Self.D);
end;

function TTagDeclW.isClass: Boolean;
begin
  Result := clangExt_TagDecl_isClass(Self.D);
end;

function TTagDeclW.isUnion: Boolean;
begin
  Result := clangExt_TagDecl_isUnion(Self.D);
end;

function TTagDeclW.isEnum: Boolean;
begin
  Result := clangExt_TagDecl_isEnum(Self.D);
end;

function TTagDeclW.hasNameForLinkage: Boolean;
begin
  Result := clangExt_TagDecl_hasNameForLinkage(Self.D);
end;

function TTagDeclW.getTypedefNameForAnonDecl: TTypedefNameDeclW;
begin
  clangExt_TagDecl_getTypedefNameForAnonDecl(Self.D).Wrap(Result);
end;

function TTagDeclW.getQualifier: NestedNameSpecifier;
begin
  Result := clangExt_TagDecl_getQualifier(Self.D);
end;

function TTagDeclW.getNumTemplateParameterLists: Cardinal;
begin
  Result := clangExt_TagDecl_getNumTemplateParameterLists(Self.D);
end;

function TTagDeclW.getTemplateParameterList(i: Cardinal): TemplateParameterList;
begin
  Result := clangExt_TagDecl_getTemplateParameterList(Self.D, i);
end;

class function TTagDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_TagDecl_classof(aDecl.D);
end;

class function TTagDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_TagDecl_classofKind(K);
end;

function TTagDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_TagDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TTagDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TTagDeclW): Boolean;
begin
  Result := clangExt_TagDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

{$endregion 'TTagDeclW'}
   
{$region 'TEnumDeclW'}

class function TEnumDeclW.Create(const aDecl: EnumDecl; out oDecl: TEnumDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TEnumDeclW);
  if (not Assigned(aDecl)) or (not clangExt_EnumDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TEnumDeclW.getCanonicalDecl: TEnumDeclW;
begin
  clangExt_EnumDecl_getCanonicalDecl(Self.D).Wrap(Result);
end;

function TEnumDeclW.getPreviousDecl: TEnumDeclW;
begin
  clangExt_EnumDecl_getPreviousDecl(Self.D).Wrap(Result);
end;

function TEnumDeclW.getMostRecentDecl: TEnumDeclW;
begin
  clangExt_EnumDecl_getMostRecentDecl(Self.D).Wrap(Result);
end;

function TEnumDeclW.getDefinition: TEnumDeclW;
begin
  clangExt_EnumDecl_getDefinition(Self.D).Wrap(Result);
end;

function TEnumDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_EnumDecl_getSourceRange(Self.D);
end;

function TEnumDeclW.getNumEnumerators: Cardinal;
begin
  Result := clangExt_EnumDecl_getNumEnumerators(Self.D);
end;

function TEnumDeclW.getNameEnumerators(i: Cardinal): TEnumConstantDeclW;
begin
  clangExt_EnumDecl_getNameEnumerators(Self.D, i).Wrap(Result);
end;

function TEnumDeclW.getPromotionType: CXQualType;
begin
  Result := clangExt_EnumDecl_getPromotionType(Self.D);
end;

function TEnumDeclW.getIntegerType: CXQualType;
begin
  Result := clangExt_EnumDecl_getIntegerType(Self.D);
end;

function TEnumDeclW.getIntegerTypeSourceInfo: TypeSourceInfo;
begin
  Result := clangExt_EnumDecl_getIntegerTypeSourceInfo(Self.D);
end;

function TEnumDeclW.getIntegerTypeRange: CXSourceRange;
begin
  Result := clangExt_EnumDecl_getIntegerTypeRange(Self.D);
end;

function TEnumDeclW.getNumPositiveBits: Cardinal;
begin
  Result := clangExt_EnumDecl_getNumPositiveBits(Self.D);
end;

function TEnumDeclW.getNumNegativeBits: Cardinal;
begin
  Result := clangExt_EnumDecl_getNumNegativeBits(Self.D);
end;

function TEnumDeclW.isScoped: Boolean;
begin
  Result := clangExt_EnumDecl_isScoped(Self.D);
end;

function TEnumDeclW.isScopedUsingClassTag: Boolean;
begin
  Result := clangExt_EnumDecl_isScopedUsingClassTag(Self.D);
end;

function TEnumDeclW.isFixed: Boolean;
begin
  Result := clangExt_EnumDecl_isFixed(Self.D);
end;

function TEnumDeclW.getODRHash: Cardinal;
begin
  Result := clangExt_EnumDecl_getODRHash(Self.D);
end;

function TEnumDeclW.isComplete: Boolean;
begin
  Result := clangExt_EnumDecl_isComplete(Self.D);
end;

function TEnumDeclW.isClosed: Boolean;
begin
  Result := clangExt_EnumDecl_isClosed(Self.D);
end;

function TEnumDeclW.isClosedFlag: Boolean;
begin
  Result := clangExt_EnumDecl_isClosedFlag(Self.D);
end;

function TEnumDeclW.isClosedNonFlag: Boolean;
begin
  Result := clangExt_EnumDecl_isClosedNonFlag(Self.D);
end;

function TEnumDeclW.getTemplateInstantiationPattern: TEnumDeclW;
begin
  clangExt_EnumDecl_getTemplateInstantiationPattern(Self.D).Wrap(Result);
end;

function TEnumDeclW.getInstantiatedFromMemberEnum: TEnumDeclW;
begin
  clangExt_EnumDecl_getInstantiatedFromMemberEnum(Self.D).Wrap(Result);
end;

function TEnumDeclW.getTemplateSpecializationKind: TemplateSpecializationKind;
begin
  Result := clangExt_EnumDecl_getTemplateSpecializationKind(Self.D);
end;

function TEnumDeclW.getMemberSpecializationInfo: MemberSpecializationInfo;
begin
  Result := clangExt_EnumDecl_getMemberSpecializationInfo(Self.D);
end;

class function TEnumDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_EnumDecl_classof(aDecl.D);
end;

class function TEnumDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_EnumDecl_classofKind(K);
end;
    
{$endregion 'TEnumDeclW'}

{$region 'TRecordDeclW'}

class function TRecordDeclW.Create(const aDecl: RecordDecl; out
  oDecl: TRecordDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TRecordDeclW);
  if (not Assigned(aDecl)) or (not clangExt_RecordDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TRecordDeclW.getPreviousDecl: TRecordDeclW;
begin
  clangExt_RecordDecl_getPreviousDecl(Self.D).Wrap(Result);
end;

function TRecordDeclW.getMostRecentDecl: TRecordDeclW;
begin
  clangExt_RecordDecl_getMostRecentDecl(Self.D).Wrap(Result);
end;

function TRecordDeclW.hasFlexibleArrayMember: Boolean;
begin
  Result := clangExt_RecordDecl_hasFlexibleArrayMember(Self.D);
end;

function TRecordDeclW.isAnonymousStructOrUnion: Boolean;
begin
  Result := clangExt_RecordDecl_isAnonymousStructOrUnion(Self.D);
end;

function TRecordDeclW.hasObjectMember: Boolean;
begin
  Result := clangExt_RecordDecl_hasObjectMember(Self.D);
end;

function TRecordDeclW.hasVolatileMember: Boolean;
begin
  Result := clangExt_RecordDecl_hasVolatileMember(Self.D);
end;

function TRecordDeclW.hasLoadedFieldsFromExternalStorage: Boolean;
begin
  Result := clangExt_RecordDecl_hasLoadedFieldsFromExternalStorage(Self.D);
end;

function TRecordDeclW.isNonTrivialToPrimitiveDefaultInitialize: Boolean;
begin
  Result := clangExt_RecordDecl_isNonTrivialToPrimitiveDefaultInitialize(Self.D);
end;

function TRecordDeclW.isNonTrivialToPrimitiveCopy: Boolean;
begin
  Result := clangExt_RecordDecl_isNonTrivialToPrimitiveCopy(Self.D);
end;

function TRecordDeclW.isNonTrivialToPrimitiveDestroy: Boolean;
begin
  Result := clangExt_RecordDecl_isNonTrivialToPrimitiveDestroy(Self.D);
end;

function TRecordDeclW.hasNonTrivialToPrimitiveDefaultInitializeCUnion: Boolean;
begin
  Result := clangExt_RecordDecl_hasNonTrivialToPrimitiveDefaultInitializeCUnion(Self.D);
end;

function TRecordDeclW.hasNonTrivialToPrimitiveDestructCUnion: Boolean;
begin
  Result := clangExt_RecordDecl_hasNonTrivialToPrimitiveDestructCUnion(Self.D);
end;

function TRecordDeclW.hasNonTrivialToPrimitiveCopyCUnion: Boolean;
begin
  Result := clangExt_RecordDecl_hasNonTrivialToPrimitiveCopyCUnion(Self.D);
end;

function TRecordDeclW.canPassInRegisters: Boolean;
begin
  Result := clangExt_RecordDecl_canPassInRegisters(Self.D);
end;

function TRecordDeclW.getArgPassingRestrictions: CX_RecordDecl_ArgPassingKind;
begin
  Result := clangExt_RecordDecl_getArgPassingRestrictions(Self.D);
end;

function TRecordDeclW.isParamDestroyedInCallee: Boolean;
begin
  Result := clangExt_RecordDecl_isParamDestroyedInCallee(Self.D);
end;

function TRecordDeclW.isRandomized: Boolean;
begin
  Result := clangExt_RecordDecl_isRandomized(Self.D);
end;

function TRecordDeclW.isInjectedClassName: Boolean;
begin
  Result := clangExt_RecordDecl_isInjectedClassName(Self.D);
end;

function TRecordDeclW.isLambda: Boolean;
begin
  Result := clangExt_RecordDecl_isLambda(Self.D);
end;

function TRecordDeclW.isCapturedRecord: Boolean;
begin
  Result := clangExt_RecordDecl_isCapturedRecord(Self.D);
end;

function TRecordDeclW.getDefinition: TRecordDeclW;
begin
  clangExt_RecordDecl_getDefinition(Self.D).Wrap(Result);
end;

function TRecordDeclW.isOrContainsUnion: Boolean;
begin
  Result := clangExt_RecordDecl_isOrContainsUnion(Self.D);
end;

function TRecordDeclW.getNumFields: Cardinal;
begin
  Result := clangExt_RecordDecl_getNumFields(Self.D);
end;

function TRecordDeclW.getField(i: Cardinal): TFieldDeclW;
begin
  clangExt_RecordDecl_getField(Self.D, i).Wrap(Result);
end;

function TRecordDeclW.field_empty: Boolean;
begin
  Result := clangExt_RecordDecl_field_empty(Self.D);
end;

class function TRecordDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_RecordDecl_classof(aDecl.D);
end;

class function TRecordDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_RecordDecl_classofKind(K);
end;

function TRecordDeclW.isMsStruct(const C: ASTContext): Boolean;
begin
  Result := clangExt_RecordDecl_isMsStruct(Self.D, C);
end;

function TRecordDeclW.mayInsertExtraPadding(EmitRemark: Boolean): Boolean;
begin
  Result := clangExt_RecordDecl_mayInsertExtraPadding(Self.D, EmitRemark);
end;

function TRecordDeclW.findFirstNamedDataMember: TFieldDeclW;
begin
  clangExt_RecordDecl_findFirstNamedDataMember(Self.D).Wrap(Result);
end;

{$endregion 'TRecordDeclW'}

{$region 'TFileScopeAsmDeclW'}

class function TFileScopeAsmDeclW.Create(const aDecl: FileScopeAsmDecl; out
  oDecl: TFileScopeAsmDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TFileScopeAsmDeclW);
  if (not Assigned(aDecl)) or (not clangExt_FileScopeAsmDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TFileScopeAsmDeclW.getAsmLoc: CXSourceLocation;
begin
  Result := clangExt_FileScopeAsmDecl_getAsmLoc(Self.D);
end;

function TFileScopeAsmDeclW.getRParenLoc: CXSourceLocation;
begin
  Result := clangExt_FileScopeAsmDecl_getRParenLoc(Self.D);
end;

function TFileScopeAsmDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_FileScopeAsmDecl_getSourceRange(Self.D);
end;

function TFileScopeAsmDeclW.getAsmString: StringLiteral;
begin
  Result := clangExt_FileScopeAsmDecl_getAsmString(Self.D);
end;

class function TFileScopeAsmDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_FileScopeAsmDecl_classof(aDecl.D);
end;

class function TFileScopeAsmDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_FileScopeAsmDecl_classofKind(K);
end;

{$endregion 'TFileScopeAsmDeclW'}

{$region 'BlockDecl_Capture_Helper'}

function BlockDecl_Capture_Helper.getVariable: TVarDeclW;
begin
  clangExt_BlockDecl_Capture_getVariable(Self).Wrap(Result);
end;

function BlockDecl_Capture_Helper.isByRef: Boolean;
begin
  Result := clangExt_BlockDecl_Capture_isByRef(Self);
end;

function BlockDecl_Capture_Helper.isEscapingByref: Boolean;
begin
  Result := clangExt_BlockDecl_Capture_isEscapingByref(Self);
end;

function BlockDecl_Capture_Helper.isNonEscapingByref: Boolean;
begin
  Result := clangExt_BlockDecl_Capture_isNonEscapingByref(Self);
end;

function BlockDecl_Capture_Helper.isNested: Boolean;
begin
  Result := clangExt_BlockDecl_Capture_isNested(Self);
end;

function BlockDecl_Capture_Helper.hasCopyExpr: Boolean;
begin
  Result := clangExt_BlockDecl_Capture_hasCopyExpr(Self);
end;

function BlockDecl_Capture_Helper.getCopyExpr: Expr;
begin
  Result := clangExt_BlockDecl_Capture_getCopyExpr(Self);
end;

{$endregion 'BlockDecl_Capture_Helper'}

{$region 'TBlockDeclW'}

class function TBlockDeclW.Create(const aDecl: BlockDecl; out oDecl: TBlockDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TBlockDeclW);
  if (not Assigned(aDecl)) or (not clangExt_BlockDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TBlockDeclW.getCaretLocation: CXSourceLocation;
begin
  Result := clangExt_BlockDecl_getCaretLocation(Self.D);
end;

function TBlockDeclW.isVariadic: Boolean;
begin
  Result := clangExt_BlockDecl_isVariadic(Self.D);
end;

function TBlockDeclW.getCompoundBody: CompoundStmt;
begin
  Result := clangExt_BlockDecl_getCompoundBody(Self.D);
end;

function TBlockDeclW.getBody: Stmt;
begin
  Result := clangExt_BlockDecl_getBody(Self.D);
end;

function TBlockDeclW.getSignatureAsWritten: TypeSourceInfo;
begin
  Result := clangExt_BlockDecl_getSignatureAsWritten(Self.D);
end;

function TBlockDeclW.param_empty: Boolean;
begin
  Result := clangExt_BlockDecl_param_empty(Self.D);
end;

function TBlockDeclW.param_size: SIZE_T;
begin
  Result := clangExt_BlockDecl_param_size(Self.D);
end;

function TBlockDeclW.getNumParams: Cardinal;
begin
  Result := clangExt_BlockDecl_getNumParams(Self.D);
end;

function TBlockDeclW.getParamDecl(i: Cardinal): TParmVarDeclW;
begin
  clangExt_BlockDecl_getParamDecl(Self.D, i).Wrap(Result);
end;

function TBlockDeclW.hasCaptures: Boolean;
begin
  Result := clangExt_BlockDecl_hasCaptures(Self.D);
end;

function TBlockDeclW.getNumCaptures: Cardinal;
begin
  Result := clangExt_BlockDecl_getNumCaptures(Self.D);
end;

function TBlockDeclW.getCaptures(i: Cardinal): BlockDecl_Capture;
begin
  Result := clangExt_BlockDecl_getCaptures(Self.D, i);
end;

function TBlockDeclW.capturesCXXThis: Boolean;
begin
  Result := clangExt_BlockDecl_capturesCXXThis(Self.D);
end;

function TBlockDeclW.blockMissingReturnType: Boolean;
begin
  Result := clangExt_BlockDecl_blockMissingReturnType(Self.D);
end;

function TBlockDeclW.isConversionFromLambda: Boolean;
begin
  Result := clangExt_BlockDecl_isConversionFromLambda(Self.D);
end;

function TBlockDeclW.doesNotEscape: Boolean;
begin
  Result := clangExt_BlockDecl_doesNotEscape(Self.D);
end;

function TBlockDeclW.canAvoidCopyToHeap: Boolean;
begin
  Result := clangExt_BlockDecl_canAvoidCopyToHeap(Self.D);
end;

function TBlockDeclW.capturesVariable(aDecl: TVarDeclW): Boolean;
begin
  Result := clangExt_BlockDecl_capturesVariable(Self.D, aDecl.D);
end;

function TBlockDeclW.getBlockManglingNumber: Cardinal;
begin
  Result := clangExt_BlockDecl_getBlockManglingNumber(Self.D);
end;

function TBlockDeclW.getBlockManglingContextDecl: Decl;
begin
  Result := clangExt_BlockDecl_getBlockManglingContextDecl(Self.D);
end;

function TBlockDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_BlockDecl_getSourceRange(Self.D);
end;

class function TBlockDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_BlockDecl_classof(aDecl.D);
end;

class function TBlockDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_BlockDecl_classofKind(K);
end;

function TBlockDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_BlockDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TBlockDeclW.castFromDeclContext(const DC: TDeclContextW; out
  aDecl: TBlockDeclW): Boolean;
begin
  Result := clangExt_BlockDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;
         
{$endregion 'TBlockDeclW'}

{$region 'TCapturedDeclW'}

class function TCapturedDeclW.Create(const aDecl: CapturedDecl; out
  oDecl: TCapturedDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TCapturedDeclW);
  if (not Assigned(aDecl)) or (not clangExt_CapturedDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TCapturedDeclW.getBody: Stmt;
begin
  Result := clangExt_CapturedDecl_getBody(Self.D);
end;

function TCapturedDeclW.isNothrow: Boolean;
begin
  Result := clangExt_CapturedDecl_isNothrow(Self.D);
end;

function TCapturedDeclW.getNumParams: Cardinal;
begin
  Result := clangExt_CapturedDecl_getNumParams(Self.D);
end;

function TCapturedDeclW.getParam(i: Cardinal): ImplicitParamDecl;
begin
  Result := clangExt_CapturedDecl_getParam(Self.D, i);
end;

function TCapturedDeclW.getContextParam: ImplicitParamDecl;
begin
  Result := clangExt_CapturedDecl_getContextParam(Self.D);
end;

function TCapturedDeclW.getContextParamPosition: Cardinal;
begin
  Result := clangExt_CapturedDecl_getContextParamPosition(Self.D);
end;

class function TCapturedDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_CapturedDecl_classof(aDecl.D);
end;

class function TCapturedDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_CapturedDecl_classofKind(K);
end;

function TCapturedDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_CapturedDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TCapturedDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TCapturedDeclW): Boolean;
begin
  Result := clangExt_CapturedDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;
      
{$endregion 'TCapturedDeclW'}

{$region 'TImportDeclW'}

class function TImportDeclW.Create(const aDecl: ImportDecl; out oDecl: TImportDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TImportDeclW);
  if (not Assigned(aDecl)) or (not clangExt_ImportDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TImportDeclW.getImportedModule: Module;
begin
  Result := clangExt_ImportDecl_getImportedModule(Self.D);
end;

function TImportDeclW.getNumIdentifierLocs: Cardinal;
begin
  Result := clangExt_ImportDecl_getNumIdentifierLocs(Self.D);
end;

function TImportDeclW.getIdentifierLocs(i: Cardinal): CXSourceLocation;
begin
  Result := clangExt_ImportDecl_getIdentifierLocs(Self.D, i);
end;

function TImportDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_ImportDecl_getSourceRange(Self.D);
end;

class function TImportDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_ImportDecl_classof(aDecl.D);
end;

class function TImportDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_ImportDecl_classofKind(K);
end;

{$endregion 'TImportDeclW'}

{$region 'TExportDeclW'}

class function TExportDeclW.Create(const aDecl: ExportDecl; out
  oDecl: TExportDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TExportDeclW);
  if (not Assigned(aDecl)) or (not clangExt_ExportDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TExportDeclW.getExportLoc: CXSourceLocation;
begin
  Result := clangExt_ExportDecl_getExportLoc(Self.D);
end;

function TExportDeclW.getRBraceLoc: CXSourceLocation;
begin
  Result := clangExt_ExportDecl_getRBraceLoc(Self.D);
end;

function TExportDeclW.hasBraces: Boolean;
begin
  Result := clangExt_ExportDecl_hasBraces(Self.D);
end;

function TExportDeclW.getEndLoc: CXSourceLocation;
begin
  Result := clangExt_ExportDecl_getEndLoc(Self.D);
end;

function TExportDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_ExportDecl_getSourceRange(Self.D);
end;

class function TExportDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_ExportDecl_classof(aDecl.D);
end;

class function TExportDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_ExportDecl_classofKind(K);
end;

function TExportDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_ExportDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TExportDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TExportDeclW): Boolean;
begin
  Result := clangExt_ExportDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

{$endregion 'TExportDeclW'}

{$region 'TEmptyDeclW'}

class function TEmptyDeclW.Create(const aDecl: EmptyDecl; out oDecl: TEmptyDeclW
  ): Boolean;
begin
  Result := False;
  oDecl := Default(TEmptyDeclW);
  if (not Assigned(aDecl)) or (not clangExt_EmptyDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

class function TEmptyDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_EmptyDecl_classof(aDecl.D);
end;

class function TEmptyDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_EmptyDecl_classofKind(K);
end;

{$endregion 'TEmptyDeclW'}

{$region 'Helper'}

function TranslationUnitDeclHelper.Wrap(out D: TTranslationUnitDeclW): Boolean;
begin
  Result := TTranslationUnitDeclW.Create(Self, D);
end;

function PragmaCommentDeclHelper.Wrap(out D: TPragmaCommentDeclW): Boolean;
begin
  Result := TPragmaCommentDeclW.Create(Self, D);
end;

function PragmaDetectMismatchDeclHelper.Wrap(out D: TPragmaDetectMismatchDeclW
  ): Boolean;
begin
  Result := TPragmaDetectMismatchDeclW.Create(Self, D);
end;

function ExternCContextDeclHelper.Wrap(out D: TExternCContextDeclW): Boolean;
begin
  Result := TExternCContextDeclW.Create(Self, D);
end;

function NamedDeclHelper.Wrap(out D: TNamedDeclW): Boolean;
begin
  Result := TNamedDeclW.Create(Self, D);
end;

function ValueDeclHelper.Wrap(out D: TValueDeclW): Boolean;
begin
  Result := TValueDeclW.Create(Self, D);
end;

function DeclaratorDeclHelper.Wrap(out D: TDeclaratorDeclW): Boolean;
begin
  Result := TDeclaratorDeclW.Create(Self, D);
end;

function VarDeclHelper.Wrap(out D: TVarDeclW): Boolean;
begin
  Result := TVarDeclW.Create(Self, D);
end;

function ParmVarDeclHelper.Wrap(out D: TParmVarDeclW): Boolean;
begin
  Result := TParmVarDeclW.Create(Self, D);
end;

function FunctionDeclHelper.Wrap(out D: TFunctionDeclW): Boolean;
begin
  Result := TFunctionDeclW.Create(Self, D);
end;

function FieldDeclHelper.Wrap(out D: TFieldDeclW): Boolean;
begin
  Result := TFieldDeclW.Create(Self, D);
end;

function EnumConstantDeclHelper.Wrap(out D: TEnumConstantDeclW): Boolean;
begin
  Result := TEnumConstantDeclW.Create(Self, D);
end;

function IndirectFieldDeclHelper.Wrap(out D: TIndirectFieldDeclW): Boolean;
begin
  Result := TIndirectFieldDeclW.Create(Self, D);
end;

function TypeDeclHelper.Wrap(out D: TTypedefNameDeclW): Boolean;
begin
  Result := TTypedefNameDeclW.Create(Self, D);
end;

function TypedefNameDeclHelper.Wrap(out D: TTypedefNameDeclW): Boolean;
begin
  Result := TTypedefNameDeclW.Create(Self, D);
end;

function TypedefDeclHelper.Wrap(out D: TTypedefDeclW): Boolean;
begin
  Result := TTypedefDeclW.Create(Self, D);
end;

function TypeAliasDeclHelper.Wrap(out D: TTypeAliasDeclW): Boolean;
begin
  Result := TTypeAliasDeclW.Create(Self, D);
end;

function TagDeclHelper.Wrap(out D: TTagDeclW): Boolean;
begin
  Result := TTagDeclW.Create(Self, D);
end;

function EnumDeclHelper.Wrap(out D: TEnumDeclW): Boolean;
begin
  Result := TEnumDeclW.Create(Self, D);
end;

function RecordDeclHelper.Wrap(out D: TRecordDeclW): Boolean;
begin
  Result := TRecordDeclW.Create(Self, D);
end;

function FileScopeAsmDeclHelper.Wrap(out D: TFileScopeAsmDeclW): Boolean;
begin
  Result := TFileScopeAsmDeclW.Create(Self, D);
end;

function BlockDeclHelper.Wrap(out D: TBlockDeclW): Boolean;
begin
  Result := TBlockDeclW.Create(Self, D);
end;

function CapturedDeclHelper.Wrap(out D: TCapturedDeclW): Boolean;
begin
  Result := TCapturedDeclW.Create(Self, D);
end;

function ImportDeclHelper.Wrap(out D: TImportDeclW): Boolean;
begin
  Result := TImportDeclW.Create(Self, D);
end;

function ExportDeclHelper.Wrap(out D: TExportDeclW): Boolean;
begin
  Result := TExportDeclW.Create(Self, D);
end;

function EmptyDeclHelper.Wrap(out D: TEmptyDeclW): Boolean;
begin
  Result := TEmptyDeclW.Create(Self, D);
end;

{$endregion 'Helper'}

end.

