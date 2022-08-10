unit LibClang.Ext.AST.DeclCXXW;

{$mode ObjFPC}{$H+} 
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.CXString,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclCXXH,  
  LibClang.Ext.AST.DeclCXXU,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.DeclFriendH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.Basic.LambdaH,
  LibClang.Ext.AST.LambdaCaptureH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.AST.APValueH,
                        
  LibClang.Ext.AST.DeclBaseW,
  LibClang.Ext.AST.DeclW;

type

  TAccessSpecDeclW = object(TDeclW)
  public
    class function Create(const aDecl: AccessSpecDecl; out oDecl: TAccessSpecDeclW): Boolean; static;
  public
    function getAccessSpecifierLoc: CXSourceLocation;
    function getColonLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;       

  CXXBaseSpecifierHelper = type helper for CXXBaseSpecifier
    function getSourceRange(const ctx: ASTContext): CXSourceRange;
    function getBeginLoc(const ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const ctx: ASTContext): CXSourceLocation;
    function getBaseTypeLoc(const ctx: ASTContext): CXSourceLocation;
    function isVirtual: Boolean;
    function isBaseOfClass: Boolean;
    function isPackExpansion: Boolean;
    function getInheritConstructors: Boolean;
    function getEllipsisLoc(const ctx: ASTContext): CXSourceLocation;
    function getAccessSpecifier: AccessSpecifier;
    function getAccessSpecifierAsWritten: AccessSpecifier;
    function getType: CXQualType;
    function getTypeSourceInfo: TypeSourceInfo;
  end;   

  TCXXRecordDeclW = object(TRecordDeclW)
  public
    class function Create(const aDecl: RecordDecl; out oDecl: TCXXRecordDeclW): Boolean; static;
  public
    function getCanonicalDecl: TCXXRecordDeclW;
    function getPreviousDecl: TCXXRecordDeclW;
    function getMostRecentDecl: TCXXRecordDeclW;
    function getMostRecentNonInjectedDecl: TCXXRecordDeclW;
    function getDefinition: TCXXRecordDeclW;
    function hasDefinition: Boolean;
    function isDynamicClass: Boolean;
    function mayBeDynamicClass: Boolean;
    function mayBeNonDynamicClass: Boolean;
    function isParsingBaseSpecifiers: Boolean;
    function getODRHash: Cardinal;
    function getNumBases: Cardinal;
    function getBases(i: Cardinal): CXXBaseSpecifier;
    function getNumVBases: Cardinal;
    function getVBases(i: Cardinal): CXXBaseSpecifier;
    function hasAnyDependentBases: Boolean;
    function getNumMethods: Cardinal;
    function getMethods(i: Cardinal): CXXMethodDecl;
    function getNumCtors: Cardinal;
    function getCtors(i: Cardinal): CXXConstructorDecl;
    function getNumFriends: Cardinal;
    function getFriends(i: Cardinal): FriendDecl;
    function hasFriends: Boolean;
    function defaultedCopyConstructorIsDeleted: Boolean;
    function defaultedMoveConstructorIsDeleted: Boolean;
    function defaultedDestructorIsDeleted: Boolean;
    function hasSimpleCopyConstructor: Boolean;
    function hasSimpleMoveConstructor: Boolean;
    function hasSimpleCopyAssignment: Boolean;
    function hasSimpleMoveAssignment: Boolean;
    function hasSimpleDestructor: Boolean;
    function hasDefaultConstructor: Boolean;
    function needsImplicitDefaultConstructor: Boolean;
    function hasUserDeclaredConstructor: Boolean;
    function hasUserProvidedDefaultConstructor: Boolean;
    function hasUserDeclaredCopyConstructor: Boolean;
    function needsImplicitCopyConstructor: Boolean;
    function needsOverloadResolutionForCopyConstructor: Boolean;
    function implicitCopyConstructorHasConstParam: Boolean;
    function hasCopyConstructorWithConstParam: Boolean;
    function hasUserDeclaredMoveOperation: Boolean;
    function hasUserDeclaredMoveConstructor: Boolean;
    function hasMoveConstructor: Boolean;
    function needsImplicitMoveConstructor: Boolean;
    function needsOverloadResolutionForMoveConstructor: Boolean;
    function hasUserDeclaredCopyAssignment: Boolean;
    function needsImplicitCopyAssignment: Boolean;
    function needsOverloadResolutionForCopyAssignment: Boolean;
    function implicitCopyAssignmentHasConstParam: Boolean;
    function hasCopyAssignmentWithConstParam: Boolean;
    function hasUserDeclaredMoveAssignment: Boolean;
    function hasMoveAssignment: Boolean;
    function needsImplicitMoveAssignment: Boolean;
    function needsOverloadResolutionForMoveAssignment: Boolean;
    function hasUserDeclaredDestructor: Boolean;
    function needsImplicitDestructor: Boolean;
    function needsOverloadResolutionForDestructor: Boolean;
    function isLambda: Boolean;
    function isGenericLambda: Boolean;
    function lambdaIsDefaultConstructibleAndAssignable: Boolean;
    function getLambdaCallOperator: CXXMethodDecl;
    function getDependentLambdaCallOperator: FunctionTemplateDecl;
    function getLambdaStaticInvoker: CXXMethodDecl;
    function getGenericLambdaTemplateParameterList: TemplateParameterList;
    function getNumLambdaExplicitTemplateParameters: Cardinal;
    function getLambdaExplicitTemplateParameters(i: Cardinal): TNamedDeclW;
    function getLambdaCaptureDefault: LambdaCaptureDefault;
    function getCaptures(i: Cardinal): LambdaCapture;
    function capture_size: Cardinal;
    function isAggregate: Boolean;
    function hasInClassInitializer: Boolean;
    function hasUninitializedReferenceMember: Boolean;
    function isPOD: Boolean;
    function isCLike: Boolean;
    function isEmpty: Boolean;
    function hasInitMethod: Boolean;
    function hasPrivateFields: Boolean;
    function hasProtectedFields: Boolean;
    function hasDirectFields: Boolean;
    function isPolymorphic: Boolean;
    function isAbstract: Boolean;
    function isStandardLayout: Boolean;
    function isCXX11StandardLayout: Boolean;
    function hasMutableFields: Boolean;
    function hasVariantMembers: Boolean;
    function hasTrivialDefaultConstructor: Boolean;
    function hasNonTrivialDefaultConstructor: Boolean;
    function hasConstexprNonCopyMoveConstructor: Boolean;
    function defaultedDefaultConstructorIsConstexpr: Boolean;
    function hasConstexprDefaultConstructor: Boolean;
    function hasTrivialCopyConstructor: Boolean;
    function hasTrivialCopyConstructorForCall: Boolean;
    function hasNonTrivialCopyConstructor: Boolean;
    function hasNonTrivialCopyConstructorForCall: Boolean;
    function hasTrivialMoveConstructor: Boolean;
    function hasTrivialMoveConstructorForCall: Boolean;
    function hasNonTrivialMoveConstructor: Boolean;
    function hasNonTrivialMoveConstructorForCall: Boolean;
    function hasTrivialCopyAssignment: Boolean;
    function hasNonTrivialCopyAssignment: Boolean;
    function hasTrivialMoveAssignment: Boolean;
    function hasNonTrivialMoveAssignment: Boolean;
    function defaultedDestructorIsConstexpr: Boolean;
    function hasConstexprDestructor: Boolean;
    function hasTrivialDestructor: Boolean;
    function hasTrivialDestructorForCall: Boolean;
    function hasNonTrivialDestructor: Boolean;
    function hasNonTrivialDestructorForCall: Boolean;
    function allowConstDefaultInit: Boolean;
    function hasIrrelevantDestructor: Boolean;
    function hasNonLiteralTypeFieldsOrBases: Boolean;
    function hasInheritedConstructor: Boolean;
    function hasInheritedAssignment: Boolean;
    function isTriviallyCopyable: Boolean;
    function isTrivial: Boolean;
    function isLiteral: Boolean;
    function isStructural: Boolean;
    function getInstantiatedFromMemberClass: TCXXRecordDeclW;
    function getMemberSpecializationInfo: MemberSpecializationInfo;
    function getDescribedClassTemplate: ClassTemplateDecl;
    function getTemplateSpecializationKind: TemplateSpecializationKind;
    function getTemplateInstantiationPattern: TCXXRecordDeclW;
    function getDestructor: CXXDestructorDecl;
    function isAnyDestructorNoReturn: Boolean;
    function isLocalClass: TFunctionDeclW;
    function isCurrentInstantiation(const CurContext: TDeclContextW): Boolean;
    function isDerivedFrom(const Base: TCXXRecordDeclW): Boolean;
    function isVirtuallyDerivedFrom(const Base: TCXXRecordDeclW): Boolean;
    function isProvablyNotDerivedFrom(const Base: TCXXRecordDeclW): Boolean;
    function mayBeAbstract: Boolean;
    function isEffectivelyFinal: Boolean;
    function getLambdaManglingNumber: Cardinal;
    function hasKnownLambdaInternalLinkage: Boolean;
    function getLambdaContextDecl: Decl;
    function getDeviceLambdaManglingNumber: Cardinal;
    function getMSInheritanceModel: MSInheritanceModel;
    function calculateInheritanceModel: MSInheritanceModel;
    function nullFieldOffsetIsZero: Boolean;
    function getMSVtorDispMode: MSVtorDispMode;
    function isDependentLambda: Boolean;
    function isNeverDependentLambda: Boolean;
    function getLambdaDependencyKind: Cardinal;
    function getLambdaTypeInfo: TypeSourceInfo;
    function isInterfaceLike: Boolean;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;    

  ExplicitSpecifierHelper = type helper for ExplicitSpecifier
    function getKind: ExplicitSpecKind;
    function getExpr: Expr;
    function isSpecified: Boolean;
    function isEquivalent(const Other: ExplicitSpecifier): Boolean;
    function isExplicit: Boolean;
    function isInvalid: Boolean;
  end; 

  TCXXMethodDeclW = object(TFunctionDeclW)
  public
    class function Create(const aDecl: CXXMethodDecl; out oDecl: TCXXMethodDeclW): Boolean; static;
  public
    function isStatic: Boolean;
    function isInstance: Boolean;
    class function isStaticOverloadedOperator(OOK: OverloadedOperatorKind): Boolean; static;
    function isConst: Boolean;
    function isVolatile: Boolean;
    function isVirtual: Boolean;
    function getDevirtualizedMethod(const Base: Expr; IsAppleKext: Boolean): TCXXMethodDeclW;
    function isCopyAssignmentOperator: Boolean;
    function isMoveAssignmentOperator: Boolean;
    function getCanonicalDecl: TCXXMethodDeclW;
    function getMostRecentDecl: TCXXMethodDeclW;
    function size_overridden_methods: Cardinal;
    function overridden_methods(i: Cardinal): TCXXMethodDeclW;
    function getParent: TCXXRecordDeclW;
    function getThisType: CXQualType;
    function getThisObjectType: CXQualType;
    class function getThisTypeProtoType(const FPT: FunctionProtoType; const aDecl: TCXXRecordDeclW): CXQualType; static;
    class function getThisObjectProtoType(const FPT: FunctionProtoType; const aDecl: TCXXRecordDeclW): CXQualType; static;
    function getMethodQualifiers: CXQualifiers;
    function getRefQualifier: RefQualifierKind;
    function hasInlineBody: Boolean;
    function isLambdaStaticInvoker: Boolean;
    function getCorrespondingMethodInClass(const RD: TCXXRecordDeclW; MayBeBase: Boolean = False): TCXXMethodDeclW;
    function getCorrespondingMethodDeclaredInClass(const RD: TCXXRecordDeclW; MayBeBase: Boolean = False): TCXXMethodDeclW;
    class function classof(const aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;    

  TLinkageSpecDeclW = object(TDeclW)
  public
    class function Create(const aDecl: LinkageSpecDecl; out oDecl: TLinkageSpecDeclW): Boolean; static;
  public
    function getLanguage: CX_LinkageSpecDecl_LanguageIDs;
    function hasBraces: Boolean;
    function getExternLoc: CXSourceLocation;
    function getRBraceLoc: CXSourceLocation;
    function getEndLoc: CXSourceLocation;
    function getSourceRange: CXSourceRange;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
    function castToDeclContext: TDeclContextW;
    class function castFromDeclContext(DC: TDeclContextW; out aDecl: TLinkageSpecDeclW): Boolean; static;
  end;        

  { TMSGuidDeclW }

  TMSGuidDeclW = object(TValueDeclW)
  public
    class function Create(const aDecl: MSGuidDecl; out oDecl: TMSGuidDeclW): Boolean; static;
  public
    function printName: string;
    function getParts: MSGuidDeclParts;
    function getAsAPValue: APValue;
    class function classof(aDecl: TDeclW): Boolean; static;
    class function classofKind(K: CX_DeclKind): Boolean; static;
  end;

{$region 'Helper'}

  AccessSpecDeclHelper = type helper for AccessSpecDecl
    function Wrap(out D: TAccessSpecDeclW): Boolean; inline;
  end;

  CXXRecordDeclHelper = type Helper for CXXRecordDecl
    function Wrap(out D: TCXXRecordDeclW): Boolean; inline;
  end;

  CXXMethodDeclHelper = type helper for CXXMethodDecl
    function Wrap(out D: TCXXMethodDeclW): Boolean; inline;
  end;

  LinkageSpecDeclHelper = type helper for LinkageSpecDecl
    function Wrap(out D: TLinkageSpecDeclW): Boolean; inline;
  end;

  MSGuidDeclHelper = type helper for MSGuidDecl
    function Wrap(out D: TMSGuidDeclW): Boolean; inline;
  end;

{$endregion 'Helper'}

implementation

{ MSGuidDeclHelper }

{$region 'Helper'}

function AccessSpecDeclHelper.Wrap(out D: TAccessSpecDeclW): Boolean;
begin
  Result := TAccessSpecDeclW.Create(Self, D);
end;

function CXXRecordDeclHelper.Wrap(out D: TCXXRecordDeclW): Boolean;
begin
  Result := TCXXRecordDeclW.Create(Self, D);
end;

function CXXMethodDeclHelper.Wrap(out D: TCXXMethodDeclW): Boolean;
begin
  Result := TCXXMethodDeclW.Create(Self, D);
end;

function LinkageSpecDeclHelper.Wrap(out D: TLinkageSpecDeclW): Boolean;
begin
  Result := TLinkageSpecDeclW.Create(Self, D);
end;
     
function MSGuidDeclHelper.Wrap(out D: TMSGuidDeclW): Boolean;
begin
  Result := TMSGuidDeclW.Create(Self, D);
end;

{$endregion 'Helper'}

{$region 'TAccessSpecDeclW'}

class function TAccessSpecDeclW.Create(const aDecl: AccessSpecDecl; out
  oDecl: TAccessSpecDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TAccessSpecDeclW);
  if not clangExt_AccessSpecDecl_classof(aDecl) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TAccessSpecDeclW.getAccessSpecifierLoc: CXSourceLocation;
begin
  Result := clangExt_AccessSpecDecl_getAccessSpecifierLoc(Self.D);
end;

function TAccessSpecDeclW.getColonLoc: CXSourceLocation;
begin
  Result := clangExt_AccessSpecDecl_getColonLoc(Self.D);
end;

function TAccessSpecDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_AccessSpecDecl_getSourceRange(Self.D);
end;

class function TAccessSpecDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_AccessSpecDecl_classof(aDecl.D);
end;

class function TAccessSpecDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_AccessSpecDecl_classofKind(K);
end;

{$endregion 'TAccessSpecDeclW'}

{$region 'CXXBaseSpecifierHelper'}

function CXXBaseSpecifierHelper.getSourceRange(const ctx: ASTContext): CXSourceRange;
begin
Result := clangExt_CXXBaseSpecifier_getSourceRange(Self, ctx);
end;

function CXXBaseSpecifierHelper.getBeginLoc(const ctx: ASTContext): CXSourceLocation;
begin
Result := clangExt_CXXBaseSpecifier_getBeginLoc(Self, ctx);
end;

function CXXBaseSpecifierHelper.getEndLoc(const ctx: ASTContext): CXSourceLocation;
begin
Result := clangExt_CXXBaseSpecifier_getEndLoc(Self, ctx);
end;

function CXXBaseSpecifierHelper.getBaseTypeLoc(const ctx: ASTContext): CXSourceLocation;
begin
Result := clangExt_CXXBaseSpecifier_getBaseTypeLoc(Self, ctx);
end;

function CXXBaseSpecifierHelper.isVirtual: Boolean;
begin
Result := clangExt_CXXBaseSpecifier_isVirtual(Self);
end;

function CXXBaseSpecifierHelper.isBaseOfClass: Boolean;
begin
Result := clangExt_CXXBaseSpecifier_isBaseOfClass(Self);
end;

function CXXBaseSpecifierHelper.isPackExpansion: Boolean;
begin
Result := clangExt_CXXBaseSpecifier_isPackExpansion(Self);
end;

function CXXBaseSpecifierHelper.getInheritConstructors: Boolean;
begin
Result := clangExt_CXXBaseSpecifier_getInheritConstructors(Self);
end;

function CXXBaseSpecifierHelper.getEllipsisLoc(const ctx: ASTContext): CXSourceLocation;
begin
Result := clangExt_CXXBaseSpecifier_getEllipsisLoc(Self, ctx);
end;

function CXXBaseSpecifierHelper.getAccessSpecifier: AccessSpecifier;
begin
Result := clangExt_CXXBaseSpecifier_getAccessSpecifier(Self);
end;

function CXXBaseSpecifierHelper.getAccessSpecifierAsWritten: AccessSpecifier;
begin
Result := clangExt_CXXBaseSpecifier_getAccessSpecifierAsWritten(Self);
end;

function CXXBaseSpecifierHelper.getType: CXQualType;
begin
Result := clangExt_CXXBaseSpecifier_getType(Self);
end;

function CXXBaseSpecifierHelper.getTypeSourceInfo: TypeSourceInfo;
begin
Result := clangExt_CXXBaseSpecifier_getTypeSourceInfo(Self);
end;

{$endregion 'CXXBaseSpecifierHelper'}

{$region 'TCXXRecordDeclW'}

class function TCXXRecordDeclW.Create(const aDecl: RecordDecl; out
  oDecl: TCXXRecordDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TCXXRecordDeclW);
  if not clangExt_CXXRecordDecl_classof(aDecl) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TCXXRecordDeclW.getCanonicalDecl: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getCanonicalDecl(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getPreviousDecl: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getPreviousDecl(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getMostRecentDecl: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getMostRecentDecl(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getMostRecentNonInjectedDecl: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getMostRecentNonInjectedDecl(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getDefinition: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getDefinition(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.hasDefinition: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasDefinition(Self.D);
end;

function TCXXRecordDeclW.isDynamicClass: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isDynamicClass(Self.D);
end;

function TCXXRecordDeclW.mayBeDynamicClass: Boolean;
begin
  Result := clangExt_CXXRecordDecl_mayBeDynamicClass(Self.D);
end;

function TCXXRecordDeclW.mayBeNonDynamicClass: Boolean;
begin
  Result := clangExt_CXXRecordDecl_mayBeNonDynamicClass(Self.D);
end;

function TCXXRecordDeclW.isParsingBaseSpecifiers: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isParsingBaseSpecifiers(Self.D);
end;

function TCXXRecordDeclW.getODRHash: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getODRHash(Self.D);
end;

function TCXXRecordDeclW.getNumBases: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumBases(Self.D);
end;

function TCXXRecordDeclW.getBases(i: Cardinal): CXXBaseSpecifier;
begin
  Result := clangExt_CXXRecordDecl_getBases(Self.D, i);
end;

function TCXXRecordDeclW.getNumVBases: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumVBases(Self.D);
end;

function TCXXRecordDeclW.getVBases(i: Cardinal): CXXBaseSpecifier;
begin
  Result := clangExt_CXXRecordDecl_getVBases(Self.D, i);
end;

function TCXXRecordDeclW.hasAnyDependentBases: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasAnyDependentBases(Self.D);
end;

function TCXXRecordDeclW.getNumMethods: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumMethods(Self.D);
end;

function TCXXRecordDeclW.getMethods(i: Cardinal): CXXMethodDecl;
begin
  Result := clangExt_CXXRecordDecl_getMethods(Self.D, i);
end;

function TCXXRecordDeclW.getNumCtors: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumCtors(Self.D);
end;

function TCXXRecordDeclW.getCtors(i: Cardinal): CXXConstructorDecl;
begin
  Result := clangExt_CXXRecordDecl_getCtors(Self.D, i);
end;

function TCXXRecordDeclW.getNumFriends: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumFriends(Self.D);
end;

function TCXXRecordDeclW.getFriends(i: Cardinal): FriendDecl;
begin
  Result := clangExt_CXXRecordDecl_getFriends(Self.D, i);
end;

function TCXXRecordDeclW.hasFriends: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasFriends(Self.D);
end;

function TCXXRecordDeclW.defaultedCopyConstructorIsDeleted: Boolean;
begin
  Result := clangExt_CXXRecordDecl_defaultedCopyConstructorIsDeleted(Self.D);
end;

function TCXXRecordDeclW.defaultedMoveConstructorIsDeleted: Boolean;
begin
  Result := clangExt_CXXRecordDecl_defaultedMoveConstructorIsDeleted(Self.D);
end;

function TCXXRecordDeclW.defaultedDestructorIsDeleted: Boolean;
begin
  Result := clangExt_CXXRecordDecl_defaultedDestructorIsDeleted(Self.D);
end;

function TCXXRecordDeclW.hasSimpleCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasSimpleCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.hasSimpleMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasSimpleMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.hasSimpleCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasSimpleCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.hasSimpleMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasSimpleMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.hasSimpleDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasSimpleDestructor(Self.D);
end;

function TCXXRecordDeclW.hasDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.needsImplicitDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredConstructor(Self.D);
end;

function TCXXRecordDeclW.hasUserProvidedDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserProvidedDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.needsImplicitCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.needsOverloadResolutionForCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsOverloadResolutionForCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.implicitCopyConstructorHasConstParam: Boolean;
begin
  Result := clangExt_CXXRecordDecl_implicitCopyConstructorHasConstParam(Self.D);
end;

function TCXXRecordDeclW.hasCopyConstructorWithConstParam: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasCopyConstructorWithConstParam(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredMoveOperation: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredMoveOperation(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.hasMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.needsImplicitMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.needsOverloadResolutionForMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsOverloadResolutionForMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.needsImplicitCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.needsOverloadResolutionForCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsOverloadResolutionForCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.implicitCopyAssignmentHasConstParam: Boolean;
begin
  Result := clangExt_CXXRecordDecl_implicitCopyAssignmentHasConstParam(Self.D);
end;

function TCXXRecordDeclW.hasCopyAssignmentWithConstParam: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasCopyAssignmentWithConstParam(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.hasMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.needsImplicitMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.needsOverloadResolutionForMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsOverloadResolutionForMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.hasUserDeclaredDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUserDeclaredDestructor(Self.D);
end;

function TCXXRecordDeclW.needsImplicitDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsImplicitDestructor(Self.D);
end;

function TCXXRecordDeclW.needsOverloadResolutionForDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_needsOverloadResolutionForDestructor(Self.D);
end;

function TCXXRecordDeclW.isLambda: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isLambda(Self.D);
end;

function TCXXRecordDeclW.isGenericLambda: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isGenericLambda(Self.D);
end;

function TCXXRecordDeclW.lambdaIsDefaultConstructibleAndAssignable: Boolean;
begin
  Result := clangExt_CXXRecordDecl_lambdaIsDefaultConstructibleAndAssignable(Self.D);
end;

function TCXXRecordDeclW.getLambdaCallOperator: CXXMethodDecl;
begin
  Result := clangExt_CXXRecordDecl_getLambdaCallOperator(Self.D);
end;

function TCXXRecordDeclW.getDependentLambdaCallOperator: FunctionTemplateDecl;
begin
  Result := clangExt_CXXRecordDecl_getDependentLambdaCallOperator(Self.D);
end;

function TCXXRecordDeclW.getLambdaStaticInvoker: CXXMethodDecl;
begin
  Result := clangExt_CXXRecordDecl_getLambdaStaticInvoker(Self.D);
end;

function TCXXRecordDeclW.getGenericLambdaTemplateParameterList: TemplateParameterList;
begin
  Result := clangExt_CXXRecordDecl_getGenericLambdaTemplateParameterList(Self.D);
end;

function TCXXRecordDeclW.getNumLambdaExplicitTemplateParameters: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getNumLambdaExplicitTemplateParameters(Self.D);
end;

function TCXXRecordDeclW.getLambdaExplicitTemplateParameters(i: Cardinal
  ): TNamedDeclW;
begin
  clangExt_CXXRecordDecl_getLambdaExplicitTemplateParameters(Self.D, i).Wrap(Result);
end;

function TCXXRecordDeclW.getLambdaCaptureDefault: LambdaCaptureDefault;
begin
  Result := clangExt_CXXRecordDecl_getLambdaCaptureDefault(Self.D);
end;

function TCXXRecordDeclW.getCaptures(i: Cardinal): LambdaCapture;
begin
  Result := clangExt_CXXRecordDecl_getCaptures(Self.D, i);
end;

function TCXXRecordDeclW.capture_size: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_capture_size(Self.D);
end;

function TCXXRecordDeclW.isAggregate: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isAggregate(Self.D);
end;

function TCXXRecordDeclW.hasInClassInitializer: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasInClassInitializer(Self.D);
end;

function TCXXRecordDeclW.hasUninitializedReferenceMember: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasUninitializedReferenceMember(Self.D);
end;

function TCXXRecordDeclW.isPOD: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isPOD(Self.D);
end;

function TCXXRecordDeclW.isCLike: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isCLike(Self.D);
end;

function TCXXRecordDeclW.isEmpty: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isEmpty(Self.D);
end;

function TCXXRecordDeclW.hasInitMethod: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasInitMethod(Self.D);
end;

function TCXXRecordDeclW.hasPrivateFields: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasPrivateFields(Self.D);
end;

function TCXXRecordDeclW.hasProtectedFields: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasProtectedFields(Self.D);
end;

function TCXXRecordDeclW.hasDirectFields: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasDirectFields(Self.D);
end;

function TCXXRecordDeclW.isPolymorphic: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isPolymorphic(Self.D);
end;

function TCXXRecordDeclW.isAbstract: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isAbstract(Self.D);
end;

function TCXXRecordDeclW.isStandardLayout: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isStandardLayout(Self.D);
end;

function TCXXRecordDeclW.isCXX11StandardLayout: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isCXX11StandardLayout(Self.D);
end;

function TCXXRecordDeclW.hasMutableFields: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasMutableFields(Self.D);
end;

function TCXXRecordDeclW.hasVariantMembers: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasVariantMembers(Self.D);
end;

function TCXXRecordDeclW.hasTrivialDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.hasConstexprNonCopyMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasConstexprNonCopyMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.defaultedDefaultConstructorIsConstexpr: Boolean;
begin
  Result := clangExt_CXXRecordDecl_defaultedDefaultConstructorIsConstexpr(Self.D);
end;

function TCXXRecordDeclW.hasConstexprDefaultConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasConstexprDefaultConstructor(Self.D);
end;

function TCXXRecordDeclW.hasTrivialCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.hasTrivialCopyConstructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialCopyConstructorForCall(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialCopyConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialCopyConstructor(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialCopyConstructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialCopyConstructorForCall(Self.D);
end;

function TCXXRecordDeclW.hasTrivialMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.hasTrivialMoveConstructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialMoveConstructorForCall(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialMoveConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialMoveConstructor(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialMoveConstructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialMoveConstructorForCall(Self.D);
end;

function TCXXRecordDeclW.hasTrivialCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialCopyAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialCopyAssignment(Self.D);
end;

function TCXXRecordDeclW.hasTrivialMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialMoveAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialMoveAssignment(Self.D);
end;

function TCXXRecordDeclW.defaultedDestructorIsConstexpr: Boolean;
begin
  Result := clangExt_CXXRecordDecl_defaultedDestructorIsConstexpr(Self.D);
end;

function TCXXRecordDeclW.hasConstexprDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasConstexprDestructor(Self.D);
end;

function TCXXRecordDeclW.hasTrivialDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialDestructor(Self.D);
end;

function TCXXRecordDeclW.hasTrivialDestructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasTrivialDestructorForCall(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialDestructor(Self.D);
end;

function TCXXRecordDeclW.hasNonTrivialDestructorForCall: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonTrivialDestructorForCall(Self.D);
end;

function TCXXRecordDeclW.allowConstDefaultInit: Boolean;
begin
  Result := clangExt_CXXRecordDecl_allowConstDefaultInit(Self.D);
end;

function TCXXRecordDeclW.hasIrrelevantDestructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasIrrelevantDestructor(Self.D);
end;

function TCXXRecordDeclW.hasNonLiteralTypeFieldsOrBases: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasNonLiteralTypeFieldsOrBases(Self.D);
end;

function TCXXRecordDeclW.hasInheritedConstructor: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasInheritedConstructor(Self.D);
end;

function TCXXRecordDeclW.hasInheritedAssignment: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasInheritedAssignment(Self.D);
end;

function TCXXRecordDeclW.isTriviallyCopyable: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isTriviallyCopyable(Self.D);
end;

function TCXXRecordDeclW.isTrivial: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isTrivial(Self.D);
end;

function TCXXRecordDeclW.isLiteral: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isLiteral(Self.D);
end;

function TCXXRecordDeclW.isStructural: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isStructural(Self.D);
end;

function TCXXRecordDeclW.getInstantiatedFromMemberClass: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getInstantiatedFromMemberClass(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getMemberSpecializationInfo: MemberSpecializationInfo;
begin
  Result := clangExt_CXXRecordDecl_getMemberSpecializationInfo(Self.D);
end;

function TCXXRecordDeclW.getDescribedClassTemplate: ClassTemplateDecl;
begin
  Result := clangExt_CXXRecordDecl_getDescribedClassTemplate(Self.D);
end;

function TCXXRecordDeclW.getTemplateSpecializationKind: TemplateSpecializationKind;
begin
  Result := clangExt_CXXRecordDecl_getTemplateSpecializationKind(Self.D);
end;

function TCXXRecordDeclW.getTemplateInstantiationPattern: TCXXRecordDeclW;
begin
  clangExt_CXXRecordDecl_getTemplateInstantiationPattern(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.getDestructor: CXXDestructorDecl;
begin
  Result := clangExt_CXXRecordDecl_getDestructor(Self.D);
end;

function TCXXRecordDeclW.isAnyDestructorNoReturn: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isAnyDestructorNoReturn(Self.D);
end;

function TCXXRecordDeclW.isLocalClass: TFunctionDeclW;
begin
  clangExt_CXXRecordDecl_isLocalClass(Self.D).Wrap(Result);
end;

function TCXXRecordDeclW.isCurrentInstantiation(const CurContext: TDeclContextW
  ): Boolean;
begin
  Result := clangExt_CXXRecordDecl_isCurrentInstantiation(Self.D, CurContext.Ctx);
end;

function TCXXRecordDeclW.isDerivedFrom(const Base: TCXXRecordDeclW): Boolean;
begin
  Result := clangExt_CXXRecordDecl_isDerivedFrom(Self.D, Base.D);
end;

function TCXXRecordDeclW.isVirtuallyDerivedFrom(const Base: TCXXRecordDeclW
  ): Boolean;
begin
  Result := clangExt_CXXRecordDecl_isVirtuallyDerivedFrom(Self.D, Base.D);
end;

function TCXXRecordDeclW.isProvablyNotDerivedFrom(const Base: TCXXRecordDeclW
  ): Boolean;
begin
  Result := clangExt_CXXRecordDecl_isProvablyNotDerivedFrom(Self.D, Base.D);
end;

function TCXXRecordDeclW.mayBeAbstract: Boolean;
begin
  Result := clangExt_CXXRecordDecl_mayBeAbstract(Self.D);
end;

function TCXXRecordDeclW.isEffectivelyFinal: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isEffectivelyFinal(Self.D);
end;

function TCXXRecordDeclW.getLambdaManglingNumber: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getLambdaManglingNumber(Self.D);
end;

function TCXXRecordDeclW.hasKnownLambdaInternalLinkage: Boolean;
begin
  Result := clangExt_CXXRecordDecl_hasKnownLambdaInternalLinkage(Self.D);
end;

function TCXXRecordDeclW.getLambdaContextDecl: Decl;
begin
  Result := clangExt_CXXRecordDecl_getLambdaContextDecl(Self.D);
end;

function TCXXRecordDeclW.getDeviceLambdaManglingNumber: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getDeviceLambdaManglingNumber(Self.D);
end;

function TCXXRecordDeclW.getMSInheritanceModel: MSInheritanceModel;
begin
  Result := clangExt_CXXRecordDecl_getMSInheritanceModel(Self.D);
end;

function TCXXRecordDeclW.calculateInheritanceModel: MSInheritanceModel;
begin
  Result := clangExt_CXXRecordDecl_calculateInheritanceModel(Self.D);
end;

function TCXXRecordDeclW.nullFieldOffsetIsZero: Boolean;
begin
  Result := clangExt_CXXRecordDecl_nullFieldOffsetIsZero(Self.D);
end;

function TCXXRecordDeclW.getMSVtorDispMode: MSVtorDispMode;
begin
  Result := clangExt_CXXRecordDecl_getMSVtorDispMode(Self.D);
end;

function TCXXRecordDeclW.isDependentLambda: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isDependentLambda(Self.D);
end;

function TCXXRecordDeclW.isNeverDependentLambda: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isNeverDependentLambda(Self.D);
end;

function TCXXRecordDeclW.getLambdaDependencyKind: Cardinal;
begin
  Result := clangExt_CXXRecordDecl_getLambdaDependencyKind(Self.D);
end;

function TCXXRecordDeclW.getLambdaTypeInfo: TypeSourceInfo;
begin
  Result := clangExt_CXXRecordDecl_getLambdaTypeInfo(Self.D);
end;

function TCXXRecordDeclW.isInterfaceLike: Boolean;
begin
  Result := clangExt_CXXRecordDecl_isInterfaceLike(Self.D);
end;

class function TCXXRecordDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_CXXRecordDecl_classof(aDecl.D);
end;

class function TCXXRecordDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_CXXRecordDecl_classofKind(K);
end;  

{$endregion 'TCXXRecordDeclW'}

{$region 'ExplicitSpecifierHelper'}

function ExplicitSpecifierHelper.getKind: ExplicitSpecKind;
begin
  Result := clangExt_ExplicitSpecifier_getKind(Self);
end;

function ExplicitSpecifierHelper.getExpr: Expr;
begin
  Result := clangExt_ExplicitSpecifier_getExpr(Self);
end;

function ExplicitSpecifierHelper.isSpecified: Boolean;
begin
  Result := clangExt_ExplicitSpecifier_isSpecified(Self);
end;

function ExplicitSpecifierHelper.isEquivalent(const Other: ExplicitSpecifier
  ): Boolean;
begin
  Result := clangExt_ExplicitSpecifier_isEquivalent(Self, Other);
end;

function ExplicitSpecifierHelper.isExplicit: Boolean;
begin
  Result := clangExt_ExplicitSpecifier_isExplicit(Self);
end;

function ExplicitSpecifierHelper.isInvalid: Boolean;
begin
  Result := clangExt_ExplicitSpecifier_isInvalid(Self);
end; 
{$endregion 'ExplicitSpecifierHelper'}

{$region 'TCXXMethodDeclW'}

class function TCXXMethodDeclW.Create(const aDecl: CXXMethodDecl; out
  oDecl: TCXXMethodDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TCXXMethodDeclW);
  if (not Assigned(aDecl)) or (not clangExt_CXXMethodDecl_classof(aDecl)) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TCXXMethodDeclW.isStatic: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isStatic(Self.D);
end;

function TCXXMethodDeclW.isInstance: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isInstance(Self.D);
end;

class function TCXXMethodDeclW.isStaticOverloadedOperator(
  OOK: OverloadedOperatorKind): Boolean;
begin
  Result := clangExt_CXXMethodDecl_isStaticOverloadedOperator(OOK);
end;

function TCXXMethodDeclW.isConst: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isConst(Self.D);
end;

function TCXXMethodDeclW.isVolatile: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isVolatile(Self.D);
end;

function TCXXMethodDeclW.isVirtual: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isVirtual(Self.D);
end;

function TCXXMethodDeclW.getDevirtualizedMethod(const Base: Expr;
  IsAppleKext: Boolean): TCXXMethodDeclW;
begin
  clangExt_CXXMethodDecl_getDevirtualizedMethod(Self.D, Base, IsAppleKext).Wrap(Result);
end;

function TCXXMethodDeclW.isCopyAssignmentOperator: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isCopyAssignmentOperator(Self.D);
end;

function TCXXMethodDeclW.isMoveAssignmentOperator: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isMoveAssignmentOperator(Self.D);
end;

function TCXXMethodDeclW.getCanonicalDecl: TCXXMethodDeclW;
begin
   clangExt_CXXMethodDecl_getCanonicalDecl(Self.D).Wrap(Result);
end;

function TCXXMethodDeclW.getMostRecentDecl: TCXXMethodDeclW;
begin
  clangExt_CXXMethodDecl_getMostRecentDecl(Self.D).Wrap(Result);
end;

function TCXXMethodDeclW.size_overridden_methods: Cardinal;
begin
  Result := clangExt_CXXMethodDecl_size_overridden_methods(Self.D);
end;

function TCXXMethodDeclW.overridden_methods(i: Cardinal): TCXXMethodDeclW;
begin
  clangExt_CXXMethodDecl_overridden_methods(Self.D, i).Wrap(Result);
end;

function TCXXMethodDeclW.getParent: TCXXRecordDeclW;
begin
  clangExt_CXXMethodDecl_getParent(Self.D).Wrap(Result);
end;

function TCXXMethodDeclW.getThisType: CXQualType;
begin
  Result := clangExt_CXXMethodDecl_getThisType(Self.D);
end;

function TCXXMethodDeclW.getThisObjectType: CXQualType;
begin
  Result := clangExt_CXXMethodDecl_getThisObjectType(Self.D);
end;

class function TCXXMethodDeclW.getThisTypeProtoType(
  const FPT: FunctionProtoType; const aDecl: TCXXRecordDeclW): CXQualType;
begin
  Result := clangExt_CXXMethodDecl_getThisTypeProtoType(FPT, aDecl.D);
end;

class function TCXXMethodDeclW.getThisObjectProtoType(
  const FPT: FunctionProtoType; const aDecl: TCXXRecordDeclW): CXQualType;
begin
  Result := clangExt_CXXMethodDecl_getThisObjectProtoType(FPT, aDecl.D);
end;

function TCXXMethodDeclW.getMethodQualifiers: CXQualifiers;
begin
  Result := clangExt_CXXMethodDecl_getMethodQualifiers(Self.D);
end;

function TCXXMethodDeclW.getRefQualifier: RefQualifierKind;
begin
  Result := clangExt_CXXMethodDecl_getRefQualifier(Self.D);
end;

function TCXXMethodDeclW.hasInlineBody: Boolean;
begin
  Result := clangExt_CXXMethodDecl_hasInlineBody(Self.D);
end;

function TCXXMethodDeclW.isLambdaStaticInvoker: Boolean;
begin
  Result := clangExt_CXXMethodDecl_isLambdaStaticInvoker(Self.D);
end;

function TCXXMethodDeclW.getCorrespondingMethodInClass(
  const RD: TCXXRecordDeclW; MayBeBase: Boolean): TCXXMethodDeclW;
begin
  clangExt_CXXMethodDecl_getCorrespondingMethodInClass(Self.D, RD.D, MayBeBase).Wrap(Result);
end;

function TCXXMethodDeclW.getCorrespondingMethodDeclaredInClass(
  const RD: TCXXRecordDeclW; MayBeBase: Boolean): TCXXMethodDeclW;
begin
  clangExt_CXXMethodDecl_getCorrespondingMethodDeclaredInClass(Self.D, RD.D, MayBeBase).Wrap(Result);
end;

class function TCXXMethodDeclW.classof(const aDecl: TDeclW): Boolean;
begin
  Result := clangExt_CXXMethodDecl_classof(aDecl.D);
end;

class function TCXXMethodDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_CXXMethodDecl_classofKind(k);
end;

{$endregion 'TCXXMethodDeclW'}

{$region 'TLinkageSpecDeclW'}

class function TLinkageSpecDeclW.Create(const aDecl: LinkageSpecDecl; out
  oDecl: TLinkageSpecDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TLinkageSpecDeclW);
  if not clangExt_LinkageSpecDecl_classof(aDecl) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TLinkageSpecDeclW.getLanguage: CX_LinkageSpecDecl_LanguageIDs;
begin
  Result := clangExt_LinkageSpecDecl_getLanguage(Self.D);
end;

function TLinkageSpecDeclW.hasBraces: Boolean;
begin
  Result := clangExt_LinkageSpecDecl_hasBraces(Self.D);
end;

function TLinkageSpecDeclW.getExternLoc: CXSourceLocation;
begin
  Result := clangExt_LinkageSpecDecl_getExternLoc(Self.D);
end;

function TLinkageSpecDeclW.getRBraceLoc: CXSourceLocation;
begin
  Result := clangExt_LinkageSpecDecl_getRBraceLoc(Self.D);
end;

function TLinkageSpecDeclW.getEndLoc: CXSourceLocation;
begin
  Result := clangExt_LinkageSpecDecl_getEndLoc(Self.D);
end;

function TLinkageSpecDeclW.getSourceRange: CXSourceRange;
begin
  Result := clangExt_LinkageSpecDecl_getSourceRange(Self.D);
end;

class function TLinkageSpecDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_LinkageSpecDecl_classof(aDecl.D);
end;

class function TLinkageSpecDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_LinkageSpecDecl_classofKind(K);
end;

function TLinkageSpecDeclW.castToDeclContext: TDeclContextW;
begin
  clangExt_LinkageSpecDecl_castToDeclContext(Self.D).Wrap(Result);
end;

class function TLinkageSpecDeclW.castFromDeclContext(DC: TDeclContextW; out
  aDecl: TLinkageSpecDeclW): Boolean;
begin
  Result := clangExt_LinkageSpecDecl_castFromDeclContext(DC.Ctx).Wrap(aDecl);
end;

{$endregion 'TLinkageSpecDeclW'}
           
{$region 'TLinkageSpecDeclW'}
class function TMSGuidDeclW.Create(const aDecl: MSGuidDecl; out
  oDecl: TMSGuidDeclW): Boolean;
begin
  Result := False;
  oDecl := Default(TMSGuidDeclW);
  if not clangExt_MSGuidDecl_classof(aDecl) then
    Exit;
  oDecl.D := aDecl;
  Result := True;
end;

function TMSGuidDeclW.printName: string;
begin
  Result := clangExt_MSGuidDecl_printName(D).ToString;
end;

function TMSGuidDeclW.getParts: MSGuidDeclParts;
begin
  Result := clangExt_MSGuidDecl_getParts(D);
end;

function TMSGuidDeclW.getAsAPValue: APValue;
begin
  Result := clangExt_MSGuidDecl_getAsAPValue(D);
end;

class function TMSGuidDeclW.classof(aDecl: TDeclW): Boolean;
begin
  Result := clangExt_MSGuidDecl_classof(aDecl.D);
end;

class function TMSGuidDeclW.classofKind(K: CX_DeclKind): Boolean;
begin
  Result := clangExt_MSGuidDecl_classofKind(K);
end;  
{$endregion 'TLinkageSpecDeclW'}

end.

