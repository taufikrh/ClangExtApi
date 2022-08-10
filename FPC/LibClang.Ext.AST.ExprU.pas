unit LibClang.Ext.AST.ExprU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,           
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.DependenceFlagsH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.APValueH,
  LibClang.Ext.llvm.ADT.APIntH,
  LibClang.Ext.llvm.ADT.APSIntH,
  LibClang.Ext.AST.OperationKindsH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.ExprObjCH,
  LibClang.Ext.llvm.ADT.APFloatH,
  LibClang.Ext.Basic.TypeTraitsH,
  LibClang.Ext.Basic.SourceManagerH,
  LibClang.Ext.Basic.TargetInfoH
  ;

{$region 'Expr'}
function clangExt_Expr_getType(const e: Expr): CXQualType; cdecl; external LibClang_dll;
function clangExt_Expr_getDependence(const e: Expr): ExprDependence; cdecl; external LibClang_dll;
function clangExt_Expr_isValueDependent(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isTypeDependent(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isInstantiationDependent(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_containsUnexpandedParameterPack(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_containsErrors(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_getExprLoc(const e: Expr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Expr_isReadIfDiscardedInCPlusPlus11(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isLValue(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isPRValue(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isXValue(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isGLValue(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_ClassifyLValue(const e: Expr; const Ctx: ASTContext): Expr_LValueClassification; cdecl; external LibClang_dll;
function clangExt_Expr_isModifiableLvalue(const e: Expr; const Ctx: ASTContext; Loc: PCXSourceLocation = nil): Expr_isModifiableLvalueResult; cdecl; external LibClang_dll;
function clangExt_Expr_getFPFeaturesInEffect(const e: Expr; const LO: LangOptions): FPOptions; cdecl; external LibClang_dll;
function clangExt_Expr_getValueKind(const e: Expr): ExprValueKind; cdecl; external LibClang_dll;
function clangExt_Expr_getObjectKind(const e: Expr): ExprObjectKind; cdecl; external LibClang_dll;
function clangExt_Expr_isOrdinaryOrBitFieldObject(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_refersToBitField(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_getSourceBitField(const e: Expr): FieldDecl; cdecl; external LibClang_dll;
function clangExt_Expr_getReferencedDeclOfCallee(const e: Expr): Decl; cdecl; external LibClang_dll;
function clangExt_Expr_getObjCProperty(const e: Expr): ObjCPropertyRefExpr; cdecl; external LibClang_dll;
function clangExt_Expr_isObjCSelfExpr(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_refersToVectorElement(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_refersToMatrixElement(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_refersToGlobalRegisterVar(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_hasPlaceholderType(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_hasPlaceholderTypeKind(const e: Expr; K: BuiltinTypeKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isKnownToHaveBooleanValue(const e: Expr; Semantic: Boolean = True): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isIntegerConstantExpr(const e: Expr; const Ctx: ASTContext; Loc: PCXSourceLocation = nil): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isCXX98IntegralConstantExpr(const e: Expr; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isCXX11ConstantExpr(const e: Expr; const Ctx: ASTContext; Ret: PAPValue = nil; Loc: PCXSourceLocation = nil): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isConstantInitializer(const e: Expr; const Ctx: ASTContext; ForRef: Boolean; const Culprit: PExpr = nil): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_getAsBuiltinConstantDeclRef(const e: Expr; const Ctx: ASTContext): ValueDecl; cdecl; external LibClang_dll;
function clangExt_Expr_tryEvaluateStrLen(const e: Expr; out Ret: UInt64; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isNullPointerConstant(const e: Expr; const Ctx: ASTContext; NPC: NullPointerConstantValueDependence): NullPointerConstantKind; cdecl; external LibClang_dll;
function clangExt_Expr_isOBJCGCCandidate(const e: Expr; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isBoundMemberFunction(const e: Expr; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreUnlessSpelledInSource(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreImpCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreImplicit(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreImplicitAsWritten(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParens(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParenImpCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParenCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreConversionOperatorSingleStep(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParenLValueCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParenNoopCasts(const e: Expr; const Ctx: ASTContext): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_IgnoreParenBaseCasts(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_isDefaultArgument(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isTemporaryObject(const e: Expr; const Ctx: ASTContext; const TempTy: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_isImplicitCXXThis(const e: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_getBestDynamicClassType(const e: Expr): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_Expr_getBestDynamicClassTypeExpr(const e: Expr): Expr; cdecl; external LibClang_dll;
function clangExt_Expr_isSameComparisonOperand(const E1: Expr; const E2: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_Expr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;  
{$endregion 'Expr'}
                   
{$region 'FullExpr'}
function clangExt_FullExpr_getSubExpr(const e: FullExpr): Expr; cdecl; external LibClang_dll;
function clangExt_FullExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;   
{$endregion 'FullExpr'}
                         
{$region 'ConstantExpr'}
function clangExt_ConstantExpr_getBeginLoc(const e: ConstantExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_getEndLoc(const e: ConstantExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_getResultAPValueKind(const e: ConstantExpr): APValue_ValueKind; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_getResultStorageKind(const e: ConstantExpr): ConstantExpr_ResultStorageKind; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_isImmediateInvocation(const e: ConstantExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_hasAPValueResult(const e: ConstantExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_getAPValueResult(const e: ConstantExpr): APValue; cdecl; external LibClang_dll;  // dispose: clangExt_APValue_Dispose
function clangExt_ConstantExpr_getResultAsAPValue(const e: ConstantExpr): APValue; cdecl; external LibClang_dll; // dispose: clangExt_APValue_Dispose
function clangExt_ConstantExpr_getResultAsAPSInt(const e: ConstantExpr): APSInt; cdecl; external LibClang_dll; // dispose: clangExt_APSInt_Dispose
function clangExt_ConstantExpr_getNumChildren(const e: ConstantExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_ConstantExpr_getChildren(const e: ConstantExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'ConstantExpr'}
                            
{$region 'DeclRefExpr'}
function clangExt_DeclRefExpr_getDecl(const e: DeclRefExpr): ValueDecl; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getLocation(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getBeginLoc(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getEndLoc(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_hasQualifier(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getQualifierLoc(const e: DeclRefExpr): NestedNameSpecifierLoc; cdecl; external LibClang_dll; // dispose: clangExt_NestedNameSpecifierLoc_Dispose
function clangExt_DeclRefExpr_getQualifier(const e: DeclRefExpr): NestedNameSpecifier; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getFoundDecl(const e: DeclRefExpr): NamedDecl; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_hasTemplateKWAndArgsInfo(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getTemplateKeywordLoc(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getLAngleLoc(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getRAngleLoc(const e: DeclRefExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_hasTemplateKeyword(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_hasExplicitTemplateArgs(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getTemplateArgs(const e: DeclRefExpr): TemplateArgumentLoc; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getNumTemplateArgs(const e: DeclRefExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_template_arguments(const e: DeclRefExpr; i: Cardinal): TemplateArgumentLoc; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_hadMultipleCandidates(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_isNonOdrUse(const e: DeclRefExpr): NonOdrUseReason; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_refersToEnclosingVariableOrCapture(const e: DeclRefExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getNumChildren(const e: DeclRefExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_DeclRefExpr_getChildren(const e: DeclRefExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;   
{$endregion 'DeclRefExpr'}
                     
{$region 'IntegerLiteral'}
function clangExt_IntegerLiteral_getBeginLoc(const e: IntegerLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_getEndLoc(const e: IntegerLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_getLocation(const e: IntegerLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_getNumChildren(const e: IntegerLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_getChildren(const e: IntegerLiteral; i: Cardinal): Stmt; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_IntegerLiteral_getValue(const e: IntegerLiteral): APInt; cdecl; external LibClang_dll; // dispose: clangExt_APInt_Dispose
{$endregion 'IntegerLiteral'}
                             
{$region 'CharacterLiteral'}
function clangExt_CharacterLiteral_getLocation(const e: CharacterLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getKind(const e: CharacterLiteral): CharacterLiteral_CharacterKind; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getBeginLoc(const e: CharacterLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getEndLoc(const e: CharacterLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getValue(const e: CharacterLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_print(val: Cardinal; Kind: CharacterLiteral_CharacterKind): CXString; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getNumChildren(const e: CharacterLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_CharacterLiteral_getChildren(const e: CharacterLiteral; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'CharacterLiteral'}
                                 
{$region 'FloatingLiteral'}
function clangExt_FloatingLiteral_getValue(const e: FloatingLiteral): APFloat; cdecl; external LibClang_dll; // dispose: clangExt_APFloat_Dispose
function clangExt_FloatingLiteral_isExact(const e: FloatingLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_getLocation(const e: FloatingLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_getBeginLoc(const e: FloatingLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_getEndLoc(const e: FloatingLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_getNumChildren(const e: FloatingLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_FloatingLiteral_getChildren(const e: FloatingLiteral; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'FloatingLiteral'}
              
{$region 'StringLiteral'}
function clangExt_StringLiteral_getString(const e: StringLiteral): CXString; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getBytes(const e: StringLiteral): CXString; cdecl; external LibClang_dll;
function clangExt_StringLiteral_outputString(const e: StringLiteral): CXString; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getCodeUnit(const e: StringLiteral; i: SIZE_T): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getByteLength(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getLength(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getCharByteWidth(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getKind(const e: StringLiteral): StringLiteral_StringKind; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isOrdinary(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isWide(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isUTF8(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isUTF16(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isUTF32(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_isPascal(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_containsNonAscii(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_containsNonAsciiOrNull(const e: StringLiteral): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getNumConcatenated(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getStrTokenLoc(const e: StringLiteral; TokNum: Cardinal; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getLocationOfByte(const e: StringLiteral; ByteNo: Cardinal; const SM: SourceManager; const Features: LangOptions; const Target: TargetInfo; const Ctx: ASTContext; StartToken: PCardinal = nil; StartTokenByteOffset: PCardinal = nil): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_StringLiteral_GetToklocNum(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_GetTokloc(const e: StringLiteral; i: Cardinal; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getBeginLoc(const e: StringLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getEndLoc(const e: StringLiteral; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_StringLiteral_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getNumChildren(const e: StringLiteral): Cardinal; cdecl; external LibClang_dll;
function clangExt_StringLiteral_getChildren(const e: StringLiteral; i: Cardinal): Stmt; cdecl; external LibClang_dll;   
{$endregion 'StringLiteral'}

{$region 'ParenExpr'}
function clangExt_ParenExpr_getSubExpr(const e: ParenExpr): Expr; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getBeginLoc(const e: ParenExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getEndLoc(const e: ParenExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getLParen(const e: ParenExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getRParen(const e: ParenExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getNumChildren(const e: ParenExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_ParenExpr_getChildren(const e: ParenExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'ParenExpr'}
                               
{$region 'UnaryOperator'}
function clangExt_UnaryOperator_getOpcode(const e: UnaryOperator): UnaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getSubExpr(const e: UnaryOperator): Expr; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getOperatorLoc(const e: UnaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_canOverflow(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isFPContractableWithinStatement(const e: UnaryOperator; const LO: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isFEnvAccessOn(const e: UnaryOperator; const LO: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isPostfixStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isPrefixStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isPrefix(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isPostfix(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isIncrementOpStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isIncrementOp(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isDecrementOpStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isDecrementOp(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isIncrementDecrementOpStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isIncrementDecrementOp(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isArithmeticOpStatic(Op: UnaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_isArithmeticOp(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getOpcodeStr(Op: UnaryOperatorKind): CXString; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getOverloadedOpcode(OO: OverloadedOperatorKind; Postfix: Boolean): UnaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getOverloadedOperator(Opc: UnaryOperatorKind): OverloadedOperatorKind; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getBeginLoc(const e: UnaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getEndLoc(const e: UnaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getExprLoc(const e: UnaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getNumChildren(const e: UnaryOperator): Cardinal; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getChildren(const e: UnaryOperator; i: Cardinal): Stmt; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_hasStoredFPFeatures(const e: UnaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getStoredFPFeatures(const e: UnaryOperator): FPOptionsOverride; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getFPFeaturesInEffect(const e: UnaryOperator; const LO: LangOptions): FPOptions; cdecl; external LibClang_dll;
function clangExt_UnaryOperator_getFPOptionsOverride(const e: UnaryOperator): FPOptionsOverride; cdecl; external LibClang_dll;
{$endregion 'UnaryOperator'}
                        
{$region 'UnaryExprOrTypeTraitExpr'}
function clangExt_UnaryExprOrTypeTraitExpr_getKind(const e: UnaryExprOrTypeTraitExpr): UnaryExprOrTypeTrait; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_isArgumentType(const e: UnaryExprOrTypeTraitExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getArgumentType(const e: UnaryExprOrTypeTraitExpr): CXQualType; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getArgumentTypeInfo(const e: UnaryExprOrTypeTraitExpr): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getArgumentExpr(const e: UnaryExprOrTypeTraitExpr): Expr; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getTypeOfArgument(const e: UnaryExprOrTypeTraitExpr): CXQualType; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getOperatorLoc(const e: UnaryExprOrTypeTraitExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getRParenLoc(const e: UnaryExprOrTypeTraitExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getBeginLoc(const e: UnaryExprOrTypeTraitExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getEndLoc(const e: UnaryExprOrTypeTraitExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getNumChildren(const e: UnaryExprOrTypeTraitExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_UnaryExprOrTypeTraitExpr_getChildren(const e: UnaryExprOrTypeTraitExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;  
{$endregion 'UnaryExprOrTypeTraitExpr'}

{$region 'CastExpr'}
function clangExt_CastExpr_getCastKind(const e: CastExpr): CastKind; cdecl; external LibClang_dll;
function clangExt_CastExpr_CastKindName(CK: CastKind): PChar; cdecl; external LibClang_dll;
function clangExt_CastExpr_getCastKindName(const e: CastExpr): PChar; cdecl; external LibClang_dll;
function clangExt_CastExpr_getSubExpr(const e: CastExpr): Expr; cdecl; external LibClang_dll;
function clangExt_CastExpr_getSubExprAsWritten(const e: CastExpr): Expr; cdecl; external LibClang_dll;
function clangExt_CastExpr_getConversionFunction(const e: CastExpr): NamedDecl; cdecl; external LibClang_dll;
function clangExt_CastExpr_path_empty(const e: CastExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_CastExpr_path_size(const e: CastExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_CastExpr_getPath(const e: CastExpr; i: Cardinal): CXXBaseSpecifier; cdecl; external LibClang_dll;
function clangExt_CastExpr_getTargetUnionField(const e: CastExpr): FieldDecl; cdecl; external LibClang_dll;
function clangExt_CastExpr_hasStoredFPFeatures(const e: CastExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_CastExpr_getStoredFPFeatures(const e: CastExpr): FPOptionsOverride; cdecl; external LibClang_dll;
function clangExt_CastExpr_getFPFeaturesInEffect(const e: CastExpr; const LO: LangOptions): FPOptions; cdecl; external LibClang_dll;
function clangExt_CastExpr_getFPFeatures(const e: CastExpr): FPOptionsOverride; cdecl; external LibClang_dll;
function clangExt_CastExpr_getTargetFieldForToUnionCast(const unionType: CXQualType; const opType: CXQualType): FieldDecl; cdecl; external LibClang_dll;
function clangExt_CastExpr_getTargetFieldForToUnionCastRecordDecl(const RD: RecordDecl; const opType: CXQualType): FieldDecl; cdecl; external LibClang_dll;
function clangExt_CastExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_CastExpr_getNumChildren(const e: CastExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_CastExpr_getChildren(const e: CastExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'CastExpr'}

{$region 'ImplicitCastExpr'}
function clangExt_ImplicitCastExpr_isPartOfExplicitCast(const e: ImplicitCastExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_ImplicitCastExpr_getBeginLoc(const e: ImplicitCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ImplicitCastExpr_getEndLoc(const e: ImplicitCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ImplicitCastExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;  
{$endregion 'ImplicitCastExpr'}
                              
{$region 'ExplicitCastExpr'}
function clangExt_ExplicitCastExpr_getTypeInfoAsWritten(const e: ExplicitCastExpr): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_ExplicitCastExpr_getTypeAsWritten(const e: ExplicitCastExpr): CXQualType; cdecl; external LibClang_dll;
function clangExt_ExplicitCastExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
{$endregion 'ExplicitCastExpr'}
                             
{$region 'CStyleCastExpr'}
function clangExt_CStyleCastExpr_getLParenLoc(const e: CStyleCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CStyleCastExpr_getRParenLoc(const e: CStyleCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CStyleCastExpr_getBeginLoc(const e: CStyleCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CStyleCastExpr_getEndLoc(const e: CStyleCastExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CStyleCastExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
{$endregion 'CStyleCastExpr'}
                           
{$region 'BinaryOperator'}
function clangExt_BinaryOperator_getExprLoc(const e: BinaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOperatorLoc(const e: BinaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOpcode(const e: BinaryOperator): BinaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getLHS(const e: BinaryOperator): Expr; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getRHS(const e: BinaryOperator): Expr; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getBeginLoc(const e: BinaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getEndLoc(const e: BinaryOperator; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOpcodeStrStatic(Op: BinaryOperatorKind): CXString; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOpcodeStr(const e: BinaryOperator): CXString; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOverloadedOpcode(OO: OverloadedOperatorKind): BinaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOverloadedOperator(Opc: BinaryOperatorKind): OverloadedOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isPtrMemOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isPtrMemOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isMultiplicativeOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isMultiplicativeOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isAdditiveOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isAdditiveOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isShiftOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isShiftOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isBitwiseOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isBitwiseOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isRelationalOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isRelationalOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isEqualityOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isEqualityOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isComparisonOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isComparisonOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isCommaOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isCommaOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_negateComparisonOp(Opc: BinaryOperatorKind): BinaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_reverseComparisonOp(Opc: BinaryOperatorKind): BinaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isLogicalOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isLogicalOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isAssignmentOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isAssignmentOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isCompoundAssignmentOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isCompoundAssignmentOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getOpForCompoundAssignment(Opc: BinaryOperatorKind): BinaryOperatorKind; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isShiftAssignOpStatic(Opc: BinaryOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isShiftAssignOp(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isNullPointerArithmeticExtension(const Ctx: ASTContext; Opc: BinaryOperatorKind; LHS: Expr; RHS: Expr): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_classof(const S: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getNumChildren(const e: BinaryOperator): Cardinal; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getChildren(const e: BinaryOperator; i: Cardinal): Stmt; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_hasStoredFPFeatures(const e: BinaryOperator): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getStoredFPFeatures(const e: BinaryOperator): FPOptionsOverride; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getFPFeaturesInEffect(const e: BinaryOperator; const LO: LangOptions): FPOptions; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_getFPFeatures(const e: BinaryOperator; const LO: LangOptions): FPOptionsOverride; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isFPContractableWithinStatement(const e: BinaryOperator; const LO: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_BinaryOperator_isFEnvAccessOn(const e: BinaryOperator; const LO: LangOptions): Boolean; cdecl; external LibClang_dll;
{$endregion 'BinaryOperator'}

{$region 'InitListExpr'}
function clangExt_InitListExpr_getNumInits(const e: InitListExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getInit(const e: InitListExpr; Init: Cardinal): Expr; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getArrayFiller(const e: InitListExpr): Expr; cdecl; external LibClang_dll;
function clangExt_InitListExpr_hasArrayFiller(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getInitializedFieldInUnion(const e: InitListExpr): FieldDecl; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isExplicit(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isStringLiteralInit(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isTransparent(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isIdiomaticZeroInitializer(const e: InitListExpr; const LangOpts: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getLBraceLoc(const e: InitListExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getRBraceLoc(const e: InitListExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isSemanticForm(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getSemanticForm(const e: InitListExpr): InitListExpr; cdecl; external LibClang_dll;
function clangExt_InitListExpr_isSyntacticForm(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getSyntacticForm(const e: InitListExpr): InitListExpr; cdecl; external LibClang_dll;
function clangExt_InitListExpr_hadArrayRangeDesignator(const e: InitListExpr): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getBeginLoc(const e: InitListExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getEndLoc(const e: InitListExpr; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_InitListExpr_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getNumChildren(const e: InitListExpr): Cardinal; cdecl; external LibClang_dll;
function clangExt_InitListExpr_getChildren(const e: InitListExpr; i: Cardinal): Stmt; cdecl; external LibClang_dll;
{$endregion 'InitListExpr'}

implementation

end.

