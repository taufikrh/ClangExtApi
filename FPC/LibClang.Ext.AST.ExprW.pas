unit LibClang.Ext.AST.ExprW;

{$mode ObjFPC}{$H+} 
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.DependenceFlagsH,
  LibClang.Ext.AST.StmtW,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.ExprU,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.llvm.ADT.APSIntH,   
  LibClang.Ext.AST.OperationKindsH,
  LibClang.Ext.Basic.LangOptionsH, 
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.AST.ExprObjCH,
  LibClang.Ext.Basic.OperatorKindsH, 
  LibClang.Ext.llvm.ADT.APFloatH,
  LibClang.Ext.Basic.TypeTraitsH,
  LibClang.Ext.llvm.ADT.APIntW,
  LibClang.Ext.Basic.SourceManagerH,
  LibClang.Ext.Basic.TargetInfoH;

type

  { TExprW }

  TExprW = object(TValueStmtW)
  public
    class function Create(aExpr: Expr; out oExpr: TExprW): Boolean; static;
  public
    function getType: CXQualType;
    function getDependence: ExprDependence;
    function isValueDependent: Boolean;
    function isTypeDependent: Boolean;
    function isInstantiationDependent: Boolean;
    function containsUnexpandedParameterPack: Boolean;
    function containsErrors: Boolean;
    function getExprLoc(const Ctx: ASTContext): CXSourceLocation;
    function isReadIfDiscardedInCPlusPlus11: Boolean;
    function isLValue: Boolean;
    function isPRValue: Boolean;
    function isXValue: Boolean;
    function isGLValue: Boolean;
    function ClassifyLValue(const Ctx: ASTContext): Expr_LValueClassification;
    function isModifiableLvalue(const Ctx: ASTContext; Loc: PCXSourceLocation = nil): Expr_isModifiableLvalueResult;
    function getFPFeaturesInEffect(const LO: LangOptions): FPOptions; // dispose with clangExt_FPOptions_Dispose
    function getValueKind: ExprValueKind;
    function getObjectKind: ExprObjectKind;
    function isOrdinaryOrBitFieldObject: Boolean;
    function refersToBitField: Boolean;
    function getSourceBitField: FieldDecl;
    function getReferencedDeclOfCallee: Decl;
    function getObjCProperty: ObjCPropertyRefExpr;
    function isObjCSelfExpr: Boolean;
    function refersToVectorElement: Boolean;
    function refersToMatrixElement: Boolean;
    function refersToGlobalRegisterVar: Boolean;
    function hasPlaceholderType: Boolean;
    function hasPlaceholderTypeKind(K: BuiltinTypeKind): Boolean;
    function isKnownToHaveBooleanValue(Semantic: Boolean = True): Boolean;
    function isIntegerConstantExpr(const Ctx: ASTContext; Loc: PCXSourceLocation = nil): Boolean;
    function isCXX98IntegralConstantExpr(const Ctx: ASTContext): Boolean;
    function isCXX11ConstantExpr(const Ctx: ASTContext; Ret: PAPValue = nil; Loc: PCXSourceLocation = nil): Boolean;
    function isConstantInitializer(const Ctx: ASTContext; ForRef: Boolean; const Culprit: PExpr = nil): Boolean;
    function getAsBuiltinConstantDeclRef(const Ctx: ASTContext): ValueDecl;
    function tryEvaluateStrLen(out Ret: UInt64; const Ctx: ASTContext): Boolean;
    function isNullPointerConstant(const Ctx: ASTContext; NPC: NullPointerConstantValueDependence): NullPointerConstantKind;
    function isOBJCGCCandidate(const Ctx: ASTContext): Boolean;

    // Returns true if this expression is a bound member function.
    function isBoundMemberFunction(const Ctx: ASTContext): Boolean;
    function IgnoreUnlessSpelledInSource: TExprW;
    function IgnoreImpCasts: TExprW;
    function IgnoreCasts: TExprW;
    function IgnoreImplicit: TExprW;
    function IgnoreImplicitAsWritten: TExprW;
    function IgnoreParens: TExprW;
    function IgnoreParenImpCasts: TExprW;
    function IgnoreParenCasts: TExprW;
    function IgnoreConversionOperatorSingleStep: TExprW;
    function IgnoreParenLValueCasts: TExprW;
    function IgnoreParenNoopCasts(const Ctx: ASTContext): TExprW;
    function IgnoreParenBaseCasts: TExprW;
    // Determine whether this expression is a default function argument.
    //
    // Default arguments are implicitly generated in the abstract syntax tree
    // by semantic analysis for function calls, object constructions, etc. in
    // C++. Default arguments are represented by \c CXXDefaultArgExpr nodes;
    // this routine also looks through any implicit casts to determine whether
    // the expression is a default argument.
    function isDefaultArgument: Boolean;

    // Determine whether the result of this expression is a
    // temporary object of the given class type.
    function isTemporaryObject(const Ctx: ASTContext; const TempTy: CXXRecordDecl): Boolean;

    // Whether this expression is an implicit reference to 'this' in C++.
    function isImplicitCXXThis: Boolean;
    function getBestDynamicClassType: CXXRecordDecl;
    function getBestDynamicClassTypeExpr: TExprW;
    class function isSameComparisonOperand(const E1: TExprW; const E2: TExprW): Boolean; static;
    class function classof(const T: TStmtW): Boolean; static;
  end;       

  { TFullExprW }

  TFullExprW = object(TExprW)
  public
    class function Create(aExpr: FullExpr; out oExpr: TFullExprW): Boolean; static;
  public
    function getSubExpr: TExprW;
    class function classof(const T: TStmtW): Boolean; static;
  end;

  { TConstantExprW }

  TConstantExprW = object(TFullExprW)
  public
    class function Create(aExpr: ConstantExpr; out oExpr: TConstantExprW): Boolean; static;
  public
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getResultAPValueKind: APValue_ValueKind;
    function getResultStorageKind: ConstantExpr_ResultStorageKind;
    function isImmediateInvocation: Boolean;
    function hasAPValueResult: Boolean;
    // dispose: clangExt_APValue_Dispose
    function getAPValueResult: APValue;
    // dispose: clangExt_APValue_Dispose
    function getResultAsAPValue: APValue;
    // dispose: clangExt_APSInt_Dispose
    function getResultAsAPSInt: APSInt;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

  { TDeclRefExprW }

  TDeclRefExprW = object(TExprW)
  public
    class function Create(aExpr: DeclRefExpr; out oExpr: TDeclRefExprW): Boolean; static;
  public
    function getDecl: ValueDecl;
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function hasQualifier: Boolean;
    // dispose: clangExt_NestedNameSpecifierLoc_Dispose
    function getQualifierLoc: NestedNameSpecifierLoc;
    function getQualifier: NestedNameSpecifier;
    function getFoundDecl: NamedDecl;
    function hasTemplateKWAndArgsInfo: Boolean;
    function getTemplateKeywordLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLAngleLoc(const Ctx: ASTContext): CXSourceLocation;
    function getRAngleLoc(const Ctx: ASTContext): CXSourceLocation;
    function hasTemplateKeyword: Boolean;
    function hasExplicitTemplateArgs: Boolean;
    function getTemplateArgs: TemplateArgumentLoc;
    function getNumTemplateArgs: Cardinal;
    function template_arguments(i: Cardinal): TemplateArgumentLoc;
    function hadMultipleCandidates: Boolean;
    function isNonOdrUse: NonOdrUseReason;
    function refersToEnclosingVariableOrCapture: Boolean;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;   

  { TIntegerLiteralW }

  TIntegerLiteralW = object(TExprW)
  public
    class function Create(aExpr: IntegerLiteral; out oExpr: TIntegerLiteralW): Boolean; static;
  public
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
    class function classof(const T: TStmtW): Boolean; static;
    // dispose: clangExt_APInt_Dispose
    function getValue: TAPIntW;
  end;    

  { TCharacterLiteralW }

  TCharacterLiteralW = object(TExprW)
  public
    class function Create(aExpr: CharacterLiteral; out oExpr: TCharacterLiteralW): Boolean; static;
  public
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    function getKind: CharacterLiteral_CharacterKind;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getValue: Cardinal;
    class function classof(const T: TStmtW): Boolean; static;
    class function print(val: Cardinal; Kind: CharacterLiteral_CharacterKind): string; static;
    class function printCXString(val: Cardinal; Kind: CharacterLiteral_CharacterKind): CXString; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

  { TFloatingLiteralW }

  TFloatingLiteralW = object(TExprW)
  public
    class function Create(aExpr: FloatingLiteral; out oExpr: TFloatingLiteralW): Boolean; static;
  public
    // dispose: clangExt_APFloat_Dispose
    function getValue: APFloat;
    function isExact: Boolean;
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

  { TStringLiteralW }

  TStringLiteralW = object(TExprW)
  public
    class function Create(aExpr: StringLiteral; out oExpr: TStringLiteralW): Boolean; static;
  public
    function getString: string;
    function getStringCXString: CXString;
    function getBytes: string;
    function getBytesCXString: CXString;
    function outputString: string;
    function getCodeUnit(i: SIZE_T): Cardinal;
    function getByteLength: Cardinal;
    function getLength: Cardinal;
    function getCharByteWidth: Cardinal;
    function getKind: StringLiteral_StringKind;
    function isOrdinary: Boolean;
    function isWide: Boolean;
    function isUTF8: Boolean;
    function isUTF16: Boolean;
    function isUTF32: Boolean;
    function isPascal: Boolean;
    function containsNonAscii: Boolean;
    function containsNonAsciiOrNull: Boolean;
    function getNumConcatenated: Cardinal;
    function getStrTokenLoc(TokNum: Cardinal; const Ctx: ASTContext): CXSourceLocation;
    function getLocationOfByte(ByteNo: Cardinal; const SM: SourceManager; const Features: LangOptions; const Target: TargetInfo; const Ctx: ASTContext; StartToken: PCardinal = nil; StartTokenByteOffset: PCardinal = nil): CXSourceLocation;
    function GetToklocNum: Cardinal;
    function GetTokloc(i: Cardinal; const Ctx: ASTContext): CXSourceLocation;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  public
    function ToString(out str: string): Boolean;
  end;

  { TParenExprW }

  TParenExprW = object(TExprW)
  public
    class function Create(aExpr: ParenExpr; out oExpr: TParenExprW): Boolean; static;
  public
    function getSubExpr: TExprW;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLParen(const Ctx: ASTContext): CXSourceLocation;
    function getRParen(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

  { TUnaryOperatorW }

  TUnaryOperatorW = object(TExprW)
  public
    class function Create(aExpr: UnaryOperator; out oExpr: TUnaryOperatorW): Boolean; static;
  public
    function getOpcode: UnaryOperatorKind;
    function getSubExpr: TExprW;
    function getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
    function canOverflow: Boolean;
    function isFPContractableWithinStatement(const LO: LangOptions): Boolean;
    function isFEnvAccessOn(const LO: LangOptions): Boolean;
    class function isPostfixStatic(Op: UnaryOperatorKind): Boolean; static;
    class function isPrefixStatic(Op: UnaryOperatorKind): Boolean; static;
    function isPrefix: Boolean;
    function isPostfix: Boolean;
    class function isIncrementOpStatic(Op: UnaryOperatorKind): Boolean; static;
    function isIncrementOp: Boolean;
    class function isDecrementOpStatic(Op: UnaryOperatorKind): Boolean; static;
    function isDecrementOp: Boolean;
    class function isIncrementDecrementOpStatic(Op: UnaryOperatorKind): Boolean; static;
    function isIncrementDecrementOp: Boolean;
    class function isArithmeticOpStatic(Op: UnaryOperatorKind): Boolean; static;
    function isArithmeticOp: Boolean;
    class function getOpcodeStr(Op: UnaryOperatorKind): string; static;
    class function getOverloadedOpcode(OO: OverloadedOperatorKind; Postfix: Boolean): UnaryOperatorKind; static;
    class function getOverloadedOperator(Opc: UnaryOperatorKind): OverloadedOperatorKind; static;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getExprLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
    function hasStoredFPFeatures: Boolean;
    function getStoredFPFeatures: FPOptionsOverride;
    function getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
    function getFPOptionsOverride: FPOptionsOverride;
  end;

  { TUnaryExprOrTypeTraitExprW }

  TUnaryExprOrTypeTraitExprW = object(TExprW)
  public
    class function Create(aExpr: UnaryExprOrTypeTraitExpr; out oExpr: TUnaryExprOrTypeTraitExprW): Boolean; static;
  public
    function getKind: UnaryExprOrTypeTrait;
    function isArgumentType: Boolean;
    function getArgumentType: CXQualType;
    function getArgumentTypeInfo: TypeSourceInfo;
    function getArgumentExpr: TExprW;
    function getTypeOfArgument: CXQualType;
    function getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
    function getRParenLoc(const Ctx: ASTContext): CXSourceLocation;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

  { TCastExprW }

  TCastExprW = object(TExprW)
  public
    class function Create(aExpr: CastExpr; out oExpr: TCastExprW): Boolean; static;
  public
    function getCastKind: CastKind;
    class function CastKindName(CK: CastKind): string; static;
    function getCastKindName: string;
    function getSubExpr: TExprW;
    function getSubExprAsWritten: TExprW;
    function getConversionFunction: NamedDecl;
    function path_empty: Boolean;
    function path_size: Cardinal;
    function getPath(i: Cardinal): CXXBaseSpecifier;
    function getTargetUnionField: FieldDecl;
    function hasStoredFPFeatures: Boolean;
    function getStoredFPFeatures: FPOptionsOverride;
    function getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
    function getFPFeatures: FPOptionsOverride;
    class function getTargetFieldForToUnionCast(const unionType: CXQualType; const opType: CXQualType): FieldDecl; static;
    class function getTargetFieldForToUnionCastRecordDecl(const RD: RecordDecl; const opType: CXQualType): FieldDecl; static;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;      

  { TImplicitCastExprW }

  TImplicitCastExprW = object(TCastExprW)
  public
    class function Create(aExpr: ImplicitCastExpr; out oExpr: TImplicitCastExprW): Boolean; static;
  public
    function isPartOfExplicitCast: Boolean;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
  end;

  { TExplicitCastExprW }

  TExplicitCastExprW = object(TCastExprW)
  public
    class function Create(aExpr: ExplicitCastExpr; out oExpr: TExplicitCastExprW): Boolean; static;
  public
    function getTypeInfoAsWritten: TypeSourceInfo;
    function getTypeAsWritten: CXQualType;
    class function classof(const T: TStmtW): Boolean; static;
  end;

  { TCStyleCastExprW }

  TCStyleCastExprW = object(TExplicitCastExprW)
  public
    class function Create(aExpr: CStyleCastExpr; out oExpr: TCStyleCastExprW): Boolean; static;
  public
    function getLParenLoc(const Ctx: ASTContext): CXSourceLocation;
    function getRParenLoc(const Ctx: ASTContext): CXSourceLocation;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
  end;

  { TBinaryOperatorW }

  TBinaryOperatorW = object(TExprW)
  public
    class function Create(aExpr: BinaryOperator; out oExpr: TBinaryOperatorW): Boolean; static;
  public
    function getExprLoc(const Ctx: ASTContext): CXSourceLocation;
    function getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
    function getOpcode: BinaryOperatorKind;
    function getLHS: TExprW;
    function getRHS: TExprW;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getOpcodeStrStatic(Op: BinaryOperatorKind): string;
    function getOpcodeStr: string;
    class function getOverloadedOpcode(OO: OverloadedOperatorKind): BinaryOperatorKind; static;
    class function getOverloadedOperator(Opc: BinaryOperatorKind): OverloadedOperatorKind; static;
    class function isPtrMemOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isPtrMemOp: Boolean;
    class function isMultiplicativeOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isMultiplicativeOp: Boolean;
    class function isAdditiveOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isAdditiveOp: Boolean;
    class function isShiftOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isShiftOp: Boolean;
    class function isBitwiseOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isBitwiseOp: Boolean;
    class function isRelationalOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isRelationalOp: Boolean;
    class function isEqualityOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isEqualityOp: Boolean;
    class function isComparisonOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isComparisonOp: Boolean;
    class function isCommaOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isCommaOp: Boolean;
    class function negateComparisonOp(Opc: BinaryOperatorKind): BinaryOperatorKind; static;
    class function reverseComparisonOp(Opc: BinaryOperatorKind): BinaryOperatorKind; static;
    class function isLogicalOpStatic(Opc: BinaryOperatorKind): Boolean;
    function isLogicalOp: Boolean;
    class function isAssignmentOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isAssignmentOp: Boolean;
    class function isCompoundAssignmentOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isCompoundAssignmentOp: Boolean;
    class function getOpForCompoundAssignment(Opc: BinaryOperatorKind): BinaryOperatorKind; static;
    class function isShiftAssignOpStatic(Opc: BinaryOperatorKind): Boolean; static;
    function isShiftAssignOp: Boolean;
    class function isNullPointerArithmeticExtension(const Ctx: ASTContext; Opc: BinaryOperatorKind; LHS: TExprW; RHS: TExprW): Boolean; static;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
    function hasStoredFPFeatures: Boolean;
    function getStoredFPFeatures: FPOptionsOverride;
    function getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
    function getFPFeatures(const LO: LangOptions): FPOptionsOverride;
    function isFPContractableWithinStatement(const LO: LangOptions): Boolean;
    function isFEnvAccessOn(const LO: LangOptions): Boolean;
  end;

  { TInitListExprW }

  TInitListExprW = object(TExprW)
  public
    class function Create(aExpr: InitListExpr; out oExpr: TInitListExprW): Boolean; static;
  public
    function getNumInits: Cardinal;
    function getInit(Init: Cardinal): TExprW;
    function getArrayFiller: TExprW;
    function hasArrayFiller: Boolean;
    function getInitializedFieldInUnion: FieldDecl;
    function isExplicit: Boolean;
    function isStringLiteralInit: Boolean;
    function isTransparent: Boolean;
    function isIdiomaticZeroInitializer(const LangOpts: LangOptions): Boolean;
    function getLBraceLoc(const Ctx: ASTContext): CXSourceLocation;
    function getRBraceLoc(const Ctx: ASTContext): CXSourceLocation;
    function isSemanticForm: Boolean;
    function getSemanticForm: TInitListExprW;
    function isSyntacticForm: Boolean;
    function getSyntacticForm: TInitListExprW;
    function hadArrayRangeDesignator: Boolean;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const T: TStmtW): Boolean; static;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;

{$region 'Helper'}

  ExprHelper = type helper for Expr
    function Wrap(out S: TExprW): Boolean;
  end;

  FullExprHelper = type helper for FullExpr
    function Wrap(out S: TFullExprW): Boolean;
  end;

  ConstantExprHelper = type helper for ConstantExpr
    function Wrap(out S: TConstantExprW): Boolean;
  end;
  
  DeclRefExprHelper = type helper for DeclRefExpr
    function Wrap(out S: TDeclRefExprW): Boolean;
  end;

  IntegerLiteralHelper = type helper for IntegerLiteral
    function Wrap(out S: TIntegerLiteralW): Boolean;
  end;

  CharacterLiteralHelper = type helper for CharacterLiteral
    function Wrap(out S: TCharacterLiteralW): Boolean;
  end;

  FloatingLiteralHelper = type helper for FloatingLiteral
    function Wrap(out S: TFloatingLiteralW): Boolean;
  end;

  ParenExprHelper = type helper for ParenExpr
    function Wrap(out S: TParenExprW): Boolean;
  end;

  UnaryOperatorHelper = type helper for UnaryOperator
    function Wrap(out S: TUnaryOperatorW): Boolean;
  end;

  UnaryExprOrTypeTraitExprHelper = type helper for UnaryExprOrTypeTraitExpr
    function Wrap(out S: TUnaryExprOrTypeTraitExprW): Boolean;
  end;

  CastExprHelper = type helper for CastExpr
    function Wrap(out S: TCastExprW): Boolean;
  end;

  ImplicitCastExprHelper = type helper for ImplicitCastExpr
    function Wrap(out S: TImplicitCastExprW): Boolean;
  end;

  ExplicitCastExprHelper = type helper for ExplicitCastExpr
    function Wrap(out S: TExplicitCastExprW): Boolean;
  end;

  CStyleCastExprHelper = type helper for CStyleCastExpr
    function Wrap(out S: TCStyleCastExprW): Boolean;
  end;

  BinaryOperatorHelper = type helper for BinaryOperator
    function Wrap(out S: TBinaryOperatorW): Boolean;
  end;

  { InitListExprHelper }

  InitListExprHelper = type helper for InitListExpr
    function Wrap(out S: TInitListExprW): Boolean;
  end;
{$endregion 'Helper'}

implementation

{$region 'Helper'}

function ExprHelper.Wrap(out S: TExprW): Boolean;
begin
  Result := TExprW.Create(Self, S);
end;

function FullExprHelper.Wrap(out S: TFullExprW): Boolean;
begin
  Result := TFullExprW.Create(Self, S);
end;

function ConstantExprHelper.Wrap(out S: TConstantExprW): Boolean;
begin
  Result := TConstantExprW.Create(Self, S);
end;

function DeclRefExprHelper.Wrap(out S: TDeclRefExprW): Boolean;
begin
  Result := TDeclRefExprW.Create(Self, S);
end;

function IntegerLiteralHelper.Wrap(out S: TIntegerLiteralW): Boolean;
begin
  Result := TIntegerLiteralW.Create(Self, S);
end;

function CharacterLiteralHelper.Wrap(out S: TCharacterLiteralW): Boolean;
begin
  Result := TCharacterLiteralW.Create(Self, S);
end;

function FloatingLiteralHelper.Wrap(out S: TFloatingLiteralW): Boolean;
begin
  Result := TFloatingLiteralW.Create(Self, S);
end;

function ParenExprHelper.Wrap(out S: TParenExprW): Boolean;
begin
  Result := TParenExprW.Create(Self, S);
end;

function UnaryOperatorHelper.Wrap(out S: TUnaryOperatorW): Boolean;
begin
  Result := TUnaryOperatorW.Create(Self, S);
end;

function UnaryExprOrTypeTraitExprHelper.Wrap(out S: TUnaryExprOrTypeTraitExprW
  ): Boolean;
begin
  Result := TUnaryExprOrTypeTraitExprW.Create(Self, S);
end;

function CastExprHelper.Wrap(out S: TCastExprW): Boolean;
begin
  Result := TCastExprW.Create(Self, S);
end;
 
function ImplicitCastExprHelper.Wrap(out S: TImplicitCastExprW): Boolean;
begin
  Result := TImplicitCastExprW.Create(Self, S);
end;

function ExplicitCastExprHelper.Wrap(out S: TExplicitCastExprW): Boolean;
begin
  Result := TExplicitCastExprW.Create(Self, S);
end;

function CStyleCastExprHelper.Wrap(out S: TCStyleCastExprW): Boolean;
begin
  Result := TCStyleCastExprW.Create(Self, S);
end;

function BinaryOperatorHelper.Wrap(out S: TBinaryOperatorW): Boolean;
begin
  Result := TBinaryOperatorW.Create(Self, S);
end;

function InitListExprHelper.Wrap(out S: TInitListExprW): Boolean;
begin
  Result := TInitListExprW.Create(Self, S);
end;

{$endregion 'Helper'}

{$region 'TExprW'}

class function TExprW.Create(aExpr: Expr; out oExpr: TExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TExprW);
  if (not Assigned(aExpr)) or (not clangExt_Expr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TExprW.getType: CXQualType;
begin
  Result := clangExt_Expr_getType(Self.S);
end;

function TExprW.getDependence: ExprDependence;
begin
  Result := clangExt_Expr_getDependence(Self.S);
end;

function TExprW.isValueDependent: Boolean;
begin
  Result := clangExt_Expr_isValueDependent(Self.S);
end;

function TExprW.isTypeDependent: Boolean;
begin
  Result := clangExt_Expr_isTypeDependent(Self.S);
end;

function TExprW.isInstantiationDependent: Boolean;
begin
  Result := clangExt_Expr_isInstantiationDependent(Self.S);
end;

function TExprW.containsUnexpandedParameterPack: Boolean;
begin
  Result := clangExt_Expr_containsUnexpandedParameterPack(Self.S);
end;

function TExprW.containsErrors: Boolean;
begin
  Result := clangExt_Expr_containsErrors(Self.S);
end;

function TExprW.getExprLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Expr_getExprLoc(Self.S, Ctx);
end;

function TExprW.isReadIfDiscardedInCPlusPlus11: Boolean;
begin
  Result := clangExt_Expr_isReadIfDiscardedInCPlusPlus11(Self.S);
end;

function TExprW.isLValue: Boolean;
begin
  Result := clangExt_Expr_isLValue(Self.S);
end;

function TExprW.isPRValue: Boolean;
begin
  Result := clangExt_Expr_isPRValue(Self.S);
end;

function TExprW.isXValue: Boolean;
begin
  Result := clangExt_Expr_isXValue(Self.S);
end;

function TExprW.isGLValue: Boolean;
begin
  Result := clangExt_Expr_isGLValue(Self.S);
end;

function TExprW.ClassifyLValue(const Ctx: ASTContext): Expr_LValueClassification;
begin
  Result := clangExt_Expr_ClassifyLValue(Self.S, Ctx);
end;

function TExprW.isModifiableLvalue(const Ctx: ASTContext; Loc: PCXSourceLocation): Expr_isModifiableLvalueResult;
begin
  Result := clangExt_Expr_isModifiableLvalue(Self.S, Ctx, Loc);
end;

function TExprW.getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
begin
  Result := clangExt_Expr_getFPFeaturesInEffect(Self.S, LO);
end;

function TExprW.getValueKind: ExprValueKind;
begin
  Result := clangExt_Expr_getValueKind(Self.S);
end;

function TExprW.getObjectKind: ExprObjectKind;
begin
  Result := clangExt_Expr_getObjectKind(Self.S);
end;

function TExprW.isOrdinaryOrBitFieldObject: Boolean;
begin
  Result := clangExt_Expr_isOrdinaryOrBitFieldObject(Self.S);
end;

function TExprW.refersToBitField: Boolean;
begin
  Result := clangExt_Expr_refersToBitField(Self.S);
end;

function TExprW.getSourceBitField: FieldDecl;
begin
  Result := clangExt_Expr_getSourceBitField(Self.S);
end;

function TExprW.getReferencedDeclOfCallee: Decl;
begin
  Result := clangExt_Expr_getReferencedDeclOfCallee(Self.S);
end;

function TExprW.getObjCProperty: ObjCPropertyRefExpr;
begin
  Result := clangExt_Expr_getObjCProperty(Self.S);
end;

function TExprW.isObjCSelfExpr: Boolean;
begin
  Result := clangExt_Expr_isObjCSelfExpr(Self.S);
end;

function TExprW.refersToVectorElement: Boolean;
begin
  Result := clangExt_Expr_refersToVectorElement(Self.S);
end;

function TExprW.refersToMatrixElement: Boolean;
begin
  Result := clangExt_Expr_refersToMatrixElement(Self.S);
end;

function TExprW.refersToGlobalRegisterVar: Boolean;
begin
  Result := clangExt_Expr_refersToGlobalRegisterVar(Self.S);
end;

function TExprW.hasPlaceholderType: Boolean;
begin
  Result := clangExt_Expr_hasPlaceholderType(Self.S);
end;

function TExprW.hasPlaceholderTypeKind(K: BuiltinTypeKind): Boolean;
begin
  Result := clangExt_Expr_hasPlaceholderTypeKind(Self.S, K);
end;

function TExprW.isKnownToHaveBooleanValue(Semantic: Boolean): Boolean;
begin
  Result := clangExt_Expr_isKnownToHaveBooleanValue(Self.S, Semantic);
end;

function TExprW.isIntegerConstantExpr(const Ctx: ASTContext; Loc: PCXSourceLocation): Boolean;
begin
  Result := clangExt_Expr_isIntegerConstantExpr(Self.S, Ctx, Loc);
end;

function TExprW.isCXX98IntegralConstantExpr(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_Expr_isCXX98IntegralConstantExpr(Self.S, Ctx);
end;

function TExprW.isCXX11ConstantExpr(const Ctx: ASTContext; Ret: PAPValue; Loc: PCXSourceLocation): Boolean;
begin
  Result := clangExt_Expr_isCXX11ConstantExpr(Self.S, Ctx, Ret, Loc);
end;

function TExprW.isConstantInitializer(const Ctx: ASTContext; ForRef: Boolean; const Culprit: PExpr): Boolean;
begin
  Result := clangExt_Expr_isConstantInitializer(Self.S, Ctx, ForRef, Culprit);
end;

function TExprW.getAsBuiltinConstantDeclRef(const Ctx: ASTContext): ValueDecl;
begin
  Result := clangExt_Expr_getAsBuiltinConstantDeclRef(Self.S, Ctx);
end;

function TExprW.tryEvaluateStrLen(out Ret: UInt64; const Ctx: ASTContext
  ): Boolean;
begin
  Result := clangExt_Expr_tryEvaluateStrLen(Self.S, Ret, Ctx)
end;

function TExprW.isNullPointerConstant(const Ctx: ASTContext;
  NPC: NullPointerConstantValueDependence): NullPointerConstantKind;
begin
  Result := clangExt_Expr_isNullPointerConstant(Self.S, Ctx, NPC);
end;

function TExprW.isOBJCGCCandidate(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_Expr_isOBJCGCCandidate(Self.S, Ctx);
end;

function TExprW.isBoundMemberFunction(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_Expr_isBoundMemberFunction(Self.S, Ctx);
end;

function TExprW.IgnoreUnlessSpelledInSource: TExprW;
begin
  clangExt_Expr_IgnoreUnlessSpelledInSource(Self.S).Wrap(Result);
end;

function TExprW.IgnoreImpCasts: TExprW;
begin
  clangExt_Expr_IgnoreImpCasts(Self.S).Wrap(Result);
end;

function TExprW.IgnoreCasts: TExprW;
begin
  clangExt_Expr_IgnoreCasts(Self.S).Wrap(Result);
end;

function TExprW.IgnoreImplicit: TExprW;
begin
  clangExt_Expr_IgnoreImplicit(Self.S).Wrap(Result);
end;

function TExprW.IgnoreImplicitAsWritten: TExprW;
begin
  clangExt_Expr_IgnoreImplicitAsWritten(Self.S).Wrap(Result);
end;

function TExprW.IgnoreParens: TExprW;
begin
  clangExt_Expr_IgnoreParens(Self.S).Wrap(Result);
end;

function TExprW.IgnoreParenImpCasts: TExprW;
begin
  clangExt_Expr_IgnoreParenImpCasts(Self.S).Wrap(Result);
end;

function TExprW.IgnoreParenCasts: TExprW;
begin
  clangExt_Expr_IgnoreParenCasts(Self.S).Wrap(Result);
end;

function TExprW.IgnoreConversionOperatorSingleStep: TExprW;
begin
  clangExt_Expr_IgnoreConversionOperatorSingleStep(Self.S).Wrap(Result);
end;

function TExprW.IgnoreParenLValueCasts: TExprW;
begin
  clangExt_Expr_IgnoreParenLValueCasts(Self.S).Wrap(Result);
end;

function TExprW.IgnoreParenNoopCasts(const Ctx: ASTContext): TExprW;
begin
  clangExt_Expr_IgnoreParenNoopCasts(Self.S, Ctx).Wrap(Result);
end;

function TExprW.IgnoreParenBaseCasts: TExprW;
begin
  clangExt_Expr_IgnoreParenBaseCasts(Self.S).Wrap(Result);
end;

function TExprW.isDefaultArgument: Boolean;
begin
  Result := clangExt_Expr_isDefaultArgument(Self.S);
end;

function TExprW.isTemporaryObject(const Ctx: ASTContext; const TempTy: CXXRecordDecl): Boolean;
begin
  Result := clangExt_Expr_isTemporaryObject(Self.S, Ctx, TempTy);
end;

function TExprW.isImplicitCXXThis: Boolean;
begin
  Result := clangExt_Expr_isImplicitCXXThis(Self.S);
end;

function TExprW.getBestDynamicClassType: CXXRecordDecl;
begin
  Result := clangExt_Expr_getBestDynamicClassType(Self.S);
end;

function TExprW.getBestDynamicClassTypeExpr: TExprW;
begin
  clangExt_Expr_getBestDynamicClassTypeExpr(Self.S).Wrap(Result);
end;

class function TExprW.isSameComparisonOperand(const E1: TExprW; const E2: TExprW
  ): Boolean;
begin
  Result := clangExt_Expr_isSameComparisonOperand(E1.S, E2.S);
end;

class function TExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_Expr_classof(T.S);
end;     
{$endregion 'TExprW'}

{$region 'TFullExprW'}

class function TFullExprW.Create(aExpr: FullExpr; out oExpr: TFullExprW
  ): Boolean;
begin
  Result := False;
  oExpr := Default(TFullExprW);
  if (not Assigned(aExpr)) or (not clangExt_FullExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TFullExprW.getSubExpr: TExprW;
begin
  clangExt_FullExpr_getSubExpr(Self.S).Wrap(Result);
end;

class function TFullExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_FullExpr_classof(T.S);
end;
  
{$endregion 'TFullExprW'}
   
{$region 'TConstantExprW'}

class function TConstantExprW.Create(aExpr: ConstantExpr; out
  oExpr: TConstantExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TConstantExprW);
  if (not Assigned(aExpr)) or (not clangExt_ConstantExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TConstantExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ConstantExpr_getBeginLoc(Self.S, Ctx);
end;

function TConstantExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ConstantExpr_getEndLoc(Self.S, Ctx);
end;

class function TConstantExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_ConstantExpr_classof(T.S);
end;

function TConstantExprW.getResultAPValueKind: APValue_ValueKind;
begin
  Result := clangExt_ConstantExpr_getResultAPValueKind(Self.S);
end;

function TConstantExprW.getResultStorageKind: ConstantExpr_ResultStorageKind;
begin
  Result := clangExt_ConstantExpr_getResultStorageKind(Self.S);
end;

function TConstantExprW.isImmediateInvocation: Boolean;
begin
  Result := clangExt_ConstantExpr_isImmediateInvocation(Self.S);
end;

function TConstantExprW.hasAPValueResult: Boolean;
begin
  Result := clangExt_ConstantExpr_hasAPValueResult(Self.S);
end;

function TConstantExprW.getAPValueResult: APValue;
begin
  Result := clangExt_ConstantExpr_getAPValueResult(Self.S);
end;

function TConstantExprW.getResultAsAPValue: APValue;
begin
  Result := clangExt_ConstantExpr_getResultAsAPValue(Self.S);
end;

function TConstantExprW.getResultAsAPSInt: APSInt;
begin
  Result := clangExt_ConstantExpr_getResultAsAPSInt(Self.S);
end;

function TConstantExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_ConstantExpr_getNumChildren(Self.S);
end;

function TConstantExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_ConstantExpr_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TConstantExprW'}
     
{$region 'TDeclRefExprW'}

class function TDeclRefExprW.Create(aExpr: DeclRefExpr; out oExpr: TDeclRefExprW
  ): Boolean;
begin
  Result := False;
  oExpr := Default(TDeclRefExprW);
  if (not Assigned(aExpr)) or (not clangExt_DeclRefExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TDeclRefExprW.getDecl: ValueDecl;
begin
  Result := clangExt_DeclRefExpr_getDecl(Self.S);
end;

function TDeclRefExprW.getLocation(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getLocation(Self.S, Ctx);
end;

function TDeclRefExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getBeginLoc(Self.S, Ctx);
end;

function TDeclRefExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getEndLoc(Self.S, Ctx);
end;

function TDeclRefExprW.hasQualifier: Boolean;
begin
  Result := clangExt_DeclRefExpr_hasQualifier(Self.S);
end;

function TDeclRefExprW.getQualifierLoc: NestedNameSpecifierLoc;
begin
  Result := clangExt_DeclRefExpr_getQualifierLoc(Self.S);
end;

function TDeclRefExprW.getQualifier: NestedNameSpecifier;
begin
  Result := clangExt_DeclRefExpr_getQualifier(Self.S);
end;

function TDeclRefExprW.getFoundDecl: NamedDecl;
begin
  Result := clangExt_DeclRefExpr_getFoundDecl(Self.S);
end;

function TDeclRefExprW.hasTemplateKWAndArgsInfo: Boolean;
begin
  Result := clangExt_DeclRefExpr_hasTemplateKWAndArgsInfo(Self.S);
end;

function TDeclRefExprW.getTemplateKeywordLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getTemplateKeywordLoc(Self.S, Ctx);
end;

function TDeclRefExprW.getLAngleLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getLAngleLoc(Self.S, Ctx);
end;

function TDeclRefExprW.getRAngleLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_DeclRefExpr_getRAngleLoc(Self.S, Ctx);
end;

function TDeclRefExprW.hasTemplateKeyword: Boolean;
begin
  Result := clangExt_DeclRefExpr_hasTemplateKeyword(Self.S);
end;

function TDeclRefExprW.hasExplicitTemplateArgs: Boolean;
begin
  Result := clangExt_DeclRefExpr_hasExplicitTemplateArgs(Self.S);
end;

function TDeclRefExprW.getTemplateArgs: TemplateArgumentLoc;
begin
  Result := clangExt_DeclRefExpr_getTemplateArgs(Self.S);
end;

function TDeclRefExprW.getNumTemplateArgs: Cardinal;
begin
  Result := clangExt_DeclRefExpr_getNumTemplateArgs(Self.S);
end;

function TDeclRefExprW.template_arguments(i: Cardinal): TemplateArgumentLoc;
begin
  Result := clangExt_DeclRefExpr_template_arguments(Self.S, i);
end;

function TDeclRefExprW.hadMultipleCandidates: Boolean;
begin
  Result := clangExt_DeclRefExpr_hadMultipleCandidates(Self.S);
end;

function TDeclRefExprW.isNonOdrUse: NonOdrUseReason;
begin
  Result := clangExt_DeclRefExpr_isNonOdrUse(Self.S);
end;

function TDeclRefExprW.refersToEnclosingVariableOrCapture: Boolean;
begin
  Result := clangExt_DeclRefExpr_refersToEnclosingVariableOrCapture(Self.S);
end;

class function TDeclRefExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_DeclRefExpr_classof(T.S);
end;

function TDeclRefExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_DeclRefExpr_getNumChildren(Self.S);
end;

function TDeclRefExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_DeclRefExpr_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TDeclRefExprW'}

{$region 'TIntegerLiteralW'}

class function TIntegerLiteralW.Create(aExpr: IntegerLiteral; out
  oExpr: TIntegerLiteralW): Boolean;
begin
  Result := False;
  oExpr := Default(TIntegerLiteralW);
  if (not Assigned(aExpr)) or (not clangExt_IntegerLiteral_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TIntegerLiteralW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_IntegerLiteral_getBeginLoc(Self.S, Ctx);
end;

function TIntegerLiteralW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_IntegerLiteral_getEndLoc(Self.S, Ctx);
end;

function TIntegerLiteralW.getLocation(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_IntegerLiteral_getLocation(Self.S, Ctx);
end;

function TIntegerLiteralW.getNumChildren: Cardinal;
begin
  Result := clangExt_IntegerLiteral_getNumChildren(Self.S);
end;

function TIntegerLiteralW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_IntegerLiteral_getChildren(Self.S, i).Wrap(Result);
end;

class function TIntegerLiteralW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_IntegerLiteral_classof(T.S);
end;

function TIntegerLiteralW.getValue: TAPIntW;
begin
  clangExt_IntegerLiteral_getValue(Self.S).Wrap(Result);
end;

{$endregion 'TIntegerLiteralW'}

{$region 'TCharacterLiteralW'}

class function TCharacterLiteralW.Create(aExpr: CharacterLiteral; out
  oExpr: TCharacterLiteralW): Boolean;
begin
  Result := False;
  oExpr := Default(TCharacterLiteralW);
  if (not Assigned(aExpr)) or (not clangExt_CharacterLiteral_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TCharacterLiteralW.getLocation(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CharacterLiteral_getLocation(Self.S, Ctx);
end;

function TCharacterLiteralW.getKind: CharacterLiteral_CharacterKind;
begin
  Result := clangExt_CharacterLiteral_getKind(Self.S);
end;

function TCharacterLiteralW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CharacterLiteral_getBeginLoc(Self.S, Ctx);
end;

function TCharacterLiteralW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CharacterLiteral_getEndLoc(Self.S, Ctx);
end;

function TCharacterLiteralW.getValue: Cardinal;
begin
  Result := clangExt_CharacterLiteral_getValue(Self.S);
end;

class function TCharacterLiteralW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_CharacterLiteral_classof(T.S);
end;

class function TCharacterLiteralW.print(val: Cardinal;
  Kind: CharacterLiteral_CharacterKind): string;
begin
  Result := clangExt_CharacterLiteral_print(val, Kind).ToString;
end;

class function TCharacterLiteralW.printCXString(val: Cardinal;
  Kind: CharacterLiteral_CharacterKind): CXString;
begin
  Result := clangExt_CharacterLiteral_print(val, Kind);
end;

function TCharacterLiteralW.getNumChildren: Cardinal;
begin
  Result := clangExt_CharacterLiteral_getNumChildren(Self.S);
end;

function TCharacterLiteralW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_CharacterLiteral_getChildren(Self.S, i).Wrap(Result);
end;
      
{$endregion 'TCharacterLiteralW'}

{$region 'TFloatingLiteralW'}

class function TFloatingLiteralW.Create(aExpr: FloatingLiteral; out
  oExpr: TFloatingLiteralW): Boolean;
begin
  Result := False;
  oExpr := Default(TFloatingLiteralW);
  if (not Assigned(aExpr)) or (not clangExt_FloatingLiteral_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TFloatingLiteralW.getValue: APFloat;
begin
  Result := clangExt_FloatingLiteral_getValue(Self.S);
end;

function TFloatingLiteralW.isExact: Boolean;
begin
  Result := clangExt_FloatingLiteral_isExact(Self.S);
end;

function TFloatingLiteralW.getLocation(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_FloatingLiteral_getLocation(Self.S, Ctx);
end;

function TFloatingLiteralW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_FloatingLiteral_getBeginLoc(Self.S, Ctx);
end;

function TFloatingLiteralW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_FloatingLiteral_getEndLoc(Self.S, Ctx);
end;

class function TFloatingLiteralW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_FloatingLiteral_classof(T.S);
end;

function TFloatingLiteralW.getNumChildren: Cardinal;
begin
  Result := clangExt_FloatingLiteral_getNumChildren(Self.S);
end;

function TFloatingLiteralW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_FloatingLiteral_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TFloatingLiteralW'}

{$region 'TStringLiteralW'}

class function TStringLiteralW.Create(aExpr: StringLiteral; out
  oExpr: TStringLiteralW): Boolean;
begin
  Result := False;
  oExpr := Default(TStringLiteralW);
  if (not Assigned(aExpr)) or (not clangExt_StringLiteral_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TStringLiteralW.getString: string;
begin
  Result := clangExt_StringLiteral_getString(Self.S).ToString;
end;

function TStringLiteralW.getStringCXString: CXString;
begin
  Result := clangExt_StringLiteral_getString(Self.S)
end;

function TStringLiteralW.getBytes: string;
begin
  Result := clangExt_StringLiteral_getBytes(Self.S).ToString;
end;

function TStringLiteralW.getBytesCXString: CXString;
begin
  Result := clangExt_StringLiteral_getBytes(Self.S);
end;

function TStringLiteralW.outputString: string;
begin
  Result := clangExt_StringLiteral_outputString(Self.S).ToString;
end;

function TStringLiteralW.getCodeUnit(i: SIZE_T): Cardinal;
begin
  Result := clangExt_StringLiteral_getCodeUnit(Self.S, i);
end;

function TStringLiteralW.getByteLength: Cardinal;
begin
  Result := clangExt_StringLiteral_getByteLength(Self.S);
end;

function TStringLiteralW.getLength: Cardinal;
begin
  Result := clangExt_StringLiteral_getLength(Self.S);
end;

function TStringLiteralW.getCharByteWidth: Cardinal;
begin
  Result := clangExt_StringLiteral_getCharByteWidth(Self.S);
end;

function TStringLiteralW.getKind: StringLiteral_StringKind;
begin
  Result := clangExt_StringLiteral_getKind(Self.S);
end;

function TStringLiteralW.isOrdinary: Boolean;
begin
  Result := clangExt_StringLiteral_isOrdinary(Self.S);
end;

function TStringLiteralW.isWide: Boolean;
begin
  Result := clangExt_StringLiteral_isWide(Self.S);
end;

function TStringLiteralW.isUTF8: Boolean;
begin
  Result := clangExt_StringLiteral_isUTF8(Self.S);
end;

function TStringLiteralW.isUTF16: Boolean;
begin
  Result := clangExt_StringLiteral_isUTF16(Self.S);
end;

function TStringLiteralW.isUTF32: Boolean;
begin
  Result := clangExt_StringLiteral_isUTF32(Self.S);
end;

function TStringLiteralW.isPascal: Boolean;
begin
  Result := clangExt_StringLiteral_isPascal(Self.S);
end;

function TStringLiteralW.containsNonAscii: Boolean;
begin
  Result := clangExt_StringLiteral_containsNonAscii(Self.S);
end;

function TStringLiteralW.containsNonAsciiOrNull: Boolean;
begin
  Result := clangExt_StringLiteral_containsNonAsciiOrNull(Self.S);
end;

function TStringLiteralW.getNumConcatenated: Cardinal;
begin
  Result := clangExt_StringLiteral_getNumConcatenated(Self.S);
end;

function TStringLiteralW.getStrTokenLoc(TokNum: Cardinal; const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_StringLiteral_getStrTokenLoc(Self.S, TokNum, Ctx);
end;

function TStringLiteralW.getLocationOfByte(ByteNo: Cardinal; const SM: SourceManager; const Features: LangOptions; const Target: TargetInfo; const Ctx: ASTContext; StartToken: PCardinal; StartTokenByteOffset: PCardinal): CXSourceLocation;
begin
  Result := clangExt_StringLiteral_getLocationOfByte(Self.S, ByteNo, SM, Features, Target, Ctx, StartToken, StartTokenByteOffset);
end;

function TStringLiteralW.GetToklocNum: Cardinal;
begin
  Result := clangExt_StringLiteral_GetToklocNum(Self.S);
end;

function TStringLiteralW.GetTokloc(i: Cardinal; const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_StringLiteral_GetTokloc(Self.S, i, Ctx);
end;

function TStringLiteralW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_StringLiteral_getBeginLoc(Self.S, Ctx);
end;

function TStringLiteralW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_StringLiteral_getEndLoc(Self.S, Ctx);
end;

class function TStringLiteralW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_StringLiteral_classof(T.S);
end;

function TStringLiteralW.getNumChildren: Cardinal;
begin
  Result := clangExt_StringLiteral_getNumChildren(Self.S);
end;

function TStringLiteralW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_StringLiteral_getChildren(Self.S, i).Wrap(Result);
end;

function TStringLiteralW.ToString(out str: string): Boolean;
var
  StringKind: StringLiteral_StringKind;
  mCxString: CXString;
  uExpr: UnicodeString;
begin

  StringKind := Self.getKind;
  case StringKind of
    StringLiteral_StringKind.Ordinary:
      begin
        str := Self.getString;
        Result := True;
      end;
    StringLiteral_StringKind.Wide:
      begin
        mCxString := Self.getStringCXString;
        try
          SetString(uExpr, PWideChar(mCxString.data), Self.getLength);
          str := UTF8Encode(uExpr);
        finally
          mCxString.disposeString;
        end;
      end;
  else
    begin
      str := '';
      Result := False;
    end;
  end;
end;

{$endregion 'TStringLiteralW'}

{$region 'TParenExprW'}

class function TParenExprW.Create(aExpr: ParenExpr; out oExpr: TParenExprW
  ): Boolean;
begin
  Result := False;
  oExpr := Default(TParenExprW);
  if (not Assigned(aExpr)) or (not clangExt_ParenExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TParenExprW.getSubExpr: TExprW;
begin
  clangExt_ParenExpr_getSubExpr(Self.S).Wrap(Result);
end;

function TParenExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ParenExpr_getBeginLoc(Self.S, Ctx);
end;

function TParenExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ParenExpr_getEndLoc(Self.S, Ctx);
end;

function TParenExprW.getLParen(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ParenExpr_getLParen(Self.S, Ctx);
end;

function TParenExprW.getRParen(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ParenExpr_getRParen(Self.S, Ctx);
end;

class function TParenExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_ParenExpr_classof(T.S);
end;

function TParenExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_ParenExpr_getNumChildren(Self.S);
end;

function TParenExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_ParenExpr_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TParenExprW'}

{$region 'TUnaryOperatorW'}

class function TUnaryOperatorW.Create(aExpr: UnaryOperator; out
  oExpr: TUnaryOperatorW): Boolean;
begin
  Result := False;
  oExpr := Default(TUnaryOperatorW);
  if (not Assigned(aExpr)) or (not clangExt_UnaryOperator_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TUnaryOperatorW.getOpcode: UnaryOperatorKind;
begin
  Result := clangExt_UnaryOperator_getOpcode(Self.S);
end;

function TUnaryOperatorW.getSubExpr: TExprW;
begin
  clangExt_UnaryOperator_getSubExpr(Self.S).Wrap(Result);
end;

function TUnaryOperatorW.getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryOperator_getOperatorLoc(Self.S, Ctx);
end;

function TUnaryOperatorW.canOverflow: Boolean;
begin
  Result := clangExt_UnaryOperator_canOverflow(Self.S);
end;

function TUnaryOperatorW.isFPContractableWithinStatement(const LO: LangOptions): Boolean;
begin
  Result := clangExt_UnaryOperator_isFPContractableWithinStatement(Self.S, LO);
end;

function TUnaryOperatorW.isFEnvAccessOn(const LO: LangOptions): Boolean;
begin
  Result := clangExt_UnaryOperator_isFEnvAccessOn(Self.S, LO);
end;

class function TUnaryOperatorW.isPostfixStatic(Op: UnaryOperatorKind): Boolean;
begin
  Result := clangExt_UnaryOperator_isPostfixStatic(Op);
end;

class function TUnaryOperatorW.isPrefixStatic(Op: UnaryOperatorKind): Boolean;
begin
  Result := clangExt_UnaryOperator_isPrefixStatic(Op);
end;

function TUnaryOperatorW.isPrefix: Boolean;
begin
  Result := clangExt_UnaryOperator_isPrefix(Self.S);
end;

function TUnaryOperatorW.isPostfix: Boolean;
begin
  Result := clangExt_UnaryOperator_isPostfix(Self.S);
end;

class function TUnaryOperatorW.isIncrementOpStatic(Op: UnaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_UnaryOperator_isIncrementOpStatic(Op);
end;

function TUnaryOperatorW.isIncrementOp: Boolean;
begin
  Result := clangExt_UnaryOperator_isIncrementOp(Self.S);
end;

class function TUnaryOperatorW.isDecrementOpStatic(Op: UnaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_UnaryOperator_isDecrementOpStatic(Op);
end;

function TUnaryOperatorW.isDecrementOp: Boolean;
begin
  Result := clangExt_UnaryOperator_isDecrementOp(Self.S);
end;

class function TUnaryOperatorW.isIncrementDecrementOpStatic(
  Op: UnaryOperatorKind): Boolean;
begin
  Result := clangExt_UnaryOperator_isIncrementDecrementOpStatic(Op);
end;

function TUnaryOperatorW.isIncrementDecrementOp: Boolean;
begin
  Result := clangExt_UnaryOperator_isIncrementDecrementOp(Self.S);
end;

class function TUnaryOperatorW.isArithmeticOpStatic(Op: UnaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_UnaryOperator_isArithmeticOpStatic(Op);
end;

function TUnaryOperatorW.isArithmeticOp: Boolean;
begin
  Result := clangExt_UnaryOperator_isArithmeticOp(Self.S);
end;

class function TUnaryOperatorW.getOpcodeStr(Op: UnaryOperatorKind): string;
begin
  Result := clangExt_UnaryOperator_getOpcodeStr(Op).ToString;
end;

class function TUnaryOperatorW.getOverloadedOpcode(OO: OverloadedOperatorKind;
  Postfix: Boolean): UnaryOperatorKind;
begin
  Result := clangExt_UnaryOperator_getOverloadedOpcode(OO, Postfix);
end;

class function TUnaryOperatorW.getOverloadedOperator(Opc: UnaryOperatorKind
  ): OverloadedOperatorKind;
begin
  Result := clangExt_UnaryOperator_getOverloadedOperator(Opc);
end;

function TUnaryOperatorW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryOperator_getBeginLoc(Self.S, Ctx);
end;

function TUnaryOperatorW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryOperator_getEndLoc(Self.S, Ctx);
end;

function TUnaryOperatorW.getExprLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryOperator_getExprLoc(Self.S, Ctx);
end;

class function TUnaryOperatorW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_UnaryOperator_classof(T.S);
end;

function TUnaryOperatorW.getNumChildren: Cardinal;
begin
  Result := clangExt_UnaryOperator_getNumChildren(Self.S);
end;

function TUnaryOperatorW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_UnaryOperator_getChildren(Self.S, i).Wrap(Result);
end;

function TUnaryOperatorW.hasStoredFPFeatures: Boolean;
begin
  Result := clangExt_UnaryOperator_hasStoredFPFeatures(Self.S);
end;

function TUnaryOperatorW.getStoredFPFeatures: FPOptionsOverride;
begin
  Result := clangExt_UnaryOperator_getStoredFPFeatures(Self.S);
end;

function TUnaryOperatorW.getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
begin
  Result := clangExt_UnaryOperator_getFPFeaturesInEffect(Self.S, LO);
end;

function TUnaryOperatorW.getFPOptionsOverride: FPOptionsOverride;
begin
  Result := clangExt_UnaryOperator_getFPOptionsOverride(Self.S);
end;

{$endregion 'TUnaryOperatorW'}

{$region 'TUnaryExprOrTypeTraitExprW'}

class function TUnaryExprOrTypeTraitExprW.Create(
  aExpr: UnaryExprOrTypeTraitExpr; out oExpr: TUnaryExprOrTypeTraitExprW
  ): Boolean;
begin
  Result := False;
  oExpr := Default(TUnaryExprOrTypeTraitExprW);
  if (not Assigned(aExpr)) or (not clangExt_UnaryExprOrTypeTraitExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TUnaryExprOrTypeTraitExprW.getKind: UnaryExprOrTypeTrait;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getKind(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.isArgumentType: Boolean;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_isArgumentType(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.getArgumentType: CXQualType;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getArgumentType(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.getArgumentTypeInfo: TypeSourceInfo;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getArgumentTypeInfo(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.getArgumentExpr: TExprW;
begin
  clangExt_UnaryExprOrTypeTraitExpr_getArgumentExpr(Self.S).Wrap(Result);
end;

function TUnaryExprOrTypeTraitExprW.getTypeOfArgument: CXQualType;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getTypeOfArgument(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getOperatorLoc(Self.S, Ctx);
end;

function TUnaryExprOrTypeTraitExprW.getRParenLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getRParenLoc(Self.S, Ctx);
end;

function TUnaryExprOrTypeTraitExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getBeginLoc(Self.S, Ctx);
end;

function TUnaryExprOrTypeTraitExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getEndLoc(Self.S, Ctx);
end;

class function TUnaryExprOrTypeTraitExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_classof(T.S);
end;

function TUnaryExprOrTypeTraitExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_UnaryExprOrTypeTraitExpr_getNumChildren(Self.S);
end;

function TUnaryExprOrTypeTraitExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_UnaryExprOrTypeTraitExpr_getChildren(Self.S, i).Wrap(Result);
end;
      
{$endregion 'TUnaryExprOrTypeTraitExprW'}

{$region 'TCastExprW'}

class function TCastExprW.Create(aExpr: CastExpr; out oExpr: TCastExprW
  ): Boolean;
begin
  Result := False;
  oExpr := Default(TCastExprW);
  if (not Assigned(aExpr)) or (not clangExt_CastExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TCastExprW.getCastKind: CastKind;
begin
  Result := clangExt_CastExpr_getCastKind(Self.S);
end;

class function TCastExprW.CastKindName(CK: CastKind): string;
begin
  Result := StrPas(clangExt_CastExpr_CastKindName(CK));
end;

function TCastExprW.getCastKindName: string;
begin
  Result := StrPas(clangExt_CastExpr_getCastKindName(Self.S));
end;

function TCastExprW.getSubExpr: TExprW;
begin
  clangExt_CastExpr_getSubExpr(Self.S).Wrap(Result);
end;

function TCastExprW.getSubExprAsWritten: TExprW;
begin
  clangExt_CastExpr_getSubExprAsWritten(Self.S).Wrap(Result);
end;

function TCastExprW.getConversionFunction: NamedDecl;
begin
  Result := clangExt_CastExpr_getConversionFunction(Self.S);
end;

function TCastExprW.path_empty: Boolean;
begin
  Result := clangExt_CastExpr_path_empty(Self.S);
end;

function TCastExprW.path_size: Cardinal;
begin
  Result := clangExt_CastExpr_path_size(Self.S);
end;

function TCastExprW.getPath(i: Cardinal): CXXBaseSpecifier;
begin
  Result := clangExt_CastExpr_getPath(Self.S, i);
end;

function TCastExprW.getTargetUnionField: FieldDecl;
begin
  Result := clangExt_CastExpr_getTargetUnionField(Self.S);
end;

function TCastExprW.hasStoredFPFeatures: Boolean;
begin
  Result := clangExt_CastExpr_hasStoredFPFeatures(Self.S);
end;

function TCastExprW.getStoredFPFeatures: FPOptionsOverride;
begin
  Result := clangExt_CastExpr_getStoredFPFeatures(Self.S);
end;

function TCastExprW.getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
begin
  Result := clangExt_CastExpr_getFPFeaturesInEffect(Self.S, LO);
end;

function TCastExprW.getFPFeatures: FPOptionsOverride;
begin
  Result := clangExt_CastExpr_getFPFeatures(Self.S);
end;

class function TCastExprW.getTargetFieldForToUnionCast(
  const unionType: CXQualType; const opType: CXQualType): FieldDecl;
begin
  Result := clangExt_CastExpr_getTargetFieldForToUnionCast(unionType, opType);
end;

class function TCastExprW.getTargetFieldForToUnionCastRecordDecl(
  const RD: RecordDecl; const opType: CXQualType): FieldDecl;
begin
  Result := clangExt_CastExpr_getTargetFieldForToUnionCastRecordDecl(RD, opType);
end;

class function TCastExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_CastExpr_classof(T.S);
end;

function TCastExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_CastExpr_getNumChildren(Self.S);
end;

function TCastExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_CastExpr_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TCastExprW'}
                           
{$region 'TImplicitCastExprW'}

class function TImplicitCastExprW.Create(aExpr: ImplicitCastExpr; out
  oExpr: TImplicitCastExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TImplicitCastExprW);
  if (not Assigned(aExpr)) or (not clangExt_ImplicitCastExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TImplicitCastExprW.isPartOfExplicitCast: Boolean;
begin
  Result := clangExt_ImplicitCastExpr_isPartOfExplicitCast(Self.S);
end;

function TImplicitCastExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ImplicitCastExpr_getBeginLoc(Self.S, Ctx);
end;

function TImplicitCastExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_ImplicitCastExpr_getEndLoc(Self.S, Ctx);
end;

class function TImplicitCastExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_ImplicitCastExpr_classof(T.S);
end;
       
{$endregion 'TImplicitCastExprW'}

{$region 'TExplicitCastExprW'}

class function TExplicitCastExprW.Create(aExpr: ExplicitCastExpr; out
  oExpr: TExplicitCastExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TExplicitCastExprW);
  if (not Assigned(aExpr)) or (not clangExt_ExplicitCastExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TExplicitCastExprW.getTypeInfoAsWritten: TypeSourceInfo;
begin
  Result := clangExt_ExplicitCastExpr_getTypeInfoAsWritten(Self.S);
end;

function TExplicitCastExprW.getTypeAsWritten: CXQualType;
begin
  Result := clangExt_ExplicitCastExpr_getTypeAsWritten(Self.S);
end;

class function TExplicitCastExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_ExplicitCastExpr_classof(T.S);
end;
      
{$endregion 'TExplicitCastExprW'}

{$region 'TCStyleCastExprW'}

class function TCStyleCastExprW.Create(aExpr: CStyleCastExpr; out
  oExpr: TCStyleCastExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TCStyleCastExprW);
  if (not Assigned(aExpr)) or (not clangExt_CStyleCastExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TCStyleCastExprW.getLParenLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CStyleCastExpr_getLParenLoc(Self.S, Ctx);
end;

function TCStyleCastExprW.getRParenLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CStyleCastExpr_getRParenLoc(Self.S, Ctx);
end;

function TCStyleCastExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CStyleCastExpr_getBeginLoc(Self.S, Ctx);
end;

function TCStyleCastExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_CStyleCastExpr_getEndLoc(Self.S, Ctx);
end;

class function TCStyleCastExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_CStyleCastExpr_classof(T.S);
end;

{$endregion 'TCStyleCastExprW'}

{$region 'TBinaryOperatorW'}

class function TBinaryOperatorW.Create(aExpr: BinaryOperator; out
  oExpr: TBinaryOperatorW): Boolean;
begin
  Result := False;
  oExpr := Default(TBinaryOperatorW);
  if (not Assigned(aExpr)) or (not clangExt_BinaryOperator_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TBinaryOperatorW.getExprLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_BinaryOperator_getExprLoc(Self.S, Ctx);
end;

function TBinaryOperatorW.getOperatorLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_BinaryOperator_getOperatorLoc(Self.S, Ctx);
end;

function TBinaryOperatorW.getOpcode: BinaryOperatorKind;
begin
  Result := clangExt_BinaryOperator_getOpcode(Self.S);
end;

function TBinaryOperatorW.getLHS: TExprW;
begin
  clangExt_BinaryOperator_getLHS(Self.S).Wrap(Result);
end;

function TBinaryOperatorW.getRHS: TExprW;
begin
  clangExt_BinaryOperator_getRHS(Self.S).Wrap(Result);
end;

function TBinaryOperatorW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_BinaryOperator_getBeginLoc(Self.S, Ctx);
end;

function TBinaryOperatorW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_BinaryOperator_getEndLoc(Self.S, Ctx);
end;

function TBinaryOperatorW.getOpcodeStrStatic(Op: BinaryOperatorKind): string;
begin
  Result := clangExt_BinaryOperator_getOpcodeStrStatic(Op).ToString;
end;

function TBinaryOperatorW.getOpcodeStr: string;
begin
  Result := clangExt_BinaryOperator_getOpcodeStr(Self.S).ToString;
end;

class function TBinaryOperatorW.getOverloadedOpcode(OO: OverloadedOperatorKind
  ): BinaryOperatorKind;
begin
  Result := clangExt_BinaryOperator_getOverloadedOpcode(OO);
end;

class function TBinaryOperatorW.getOverloadedOperator(Opc: BinaryOperatorKind
  ): OverloadedOperatorKind;
begin
  Result := clangExt_BinaryOperator_getOverloadedOperator(Opc);
end;

class function TBinaryOperatorW.isPtrMemOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isPtrMemOpStatic(Opc);
end;

function TBinaryOperatorW.isPtrMemOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isPtrMemOp(Self.S);
end;

class function TBinaryOperatorW.isMultiplicativeOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isMultiplicativeOpStatic(Opc);
end;

function TBinaryOperatorW.isMultiplicativeOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isMultiplicativeOp(Self.S);
end;

class function TBinaryOperatorW.isAdditiveOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isAdditiveOpStatic(Opc);
end;

function TBinaryOperatorW.isAdditiveOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isAdditiveOp(Self.S);
end;

class function TBinaryOperatorW.isShiftOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isShiftOpStatic(Opc);
end;

function TBinaryOperatorW.isShiftOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isShiftOp(Self.S);
end;

class function TBinaryOperatorW.isBitwiseOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isBitwiseOpStatic(Opc);
end;

function TBinaryOperatorW.isBitwiseOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isBitwiseOp(Self.S);
end;

class function TBinaryOperatorW.isRelationalOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isRelationalOpStatic(Opc);
end;

function TBinaryOperatorW.isRelationalOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isRelationalOp(Self.S);
end;

class function TBinaryOperatorW.isEqualityOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isEqualityOpStatic(Opc);
end;

function TBinaryOperatorW.isEqualityOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isEqualityOp(Self.S);
end;

class function TBinaryOperatorW.isComparisonOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isComparisonOpStatic(Opc);
end;

function TBinaryOperatorW.isComparisonOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isComparisonOp(Self.S);
end;

class function TBinaryOperatorW.isCommaOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isCommaOpStatic(Opc);
end;

function TBinaryOperatorW.isCommaOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isCommaOp(Self.S);
end;

class function TBinaryOperatorW.negateComparisonOp(Opc: BinaryOperatorKind
  ): BinaryOperatorKind;
begin
  Result := clangExt_BinaryOperator_negateComparisonOp(Opc);
end;

class function TBinaryOperatorW.reverseComparisonOp(Opc: BinaryOperatorKind
  ): BinaryOperatorKind;
begin
  Result := clangExt_BinaryOperator_reverseComparisonOp(Opc);
end;

class function TBinaryOperatorW.isLogicalOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isLogicalOpStatic(Opc);
end;

function TBinaryOperatorW.isLogicalOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isLogicalOp(Self.S);
end;

class function TBinaryOperatorW.isAssignmentOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isAssignmentOpStatic(Opc);
end;

function TBinaryOperatorW.isAssignmentOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isAssignmentOp(Self.S);
end;

class function TBinaryOperatorW.isCompoundAssignmentOpStatic(
  Opc: BinaryOperatorKind): Boolean;
begin
  Result := clangExt_BinaryOperator_isCompoundAssignmentOpStatic(Opc);
end;

function TBinaryOperatorW.isCompoundAssignmentOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isCompoundAssignmentOp(Self.S);
end;

class function TBinaryOperatorW.getOpForCompoundAssignment(
  Opc: BinaryOperatorKind): BinaryOperatorKind;
begin
  Result := clangExt_BinaryOperator_getOpForCompoundAssignment(Opc);
end;

class function TBinaryOperatorW.isShiftAssignOpStatic(Opc: BinaryOperatorKind
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isShiftAssignOpStatic(Opc);
end;

function TBinaryOperatorW.isShiftAssignOp: Boolean;
begin
  Result := clangExt_BinaryOperator_isShiftAssignOp(Self.S);
end;

class function TBinaryOperatorW.isNullPointerArithmeticExtension(
  const Ctx: ASTContext; Opc: BinaryOperatorKind; LHS: TExprW; RHS: TExprW
  ): Boolean;
begin
  Result := clangExt_BinaryOperator_isNullPointerArithmeticExtension(Ctx, Opc, LHS.S, RHS.S);
end;

class function TBinaryOperatorW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_BinaryOperator_classof(T.S);
end;

function TBinaryOperatorW.getNumChildren: Cardinal;
begin
  Result := clangExt_BinaryOperator_getNumChildren(Self.S);
end;

function TBinaryOperatorW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_BinaryOperator_getChildren(Self.S, i).Wrap(Result);
end;

function TBinaryOperatorW.hasStoredFPFeatures: Boolean;
begin
  Result := clangExt_BinaryOperator_hasStoredFPFeatures(Self.S);
end;

function TBinaryOperatorW.getStoredFPFeatures: FPOptionsOverride;
begin
  Result := clangExt_BinaryOperator_getStoredFPFeatures(Self.S);
end;

function TBinaryOperatorW.getFPFeaturesInEffect(const LO: LangOptions): FPOptions;
begin
  Result := clangExt_BinaryOperator_getFPFeaturesInEffect(Self.S, LO);
end;

function TBinaryOperatorW.getFPFeatures(const LO: LangOptions): FPOptionsOverride;
begin
  Result := clangExt_BinaryOperator_getFPFeatures(Self.S, LO);
end;

function TBinaryOperatorW.isFPContractableWithinStatement(const LO: LangOptions): Boolean;
begin
  Result := clangExt_BinaryOperator_isFPContractableWithinStatement(Self.S, LO);
end;

function TBinaryOperatorW.isFEnvAccessOn(const LO: LangOptions): Boolean;
begin
  Result := clangExt_BinaryOperator_isFEnvAccessOn(Self.S, LO);
end;

{$endregion 'TBinaryOperatorW'}

{$region 'TInitListExprW'}

class function TInitListExprW.Create(aExpr: InitListExpr; out
  oExpr: TInitListExprW): Boolean;
begin
  Result := False;
  oExpr := Default(TInitListExprW);
  if (not Assigned(aExpr)) or (not clangExt_InitListExpr_classof(aExpr)) then
    Exit;
  oExpr.S := aExpr;
  Result := True;
end;

function TInitListExprW.getNumInits: Cardinal;
begin
  Result := clangExt_InitListExpr_getNumInits(Self.S);
end;

function TInitListExprW.getInit(Init: Cardinal): TExprW;
begin
   clangExt_InitListExpr_getInit(Self.S, Init).Wrap(Result);
end;

function TInitListExprW.getArrayFiller: TExprW;
begin
  clangExt_InitListExpr_getArrayFiller(Self.S).Wrap(Result);
end;

function TInitListExprW.hasArrayFiller: Boolean;
begin
  Result := clangExt_InitListExpr_hasArrayFiller(Self.S);
end;

function TInitListExprW.getInitializedFieldInUnion: FieldDecl;
begin
  Result := clangExt_InitListExpr_getInitializedFieldInUnion(Self.S);
end;

function TInitListExprW.isExplicit: Boolean;
begin
  Result := clangExt_InitListExpr_isExplicit(Self.S);
end;

function TInitListExprW.isStringLiteralInit: Boolean;
begin
  Result := clangExt_InitListExpr_isStringLiteralInit(Self.S);
end;

function TInitListExprW.isTransparent: Boolean;
begin
  Result := clangExt_InitListExpr_isTransparent(Self.S);
end;

function TInitListExprW.isIdiomaticZeroInitializer(const LangOpts: LangOptions): Boolean;
begin
  Result := clangExt_InitListExpr_isIdiomaticZeroInitializer(Self.S, LangOpts);
end;

function TInitListExprW.getLBraceLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_InitListExpr_getLBraceLoc(Self.S, Ctx);
end;

function TInitListExprW.getRBraceLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_InitListExpr_getRBraceLoc(Self.S, Ctx);
end;

function TInitListExprW.isSemanticForm: Boolean;
begin
  Result := clangExt_InitListExpr_isSemanticForm(Self.S);
end;

function TInitListExprW.getSemanticForm: TInitListExprW;
begin
  clangExt_InitListExpr_getSemanticForm(Self.S).Wrap(Result);
end;

function TInitListExprW.isSyntacticForm: Boolean;
begin
  Result := clangExt_InitListExpr_isSyntacticForm(Self.S);
end;

function TInitListExprW.getSyntacticForm: TInitListExprW;
begin
  clangExt_InitListExpr_getSyntacticForm(Self.S).Wrap(Result);
end;

function TInitListExprW.hadArrayRangeDesignator: Boolean;
begin
  Result := clangExt_InitListExpr_hadArrayRangeDesignator(Self.S);
end;

function TInitListExprW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_InitListExpr_getBeginLoc(Self.S, Ctx);
end;

function TInitListExprW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_InitListExpr_getEndLoc(Self.S, Ctx);
end;

class function TInitListExprW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_InitListExpr_classof(T.S);
end;

function TInitListExprW.getNumChildren: Cardinal;
begin
  Result := clangExt_InitListExpr_getNumChildren(Self.S);
end;

function TInitListExprW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_InitListExpr_getChildren(Self.S, i).Wrap(Result);
end;

{$endregion 'TInitListExprW'}

end.

