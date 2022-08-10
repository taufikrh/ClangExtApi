unit LibClang.Ext.AST.TypeW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.Basic.SpecifiersH,
  //LibClang.Extended,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.DependenceFlagsH,
  LibClang.Ext.Basic.LinkageH,
  LibClang.Ext.Basic.VisibilityH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.AST.DeclTemplateH,

  LibClang.Ext.Basic.ExceptionSpecificationTypeU,
  LibClang.Ext.Basic.AddressSpacesU,
  LibClang.Ext.AST.TypeU,

  LibClang.Ext.AST.DeclW,
  LibClang.Ext.AST.DeclCXXW,
  LibClang.Ext.llvm.ADT.APIntW
  ;

type
  CXQualTypeHelper = type helper for CXQualType
  public
    function getLocalFastQualifiers: Cardinal;
    function getTypePtr: AstType;
    function getTypePtrOrNull: AstType;
    function getBaseTypeIdentifier: IdentifierInfo;
    function split: CXSplitQualType;
    function isCanonical: Boolean;
    function isCanonicalAsParam: Boolean;
    function isNull: Boolean;
    function isLocalConstQualified: Boolean;
    function isConstQualified: Boolean;
    function isLocalRestrictQualified: Boolean;
    function isRestrictQualified: Boolean;
    function isLocalVolatileQualified: Boolean;
    function isVolatileQualified: Boolean;
    function hasLocalQualifiers: Boolean;
    function hasQualifiers: Boolean;
    function hasLocalNonFastQualifiers: Boolean;
    function getLocalQualifiers: CXQualifiers;
    function getQualifiers: CXQualifiers;
    function getLocalCVRQualifiers: Cardinal;
    function getCVRQualifiers: Cardinal;
    function isConstant(const Ctx: ASTContext): Boolean;
    function isPODType(const Context: ASTContext): Boolean;
    function isCXX98PODType(const Context: ASTContext): Boolean;
    function isCXX11PODType(const Context: ASTContext): Boolean;
    function isTrivialType(const Context: ASTContext): Boolean;
    function isTriviallyCopyableType(const Context: ASTContext): Boolean;
    function isTriviallyRelocatableType(const Context: ASTContext): Boolean;
    function mayBeDynamicClass: Boolean;
    function mayBeNotDynamicClass: Boolean;
    function getCanonicalType: CXQualType;
    function getLocalUnqualifiedType: CXQualType;
    function getUnqualifiedType: CXQualType;
    function getSplitUnqualifiedType: CXSplitQualType;
    function isMoreQualifiedThan(const Other: CXQualType): Boolean;
    function isAtLeastAsQualifiedAs(const Other: CXQualType): Boolean;
    function getNonReferenceType: CXQualType;
    function getNonLValueExprType(const Context: ASTContext): CXQualType;
    function getNonPackExpansionType: CXQualType;
    function getDesugaredType(const Context: ASTContext): CXQualType;
    function getSplitDesugaredType: CXSplitQualType;
    function getSingleStepDesugaredType(const Context: ASTContext): CXQualType;
    function IgnoreParens: CXQualType;
    class function getAsStringSplitQualType(Q: CXSplitQualType; const Policy: CXPrintingPolicy): string; static;
    class function getAsStringTypeQualifiers(const Ty: AstType; qs: CXQualifiers; const Policy: CXPrintingPolicy): string; static;
    function getAsString: string;
    function getAsStringPrintingPolicy(const Policy: CXPrintingPolicy): string;
    function hasAddressSpace: Boolean;
    function getAddressSpace: LangAS;
    function isAddressSpaceOverlapping(const T: CXQualType): Boolean;
    function isObjCGCWeak: Boolean;
    function isObjCGCStrong: Boolean;
    function hasNonTrivialObjCLifetime: Boolean;
    function hasStrongOrWeakObjCLifetime: Boolean;
    function isNonWeakInMRRWithObjCWeak(const Context: ASTContext): Boolean;
    function isNonTrivialToPrimitiveDefaultInitialize: QualType_PrimitiveDefaultInitializeKind;
    function isNonTrivialToPrimitiveCopy: QualType_PrimitiveCopyKind;
    function isNonTrivialToPrimitiveDestructiveMove: QualType_PrimitiveCopyKind;
    function isDestructedType: QualType_DestructionKind;
    function hasNonTrivialToPrimitiveDefaultInitializeCUnion: Boolean;
    function hasNonTrivialToPrimitiveDestructCUnion: Boolean;
    function hasNonTrivialToPrimitiveCopyCUnion: Boolean;
    function isCForbiddenLValueType: Boolean;
    function stripObjCKindOfType(const ctx: ASTContext): CXQualType;
    function getAtomicUnqualifiedType: CXQualType;
  end;

  TypeSourceInfoHelper = type helper for TypeSourceInfo
    function getType: CXQualType;
    function getTypeLoc: CXTypeLoc;
  end;

  { CXQualifiersHelper }

  CXQualifiersHelper = type helper for CXQualifiers
  public
    function hasConst: Boolean;
    function hasOnlyConst: Boolean;
    function withConst: CXQualifiers;
    function hasVolatile: Boolean;
    function hasOnlyVolatile: Boolean;
    function withVolatile: CXQualifiers;
    function hasRestrict: Boolean;
    function hasOnlyRestrict: Boolean;
    function withRestrict: CXQualifiers;
    function hasCVRQualifiers: Boolean;
    function getCVRQualifiers: Cardinal;
    function getCVRUQualifiers: Cardinal;
    function hasUnaligned: Boolean;
    function hasObjCGCAttr: Boolean;
    function getObjCGCAttr: CXQualifiers_GC;
    function withoutObjCGCAttr: CXQualifiers;
    function withoutObjCLifetime: CXQualifiers;
    function withoutAddressSpace: CXQualifiers;
    function hasObjCLifetime: Boolean;
    function getObjCLifetime: CXQualifiers_ObjCLifetime;
    function hasNonTrivialObjCLifetime: Boolean;
    function hasStrongOrWeakObjCLifetime: Boolean;
    function hasAddressSpace: Boolean;
    function getAddressSpace: LangAS;
    function hasTargetSpecificAddressSpace: Boolean;
    function getAddressSpaceAttributePrintValue: Cardinal;
    function hasFastQualifiers: Boolean;
    function getFastQualifiers: Cardinal;
    function hasNonFastQualifiers: Boolean;
    function getNonFastQualifiers: CXQualifiers;
    function hasQualifiers: Boolean;
    function empty: Boolean;
    class function isAddressSpaceSupersetOf(A: LangAS; B: LangAS): Boolean; static;
    function isAddressSpaceSupersetOfOther(other: CXQualifiers): Boolean;
    function compatiblyIncludes(other: CXQualifiers): Boolean;
    function compatiblyIncludesObjCLifetime(other: CXQualifiers): Boolean;
    function isStrictSupersetOf(Other: CXQualifiers): Boolean;
    function getAsString: string;
    function getAsStringPrintingPolicy(Policy: CXPrintingPolicy): string;
    class function getAddrSpaceAsString(AS_: LangAS): string; static;
    function isEmptyWhenPrinted(Policy: CXPrintingPolicy): Boolean;
    function print(Policy: CXPrintingPolicy; appendSpaceIfNonEmpty: Boolean = False): string;
  end;

  TExtQualsTypeCommonBaseW = object
    BaseType: AstType;
  end;

  { TAstTypeW }

  TAstTypeW = object(TExtQualsTypeCommonBaseW)
  public
    class function Create(const T: AstType; out oAstType: TAstTypeW): Boolean; static;
    function IsNull: Boolean;
  public
    function getTypeClass: AstType_TypeClass;
    function isFromAST: Boolean;
    function containsUnexpandedParameterPack: Boolean;
    function isCanonicalUnqualified: Boolean;
    function getLocallyUnqualifiedSingleStepDesugaredType: CXQualType;
    function isSizelessType: Boolean;
    function isSizelessBuiltinType: Boolean;
    function isVLSTBuiltinType: Boolean;
    function getSveEltType(const Ctx: ASTContext): CXQualType;
    function isIncompleteType(Def: PNamedDecl = nil): Boolean;
    function isIncompleteOrObjectType: Boolean;
    function isObjectType: Boolean;
    function isLiteralType(const Ctx: ASTContext): Boolean;
    function isStructuralType: Boolean;
    function isStandardLayoutType: Boolean;
    function isBuiltinType: Boolean;
    function isSpecificBuiltinType(K: Cardinal): Boolean;
    function isPlaceholderType: Boolean;
    function getAsPlaceholderType: BuiltinType;
    function isSpecificPlaceholderType(K: Cardinal): Boolean;
    function isNonOverloadPlaceholderType: Boolean;
    function isIntegerType: Boolean;
    function isEnumeralType: Boolean;
    function isScopedEnumeralType: Boolean;
    function isBooleanType: Boolean;
    function isCharType: Boolean;
    function isWideCharType: Boolean;
    function isChar8Type: Boolean;
    function isChar16Type: Boolean;
    function isChar32Type: Boolean;
    function isAnyCharacterType: Boolean;
    function isIntegralType(const Ctx: ASTContext): Boolean;
    function isIntegralOrEnumerationType: Boolean;
    function isIntegralOrUnscopedEnumerationType: Boolean;
    function isUnscopedEnumerationType: Boolean;
    function isRealFloatingType: Boolean;
    function isComplexType: Boolean;
    function isAnyComplexType: Boolean;
    function isFloatingType: Boolean;
    function isHalfType: Boolean;
    function isFloat16Type: Boolean;
    function isBFloat16Type: Boolean;
    function isFloat128Type: Boolean;
    function isIbm128Type: Boolean;
    function isRealType: Boolean;
    function isArithmeticType: Boolean;
    function isVoidType: Boolean;
    function isScalarType: Boolean;
    function isAggregateType: Boolean;
    function isFundamentalType: Boolean;
    function isCompoundType: Boolean;
    function isFunctionType: Boolean;
    function isFunctionNoProtoType: Boolean;
    function isFunctionProtoType: Boolean;
    function isPointerType: Boolean;
    function isAnyPointerType: Boolean;
    function isBlockPointerType: Boolean;
    function isVoidPointerType: Boolean;
    function isReferenceType: Boolean;
    function isLValueReferenceType: Boolean;
    function isRValueReferenceType: Boolean;
    function isObjectPointerType: Boolean;
    function isFunctionPointerType: Boolean;
    function isFunctionReferenceType: Boolean;
    function isMemberPointerType: Boolean;
    function isMemberFunctionPointerType: Boolean;
    function isMemberDataPointerType: Boolean;
    function isArrayType: Boolean;
    function isConstantArrayType: Boolean;
    function isIncompleteArrayType: Boolean;
    function isVariableArrayType: Boolean;
    function isDependentSizedArrayType: Boolean;
    function isRecordType: Boolean;
    function isClassType: Boolean;
    function isStructureType: Boolean;
    function isObjCBoxableRecordType: Boolean;
    function isInterfaceType: Boolean;
    function isStructureOrClassType: Boolean;
    function isUnionType: Boolean;
    function isComplexIntegerType: Boolean;
    function isVectorType: Boolean;
    function isExtVectorType: Boolean;
    function isExtVectorBoolType: Boolean;
    function isMatrixType: Boolean;
    function isConstantMatrixType: Boolean;
    function isDependentAddressSpaceType: Boolean;
    function isObjCObjectPointerType: Boolean;
    function isObjCRetainableType: Boolean;
    function isObjCLifetimeType: Boolean;
    function isObjCIndirectLifetimeType: Boolean;
    function isObjCNSObjectType: Boolean;
    function isObjCIndependentClassType: Boolean;
    function isObjCObjectType: Boolean;
    function isObjCQualifiedInterfaceType: Boolean;
    function isObjCQualifiedIdType: Boolean;
    function isObjCQualifiedClassType: Boolean;
    function isObjCObjectOrInterfaceType: Boolean;
    function isObjCIdType: Boolean;
    function isDecltypeType: Boolean;
    function isObjCInertUnsafeUnretainedType: Boolean;
    function isObjCClassType: Boolean;
    function isObjCClassOrClassKindOfType: Boolean;
    function isBlockCompatibleObjCPointerType(const ctx: ASTContext): Boolean;
    function isObjCSelType: Boolean;
    function isObjCBuiltinType: Boolean;
    function isObjCARCBridgableType: Boolean;
    function isCARCBridgableType: Boolean;
    function isTemplateTypeParmType: Boolean;
    function isNullPtrType: Boolean;
    function isNothrowT: Boolean;
    function isAlignValT: Boolean;
    function isStdByteType: Boolean;
    function isAtomicType: Boolean;
    function isUndeducedAutoType: Boolean;
    function isTypedefNameType: Boolean;
    function getScalarTypeKind: AstType_ScalarTypeKind;
    function getDependence: TypeDependence;
    function containsErrors: Boolean;
    function isDependentType: Boolean;
    function isInstantiationDependentType: Boolean;
    function isUndeducedType: Boolean;
    function isVariablyModifiedType: Boolean;
    function hasSizedVLAType: Boolean;
    function hasUnnamedOrLocalType: Boolean;
    function isOverloadableType: Boolean;
    function isElaboratedTypeSpecifier: Boolean;
    function canDecayToPointerType: Boolean;
    function hasPointerRepresentation: Boolean;
    function hasObjCPointerRepresentation: Boolean;
    function hasIntegerRepresentation: Boolean;
    function hasSignedIntegerRepresentation: Boolean;
    function hasUnsignedIntegerRepresentation: Boolean;
    function hasFloatingRepresentation: Boolean;
    function getAsStructureType: RecordType;
    function getAsUnionType: RecordType;
    function getAsComplexIntegerType: ComplexType;
    function getAsObjCInterfaceType: ObjCObjectType;
    function getAsObjCInterfacePointerType: ObjCObjectPointerType;
    function getAsObjCQualifiedIdType: ObjCObjectPointerType;
    function getAsObjCQualifiedClassType: ObjCObjectPointerType;
    function getAsObjCQualifiedInterfaceType: ObjCObjectType;
    function getAsCXXRecordDecl: CXXRecordDecl;
    function getAsRecordDecl: RecordDecl;
    function getAsTagDecl: TagDecl;
    function getPointeeCXXRecordDecl: CXXRecordDecl;
    function getContainedDeducedType: DeducedType;
    function getContainedAutoType: AutoType;
    function hasAutoForTrailingReturnType: Boolean;
    function getAsArrayTypeUnsafe: ArrayType;
    function castAsArrayTypeUnsafe: ArrayType;
    function hasAttr(AK: CX_AttrKind): Boolean;
    function getBaseElementTypeUnsafe: TAstTypeW;
    function getArrayElementTypeNoTypeQual: TAstTypeW;
    function getPointeeOrArrayElementType: TAstTypeW;
    function getPointeeType: CXQualType;
    function getUnqualifiedDesugaredType: TAstTypeW;
    function isPromotableIntegerType: Boolean;
    function isSignedIntegerType: Boolean;
    function isUnsignedIntegerType: Boolean;
    function isSignedIntegerOrEnumerationType: Boolean;
    function isUnsignedIntegerOrEnumerationType: Boolean;
    function isFixedPointType: Boolean;
    function isFixedPointOrIntegerType: Boolean;
    function isSaturatedFixedPointType: Boolean;
    function isUnsaturatedFixedPointType: Boolean;
    function isSignedFixedPointType: Boolean;
    function isUnsignedFixedPointType: Boolean;
    function isConstantSizeType: Boolean;
    function isSpecifierType: Boolean;
    function getLinkage: Linkage;
    function getVisibility: Visibility;
    function isVisibilityExplicit: Boolean;
    function isLinkageValid: Boolean;
    function canHaveNullability(ResultIfUnknown: Boolean = True): Boolean;
    function acceptsObjCTypeParams: Boolean;
    function getTypeClassName: string;
    function getCanonicalTypeInternal: CXQualType;
    function dump(const Context: ASTContext): string;
  end;    

  TBuiltinTypeW = object(TAstTypeW)
  public
    class function Create(const T: BuiltinType; out oAstType: TBuiltinTypeW): Boolean; static;
  public
    function getKind: BuiltinTypeKind;
    function getName(const Policy: CXPrintingPolicy): string;
    function getNameAsCString(const Policy: CXPrintingPolicy): string;
    function isSugared: Boolean;
    function desugar: CXQualType;
    function isInteger: Boolean;
    function isSignedInteger: Boolean;
    function isUnsignedInteger: Boolean;
    function isFloatingPoint: Boolean;
    function isSVEBool: Boolean;
    class function isPlaceholderTypeKind(K: BuiltinTypeKind): Boolean; static;
    function isPlaceholderType: Boolean;
    function isNonOverloadPlaceholderType: Boolean;
    class function classof(T: TAstTypeW): Boolean; static;
  end;    

  TComplexTypeW = object(TAstTypeW)
  public
    class function Create(const T: ComplexType; out oAstType: TComplexTypeW): Boolean; static;
  public
    function getElementType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;     

  TParenTypeW = object(TAstTypeW)
  public
    class function Create(const T: ParenType; out oAstType: TParenTypeW): Boolean; static;
  public
    function getInnerType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;    

  TPointerTypeW = object(TAstTypeW)
  public
    class function Create(const T: PointerType; out oAstType: TPointerTypeW): Boolean; static;
  public
    function getPointeeType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;     

  TAdjustedTypeW = object(TAstTypeW)
  public
    class function Create(const T: AdjustedType; out oAstType: TAdjustedTypeW): Boolean; static;
  public
    function getOriginalType: CXQualType;
    function getAdjustedType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;  

  TDecayedTypeW = object(TAdjustedTypeW)
  public
    class function Create(const T: DecayedType; out oAstType: TDecayedTypeW): Boolean; static;
  public
    function getDecayedType: CXQualType;
    function getPointeeType: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TBlockPointerTypeW = object(TAstTypeW)
  public
    class function Create(const T: BlockPointerType; out oAstType: TBlockPointerTypeW): Boolean; static;
  public
    function getPointeeType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;
          
  TReferenceTypeW = object(TAstTypeW)
  public
    class function Create(const T: ReferenceType; out oAstType: TReferenceTypeW): Boolean; static;
  public
    function isSpelledAsLValue: Boolean;
    function isInnerRef: Boolean;
    function getPointeeTypeAsWritten: CXQualType;
    function getPointeeType: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TLValueReferenceTypeW = object(TReferenceTypeW)
  public
    class function Create(const T: LValueReferenceType; out oAstType: TLValueReferenceTypeW): Boolean; static;
  public
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TRValueReferenceTypeW = object(TReferenceTypeW)
  public
    class function Create(const T: RValueReferenceType; out oAstType: TRValueReferenceTypeW): Boolean; static;
  public  
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TMemberPointerTypeW }

  TMemberPointerTypeW = object(TAstTypeW)
  public
    class function Create(const T: MemberPointerType; out oAstType: TMemberPointerTypeW): Boolean; static;
  public
    function getPointeeType: CXQualType;
    function isMemberFunctionPointer: Boolean;
    function isMemberDataPointer: Boolean;
    function getClass: TAstTypeW;
    function getMostRecentCXXRecordDecl: TCXXRecordDeclW;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TArrayTypeW }

  TArrayTypeW = object(TAstTypeW)
  public
    class function Create(const T: ArrayType; out oAstType: TArrayTypeW): Boolean; static;
  public
    function getElementType: CXQualType;
    function getSizeModifier: ArrayType_ArraySizeModifier;
    function getIndexTypeQualifiers: CXQualifiers;
    function getIndexTypeCVRQualifiers: Cardinal;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TConstantArrayTypeW }

  TConstantArrayTypeW = object(TArrayTypeW)
  public
    class function Create(const T: ConstantArrayType; out oAstType: TConstantArrayTypeW): Boolean; static;
  public
    function getSize: TAPIntW;
    function getSizeExpr: Expr;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function getNumAddressingBits(const Context: ASTContext; const ElementType: CXQualType; const NumElements: TAPIntW): Cardinal; static;
    class function getMaxSizeBits(const Context: ASTContext): Cardinal; static;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TIncompleteArrayTypeW }

  TIncompleteArrayTypeW = object(TArrayTypeW)
  public
    class function Create(const T: IncompleteArrayType; out oAstType: TIncompleteArrayTypeW): Boolean; static;
  public
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(const T: TAstTypeW): Boolean; static;
  end;

  TVariableArrayTypeW = object(TArrayTypeW)
  public
    class function Create(const T: VariableArrayType; out oAstType: TVariableArrayTypeW): Boolean; static;
  public
  end;

  TDependentSizedArrayTypeW = object(TArrayTypeW)
  public
    class function Create(const T: DependentSizedArrayType; out oAstType: TDependentSizedArrayTypeW): Boolean; static;
  public
  end;

  TDependentAddressSpaceTypeW = object(TAstTypeW)
  public
    class function Create(const T: DependentAddressSpaceType; out oAstType: TDependentAddressSpaceTypeW): Boolean; static;
  public
  end;

  TDependentSizedExtVectorTypeW = object(TAstTypeW)
  public
    class function Create(const T: DependentSizedExtVectorType; out oAstType: TDependentSizedExtVectorTypeW): Boolean; static;
  public
  end;

  TVectorTypeW = object(TAstTypeW)
  public
    class function Create(const T: VectorType; out oAstType: TVectorTypeW): Boolean; static;
  public
  end;

  TDependentVectorTypeW = object(TAstTypeW)
  public
    class function Create(const T: DependentVectorType; out oAstType: TDependentVectorTypeW): Boolean; static;
  public
  end;

  TExtVectorTypeW = object(TVectorTypeW)
  public
    class function Create(const T: ExtVectorType; out oAstType: TExtVectorTypeW): Boolean; static;
  public
  end;

  TMatrixTypeW = object(TAstTypeW)
  public
    class function Create(const T: MatrixType; out oAstType: TMatrixTypeW): Boolean; static;
  public
  end;

  TConstantMatrixTypeW = object(TMatrixTypeW)
  public
    class function Create(const T: ConstantMatrixType; out oAstType: TConstantMatrixTypeW): Boolean; static;
  public
  end;

  TDependentSizedMatrixTypeW = object(TMatrixTypeW)
  public
    class function Create(const T: DependentSizedMatrixType; out oAstType: TDependentSizedMatrixTypeW): Boolean; static;
  public
  end;

  TFunctionTypeW = object(TAstTypeW)
  public
    class function Create(const T: FunctionType; out oAstType: TFunctionTypeW): Boolean; static;
  public
    function getReturnType: CXQualType;
    function getHasRegParm: Boolean;
    function getRegParmType: Cardinal;
    function getNoReturnAttr: Boolean;
    function getCmseNSCallAttr: Boolean;
    function getCallConv: CallingConv;
    function isConst: Boolean;
    function isVolatile: Boolean;
    function isRestrict: Boolean;
    function getCallResultType(const Context: ASTContext): CXQualType;
    class function getNameForCallConv(CC: CallingConv): string; static;
    class function classof(const T: TAstTypeW): Boolean; static;
  end;

  TFunctionNoProtoTypeW = object(TFunctionTypeW)
  public
    class function Create(const T: FunctionNoProtoType; out oAstType: TFunctionNoProtoTypeW): Boolean; static;
  public
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(const T: TAstTypeW): Boolean; static;
  end;

  TFunctionProtoTypeW = object(TFunctionTypeW)
  public
    class function Create(const T: FunctionProtoType; out oAstType: TFunctionProtoTypeW): Boolean; static;
  public
    function getNumParams: Cardinal;
    function getParamType(i: Cardinal): CXQualType;
    function getExceptionSpecType: ExceptionSpecificationType;
    function hasExceptionSpec: Boolean;
    function hasDynamicExceptionSpec: Boolean;
    function hasNoexceptExceptionSpec: Boolean;
    function hasDependentExceptionSpec: Boolean;
    function hasInstantiationDependentExceptionSpec: Boolean;
    function getNumExceptions: Cardinal;
    function getExceptionType(i: Cardinal): CXQualType;
    function getNoexceptExpr: Expr;
    function getExceptionSpecDecl: FunctionDecl;
    function getExceptionSpecTemplate: FunctionDecl;
    function canThrow: CanThrowResult;
    function isNothrow(ResultIfDependent: Boolean = False): Boolean;
    function isVariadic: Boolean;
    function getEllipsisLoc(const Context: ASTContext): CXSourceLocation;
    function isTemplateVariadic: Boolean;
    function hasTrailingReturn: Boolean;
    function getMethodQuals: CXQualifiers;
    function getRefQualifier: RefQualifierKind;
    function hasExtParameterInfos: Boolean;
    function getNumExtParameterInfo: Cardinal;
    function getExtParameterInfo(i: Cardinal): FunctionProtoType_ExtParameterInfo;
    function getParameterABI(I: Cardinal): ParameterABI;
    function isParamConsumed(I: Cardinal): Boolean;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TUnresolvedUsingTypeW = object(TAstTypeW)
  public
    class function Create(const T: UnresolvedUsingType; out oAstType: TUnresolvedUsingTypeW): Boolean; static;
  public
  end;

  TUsingTypeW = object(TAstTypeW)
  public
    class function Create(const T: UsingType; out oAstType: TUsingTypeW): Boolean; static;
  public
  end;

  TTypedefTypeW = object(TAstTypeW)
  public
    class function Create(const T: TypedefType; out oAstType: TTypedefTypeW): Boolean; static;
  public
    function getDecl: TTypedefNameDeclW;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TMacroQualifiedTypeW = object(TAstTypeW)
  public
    class function Create(const T: MacroQualifiedType; out oAstType: TMacroQualifiedTypeW): Boolean; static;
  public
  end;

  TTypeOfExprTypeW = object(TAstTypeW)
  public
    class function Create(const T: TypeOfExprType; out oAstType: TTypeOfExprTypeW): Boolean; static;
  public
  end;

  TDependentTypeOfExprTypeW = object(TTypeOfExprTypeW)
  public
    class function Create(const T: DependentTypeOfExprType; out oAstType: TDependentTypeOfExprTypeW): Boolean; static;
  public
  end;

  TTypeOfTypeW = object(TAstTypeW)
  public
    class function Create(const T: TypeOfType; out oAstType: TTypeOfTypeW): Boolean; static;
  public
  end;

  TDecltypeTypeW = object(TAstTypeW)
  public
    class function Create(const T: DecltypeType; out oAstType: TDecltypeTypeW): Boolean; static;
  public
  end;

  TDependentDecltypeTypeW = object(TDecltypeTypeW)
  public
    class function Create(const T: DependentDecltypeType; out oAstType: TDependentDecltypeTypeW): Boolean; static;
  public
  end;

  TUnaryTransformTypeW = object(TAstTypeW)
  public
    class function Create(const T: UnaryTransformType; out oAstType: TUnaryTransformTypeW): Boolean; static;
  public
  end;

  TDependentUnaryTransformTypeW = object(TUnaryTransformTypeW)
  public
    class function Create(const T: DependentUnaryTransformType; out oAstType: TDependentUnaryTransformTypeW): Boolean; static;
  public
  end;

  { TTagTypeW }

  TTagTypeW = object(TAstTypeW)
  public
    class function Create(const T: TagType; out oAstType: TTagTypeW): Boolean; static;
  public
    function getDecl: TTagDeclW;
    function isBeingDefined: Boolean;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TRecordTypeW = object(TTagTypeW)
  public
    class function Create(const T: RecordType; out oAstType: TRecordTypeW): Boolean; static;
  public
    function getDecl: TRecordDeclW;
    function hasConstFields: Boolean;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TEnumTypeW }

  TEnumTypeW = object(TTagTypeW)
  public
    class function Create(const T: EnumType; out oAstType: TEnumTypeW): Boolean; static;
  public
    function getDecl: TEnumDeclW;
    function isSugared: Boolean;
    function desugar: CXQualType;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  { TAttributedTypeW }

  TAttributedTypeW = object(TAstTypeW)
  public
    class function Create(const T: AttributedType; out oAstType: TAttributedTypeW): Boolean; static;
  public
    function getAttrKind: CX_AttrKind;
    function getModifiedType: CXQualType;
    function getEquivalentType: CXQualType;
    function isSugared: Boolean;
    function desugar: CXQualType;
    function isQualifier: Boolean;
    function isMSTypeSpec: Boolean;
    function isCallingConv: Boolean;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TBTFTagAttributedTypeW = object(TAstTypeW)
  public
    class function Create(const T: BTFTagAttributedType; out oAstType: TBTFTagAttributedTypeW): Boolean; static;
  public
  end;

  TTemplateTypeParmTypeW = object(TAstTypeW)
  public
    class function Create(const T: TemplateTypeParmType; out oAstType: TTemplateTypeParmTypeW): Boolean; static;
  public
  end;

  TSubstTemplateTypeParmTypeW = object(TAstTypeW)
  public
    class function Create(const T: SubstTemplateTypeParmType; out oAstType: TSubstTemplateTypeParmTypeW): Boolean; static;
  public
  end;

  TSubstTemplateTypeParmPackTypeW = object(TAstTypeW)
  public
    class function Create(const T: SubstTemplateTypeParmPackType; out oAstType: TSubstTemplateTypeParmPackTypeW): Boolean; static;
  public
  end;

  { TDeducedTypeW }

  TDeducedTypeW = object(TAstTypeW)
  public
    class function Create(const T: DeducedType; out oAstType: TDeducedTypeW): Boolean; static;
  public
    function isSugared: Boolean;
    function desugar: CXQualType;
    function getDeducedType: CXQualType;
    function isDeduced: Boolean;
    class function classof(const T: TAstTypeW): Boolean; static;
  end;

  { TAutoTypeW }

  TAutoTypeW = object(TDeducedTypeW)
  public
    class function Create(const T: AutoType; out oAstType: TAutoTypeW): Boolean; static;
  public
    function getArgs: TemplateArgument;
    function getNumArgs: Cardinal;
    function getArg(Idx: Cardinal): TemplateArgument;
    function getNumTypeConstraintArgument: Cardinal;
    function getTypeConstraintArgument(Idx: Cardinal): TemplateArgument;
    function getTypeConstraintConcept: ConceptDecl;
    function isConstrained: Boolean;
    function isDecltypeAuto: Boolean;
    function isGNUAutoType: Boolean;
    function getKeyword: AutoTypeKeyword;
    class function classof(const T: TAstTypeW): Boolean; static;
  end;

  TDeducedTemplateSpecializationTypeW = object(TDeducedTypeW)
  public
    class function Create(const T: DeducedTemplateSpecializationType; out oAstType: TDeducedTemplateSpecializationTypeW): Boolean; static;
  public
  end;

  TTemplateSpecializationTypeW = object(TAstTypeW)
  public
    class function Create(const T: TemplateSpecializationType; out oAstType: TTemplateSpecializationTypeW): Boolean; static;
  public
  end;

  TInjectedClassNameTypeW = object(TAstTypeW)
  public
    class function Create(const T: InjectedClassNameType; out oAstType: TInjectedClassNameTypeW): Boolean; static;
  public
  end;

  TTypeWithKeywordW = object(TAstTypeW)
  public
    function getKeyword: ElaboratedTypeKeyword;
    class function getKeywordForTypeSpec(TypeSpec: Cardinal): ElaboratedTypeKeyword; static;
    class function getTagTypeKindForTypeSpec(TypeSpec: Cardinal): TagTypeKind; static;
    class function getKeywordForTagTypeKind(Tag: TagTypeKind): ElaboratedTypeKeyword; static;
    class function getTagTypeKindForKeyword(Keyword: ElaboratedTypeKeyword): TagTypeKind; static;
    class function KeywordIsTagTypeKind(Keyword: ElaboratedTypeKeyword): Boolean; static;
    class function getKeywordName(Keyword: ElaboratedTypeKeyword): string; static;
    class function getTagTypeKindName(Kind: TagTypeKind): string; static;
  end;

  TElaboratedTypeW = object(TTypeWithKeywordW)
  public
    class function Create(const T: ElaboratedType; out oAstType: TElaboratedTypeW): Boolean; static;
  public
    function getQualifier: NestedNameSpecifier;
    function getNamedType: CXQualType;
    function desugar: CXQualType;
    function isSugared: Boolean;
    function getOwnedTagDecl: TTagDeclW;
    class function classof(T: TAstTypeW): Boolean; static;
  end;

  TDependentNameTypeW = object(TTypeWithKeywordW)
  public
    class function Create(const T: DependentNameType; out oAstType: TDependentNameTypeW): Boolean; static;
  public
  end;

  TDependentTemplateSpecializationTypeW = object(TTypeWithKeywordW)
  public
    class function Create(const T: DependentTemplateSpecializationType; out oAstType: TDependentTemplateSpecializationTypeW): Boolean; static;
  public
  end;

  TPackExpansionTypeW = object(TAstTypeW)
  public
    class function Create(const T: PackExpansionType; out oAstType: TPackExpansionTypeW): Boolean; static;
  public
  end;

  TObjCTypeParamTypeW = object(TAstTypeW)
  public
    class function Create(const T: ObjCTypeParamType; out oAstType: TObjCTypeParamTypeW): Boolean; static;
  public
  end;

  TObjCObjectTypeW = object(TAstTypeW)
  public
    class function Create(const T: ObjCObjectType; out oAstType: TObjCObjectTypeW): Boolean; static;
  public
  end;

  TObjCObjectTypeImplW = object(TObjCTypeParamTypeW)
  public
    class function Create(const T: ObjCObjectTypeImpl; out oAstType: TObjCObjectTypeImplW): Boolean; static;
  public
  end;

  TObjCInterfaceTypeW = object(TObjCTypeParamTypeW)
  public
    class function Create(const T: ObjCInterfaceType; out oAstType: TObjCInterfaceTypeW): Boolean; static;
  public
  end;

  TObjCObjectPointerTypeW = object(TAstTypeW)
  public
    class function Create(const T: ObjCObjectPointerType; out oAstType: TObjCObjectPointerTypeW): Boolean; static;
  public
  end;

  TAtomicTypeW = object(TAstTypeW)
  public
    class function Create(const T: AtomicType; out oAstType: TAtomicTypeW): Boolean; static;
  public
  end;

  TPipeTypeW = object(TAstTypeW)
  public
    class function Create(const T: PipeType; out oAstType: TPipeTypeW): Boolean; static;
  public
  end;

  TBitIntTypeW = object(TAstTypeW)
  public
    class function Create(const T: BitIntType; out oAstType: TBitIntTypeW): Boolean; static;
  public
  end;

  TDependentBitIntTypeW = object(TAstTypeW)
  public
    class function Create(const T: DependentBitIntType; out oAstType: TDependentBitIntTypeW): Boolean; static;
  public
  end;

  CXQualTypeHelper2 = type helper(CXQualTypeHelper) for CXQualType
  public
    function castAs_BuiltinType(out Ty: TBuiltinTypeW): Boolean;
    function castAs_ComplexType(out Ty: TComplexTypeW): Boolean;
    function castAs_ParenType(out Ty: TParenTypeW): Boolean;
    function castAs_PointerType(out Ty: TPointerTypeW): Boolean;
    function castAs_AdjustedType(out Ty: TAdjustedTypeW): Boolean;
    function castAs_DecayedType(out Ty: TDecayedTypeW): Boolean;
    function castAs_BlockPointerType(out Ty: TBlockPointerTypeW): Boolean;
    function castAs_ReferenceType(out Ty: TReferenceTypeW): Boolean;
    function castAs_LValueReferenceType(out Ty: TLValueReferenceTypeW): Boolean;
    function castAs_RValueReferenceType(out Ty: TRValueReferenceTypeW): Boolean;
    function castAs_MemberPointerType(out Ty: TMemberPointerTypeW): Boolean;
    function castAs_DependentAddressSpaceType(out Ty: TDependentAddressSpaceTypeW): Boolean;
    function castAs_DependentSizedExtVectorType(out Ty: TDependentSizedExtVectorTypeW): Boolean;
    function castAs_VectorType(out Ty: TVectorTypeW): Boolean;
    function castAs_DependentVectorType(out Ty: TDependentVectorTypeW): Boolean;
    function castAs_ExtVectorType(out Ty: TExtVectorTypeW): Boolean;
    function castAs_MatrixType(out Ty: TMatrixTypeW): Boolean;
    function castAs_ConstantMatrixType(out Ty: TConstantMatrixTypeW): Boolean;
    function castAs_DependentSizedMatrixType(out Ty: TDependentSizedMatrixTypeW): Boolean;
    function castAs_FunctionType(out Ty: TFunctionTypeW): Boolean;
    function castAs_FunctionNoProtoType(out Ty: TFunctionNoProtoTypeW): Boolean;
    function castAs_FunctionProtoType(out Ty: TFunctionProtoTypeW): Boolean;
    function castAs_UnresolvedUsingType(out Ty: TUnresolvedUsingTypeW): Boolean;
    function castAs_UsingType(out Ty: TUsingTypeW): Boolean;
    function castAs_TypedefType(out Ty: TTypedefTypeW): Boolean;
    function castAs_MacroQualifiedType(out Ty: TMacroQualifiedTypeW): Boolean;
    function castAs_TypeOfExprType(out Ty: TTypeOfExprTypeW): Boolean;
    function castAs_DependentTypeOfExprType(out Ty: TDependentTypeOfExprTypeW): Boolean;
    function castAs_TypeOfType(out Ty: TTypeOfTypeW): Boolean;
    function castAs_DecltypeType(out Ty: TDecltypeTypeW): Boolean;
    function castAs_DependentDecltypeType(out Ty: TDependentDecltypeTypeW): Boolean;
    function castAs_UnaryTransformType(out Ty: TUnaryTransformTypeW): Boolean;
    function castAs_DependentUnaryTransformType(out Ty: TDependentUnaryTransformTypeW): Boolean;
    function castAs_TagType(out Ty: TTagTypeW): Boolean;
    function castAs_RecordType(out Ty: TRecordTypeW): Boolean;
    function castAs_EnumType(out Ty: TEnumTypeW): Boolean;
    function castAs_AttributedType(out Ty: TAttributedTypeW): Boolean;
    function castAs_BTFTagAttributedType(out Ty: TBTFTagAttributedTypeW): Boolean;
    function castAs_TemplateTypeParmType(out Ty: TTemplateTypeParmTypeW): Boolean;
    function castAs_SubstTemplateTypeParmType(out Ty: TSubstTemplateTypeParmTypeW): Boolean;
    function castAs_SubstTemplateTypeParmPackType(out Ty: TSubstTemplateTypeParmPackTypeW): Boolean;
    function castAs_DeducedType(out Ty: TDeducedTypeW): Boolean;
    function castAs_AutoType(out Ty: TAutoTypeW): Boolean;
    function castAs_DeducedTemplateSpecializationType(out Ty: TDeducedTemplateSpecializationTypeW): Boolean;
    function castAs_TemplateSpecializationType(out Ty: TTemplateSpecializationTypeW): Boolean;
    function castAs_InjectedClassNameType(out Ty: TInjectedClassNameTypeW): Boolean;
    function castAs_ElaboratedType(out Ty: TElaboratedTypeW): Boolean;
    function castAs_DependentNameType(out Ty: TDependentNameTypeW): Boolean;
    function castAs_DependentTemplateSpecializationType(out Ty: TDependentTemplateSpecializationTypeW): Boolean;
    function castAs_PackExpansionType(out Ty: TPackExpansionTypeW): Boolean;
    function castAs_ObjCTypeParamType(out Ty: TObjCTypeParamTypeW): Boolean;
    function castAs_ObjCObjectType(out Ty: TObjCObjectTypeW): Boolean;
    function castAs_ObjCObjectPointerType(out Ty: TObjCObjectPointerTypeW): Boolean;
    function castAs_AtomicType(out Ty: TAtomicTypeW): Boolean;
    function castAs_PipeType(out Ty: TPipeTypeW): Boolean;
    function castAs_BitIntType(out Ty: TBitIntTypeW): Boolean;
    function castAs_DependentBitIntType(out Ty: TDependentBitIntTypeW): Boolean;
  end;

{$region 'Helper'}

  AstTypeHelper = type helper for AstType
    function Wrap(out T: TAstTypeW): Boolean;
  end;

  BuiltinTypeHelper = type helper for BuiltinType
    function Wrap(out T: TBuiltinTypeW): Boolean;
  end;

  ComplexTypeHelper = type helper for ComplexType
    function Wrap(out T: TComplexTypeW): Boolean;
  end;

  ParenTypeHelper = type helper for ParenType
    function Wrap(out T: TParenTypeW): Boolean;
  end;

  PointerTypeHelper = type helper for PointerType
    function Wrap(out T: TPointerTypeW): Boolean;
  end;

  AdjustedTypeHelper = type helper for AdjustedType
    function Wrap(out T: TAdjustedTypeW): Boolean;
  end;
         
  DecayedTypeHelper = type helper for DecayedType
    function Wrap(out T: TDecayedTypeW): Boolean;
  end;

  BlockPointerTypeHelper = type helper for BlockPointerType
    function Wrap(out T: TBlockPointerTypeW): Boolean;
  end;

  ReferenceTypeHelper = type helper for ReferenceType
    function Wrap(out T: TReferenceTypeW): Boolean;
  end;

  LValueReferenceTypeHelper = type helper for LValueReferenceType
    function Wrap(out T: TLValueReferenceTypeW): Boolean;
  end;

  RValueReferenceTypeHelper = type helper for RValueReferenceType
    function Wrap(out T: TRValueReferenceTypeW): Boolean;
  end;

  MemberPointerTypeHelper = type helper for MemberPointerType
    function Wrap(out T: TMemberPointerTypeW): Boolean;
  end;

  ArrayTypeHelper = type helper for ArrayType
    function Wrap(out T: TArrayTypeW): Boolean;
  end;

  ConstantArrayTypeHelper = type helper for ConstantArrayType
    function Wrap(out T: TConstantArrayTypeW): Boolean;
  end;

  IncompleteArrayTypeHelper = type helper for IncompleteArrayType
    function Wrap(out T: TIncompleteArrayTypeW): Boolean;
  end;

  VariableArrayTypeHelper = type helper for VariableArrayType
    function Wrap(out T: TVariableArrayTypeW): Boolean;
  end;

  DependentSizedArrayTypeHelper = type helper for DependentSizedArrayType
    function Wrap(out T: TDependentSizedArrayTypeW): Boolean;
  end;

  DependentAddressSpaceTypeHelper = type helper for DependentAddressSpaceType
    function Wrap(out T: TDependentAddressSpaceTypeW): Boolean;
  end;

  DependentSizedExtVectorTypeHelper = type helper for DependentSizedExtVectorType
    function Wrap(out T: TDependentSizedExtVectorTypeW): Boolean;
  end;

  VectorTypeHelper = type helper for VectorType
    function Wrap(out T: TVectorTypeW): Boolean;
  end;

  DependentVectorTypeHelper = type helper for DependentVectorType
    function Wrap(out T: TDependentVectorTypeW): Boolean;
  end;

  ExtVectorTypeHelper = type helper for ExtVectorType
    function Wrap(out T: TExtVectorTypeW): Boolean;
  end;

  MatrixTypeHelper = type helper for MatrixType
    function Wrap(out T: TMatrixTypeW): Boolean;
  end;

  ConstantMatrixTypeHelper = type helper for ConstantMatrixType
    function Wrap(out T: TConstantMatrixTypeW): Boolean;
  end;

  DependentSizedMatrixTypeHelper = type helper for DependentSizedMatrixType
    function Wrap(out T: TDependentSizedMatrixTypeW): Boolean;
  end;

  FunctionTypeHelper = type helper for FunctionType
    function Wrap(out T: TFunctionTypeW): Boolean;
  end;

  FunctionNoProtoTypeHelper = type helper for FunctionNoProtoType
    function Wrap(out T: TFunctionNoProtoTypeW): Boolean;
  end;

  FunctionProtoTypeHelper = type helper for FunctionProtoType
    function Wrap(out T: TFunctionProtoTypeW): Boolean;
  end;

  UnresolvedUsingTypeHelper = type helper for UnresolvedUsingType
    function Wrap(out T: TUnresolvedUsingTypeW): Boolean;
  end;

  UsingTypeHelper = type helper for UsingType
    function Wrap(out T: TUsingTypeW): Boolean;
  end;

  TypedefTypeHelper = type helper for TypedefType
    function Wrap(out T: TTypedefTypeW): Boolean;
  end;

  MacroQualifiedTypeHelper = type helper for MacroQualifiedType
    function Wrap(out T: TMacroQualifiedTypeW): Boolean;
  end;

  TypeOfExprTypeHelper = type helper for TypeOfExprType
    function Wrap(out T: TTypeOfExprTypeW): Boolean;
  end;

  DependentTypeOfExprTypeHelper = type helper for DependentTypeOfExprType
    function Wrap(out T: TDependentTypeOfExprTypeW): Boolean;
  end;

  TypeOfTypeHelper = type helper for TypeOfType
    function Wrap(out T: TTypeOfTypeW): Boolean;
  end;

  DecltypeTypeHelper = type helper for DecltypeType
    function Wrap(out T: TDecltypeTypeW): Boolean;
  end;

  DependentDecltypeTypeHelper = type helper for DependentDecltypeType
    function Wrap(out T: TDependentDecltypeTypeW): Boolean;
  end;

  UnaryTransformTypeHelper = type helper for UnaryTransformType
    function Wrap(out T: TUnaryTransformTypeW): Boolean;
  end;

  DependentUnaryTransformTypeHelper = type helper for DependentUnaryTransformType
    function Wrap(out T: TDependentUnaryTransformTypeW): Boolean;
  end;

  TagTypeHelper = type helper for TagType
    function Wrap(out T: TTagTypeW): Boolean;
  end;

  RecordTypeHelper = type helper for RecordType
    function Wrap(out T: TRecordTypeW): Boolean;
  end;

  EnumTypeHelper = type helper for EnumType
    function Wrap(out T: TEnumTypeW): Boolean;
  end;

  AttributedTypeHelper = type helper for AttributedType
    function Wrap(out T: TAttributedTypeW): Boolean;
  end;

  BTFTagAttributedTypeHelper = type helper for BTFTagAttributedType
    function Wrap(out T: TBTFTagAttributedTypeW): Boolean;
  end;

  TemplateTypeParmTypeHelper = type helper for TemplateTypeParmType
    function Wrap(out T: TTemplateTypeParmTypeW): Boolean;
  end;

  SubstTemplateTypeParmTypeHelper = type helper for SubstTemplateTypeParmType
    function Wrap(out T: TSubstTemplateTypeParmTypeW): Boolean;
  end;

  SubstTemplateTypeParmPackTypeHelper = type helper for SubstTemplateTypeParmPackType
    function Wrap(out T: TSubstTemplateTypeParmPackTypeW): Boolean;
  end;

  DeducedTypeHelper = type helper for DeducedType
    function Wrap(out T: TDeducedTypeW): Boolean;
  end;

  AutoTypeHelper = type helper for AutoType
    function Wrap(out T: TAutoTypeW): Boolean;
  end;

  DeducedTemplateSpecializationTypeHelper = type helper for DeducedTemplateSpecializationType
    function Wrap(out T: TDeducedTemplateSpecializationTypeW): Boolean;
  end;

  TemplateSpecializationTypeHelper = type helper for TemplateSpecializationType
    function Wrap(out T: TTemplateSpecializationTypeW): Boolean;
  end;

  InjectedClassNameTypeHelper = type helper for InjectedClassNameType
    function Wrap(out T: TInjectedClassNameTypeW): Boolean;
  end;

  TypeWithKeywordHelper = type helper for TypeWithKeyword
    function Wrap(out T: TTypeWithKeywordW): Boolean;
  end;

  ElaboratedTypeHelper = type helper for ElaboratedType
    function Wrap(out T: TElaboratedTypeW): Boolean;
  end;

  DependentNameTypeHelper = type helper for DependentNameType
    function Wrap(out T: TDependentNameTypeW): Boolean;
  end;

  DependentTemplateSpecializationTypeHelper = type helper for DependentTemplateSpecializationType
    function Wrap(out T: TDependentTemplateSpecializationTypeW): Boolean;
  end;

  PackExpansionTypeHelper = type helper for PackExpansionType
    function Wrap(out T: TPackExpansionTypeW): Boolean;
  end;

  ObjCTypeParamTypeHelper = type helper for ObjCTypeParamType
    function Wrap(out T: TObjCTypeParamTypeW): Boolean;
  end;

  ObjCObjectTypeHelper = type helper for ObjCObjectType
    function Wrap(out T: TObjCObjectTypeW): Boolean;
  end;

  ObjCObjectTypeImplHelper = type helper for ObjCObjectTypeImpl
    function Wrap(out T: TObjCObjectTypeImplW): Boolean;
  end;

  ObjCInterfaceTypeHelper = type helper for ObjCInterfaceType
    function Wrap(out T: TObjCInterfaceTypeW): Boolean;
  end;

  ObjCObjectPointerTypeHelper = type helper for ObjCObjectPointerType
    function Wrap(out T: TObjCObjectPointerTypeW): Boolean;
  end;

  AtomicTypeHelper = type helper for AtomicType
    function Wrap(out T: TAtomicTypeW): Boolean;
  end;

  PipeTypeHelper = type helper for PipeType
    function Wrap(out T: TPipeTypeW): Boolean;
  end;

  BitIntTypeHelper = type helper for BitIntType
    function Wrap(out T: TBitIntTypeW): Boolean;
  end;

  DependentBitIntTypeHelper = type helper for DependentBitIntType
    function Wrap(out T: TDependentBitIntTypeW): Boolean;
  end;

{$endregion 'Helper'}

implementation

{$region 'CXQualifiersHelper'}

function CXQualifiersHelper.hasConst: Boolean;
begin
  Result := clangExt_CXQualifiers_hasConst(Self);
end;

function CXQualifiersHelper.hasOnlyConst: Boolean;
begin
  Result := clangExt_CXQualifiers_hasOnlyConst(Self);
end;

function CXQualifiersHelper.withConst: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withConst(Self);
end;

function CXQualifiersHelper.hasVolatile: Boolean;
begin
  Result := clangExt_CXQualifiers_hasVolatile(Self);
end;

function CXQualifiersHelper.hasOnlyVolatile: Boolean;
begin
  Result := clangExt_CXQualifiers_hasOnlyVolatile(Self);
end;

function CXQualifiersHelper.withVolatile: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withVolatile(Self);
end;

function CXQualifiersHelper.hasRestrict: Boolean;
begin
  Result := clangExt_CXQualifiers_hasRestrict(Self);
end;

function CXQualifiersHelper.hasOnlyRestrict: Boolean;
begin
  Result := clangExt_CXQualifiers_hasOnlyRestrict(Self);
end;

function CXQualifiersHelper.withRestrict: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withRestrict(Self);
end;

function CXQualifiersHelper.hasCVRQualifiers: Boolean;
begin
  Result := clangExt_CXQualifiers_hasCVRQualifiers(Self);
end;

function CXQualifiersHelper.getCVRQualifiers: Cardinal;
begin
  Result := clangExt_CXQualifiers_getCVRQualifiers(Self);
end;

function CXQualifiersHelper.getCVRUQualifiers: Cardinal;
begin
  Result := clangExt_CXQualifiers_getCVRUQualifiers(Self);
end;

function CXQualifiersHelper.hasUnaligned: Boolean;
begin
  Result := clangExt_CXQualifiers_hasUnaligned(Self);
end;

function CXQualifiersHelper.hasObjCGCAttr: Boolean;
begin
  Result := clangExt_CXQualifiers_hasObjCGCAttr(Self);
end;

function CXQualifiersHelper.getObjCGCAttr: CXQualifiers_GC;
begin
  Result := clangExt_CXQualifiers_getObjCGCAttr(Self);
end;

function CXQualifiersHelper.withoutObjCGCAttr: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withoutObjCGCAttr(Self);
end;

function CXQualifiersHelper.withoutObjCLifetime: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withoutObjCLifetime(Self);
end;

function CXQualifiersHelper.withoutAddressSpace: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_withoutAddressSpace(Self);
end;

function CXQualifiersHelper.hasObjCLifetime: Boolean;
begin
  Result := clangExt_CXQualifiers_hasObjCLifetime(Self);
end;

function CXQualifiersHelper.getObjCLifetime: CXQualifiers_ObjCLifetime;
begin
  Result := clangExt_CXQualifiers_getObjCLifetime(Self);
end;

function CXQualifiersHelper.hasNonTrivialObjCLifetime: Boolean;
begin
  Result := clangExt_CXQualifiers_hasNonTrivialObjCLifetime(Self);
end;

function CXQualifiersHelper.hasStrongOrWeakObjCLifetime: Boolean;
begin
  Result := clangExt_CXQualifiers_hasStrongOrWeakObjCLifetime(Self);
end;

function CXQualifiersHelper.hasAddressSpace: Boolean;
begin
  Result := clangExt_CXQualifiers_hasAddressSpace(Self);
end;

function CXQualifiersHelper.getAddressSpace: LangAS;
begin
  Result := clangExt_CXQualifiers_getAddressSpace(Self);
end;

function CXQualifiersHelper.hasTargetSpecificAddressSpace: Boolean;
begin
  Result := clangExt_CXQualifiers_hasTargetSpecificAddressSpace(Self);
end;

function CXQualifiersHelper.getAddressSpaceAttributePrintValue: Cardinal;
begin
  Result := clangExt_CXQualifiers_getAddressSpaceAttributePrintValue(Self);
end;

function CXQualifiersHelper.hasFastQualifiers: Boolean;
begin
  Result := clangExt_CXQualifiers_hasFastQualifiers(Self);
end;

function CXQualifiersHelper.getFastQualifiers: Cardinal;
begin
  Result := clangExt_CXQualifiers_getFastQualifiers(Self);
end;

function CXQualifiersHelper.hasNonFastQualifiers: Boolean;
begin
  Result := clangExt_CXQualifiers_hasNonFastQualifiers(Self);
end;

function CXQualifiersHelper.getNonFastQualifiers: CXQualifiers;
begin
  Result := clangExt_CXQualifiers_getNonFastQualifiers(Self);
end;

function CXQualifiersHelper.hasQualifiers: Boolean;
begin
  Result := clangExt_CXQualifiers_hasQualifiers(Self);
end;

function CXQualifiersHelper.empty: Boolean;
begin
  Result := clangExt_CXQualifiers_empty(Self);
end;

class function CXQualifiersHelper.isAddressSpaceSupersetOf(A: LangAS; B: LangAS): Boolean;
begin
  Result := clangExt_CXQualifiers_isAddressSpaceSupersetOf(A, B);
end;

function CXQualifiersHelper.isAddressSpaceSupersetOfOther(other: CXQualifiers): Boolean;
begin
  Result := clangExt_CXQualifiers_isAddressSpaceSupersetOfOther(Self, other);
end;

function CXQualifiersHelper.compatiblyIncludes(other: CXQualifiers): Boolean;
begin
  Result := clangExt_CXQualifiers_compatiblyIncludes(Self, other);
end;

function CXQualifiersHelper.compatiblyIncludesObjCLifetime(other: CXQualifiers): Boolean;
begin
  Result := clangExt_CXQualifiers_compatiblyIncludesObjCLifetime(Self, other);
end;

function CXQualifiersHelper.isStrictSupersetOf(Other: CXQualifiers): Boolean;
begin
  Result := clangExt_CXQualifiers_isStrictSupersetOf(Self, Other);
end;

function CXQualifiersHelper.getAsString: string;
begin
  Result := clangExt_CXQualifiers_getAsString(Self).ToString;
end;

function CXQualifiersHelper.getAsStringPrintingPolicy(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_CXQualifiers_getAsStringPrintingPolicy(Self, Policy).ToString;
end;

class function CXQualifiersHelper.getAddrSpaceAsString(AS_: LangAS): string;
begin
  Result := clangExt_CXQualifiers_getAddrSpaceAsString(AS_).ToString;
end;

function CXQualifiersHelper.isEmptyWhenPrinted(Policy: CXPrintingPolicy): Boolean;
begin
  Result := clangExt_CXQualifiers_isEmptyWhenPrinted(Self, Policy);
end;

function CXQualifiersHelper.print(Policy: CXPrintingPolicy; appendSpaceIfNonEmpty: Boolean): string;
begin
  Result := clangExt_CXQualifiers_print(Self, Policy, appendSpaceIfNonEmpty).ToString;
end;
       
{$endregion 'CXQualifiersHelper'}

{$region 'CXQualTypeHelper'}

function CXQualTypeHelper.getLocalFastQualifiers: Cardinal;
begin
  Result := clangExt_QualType_getLocalFastQualifiers(Self);
end;

function CXQualTypeHelper.getTypePtr: AstType;
begin
  if not Assigned(Self) then
    Result := nil
  else
    Result := clangExt_QualType_getTypePtr(Self);
end;

function CXQualTypeHelper.getTypePtrOrNull: AstType;
begin
  if not Assigned(Self) then
    Result := nil
  else
    Result := clangExt_QualType_getTypePtrOrNull(Self);
end;

function CXQualTypeHelper.getBaseTypeIdentifier: IdentifierInfo;
begin
  Result := clangExt_QualType_getBaseTypeIdentifier(Self);
end;

function CXQualTypeHelper.split: CXSplitQualType;
begin
  Result := clangExt_QualType_split(Self);
end;

function CXQualTypeHelper.isCanonical: Boolean;
begin
  Result := clangExt_QualType_isCanonical(Self);
end;

function CXQualTypeHelper.isCanonicalAsParam: Boolean;
begin
  Result := clangExt_QualType_isCanonicalAsParam(Self);
end;

function CXQualTypeHelper.isNull: Boolean;
begin
  Result := (not Assigned(Self)) or (clangExt_QualType_isNull(Self));
end;

function CXQualTypeHelper.isLocalConstQualified: Boolean;
begin
  Result := clangExt_QualType_isLocalConstQualified(Self);
end;

function CXQualTypeHelper.isConstQualified: Boolean;
begin
  Result := clangExt_QualType_isConstQualified(Self);
end;

function CXQualTypeHelper.isLocalRestrictQualified: Boolean;
begin
  Result := clangExt_QualType_isLocalRestrictQualified(Self);
end;

function CXQualTypeHelper.isRestrictQualified: Boolean;
begin
  Result := clangExt_QualType_isRestrictQualified(Self);
end;

function CXQualTypeHelper.isLocalVolatileQualified: Boolean;
begin
  Result := clangExt_QualType_isLocalVolatileQualified(Self);
end;

function CXQualTypeHelper.isVolatileQualified: Boolean;
begin
  Result := clangExt_QualType_isVolatileQualified(Self);
end;

function CXQualTypeHelper.hasLocalQualifiers: Boolean;
begin
  Result := clangExt_QualType_hasLocalQualifiers(Self);
end;

function CXQualTypeHelper.hasQualifiers: Boolean;
begin
  Result := clangExt_QualType_hasQualifiers(Self);
end;

function CXQualTypeHelper.hasLocalNonFastQualifiers: Boolean;
begin
  Result := clangExt_QualType_hasLocalNonFastQualifiers(Self);
end;

function CXQualTypeHelper.getLocalQualifiers: CXQualifiers;
begin
  Result := clangExt_QualType_getLocalQualifiers(Self);
end;

function CXQualTypeHelper.getQualifiers: CXQualifiers;
begin
  Result := clangExt_QualType_getQualifiers(Self);
end;

function CXQualTypeHelper.getLocalCVRQualifiers: Cardinal;
begin
  Result := clangExt_QualType_getLocalCVRQualifiers(Self);
end;

function CXQualTypeHelper.getCVRQualifiers: Cardinal;
begin
  Result := clangExt_QualType_getCVRQualifiers(Self);
end;

function CXQualTypeHelper.isConstant(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isConstant(Self, Ctx);
end;

function CXQualTypeHelper.isPODType(const Context: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isPODType(Self, Context);
end;

function CXQualTypeHelper.isCXX98PODType(const Context: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isCXX98PODType(Self, Context);
end;

function CXQualTypeHelper.isCXX11PODType(const Context: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isCXX11PODType(Self, Context);
end;

function CXQualTypeHelper.isTrivialType(const Context: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isTrivialType(Self, Context);
end;

function CXQualTypeHelper.isTriviallyCopyableType(const Context: ASTContext
  ): Boolean;
begin
  Result := clangExt_QualType_isTriviallyCopyableType(Self, Context);
end;

function CXQualTypeHelper.isTriviallyRelocatableType(const Context: ASTContext
  ): Boolean;
begin
  Result := clangExt_QualType_isTriviallyRelocatableType(Self, Context);
end;

function CXQualTypeHelper.mayBeDynamicClass: Boolean;
begin
  Result := clangExt_QualType_mayBeDynamicClass(Self);
end;

function CXQualTypeHelper.mayBeNotDynamicClass: Boolean;
begin
  Result := clangExt_QualType_mayBeNotDynamicClass(Self);
end;

function CXQualTypeHelper.getCanonicalType: CXQualType;
begin
  Result := clangExt_QualType_getCanonicalType(Self);
end;

function CXQualTypeHelper.getLocalUnqualifiedType: CXQualType;
begin
  Result := clangExt_QualType_getLocalUnqualifiedType(Self);
end;

function CXQualTypeHelper.getUnqualifiedType: CXQualType;
begin
  Result := clangExt_QualType_getUnqualifiedType(Self);
end;

function CXQualTypeHelper.getSplitUnqualifiedType: CXSplitQualType;
begin
  Result := clangExt_QualType_getSplitUnqualifiedType(Self);
end;

function CXQualTypeHelper.isMoreQualifiedThan(const Other: CXQualType): Boolean;
begin
  Result := clangExt_QualType_isMoreQualifiedThan(Self, Other);
end;

function CXQualTypeHelper.isAtLeastAsQualifiedAs(const Other: CXQualType): Boolean;
begin
  Result := clangExt_QualType_isAtLeastAsQualifiedAs(Self, Other);
end;

function CXQualTypeHelper.getNonReferenceType: CXQualType;
begin
  Result := clangExt_QualType_getNonReferenceType(Self);
end;

function CXQualTypeHelper.getNonLValueExprType(const Context: ASTContext): CXQualType;
begin
  Result := clangExt_QualType_getNonLValueExprType(Self, Context);
end;

function CXQualTypeHelper.getNonPackExpansionType: CXQualType;
begin
  Result := clangExt_QualType_getNonPackExpansionType(Self);
end;

function CXQualTypeHelper.getDesugaredType(const Context: ASTContext): CXQualType;
begin
  Result := clangExt_QualType_getDesugaredType(Self, Context);
end;

function CXQualTypeHelper.getSplitDesugaredType: CXSplitQualType;
begin
  Result := clangExt_QualType_getSplitDesugaredType(Self);
end;

function CXQualTypeHelper.getSingleStepDesugaredType(const Context: ASTContext): CXQualType;
begin
  Result := clangExt_QualType_getSingleStepDesugaredType(Self, Context);
end;

function CXQualTypeHelper.IgnoreParens: CXQualType;
begin
  Result := clangExt_QualType_IgnoreParens(Self);
end;

class function CXQualTypeHelper.getAsStringSplitQualType(Q: CXSplitQualType;
  const Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_QualType_getAsStringSplitQualType(Q, Policy).ToString;
end;

class function CXQualTypeHelper.getAsStringTypeQualifiers(const Ty: AstType;
  qs: CXQualifiers; const Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_QualType_getAsStringTypeQualifiers(Ty, qs, Policy).ToString;
end;

function CXQualTypeHelper.getAsString: string;
begin
  Result := clangExt_QualType_getAsString(Self).ToString;
end;

function CXQualTypeHelper.getAsStringPrintingPolicy(
  const Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_QualType_getAsStringPrintingPolicy(Self, Policy).ToString;
end;

function CXQualTypeHelper.hasAddressSpace: Boolean;
begin
  Result := clangExt_QualType_hasAddressSpace(Self);
end;

function CXQualTypeHelper.getAddressSpace: LangAS;
begin
  Result := clangExt_QualType_getAddressSpace(Self);
end;

function CXQualTypeHelper.isAddressSpaceOverlapping(const T: CXQualType): Boolean;
begin
  Result := clangExt_QualType_isAddressSpaceOverlapping(Self, T);
end;

function CXQualTypeHelper.isObjCGCWeak: Boolean;
begin
  Result := clangExt_QualType_isObjCGCWeak(Self);
end;

function CXQualTypeHelper.isObjCGCStrong: Boolean;
begin
  Result := clangExt_QualType_isObjCGCStrong(Self);
end;

function CXQualTypeHelper.hasNonTrivialObjCLifetime: Boolean;
begin
  Result := clangExt_QualType_hasNonTrivialObjCLifetime(Self);
end;

function CXQualTypeHelper.hasStrongOrWeakObjCLifetime: Boolean;
begin
  Result := clangExt_QualType_hasStrongOrWeakObjCLifetime(Self);
end;

function CXQualTypeHelper.isNonWeakInMRRWithObjCWeak(const Context: ASTContext): Boolean;
begin
  Result := clangExt_QualType_isNonWeakInMRRWithObjCWeak(Self, Context);
end;

function CXQualTypeHelper.isNonTrivialToPrimitiveDefaultInitialize: QualType_PrimitiveDefaultInitializeKind;
begin
  Result := clangExt_QualType_isNonTrivialToPrimitiveDefaultInitialize(Self);
end;

function CXQualTypeHelper.isNonTrivialToPrimitiveCopy: QualType_PrimitiveCopyKind;
begin
  Result := clangExt_QualType_isNonTrivialToPrimitiveCopy(Self);
end;

function CXQualTypeHelper.isNonTrivialToPrimitiveDestructiveMove: QualType_PrimitiveCopyKind;
begin
  Result := clangExt_QualType_isNonTrivialToPrimitiveDestructiveMove(Self);
end;

function CXQualTypeHelper.isDestructedType: QualType_DestructionKind;
begin
  Result := clangExt_QualType_isDestructedType(Self);
end;

function CXQualTypeHelper.hasNonTrivialToPrimitiveDefaultInitializeCUnion: Boolean;
begin
  Result := clangExt_QualType_hasNonTrivialToPrimitiveDefaultInitializeCUnion(Self);
end;

function CXQualTypeHelper.hasNonTrivialToPrimitiveDestructCUnion: Boolean;
begin
  Result := clangExt_QualType_hasNonTrivialToPrimitiveDestructCUnion(Self);
end;

function CXQualTypeHelper.hasNonTrivialToPrimitiveCopyCUnion: Boolean;
begin
  Result := clangExt_QualType_hasNonTrivialToPrimitiveCopyCUnion(Self);
end;

function CXQualTypeHelper.isCForbiddenLValueType: Boolean;
begin
  Result := clangExt_QualType_isCForbiddenLValueType(Self);
end;

function CXQualTypeHelper.stripObjCKindOfType(const ctx: ASTContext
  ): CXQualType;
begin
  Result := clangExt_QualType_stripObjCKindOfType(Self, ctx);
end;

function CXQualTypeHelper.getAtomicUnqualifiedType: CXQualType;
begin
  Result := clangExt_QualType_getAtomicUnqualifiedType(Self);
end;

{$endregion 'CXQualTypeHelper'}

{$region 'TypeSourceInfoHelper'}

function TypeSourceInfoHelper.getType: CXQualType;
begin
  Result := clangExt_TypeSourceInfo_getType(Self);
end;

function TypeSourceInfoHelper.getTypeLoc: CXTypeLoc;
begin
  Result := clangExt_TypeSourceInfo_getTypeLoc(Self);
end;  
{$endregion 'TypeSourceInfoHelper'}

{$region 'TAstTypeW'}

class function TAstTypeW.Create(const T: AstType; out oAstType: TAstTypeW
  ): Boolean;
begin
  Result := False;
  oAstType := Default(TAstTypeW);
  if not Assigned(T) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TAstTypeW.IsNull: Boolean;
begin
  Result := not Assigned(Self.BaseType);
end;

function TAstTypeW.getTypeClass: AstType_TypeClass;
begin
  Result := clangExt_Type_getTypeClass(Self.BaseType);
end;

function TAstTypeW.isFromAST: Boolean;
begin
  Result := clangExt_Type_isFromAST(Self.BaseType);
end;

function TAstTypeW.containsUnexpandedParameterPack: Boolean;
begin
  Result := clangExt_Type_containsUnexpandedParameterPack(Self.BaseType);
end;

function TAstTypeW.isCanonicalUnqualified: Boolean;
begin
  Result := clangExt_Type_isCanonicalUnqualified(Self.BaseType);
end;

function TAstTypeW.getLocallyUnqualifiedSingleStepDesugaredType: CXQualType;
begin
  Result := clangExt_Type_getLocallyUnqualifiedSingleStepDesugaredType(Self.BaseType);
end;

function TAstTypeW.isSizelessType: Boolean;
begin
  Result := clangExt_Type_isSizelessType(Self.BaseType);
end;

function TAstTypeW.isSizelessBuiltinType: Boolean;
begin
  Result := clangExt_Type_isSizelessBuiltinType(Self.BaseType);
end;

function TAstTypeW.isVLSTBuiltinType: Boolean;
begin
  Result := clangExt_Type_isVLSTBuiltinType(Self.BaseType);
end;

function TAstTypeW.getSveEltType(const Ctx: ASTContext): CXQualType;
begin
  Result := clangExt_Type_getSveEltType(Self.BaseType, Ctx);
end;

function TAstTypeW.isIncompleteType(Def: PNamedDecl): Boolean;
begin
  Result := clangExt_Type_isIncompleteType(Self.BaseType, Def);
end;

function TAstTypeW.isIncompleteOrObjectType: Boolean;
begin
  Result := clangExt_Type_isIncompleteOrObjectType(Self.BaseType);
end;

function TAstTypeW.isObjectType: Boolean;
begin
  Result := clangExt_Type_isObjectType(Self.BaseType);
end;

function TAstTypeW.isLiteralType(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_Type_isLiteralType(Self.BaseType, Ctx);
end;

function TAstTypeW.isStructuralType: Boolean;
begin
  Result := clangExt_Type_isStructuralType(Self.BaseType);
end;

function TAstTypeW.isStandardLayoutType: Boolean;
begin
  Result := clangExt_Type_isStandardLayoutType(Self.BaseType);
end;

function TAstTypeW.isBuiltinType: Boolean;
begin
  Result := clangExt_Type_isBuiltinType(Self.BaseType);
end;

function TAstTypeW.isSpecificBuiltinType(K: Cardinal): Boolean;
begin
  Result := clangExt_Type_isSpecificBuiltinType(Self.BaseType, K);
end;

function TAstTypeW.isPlaceholderType: Boolean;
begin
  Result := clangExt_Type_isPlaceholderType(Self.BaseType);
end;

function TAstTypeW.getAsPlaceholderType: BuiltinType;
begin
  Result := clangExt_Type_getAsPlaceholderType(Self.BaseType);
end;

function TAstTypeW.isSpecificPlaceholderType(K: Cardinal): Boolean;
begin
  Result := clangExt_Type_isSpecificPlaceholderType(Self.BaseType, K);
end;

function TAstTypeW.isNonOverloadPlaceholderType: Boolean;
begin
  Result := clangExt_Type_isNonOverloadPlaceholderType(Self.BaseType);
end;

function TAstTypeW.isIntegerType: Boolean;
begin
  Result := clangExt_Type_isIntegerType(Self.BaseType);
end;

function TAstTypeW.isEnumeralType: Boolean;
begin
  Result := clangExt_Type_isEnumeralType(Self.BaseType);
end;

function TAstTypeW.isScopedEnumeralType: Boolean;
begin
  Result := clangExt_Type_isScopedEnumeralType(Self.BaseType);
end;

function TAstTypeW.isBooleanType: Boolean;
begin
  Result := clangExt_Type_isBooleanType(Self.BaseType);
end;

function TAstTypeW.isCharType: Boolean;
begin
  Result := clangExt_Type_isCharType(Self.BaseType);
end;

function TAstTypeW.isWideCharType: Boolean;
begin
  Result := clangExt_Type_isWideCharType(Self.BaseType);
end;

function TAstTypeW.isChar8Type: Boolean;
begin
  Result := clangExt_Type_isChar8Type(Self.BaseType);
end;

function TAstTypeW.isChar16Type: Boolean;
begin
  Result := clangExt_Type_isChar16Type(Self.BaseType);
end;

function TAstTypeW.isChar32Type: Boolean;
begin
  Result := clangExt_Type_isChar32Type(Self.BaseType);
end;

function TAstTypeW.isAnyCharacterType: Boolean;
begin
  Result := clangExt_Type_isAnyCharacterType(Self.BaseType);
end;

function TAstTypeW.isIntegralType(const Ctx: ASTContext): Boolean;
begin
  Result := clangExt_Type_isIntegralType(Self.BaseType, Ctx);
end;

function TAstTypeW.isIntegralOrEnumerationType: Boolean;
begin
  Result := clangExt_Type_isIntegralOrEnumerationType(Self.BaseType);
end;

function TAstTypeW.isIntegralOrUnscopedEnumerationType: Boolean;
begin
  Result := clangExt_Type_isIntegralOrUnscopedEnumerationType(Self.BaseType);
end;

function TAstTypeW.isUnscopedEnumerationType: Boolean;
begin
  Result := clangExt_Type_isUnscopedEnumerationType(Self.BaseType);
end;

function TAstTypeW.isRealFloatingType: Boolean;
begin
  Result := clangExt_Type_isRealFloatingType(Self.BaseType);
end;

function TAstTypeW.isComplexType: Boolean;
begin
  Result := clangExt_Type_isComplexType(Self.BaseType);
end;

function TAstTypeW.isAnyComplexType: Boolean;
begin
  Result := clangExt_Type_isAnyComplexType(Self.BaseType);
end;

function TAstTypeW.isFloatingType: Boolean;
begin
  Result := clangExt_Type_isFloatingType(Self.BaseType);
end;

function TAstTypeW.isHalfType: Boolean;
begin
  Result := clangExt_Type_isHalfType(Self.BaseType);
end;

function TAstTypeW.isFloat16Type: Boolean;
begin
  Result := clangExt_Type_isFloat16Type(Self.BaseType);
end;

function TAstTypeW.isBFloat16Type: Boolean;
begin
  Result := clangExt_Type_isBFloat16Type(Self.BaseType);
end;

function TAstTypeW.isFloat128Type: Boolean;
begin
  Result := clangExt_Type_isFloat128Type(Self.BaseType);
end;

function TAstTypeW.isIbm128Type: Boolean;
begin
  Result := clangExt_Type_isIbm128Type(Self.BaseType);
end;

function TAstTypeW.isRealType: Boolean;
begin
  Result := clangExt_Type_isRealType(Self.BaseType);
end;

function TAstTypeW.isArithmeticType: Boolean;
begin
  Result := clangExt_Type_isArithmeticType(Self.BaseType);
end;

function TAstTypeW.isVoidType: Boolean;
begin
  Result := clangExt_Type_isVoidType(Self.BaseType);
end;

function TAstTypeW.isScalarType: Boolean;
begin
  Result := clangExt_Type_isScalarType(Self.BaseType);
end;

function TAstTypeW.isAggregateType: Boolean;
begin
  Result := clangExt_Type_isAggregateType(Self.BaseType);
end;

function TAstTypeW.isFundamentalType: Boolean;
begin
  Result := clangExt_Type_isFundamentalType(Self.BaseType);
end;

function TAstTypeW.isCompoundType: Boolean;
begin
  Result := clangExt_Type_isCompoundType(Self.BaseType);
end;

function TAstTypeW.isFunctionType: Boolean;
begin
  Result := clangExt_Type_isFunctionType(Self.BaseType);
end;

function TAstTypeW.isFunctionNoProtoType: Boolean;
begin
  Result := clangExt_Type_isFunctionNoProtoType(Self.BaseType);
end;

function TAstTypeW.isFunctionProtoType: Boolean;
begin
  Result := clangExt_Type_isFunctionProtoType(Self.BaseType);
end;

function TAstTypeW.isPointerType: Boolean;
begin
  Result := clangExt_Type_isPointerType(Self.BaseType);
end;

function TAstTypeW.isAnyPointerType: Boolean;
begin
  Result := clangExt_Type_isAnyPointerType(Self.BaseType);
end;

function TAstTypeW.isBlockPointerType: Boolean;
begin
  Result := clangExt_Type_isBlockPointerType(Self.BaseType);
end;

function TAstTypeW.isVoidPointerType: Boolean;
begin
  Result := clangExt_Type_isVoidPointerType(Self.BaseType);
end;

function TAstTypeW.isReferenceType: Boolean;
begin
  Result := clangExt_Type_isReferenceType(Self.BaseType);
end;

function TAstTypeW.isLValueReferenceType: Boolean;
begin
  Result := clangExt_Type_isLValueReferenceType(Self.BaseType);
end;

function TAstTypeW.isRValueReferenceType: Boolean;
begin
  Result := clangExt_Type_isRValueReferenceType(Self.BaseType);
end;

function TAstTypeW.isObjectPointerType: Boolean;
begin
  Result := clangExt_Type_isObjectPointerType(Self.BaseType);
end;

function TAstTypeW.isFunctionPointerType: Boolean;
begin
  Result := clangExt_Type_isFunctionPointerType(Self.BaseType);
end;

function TAstTypeW.isFunctionReferenceType: Boolean;
begin
  Result := clangExt_Type_isFunctionReferenceType(Self.BaseType);
end;

function TAstTypeW.isMemberPointerType: Boolean;
begin
  Result := clangExt_Type_isMemberPointerType(Self.BaseType);
end;

function TAstTypeW.isMemberFunctionPointerType: Boolean;
begin
  Result := clangExt_Type_isMemberFunctionPointerType(Self.BaseType);
end;

function TAstTypeW.isMemberDataPointerType: Boolean;
begin
  Result := clangExt_Type_isMemberDataPointerType(Self.BaseType);
end;

function TAstTypeW.isArrayType: Boolean;
begin
  Result := clangExt_Type_isArrayType(Self.BaseType);
end;

function TAstTypeW.isConstantArrayType: Boolean;
begin
  Result := clangExt_Type_isConstantArrayType(Self.BaseType);
end;

function TAstTypeW.isIncompleteArrayType: Boolean;
begin
  Result := clangExt_Type_isIncompleteArrayType(Self.BaseType);
end;

function TAstTypeW.isVariableArrayType: Boolean;
begin
  Result := clangExt_Type_isVariableArrayType(Self.BaseType);
end;

function TAstTypeW.isDependentSizedArrayType: Boolean;
begin
  Result := clangExt_Type_isDependentSizedArrayType(Self.BaseType);
end;

function TAstTypeW.isRecordType: Boolean;
begin
  Result := clangExt_Type_isRecordType(Self.BaseType);
end;

function TAstTypeW.isClassType: Boolean;
begin
  Result := clangExt_Type_isClassType(Self.BaseType);
end;

function TAstTypeW.isStructureType: Boolean;
begin
  Result := clangExt_Type_isStructureType(Self.BaseType);
end;

function TAstTypeW.isObjCBoxableRecordType: Boolean;
begin
  Result := clangExt_Type_isObjCBoxableRecordType(Self.BaseType);
end;

function TAstTypeW.isInterfaceType: Boolean;
begin
  Result := clangExt_Type_isInterfaceType(Self.BaseType);
end;

function TAstTypeW.isStructureOrClassType: Boolean;
begin
  Result := clangExt_Type_isStructureOrClassType(Self.BaseType);
end;

function TAstTypeW.isUnionType: Boolean;
begin
  Result := clangExt_Type_isUnionType(Self.BaseType);
end;

function TAstTypeW.isComplexIntegerType: Boolean;
begin
  Result := clangExt_Type_isComplexIntegerType(Self.BaseType);
end;

function TAstTypeW.isVectorType: Boolean;
begin
  Result := clangExt_Type_isVectorType(Self.BaseType);
end;

function TAstTypeW.isExtVectorType: Boolean;
begin
  Result := clangExt_Type_isExtVectorType(Self.BaseType);
end;

function TAstTypeW.isExtVectorBoolType: Boolean;
begin
  Result := clangExt_Type_isExtVectorBoolType(Self.BaseType);
end;

function TAstTypeW.isMatrixType: Boolean;
begin
  Result := clangExt_Type_isMatrixType(Self.BaseType);
end;

function TAstTypeW.isConstantMatrixType: Boolean;
begin
  Result := clangExt_Type_isConstantMatrixType(Self.BaseType);
end;

function TAstTypeW.isDependentAddressSpaceType: Boolean;
begin
  Result := clangExt_Type_isDependentAddressSpaceType(Self.BaseType);
end;

function TAstTypeW.isObjCObjectPointerType: Boolean;
begin
  Result := clangExt_Type_isObjCObjectPointerType(Self.BaseType);
end;

function TAstTypeW.isObjCRetainableType: Boolean;
begin
  Result := clangExt_Type_isObjCRetainableType(Self.BaseType);
end;

function TAstTypeW.isObjCLifetimeType: Boolean;
begin
  Result := clangExt_Type_isObjCLifetimeType(Self.BaseType);
end;

function TAstTypeW.isObjCIndirectLifetimeType: Boolean;
begin
  Result := clangExt_Type_isObjCIndirectLifetimeType(Self.BaseType);
end;

function TAstTypeW.isObjCNSObjectType: Boolean;
begin
  Result := clangExt_Type_isObjCNSObjectType(Self.BaseType);
end;

function TAstTypeW.isObjCIndependentClassType: Boolean;
begin
  Result := clangExt_Type_isObjCIndependentClassType(Self.BaseType);
end;

function TAstTypeW.isObjCObjectType: Boolean;
begin
  Result := clangExt_Type_isObjCObjectType(Self.BaseType);
end;

function TAstTypeW.isObjCQualifiedInterfaceType: Boolean;
begin
  Result := clangExt_Type_isObjCQualifiedInterfaceType(Self.BaseType);
end;

function TAstTypeW.isObjCQualifiedIdType: Boolean;
begin
  Result := clangExt_Type_isObjCQualifiedIdType(Self.BaseType);
end;

function TAstTypeW.isObjCQualifiedClassType: Boolean;
begin
  Result := clangExt_Type_isObjCQualifiedClassType(Self.BaseType);
end;

function TAstTypeW.isObjCObjectOrInterfaceType: Boolean;
begin
  Result := clangExt_Type_isObjCObjectOrInterfaceType(Self.BaseType);
end;

function TAstTypeW.isObjCIdType: Boolean;
begin
  Result := clangExt_Type_isObjCIdType(Self.BaseType);
end;

function TAstTypeW.isDecltypeType: Boolean;
begin
  Result := clangExt_Type_isDecltypeType(Self.BaseType);
end;

function TAstTypeW.isObjCInertUnsafeUnretainedType: Boolean;
begin
  Result := clangExt_Type_isObjCInertUnsafeUnretainedType(Self.BaseType);
end;

function TAstTypeW.isObjCClassType: Boolean;
begin
  Result := clangExt_Type_isObjCClassType(Self.BaseType);
end;

function TAstTypeW.isObjCClassOrClassKindOfType: Boolean;
begin
  Result := clangExt_Type_isObjCClassOrClassKindOfType(Self.BaseType);
end;

function TAstTypeW.isBlockCompatibleObjCPointerType(const ctx: ASTContext
  ): Boolean;
begin
  Result := clangExt_Type_isBlockCompatibleObjCPointerType(Self.BaseType, ctx);
end;

function TAstTypeW.isObjCSelType: Boolean;
begin
  Result := clangExt_Type_isObjCSelType(Self.BaseType);
end;

function TAstTypeW.isObjCBuiltinType: Boolean;
begin
  Result := clangExt_Type_isObjCBuiltinType(Self.BaseType);
end;

function TAstTypeW.isObjCARCBridgableType: Boolean;
begin
  Result := clangExt_Type_isObjCARCBridgableType(Self.BaseType);
end;

function TAstTypeW.isCARCBridgableType: Boolean;
begin
  Result := clangExt_Type_isCARCBridgableType(Self.BaseType);
end;

function TAstTypeW.isTemplateTypeParmType: Boolean;
begin
  Result := clangExt_Type_isTemplateTypeParmType(Self.BaseType);
end;

function TAstTypeW.isNullPtrType: Boolean;
begin
  Result := clangExt_Type_isNullPtrType(Self.BaseType);
end;

function TAstTypeW.isNothrowT: Boolean;
begin
  Result := clangExt_Type_isNothrowT(Self.BaseType);
end;

function TAstTypeW.isAlignValT: Boolean;
begin
  Result := clangExt_Type_isAlignValT(Self.BaseType);
end;

function TAstTypeW.isStdByteType: Boolean;
begin
  Result := clangExt_Type_isStdByteType(Self.BaseType);
end;

function TAstTypeW.isAtomicType: Boolean;
begin
  Result := clangExt_Type_isAtomicType(Self.BaseType);
end;

function TAstTypeW.isUndeducedAutoType: Boolean;
begin
  Result := clangExt_Type_isUndeducedAutoType(Self.BaseType);
end;

function TAstTypeW.isTypedefNameType: Boolean;
begin
  Result := clangExt_Type_isTypedefNameType(Self.BaseType);
end;

function TAstTypeW.getScalarTypeKind: AstType_ScalarTypeKind;
begin
  Result := clangExt_Type_getScalarTypeKind(Self.BaseType);
end;

function TAstTypeW.getDependence: TypeDependence;
begin
  Result := clangExt_Type_getDependence(Self.BaseType);
end;

function TAstTypeW.containsErrors: Boolean;
begin
  Result := clangExt_Type_containsErrors(Self.BaseType);
end;

function TAstTypeW.isDependentType: Boolean;
begin
  Result := clangExt_Type_isDependentType(Self.BaseType);
end;

function TAstTypeW.isInstantiationDependentType: Boolean;
begin
  Result := clangExt_Type_isInstantiationDependentType(Self.BaseType);
end;

function TAstTypeW.isUndeducedType: Boolean;
begin
  Result := clangExt_Type_isUndeducedType(Self.BaseType);
end;

function TAstTypeW.isVariablyModifiedType: Boolean;
begin
  Result := clangExt_Type_isVariablyModifiedType(Self.BaseType);
end;

function TAstTypeW.hasSizedVLAType: Boolean;
begin
  Result := clangExt_Type_hasSizedVLAType(Self.BaseType);
end;

function TAstTypeW.hasUnnamedOrLocalType: Boolean;
begin
  Result := clangExt_Type_hasUnnamedOrLocalType(Self.BaseType);
end;

function TAstTypeW.isOverloadableType: Boolean;
begin
  Result := clangExt_Type_isOverloadableType(Self.BaseType);
end;

function TAstTypeW.isElaboratedTypeSpecifier: Boolean;
begin
  Result := clangExt_Type_isElaboratedTypeSpecifier(Self.BaseType);
end;

function TAstTypeW.canDecayToPointerType: Boolean;
begin
  Result := clangExt_Type_canDecayToPointerType(Self.BaseType);
end;

function TAstTypeW.hasPointerRepresentation: Boolean;
begin
  Result := clangExt_Type_hasPointerRepresentation(Self.BaseType);
end;

function TAstTypeW.hasObjCPointerRepresentation: Boolean;
begin
  Result := clangExt_Type_hasObjCPointerRepresentation(Self.BaseType);
end;

function TAstTypeW.hasIntegerRepresentation: Boolean;
begin
  Result := clangExt_Type_hasIntegerRepresentation(Self.BaseType);
end;

function TAstTypeW.hasSignedIntegerRepresentation: Boolean;
begin
  Result := clangExt_Type_hasSignedIntegerRepresentation(Self.BaseType);
end;

function TAstTypeW.hasUnsignedIntegerRepresentation: Boolean;
begin
  Result := clangExt_Type_hasUnsignedIntegerRepresentation(Self.BaseType);
end;

function TAstTypeW.hasFloatingRepresentation: Boolean;
begin
  Result := clangExt_Type_hasFloatingRepresentation(Self.BaseType);
end;

function TAstTypeW.getAsStructureType: RecordType;
begin
  Result := clangExt_Type_getAsStructureType(Self.BaseType);
end;

function TAstTypeW.getAsUnionType: RecordType;
begin
  Result := clangExt_Type_getAsUnionType(Self.BaseType);
end;

function TAstTypeW.getAsComplexIntegerType: ComplexType;
begin
  Result := clangExt_Type_getAsComplexIntegerType(Self.BaseType);
end;

function TAstTypeW.getAsObjCInterfaceType: ObjCObjectType;
begin
  Result := clangExt_Type_getAsObjCInterfaceType(Self.BaseType);
end;

function TAstTypeW.getAsObjCInterfacePointerType: ObjCObjectPointerType;
begin
  Result := clangExt_Type_getAsObjCInterfacePointerType(Self.BaseType);
end;

function TAstTypeW.getAsObjCQualifiedIdType: ObjCObjectPointerType;
begin
  Result := clangExt_Type_getAsObjCQualifiedIdType(Self.BaseType);
end;

function TAstTypeW.getAsObjCQualifiedClassType: ObjCObjectPointerType;
begin
  Result := clangExt_Type_getAsObjCQualifiedClassType(Self.BaseType);
end;

function TAstTypeW.getAsObjCQualifiedInterfaceType: ObjCObjectType;
begin
  Result := clangExt_Type_getAsObjCQualifiedInterfaceType(Self.BaseType);
end;

function TAstTypeW.getAsCXXRecordDecl: CXXRecordDecl;
begin
  Result := clangExt_Type_getAsCXXRecordDecl(Self.BaseType);
end;

function TAstTypeW.getAsRecordDecl: RecordDecl;
begin
  Result := clangExt_Type_getAsRecordDecl(Self.BaseType);
end;

function TAstTypeW.getAsTagDecl: TagDecl;
begin
  Result := clangExt_Type_getAsTagDecl(Self.BaseType);
end;

function TAstTypeW.getPointeeCXXRecordDecl: CXXRecordDecl;
begin
  Result := clangExt_Type_getPointeeCXXRecordDecl(Self.BaseType);
end;

function TAstTypeW.getContainedDeducedType: DeducedType;
begin
  Result := clangExt_Type_getContainedDeducedType(Self.BaseType);
end;

function TAstTypeW.getContainedAutoType: AutoType;
begin
  Result := clangExt_Type_getContainedAutoType(Self.BaseType);
end;

function TAstTypeW.hasAutoForTrailingReturnType: Boolean;
begin
  Result := clangExt_Type_hasAutoForTrailingReturnType(Self.BaseType);
end;

function TAstTypeW.getAsArrayTypeUnsafe: ArrayType;
begin
  Result := clangExt_Type_getAsArrayTypeUnsafe(Self.BaseType);
end;

function TAstTypeW.castAsArrayTypeUnsafe: ArrayType;
begin
  Result := clangExt_Type_castAsArrayTypeUnsafe(Self.BaseType);
end;

function TAstTypeW.hasAttr(AK: CX_AttrKind): Boolean;
begin
  Result := clangExt_Type_hasAttr(Self.BaseType, AK);
end;

function TAstTypeW.getBaseElementTypeUnsafe: TAstTypeW;
begin
  clangExt_Type_getBaseElementTypeUnsafe(Self.BaseType).Wrap(Result);
end;

function TAstTypeW.getArrayElementTypeNoTypeQual: TAstTypeW;
begin
  clangExt_Type_getArrayElementTypeNoTypeQual(Self.BaseType).Wrap(Result);
end;

function TAstTypeW.getPointeeOrArrayElementType: TAstTypeW;
begin
  clangExt_Type_getPointeeOrArrayElementType(Self.BaseType).Wrap(Result);
end;

function TAstTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_Type_getPointeeType(Self.BaseType);
end;

function TAstTypeW.getUnqualifiedDesugaredType: TAstTypeW;
begin
  clangExt_Type_getUnqualifiedDesugaredType(Self.BaseType).Wrap(Result);
end;

function TAstTypeW.isPromotableIntegerType: Boolean;
begin
  Result := clangExt_Type_isPromotableIntegerType(Self.BaseType);
end;

function TAstTypeW.isSignedIntegerType: Boolean;
begin
  Result := clangExt_Type_isSignedIntegerType(Self.BaseType);
end;

function TAstTypeW.isUnsignedIntegerType: Boolean;
begin
  Result := clangExt_Type_isUnsignedIntegerType(Self.BaseType);
end;

function TAstTypeW.isSignedIntegerOrEnumerationType: Boolean;
begin
  Result := clangExt_Type_isSignedIntegerOrEnumerationType(Self.BaseType);
end;

function TAstTypeW.isUnsignedIntegerOrEnumerationType: Boolean;
begin
  Result := clangExt_Type_isUnsignedIntegerOrEnumerationType(Self.BaseType);
end;

function TAstTypeW.isFixedPointType: Boolean;
begin
  Result := clangExt_Type_isFixedPointType(Self.BaseType);
end;

function TAstTypeW.isFixedPointOrIntegerType: Boolean;
begin
  Result := clangExt_Type_isFixedPointOrIntegerType(Self.BaseType);
end;

function TAstTypeW.isSaturatedFixedPointType: Boolean;
begin
  Result := clangExt_Type_isSaturatedFixedPointType(Self.BaseType);
end;

function TAstTypeW.isUnsaturatedFixedPointType: Boolean;
begin
  Result := clangExt_Type_isUnsaturatedFixedPointType(Self.BaseType);
end;

function TAstTypeW.isSignedFixedPointType: Boolean;
begin
  Result := clangExt_Type_isSignedFixedPointType(Self.BaseType);
end;

function TAstTypeW.isUnsignedFixedPointType: Boolean;
begin
  Result := clangExt_Type_isUnsignedFixedPointType(Self.BaseType);
end;

function TAstTypeW.isConstantSizeType: Boolean;
begin
  Result := clangExt_Type_isConstantSizeType(Self.BaseType);
end;

function TAstTypeW.isSpecifierType: Boolean;
begin
  Result := clangExt_Type_isSpecifierType(Self.BaseType);
end;

function TAstTypeW.getLinkage: Linkage;
begin
  Result := clangExt_Type_getLinkage(Self.BaseType);
end;

function TAstTypeW.getVisibility: Visibility;
begin
  Result := clangExt_Type_getVisibility(Self.BaseType);
end;

function TAstTypeW.isVisibilityExplicit: Boolean;
begin
  Result := clangExt_Type_isVisibilityExplicit(Self.BaseType);
end;

function TAstTypeW.isLinkageValid: Boolean;
begin
  Result := clangExt_Type_isLinkageValid(Self.BaseType);
end;

function TAstTypeW.canHaveNullability(ResultIfUnknown: Boolean): Boolean;
begin
  Result := clangExt_Type_canHaveNullability(Self.BaseType, ResultIfUnknown);
end;

function TAstTypeW.acceptsObjCTypeParams: Boolean;
begin
  Result := clangExt_Type_acceptsObjCTypeParams(Self.BaseType);
end;

function TAstTypeW.getTypeClassName: string;
begin
  Result := StrPas(clangExt_Type_getTypeClassName(Self.BaseType));
end;

function TAstTypeW.getCanonicalTypeInternal: CXQualType;
begin
  Result := clangExt_Type_getCanonicalTypeInternal(Self.BaseType);
end;

function TAstTypeW.dump(const Context: ASTContext): string;
begin
  Result := clangExt_Type_dump(Self.BaseType, Context).ToString;
end;
        
{$endregion 'TAstTypeW'}

{$region 'TBuiltinTypeW'}

class function TBuiltinTypeW.Create(const T: BuiltinType; out
  oAstType: TBuiltinTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TBuiltinTypeW);
  if (not Assigned(T)) or (not clangExt_BuiltinType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TBuiltinTypeW.getKind: BuiltinTypeKind;
begin
  Result := clangExt_BuiltinType_getKind(Self.BaseType);
end;

function TBuiltinTypeW.getName(const Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_BuiltinType_getName(Self.BaseType, Policy).ToString;
end;

function TBuiltinTypeW.getNameAsCString(const Policy: CXPrintingPolicy): string;
begin
  Result := StrPas(clangExt_BuiltinType_getNameAsCString(Self.BaseType, Policy));
end;

function TBuiltinTypeW.isSugared: Boolean;
begin
  Result := clangExt_BuiltinType_isSugared(Self.BaseType);
end;

function TBuiltinTypeW.desugar: CXQualType;
begin
  Result := clangExt_BuiltinType_desugar(Self.BaseType);
end;

function TBuiltinTypeW.isInteger: Boolean;
begin
  Result := clangExt_BuiltinType_isInteger(Self.BaseType);
end;

function TBuiltinTypeW.isSignedInteger: Boolean;
begin
  Result := clangExt_BuiltinType_isSignedInteger(Self.BaseType);
end;

function TBuiltinTypeW.isUnsignedInteger: Boolean;
begin
  Result := clangExt_BuiltinType_isUnsignedInteger(Self.BaseType);
end;

function TBuiltinTypeW.isFloatingPoint: Boolean;
begin
  Result := clangExt_BuiltinType_isFloatingPoint(Self.BaseType);
end;

function TBuiltinTypeW.isSVEBool: Boolean;
begin
  Result := clangExt_BuiltinType_isSVEBool(Self.BaseType);
end;

class function TBuiltinTypeW.isPlaceholderTypeKind(K: BuiltinTypeKind): Boolean;
begin
  Result := clangExt_BuiltinType_isPlaceholderTypeKind(K);
end;

function TBuiltinTypeW.isPlaceholderType: Boolean;
begin
  Result := clangExt_BuiltinType_isPlaceholderType(Self.BaseType);
end;

function TBuiltinTypeW.isNonOverloadPlaceholderType: Boolean;
begin
  Result := clangExt_BuiltinType_isNonOverloadPlaceholderType(Self.BaseType);
end;

class function TBuiltinTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_BuiltinType_classof(T.BaseType);
end;

{$endregion 'TBuiltinTypeW'}

{$region 'TComplexTypeW'}

class function TComplexTypeW.Create(const T: ComplexType; out
  oAstType: TComplexTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TComplexTypeW);
  if (not Assigned(T)) or (not clangExt_ComplexType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TComplexTypeW.getElementType: CXQualType;
begin
  Result := clangExt_ComplexType_getElementType(Self.BaseType);
end;

function TComplexTypeW.isSugared: Boolean;
begin
  Result := clangExt_ComplexType_isSugared(Self.BaseType);
end;

function TComplexTypeW.desugar: CXQualType;
begin
  Result := clangExt_ComplexType_desugar(Self.BaseType);
end;

class function TComplexTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ComplexType_classof(T.BaseType);
end;

{$endregion 'TComplexTypeW'}

{$region 'TParenTypeW'}

class function TParenTypeW.Create(const T: ParenType; out oAstType: TParenTypeW
  ): Boolean;
begin
  Result := False;
  oAstType := Default(TParenTypeW);
  if (not Assigned(T)) or (not clangExt_ParenType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TParenTypeW.getInnerType: CXQualType;
begin
  Result := clangExt_ParenType_getInnerType(Self.BaseType);
end;

function TParenTypeW.isSugared: Boolean;
begin
  Result := clangExt_ParenType_isSugared(Self.BaseType);
end;

function TParenTypeW.desugar: CXQualType;
begin
  Result := clangExt_ParenType_desugar(Self.BaseType);
end;

class function TParenTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ParenType_classof(T.BaseType);
end;

{$endregion 'TParenTypeW'}

{$region 'TPointerTypeW'}

class function TPointerTypeW.Create(const T: PointerType; out
  oAstType: TPointerTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TPointerTypeW);
  if (not Assigned(T)) or (not clangExt_PointerType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TPointerTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_PointerType_getPointeeType(Self.BaseType);
end;

function TPointerTypeW.isSugared: Boolean;
begin
  Result := clangExt_PointerType_isSugared(Self.BaseType);
end;

function TPointerTypeW.desugar: CXQualType;
begin
  Result := clangExt_PointerType_desugar(Self.BaseType);
end;

class function TPointerTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_PointerType_classof(T.BaseType);
end;
        
{$endregion 'TPointerTypeW'}

{$region 'TAdjustedTypeW'}

class function TAdjustedTypeW.Create(const T: AdjustedType; out
  oAstType: TAdjustedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TAdjustedTypeW);
  if (not Assigned(T)) or (not clangExt_AdjustedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TAdjustedTypeW.getOriginalType: CXQualType;
begin
  Result := clangExt_AdjustedType_getOriginalType(Self.BaseType);
end;

function TAdjustedTypeW.getAdjustedType: CXQualType;
begin
  Result := clangExt_AdjustedType_getAdjustedType(Self.BaseType);
end;

function TAdjustedTypeW.isSugared: Boolean;
begin
  Result := clangExt_AdjustedType_isSugared(Self.BaseType);
end;

function TAdjustedTypeW.desugar: CXQualType;
begin
  Result := clangExt_AdjustedType_desugar(Self.BaseType);
end;

class function TAdjustedTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_AdjustedType_classof(T.BaseType);
end;

{$endregion 'TAdjustedTypeW'}

{$region 'TDecayedTypeW'}
class function TDecayedTypeW.Create(const T: DecayedType; out oAstType: TDecayedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDecayedTypeW);
  if (not Assigned(T)) or (not clangExt_DecayedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TDecayedTypeW.getDecayedType: CXQualType;
begin
  Result := clangExt_DecayedType_getDecayedType(Self.BaseType);
end;

function TDecayedTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_DecayedType_getPointeeType(Self.BaseType);
end;

class function TDecayedTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_DecayedType_classof(T.BaseType);
end;
{$endregion 'TDecayedTypeW'}

{$region 'TBlockPointerTypeW'}
class function TBlockPointerTypeW.Create(const T: BlockPointerType; out oAstType: TBlockPointerTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TBlockPointerTypeW);
  if (not Assigned(T)) or (not clangExt_BlockPointerType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TBlockPointerTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_BlockPointerType_getPointeeType(Self.BaseType);
end;

function TBlockPointerTypeW.isSugared: Boolean;
begin
  Result := clangExt_BlockPointerType_isSugared(Self.BaseType);
end;

function TBlockPointerTypeW.desugar: CXQualType;
begin
  Result := clangExt_BlockPointerType_desugar(Self.BaseType);
end;

class function TBlockPointerTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_BlockPointerType_classof(T.BaseType);
end;
{$endregion 'TBlockPointerTypeW'}

{$region 'TReferenceTypeW'}
class function TReferenceTypeW.Create(const T: ReferenceType; out oAstType: TReferenceTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TReferenceTypeW);
  if (not Assigned(T)) or (not clangExt_ReferenceType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TReferenceTypeW.isSpelledAsLValue: Boolean;
begin
  Result := clangExt_ReferenceType_isSpelledAsLValue(Self.BaseType);
end;

function TReferenceTypeW.isInnerRef: Boolean;
begin
  Result := clangExt_ReferenceType_isInnerRef(Self.BaseType);
end;

function TReferenceTypeW.getPointeeTypeAsWritten: CXQualType;
begin
  Result := clangExt_ReferenceType_getPointeeTypeAsWritten(Self.BaseType);
end;

function TReferenceTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_ReferenceType_getPointeeType(Self.BaseType);
end;

class function TReferenceTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ReferenceType_classof(T.BaseType);
end;
{$endregion 'TReferenceTypeW'}

{$region 'TLValueReferenceTypeW'}
class function TLValueReferenceTypeW.Create(const T: LValueReferenceType; out oAstType: TLValueReferenceTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TLValueReferenceTypeW);
  if (not Assigned(T)) or (not clangExt_LValueReferenceType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TLValueReferenceTypeW.isSugared: Boolean;
begin
  Result := clangExt_LValueReferenceType_isSugared(Self.BaseType);
end;

function TLValueReferenceTypeW.desugar: CXQualType;
begin
  Result := clangExt_LValueReferenceType_desugar(Self.BaseType);
end;

class function TLValueReferenceTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_LValueReferenceType_classof(T.BaseType);
end;
{$endregion 'TLValueReferenceTypeW'}

{$region 'TRValueReferenceTypeW'}
class function TRValueReferenceTypeW.Create(const T: RValueReferenceType; out oAstType: TRValueReferenceTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TRValueReferenceTypeW);
  if (not Assigned(T)) or (not clangExt_RValueReferenceType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TRValueReferenceTypeW.isSugared: Boolean;
begin
  Result := clangExt_RValueReferenceType_isSugared(Self.BaseType);
end;

function TRValueReferenceTypeW.desugar: CXQualType;
begin
  Result := clangExt_RValueReferenceType_desugar(Self.BaseType);
end;

class function TRValueReferenceTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_RValueReferenceType_classof(T.BaseType);
end;
{$endregion 'TRValueReferenceTypeW'}

{$region 'TMemberPointerTypeW'}
class function TMemberPointerTypeW.Create(const T: MemberPointerType; out oAstType: TMemberPointerTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TMemberPointerTypeW);
  if (not Assigned(T)) or (not clangExt_MemberPointerType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TMemberPointerTypeW.getPointeeType: CXQualType;
begin
  Result := clangExt_MemberPointerType_getPointeeType(Self.BaseType);
end;

function TMemberPointerTypeW.isMemberFunctionPointer: Boolean;
begin
  Result := clangExt_MemberPointerType_isMemberFunctionPointer(Self.BaseType);
end;

function TMemberPointerTypeW.isMemberDataPointer: Boolean;
begin
  Result := clangExt_MemberPointerType_isMemberDataPointer(Self.BaseType);
end;

function TMemberPointerTypeW.getClass: TAstTypeW;
begin
  clangExt_MemberPointerType_getClass(Self.BaseType).Wrap(Result);
end;

function TMemberPointerTypeW.getMostRecentCXXRecordDecl: TCXXRecordDeclW;
begin
  clangExt_MemberPointerType_getMostRecentCXXRecordDecl(Self.BaseType).Wrap(Result);
end;

function TMemberPointerTypeW.isSugared: Boolean;
begin
  Result := clangExt_MemberPointerType_isSugared(Self.BaseType);
end;

function TMemberPointerTypeW.desugar: CXQualType;
begin
  Result := clangExt_MemberPointerType_desugar(Self.BaseType);
end;

class function TMemberPointerTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_MemberPointerType_classof(T.BaseType);
end;
{$endregion 'TMemberPointerTypeW'}

{$region 'TArrayTypeW'}
class function TArrayTypeW.Create(const T: ArrayType; out oAstType: TArrayTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TArrayTypeW);
  if (not Assigned(T)) or (not clangExt_ArrayType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TArrayTypeW.getElementType: CXQualType;
begin
  Result := clangExt_ArrayType_getElementType(Self.BaseType);
end;

function TArrayTypeW.getSizeModifier: ArrayType_ArraySizeModifier;
begin
  Result := clangExt_ArrayType_getSizeModifier(Self.BaseType);
end;

function TArrayTypeW.getIndexTypeQualifiers: CXQualifiers;
begin
  Result := clangExt_ArrayType_getIndexTypeQualifiers(Self.BaseType);
end;

function TArrayTypeW.getIndexTypeCVRQualifiers: Cardinal;
begin
  Result := clangExt_ArrayType_getIndexTypeCVRQualifiers(Self.BaseType);
end;

class function TArrayTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ArrayType_classof(T.BaseType);
end;
{$endregion 'TArrayTypeW'}

{$region 'TConstantArrayTypeW'}
class function TConstantArrayTypeW.Create(const T: ConstantArrayType; out oAstType: TConstantArrayTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TConstantArrayTypeW);
  if (not Assigned(T)) or (not clangExt_ConstantArrayType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TConstantArrayTypeW.getSize: TAPIntW;
begin
  clangExt_ConstantArrayType_getSize(Self.BaseType).Wrap(Result);
end;

function TConstantArrayTypeW.getSizeExpr: Expr;
begin
  Result := clangExt_ConstantArrayType_getSizeExpr(Self.BaseType);
end;

function TConstantArrayTypeW.isSugared: Boolean;
begin
  Result := clangExt_ConstantArrayType_isSugared(Self.BaseType);
end;

function TConstantArrayTypeW.desugar: CXQualType;
begin
  Result := clangExt_ConstantArrayType_desugar(Self.BaseType);
end;

class function TConstantArrayTypeW.getNumAddressingBits(const Context: ASTContext; const ElementType: CXQualType; const NumElements: TAPIntW): Cardinal;
begin
  Result := clangExt_ConstantArrayType_getNumAddressingBits(Context, ElementType, NumElements.A);
end;

class function TConstantArrayTypeW.getMaxSizeBits(const Context: ASTContext): Cardinal;
begin
  Result := clangExt_ConstantArrayType_getMaxSizeBits(Context);
end;

class function TConstantArrayTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ConstantArrayType_classof(T.BaseType);
end;
{$endregion 'TConstantArrayTypeW'}

{$region 'TIncompleteArrayTypeW'}
class function TIncompleteArrayTypeW.Create(const T: IncompleteArrayType; out oAstType: TIncompleteArrayTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TIncompleteArrayTypeW);
  if (not Assigned(T)) or (not clangExt_IncompleteArrayType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TIncompleteArrayTypeW.isSugared: Boolean;
begin
  Result := clangExt_IncompleteArrayType_isSugared(Self.BaseType);
end;

function TIncompleteArrayTypeW.desugar: CXQualType;
begin
  Result := clangExt_IncompleteArrayType_desugar(Self.BaseType);
end;

class function TIncompleteArrayTypeW.classof(const T: TAstTypeW): Boolean;
begin
  Result := clangExt_IncompleteArrayType_classof(T.BaseType);
end;

{$endregion 'TIncompleteArrayTypeW'}

{$region 'TVariableArrayTypeW'}
class function TVariableArrayTypeW.Create(const T: VariableArrayType; out oAstType: TVariableArrayTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TVariableArrayTypeW);
  if (not Assigned(T)) or (not clangExt_VariableArrayType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TVariableArrayTypeW'}

{$region 'TDependentSizedArrayTypeW'}
class function TDependentSizedArrayTypeW.Create(const T: DependentSizedArrayType; out oAstType: TDependentSizedArrayTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentSizedArrayTypeW);
  if (not Assigned(T)) or (not clangExt_DependentSizedArrayType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentSizedArrayTypeW'}

{$region 'TDependentAddressSpaceTypeW'}
class function TDependentAddressSpaceTypeW.Create(const T: DependentAddressSpaceType; out oAstType: TDependentAddressSpaceTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentAddressSpaceTypeW);
  if (not Assigned(T)) or (not clangExt_DependentAddressSpaceType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentAddressSpaceTypeW'}

{$region 'TDependentSizedExtVectorTypeW'}
class function TDependentSizedExtVectorTypeW.Create(const T: DependentSizedExtVectorType; out oAstType: TDependentSizedExtVectorTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentSizedExtVectorTypeW);
  if (not Assigned(T)) or (not clangExt_DependentSizedExtVectorType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentSizedExtVectorTypeW'}

{$region 'TVectorTypeW'}
class function TVectorTypeW.Create(const T: VectorType; out oAstType: TVectorTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TVectorTypeW);
  if (not Assigned(T)) or (not clangExt_VectorType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TVectorTypeW'}

{$region 'TDependentVectorTypeW'}
class function TDependentVectorTypeW.Create(const T: DependentVectorType; out oAstType: TDependentVectorTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentVectorTypeW);
  if (not Assigned(T)) or (not clangExt_DependentVectorType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentVectorTypeW'}

{$region 'TExtVectorTypeW'}
class function TExtVectorTypeW.Create(const T: ExtVectorType; out oAstType: TExtVectorTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TExtVectorTypeW);
  if (not Assigned(T)) or (not clangExt_ExtVectorType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TExtVectorTypeW'}

{$region 'TMatrixTypeW'}
class function TMatrixTypeW.Create(const T: MatrixType; out oAstType: TMatrixTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TMatrixTypeW);
  if (not Assigned(T)) or (not clangExt_MatrixType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TMatrixTypeW'}

{$region 'TConstantMatrixTypeW'}
class function TConstantMatrixTypeW.Create(const T: ConstantMatrixType; out oAstType: TConstantMatrixTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TConstantMatrixTypeW);
  if (not Assigned(T)) or (not clangExt_ConstantMatrixType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TConstantMatrixTypeW'}

{$region 'TDependentSizedMatrixTypeW'}
class function TDependentSizedMatrixTypeW.Create(const T: DependentSizedMatrixType; out oAstType: TDependentSizedMatrixTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentSizedMatrixTypeW);
  if (not Assigned(T)) or (not clangExt_DependentSizedMatrixType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentSizedMatrixTypeW'}

{$region 'TFunctionTypeW'}
class function TFunctionTypeW.Create(const T: FunctionType; out oAstType: TFunctionTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TFunctionTypeW);
  if (not Assigned(T)) or (not clangExt_FunctionType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TFunctionTypeW.getReturnType: CXQualType;
begin
  Result := clangExt_FunctionType_getReturnType(Self.BaseType);
end;

function TFunctionTypeW.getHasRegParm: Boolean;
begin
  Result := clangExt_FunctionType_getHasRegParm(Self.BaseType);
end;

function TFunctionTypeW.getRegParmType: Cardinal;
begin
  Result := clangExt_FunctionType_getRegParmType(Self.BaseType);
end;

function TFunctionTypeW.getNoReturnAttr: Boolean;
begin
  Result := clangExt_FunctionType_getNoReturnAttr(Self.BaseType);
end;

function TFunctionTypeW.getCmseNSCallAttr: Boolean;
begin
  Result := clangExt_FunctionType_getCmseNSCallAttr(Self.BaseType);
end;

function TFunctionTypeW.getCallConv: CallingConv;
begin
  Result := clangExt_FunctionType_getCallConv(Self.BaseType);
end;

function TFunctionTypeW.isConst: Boolean;
begin
  Result := clangExt_FunctionType_isConst(Self.BaseType);
end;

function TFunctionTypeW.isVolatile: Boolean;
begin
  Result := clangExt_FunctionType_isVolatile(Self.BaseType);
end;

function TFunctionTypeW.isRestrict: Boolean;
begin
  Result := clangExt_FunctionType_isRestrict(Self.BaseType);
end;

function TFunctionTypeW.getCallResultType(const Context: ASTContext): CXQualType;
begin
  Result := clangExt_FunctionType_getCallResultType(Self.BaseType, Context);
end;

class function TFunctionTypeW.getNameForCallConv(CC: CallingConv): string;
begin
  Result := clangExt_FunctionType_getNameForCallConv(CC).ToString;
end;

class function TFunctionTypeW.classof(const T: TAstTypeW): Boolean;
begin
  Result := clangExt_FunctionType_classof(T.BaseType);
end;

{$endregion 'TFunctionTypeW'}

{$region 'TFunctionNoProtoTypeW'}
class function TFunctionNoProtoTypeW.Create(const T: FunctionNoProtoType; out oAstType: TFunctionNoProtoTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TFunctionNoProtoTypeW);
  if (not Assigned(T)) or (not clangExt_FunctionNoProtoType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TFunctionNoProtoTypeW.isSugared: Boolean;
begin
  Result := clangExt_FunctionNoProtoType_isSugared(Self.BaseType);
end;

function TFunctionNoProtoTypeW.desugar: CXQualType;
begin
  Result := clangExt_FunctionNoProtoType_desugar(Self.BaseType);
end;

class function TFunctionNoProtoTypeW.classof(const T: TAstTypeW): Boolean;
begin
  Result := clangExt_FunctionNoProtoType_classof(T.BaseType);
end;
{$endregion 'TFunctionNoProtoTypeW'}

{$region 'TFunctionProtoTypeW'}
class function TFunctionProtoTypeW.Create(const T: FunctionProtoType; out oAstType: TFunctionProtoTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TFunctionProtoTypeW);
  if (not Assigned(T)) or (not clangExt_FunctionProtoType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TFunctionProtoTypeW.getNumParams: Cardinal;
begin
  Result := clangExt_FunctionProtoType_getNumParams(Self.BaseType);
end;

function TFunctionProtoTypeW.getParamType(i: Cardinal): CXQualType;
begin
  Result := clangExt_FunctionProtoType_getParamType(Self.BaseType, i);
end;

function TFunctionProtoTypeW.getExceptionSpecType: ExceptionSpecificationType;
begin
  Result := clangExt_FunctionProtoType_getExceptionSpecType(Self.BaseType);
end;

function TFunctionProtoTypeW.hasExceptionSpec: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasExceptionSpec(Self.BaseType);
end;

function TFunctionProtoTypeW.hasDynamicExceptionSpec: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasDynamicExceptionSpec(Self.BaseType);
end;

function TFunctionProtoTypeW.hasNoexceptExceptionSpec: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasNoexceptExceptionSpec(Self.BaseType);
end;

function TFunctionProtoTypeW.hasDependentExceptionSpec: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasDependentExceptionSpec(Self.BaseType);
end;

function TFunctionProtoTypeW.hasInstantiationDependentExceptionSpec: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasInstantiationDependentExceptionSpec(Self.BaseType);
end;

function TFunctionProtoTypeW.getNumExceptions: Cardinal;
begin
  Result := clangExt_FunctionProtoType_getNumExceptions(Self.BaseType);
end;

function TFunctionProtoTypeW.getExceptionType(i: Cardinal): CXQualType;
begin
  Result := clangExt_FunctionProtoType_getExceptionType(Self.BaseType, i);
end;

function TFunctionProtoTypeW.getNoexceptExpr: Expr;
begin
  Result := clangExt_FunctionProtoType_getNoexceptExpr(Self.BaseType);
end;

function TFunctionProtoTypeW.getExceptionSpecDecl: FunctionDecl;
begin
  Result := clangExt_FunctionProtoType_getExceptionSpecDecl(Self.BaseType);
end;

function TFunctionProtoTypeW.getExceptionSpecTemplate: FunctionDecl;
begin
  Result := clangExt_FunctionProtoType_getExceptionSpecTemplate(Self.BaseType);
end;

function TFunctionProtoTypeW.canThrow: CanThrowResult;
begin
  Result := clangExt_FunctionProtoType_canThrow(Self.BaseType);
end;

function TFunctionProtoTypeW.isNothrow(ResultIfDependent: Boolean): Boolean;
begin
  Result := clangExt_FunctionProtoType_isNothrow(Self.BaseType, ResultIfDependent);
end;

function TFunctionProtoTypeW.isVariadic: Boolean;
begin
  Result := clangExt_FunctionProtoType_isVariadic(Self.BaseType);
end;

function TFunctionProtoTypeW.getEllipsisLoc(const Context: ASTContext): CXSourceLocation;
begin
  Result := clangExt_FunctionProtoType_getEllipsisLoc(Self.BaseType, Context);
end;

function TFunctionProtoTypeW.isTemplateVariadic: Boolean;
begin
  Result := clangExt_FunctionProtoType_isTemplateVariadic(Self.BaseType);
end;

function TFunctionProtoTypeW.hasTrailingReturn: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasTrailingReturn(Self.BaseType);
end;

function TFunctionProtoTypeW.getMethodQuals: CXQualifiers;
begin
  Result := clangExt_FunctionProtoType_getMethodQuals(Self.BaseType);
end;

function TFunctionProtoTypeW.getRefQualifier: RefQualifierKind;
begin
  Result := clangExt_FunctionProtoType_getRefQualifier(Self.BaseType);
end;

function TFunctionProtoTypeW.hasExtParameterInfos: Boolean;
begin
  Result := clangExt_FunctionProtoType_hasExtParameterInfos(Self.BaseType);
end;

function TFunctionProtoTypeW.getNumExtParameterInfo: Cardinal;
begin
  Result := clangExt_FunctionProtoType_getNumExtParameterInfo(Self.BaseType);
end;

function TFunctionProtoTypeW.getExtParameterInfo(i: Cardinal): FunctionProtoType_ExtParameterInfo;
begin
  Result := clangExt_FunctionProtoType_getExtParameterInfo(Self.BaseType, i);
end;

function TFunctionProtoTypeW.getParameterABI(I: Cardinal): ParameterABI;
begin
  Result := clangExt_FunctionProtoType_getParameterABI(Self.BaseType, I);
end;

function TFunctionProtoTypeW.isParamConsumed(I: Cardinal): Boolean;
begin
  Result := clangExt_FunctionProtoType_isParamConsumed(Self.BaseType, I);
end;

function TFunctionProtoTypeW.isSugared: Boolean;
begin
  Result := clangExt_FunctionProtoType_isSugared(Self.BaseType);
end;

function TFunctionProtoTypeW.desugar: CXQualType;
begin
  Result := clangExt_FunctionProtoType_desugar(Self.BaseType);
end;

class function TFunctionProtoTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_FunctionProtoType_classof(T.BaseType);
end;
{$endregion 'TFunctionProtoTypeW'}

{$region 'TUnresolvedUsingTypeW'}
class function TUnresolvedUsingTypeW.Create(const T: UnresolvedUsingType; out oAstType: TUnresolvedUsingTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TUnresolvedUsingTypeW);
  if (not Assigned(T)) or (not clangExt_UnresolvedUsingType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TUnresolvedUsingTypeW'}

{$region 'TUsingTypeW'}
class function TUsingTypeW.Create(const T: UsingType; out oAstType: TUsingTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TUsingTypeW);
  if (not Assigned(T)) or (not clangExt_UsingType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TUsingTypeW'}

{$region 'TTypedefTypeW'}
class function TTypedefTypeW.Create(const T: TypedefType; out oAstType: TTypedefTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTypedefTypeW);
  if (not Assigned(T)) or (not clangExt_TypedefType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TTypedefTypeW.getDecl: TTypedefNameDeclW;
begin
  clangExt_TypedefType_getDecl(Self.BaseType).Wrap(Result);
end;

function TTypedefTypeW.isSugared: Boolean;
begin
  Result := clangExt_TypedefType_isSugared(Self.BaseType);
end;

function TTypedefTypeW.desugar: CXQualType;
begin
  Result := clangExt_TypedefType_desugar(Self.BaseType);
end;

class function TTypedefTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_TypedefType_classof(T.BaseType);
end;
{$endregion 'TTypedefTypeW'}

{$region 'TMacroQualifiedTypeW'}
class function TMacroQualifiedTypeW.Create(const T: MacroQualifiedType; out oAstType: TMacroQualifiedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TMacroQualifiedTypeW);
  if (not Assigned(T)) or (not clangExt_MacroQualifiedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TMacroQualifiedTypeW'}

{$region 'TTypeOfExprTypeW'}
class function TTypeOfExprTypeW.Create(const T: TypeOfExprType; out oAstType: TTypeOfExprTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTypeOfExprTypeW);
  if (not Assigned(T)) or (not clangExt_TypeOfExprType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TTypeOfExprTypeW'}

{$region 'TDependentTypeOfExprTypeW'}
class function TDependentTypeOfExprTypeW.Create(const T: DependentTypeOfExprType; out oAstType: TDependentTypeOfExprTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentTypeOfExprTypeW);
  if (not Assigned(T)) or (not clangExt_DependentTypeOfExprType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentTypeOfExprTypeW'}

{$region 'TTypeOfTypeW'}
class function TTypeOfTypeW.Create(const T: TypeOfType; out oAstType: TTypeOfTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTypeOfTypeW);
  if (not Assigned(T)) or (not clangExt_TypeOfType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TTypeOfTypeW'}

{$region 'TDecltypeTypeW'}
class function TDecltypeTypeW.Create(const T: DecltypeType; out oAstType: TDecltypeTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDecltypeTypeW);
  if (not Assigned(T)) or (not clangExt_DecltypeType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDecltypeTypeW'}

{$region 'TDependentDecltypeTypeW'}
class function TDependentDecltypeTypeW.Create(const T: DependentDecltypeType; out oAstType: TDependentDecltypeTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentDecltypeTypeW);
  if (not Assigned(T)) or (not clangExt_DependentDecltypeType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentDecltypeTypeW'}

{$region 'TUnaryTransformTypeW'}
class function TUnaryTransformTypeW.Create(const T: UnaryTransformType; out oAstType: TUnaryTransformTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TUnaryTransformTypeW);
  if (not Assigned(T)) or (not clangExt_UnaryTransformType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TUnaryTransformTypeW'}

{$region 'TDependentUnaryTransformTypeW'}
class function TDependentUnaryTransformTypeW.Create(const T: DependentUnaryTransformType; out oAstType: TDependentUnaryTransformTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentUnaryTransformTypeW);
  if (not Assigned(T)) or (not clangExt_DependentUnaryTransformType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentUnaryTransformTypeW'}

{$region 'TTagTypeW'}
class function TTagTypeW.Create(const T: TagType; out oAstType: TTagTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTagTypeW);
  if (not Assigned(T)) or (not clangExt_TagType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TTagTypeW.getDecl: TTagDeclW;
begin
  clangExt_TagType_getDecl(Self.BaseType).Wrap(Result);
end;

function TTagTypeW.isBeingDefined: Boolean;
begin
  Result := clangExt_TagType_isBeingDefined(Self.BaseType);
end;

class function TTagTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_TagType_classof(T.BaseType);
end;
{$endregion 'TTagTypeW'}

{$region 'TRecordTypeW'}
class function TRecordTypeW.Create(const T: RecordType; out oAstType: TRecordTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TRecordTypeW);
  if (not Assigned(T)) or (not clangExt_RecordType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TRecordTypeW.getDecl: TRecordDeclW;
begin
  clangExt_RecordType_getDecl(Self.BaseType).Wrap(Result);
end;

function TRecordTypeW.hasConstFields: Boolean;
begin
  Result := clangExt_RecordType_hasConstFields(Self.BaseType);
end;

function TRecordTypeW.isSugared: Boolean;
begin
  Result := clangExt_RecordType_isSugared(Self.BaseType);
end;

function TRecordTypeW.desugar: CXQualType;
begin
  Result := clangExt_RecordType_desugar(Self.BaseType);
end;

class function TRecordTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_RecordType_classof(T.BaseType);
end;
{$endregion 'TRecordTypeW'}

{$region 'TEnumTypeW'}
class function TEnumTypeW.Create(const T: EnumType; out oAstType: TEnumTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TEnumTypeW);
  if (not Assigned(T)) or (not clangExt_EnumType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TEnumTypeW.getDecl: TEnumDeclW;
begin
  clangExt_EnumType_getDecl(Self.BaseType).Wrap(Result);
end;

function TEnumTypeW.isSugared: Boolean;
begin
  Result := clangExt_EnumType_isSugared(Self.BaseType);
end;

function TEnumTypeW.desugar: CXQualType;
begin
  Result := clangExt_EnumType_desugar(Self.BaseType);
end;

class function TEnumTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_EnumType_classof(T.BaseType);
end;
{$endregion 'TEnumTypeW'}

{$region 'TAttributedTypeW'}
class function TAttributedTypeW.Create(const T: AttributedType; out oAstType: TAttributedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TAttributedTypeW);
  if (not Assigned(T)) or (not clangExt_AttributedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TAttributedTypeW.getAttrKind: CX_AttrKind;
begin
  Result := clangExt_AttributedType_getAttrKind(Self.BaseType);
end;

function TAttributedTypeW.getModifiedType: CXQualType;
begin
  Result := clangExt_AttributedType_getModifiedType(Self.BaseType);
end;

function TAttributedTypeW.getEquivalentType: CXQualType;
begin
  Result := clangExt_AttributedType_getEquivalentType(Self.BaseType);
end;

function TAttributedTypeW.isSugared: Boolean;
begin
  Result := clangExt_AttributedType_isSugared(Self.BaseType);
end;

function TAttributedTypeW.desugar: CXQualType;
begin
  Result := clangExt_AttributedType_desugar(Self.BaseType);
end;

function TAttributedTypeW.isQualifier: Boolean;
begin
  Result := clangExt_AttributedType_isQualifier(Self.BaseType);
end;

function TAttributedTypeW.isMSTypeSpec: Boolean;
begin
  Result := clangExt_AttributedType_isMSTypeSpec(Self.BaseType);
end;

function TAttributedTypeW.isCallingConv: Boolean;
begin
  Result := clangExt_AttributedType_isCallingConv(Self.BaseType);
end;

class function TAttributedTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_AttributedType_classof(T.BaseType);
end;
{$endregion 'TAttributedTypeW'}

{$region 'TBTFTagAttributedTypeW'}
class function TBTFTagAttributedTypeW.Create(const T: BTFTagAttributedType; out oAstType: TBTFTagAttributedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TBTFTagAttributedTypeW);
  if (not Assigned(T)) or (not clangExt_BTFTagAttributedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TBTFTagAttributedTypeW'}

{$region 'TTemplateTypeParmTypeW'}
class function TTemplateTypeParmTypeW.Create(const T: TemplateTypeParmType; out oAstType: TTemplateTypeParmTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTemplateTypeParmTypeW);
  if (not Assigned(T)) or (not clangExt_TemplateTypeParmType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TTemplateTypeParmTypeW'}

{$region 'TSubstTemplateTypeParmTypeW'}
class function TSubstTemplateTypeParmTypeW.Create(const T: SubstTemplateTypeParmType; out oAstType: TSubstTemplateTypeParmTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TSubstTemplateTypeParmTypeW);
  if (not Assigned(T)) or (not clangExt_SubstTemplateTypeParmType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TSubstTemplateTypeParmTypeW'}

{$region 'TSubstTemplateTypeParmPackTypeW'}
class function TSubstTemplateTypeParmPackTypeW.Create(const T: SubstTemplateTypeParmPackType; out oAstType: TSubstTemplateTypeParmPackTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TSubstTemplateTypeParmPackTypeW);
  if (not Assigned(T)) or (not clangExt_SubstTemplateTypeParmPackType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TSubstTemplateTypeParmPackTypeW'}

{$region 'TDeducedTypeW'}
class function TDeducedTypeW.Create(const T: DeducedType; out oAstType: TDeducedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDeducedTypeW);
  if (not Assigned(T)) or (not clangExt_DeducedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TDeducedTypeW.isSugared: Boolean;
begin
  Result := clangExt_DeducedType_isSugared(Self.BaseType);
end;

function TDeducedTypeW.desugar: CXQualType;
begin
  Result := clangExt_DeducedType_desugar(Self.BaseType);
end;

function TDeducedTypeW.getDeducedType: CXQualType;
begin
  Result := clangExt_DeducedType_getDeducedType(Self.BaseType);
end;

function TDeducedTypeW.isDeduced: Boolean;
begin
  Result := clangExt_DeducedType_isDeduced(Self.BaseType);
end;

class function TDeducedTypeW.classof(const T: TAstTypeW): Boolean;
begin
  Result := clangExt_DeducedType_classof(T.BaseType);
end;
{$endregion 'TDeducedTypeW'}

{$region 'TAutoTypeW'}
class function TAutoTypeW.Create(const T: AutoType; out oAstType: TAutoTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TAutoTypeW);
  if (not Assigned(T)) or (not clangExt_AutoType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TAutoTypeW.getArgs: TemplateArgument;
begin
  Result := clangExt_AutoType_getArgs(Self.BaseType);
end;

function TAutoTypeW.getNumArgs: Cardinal;
begin
  Result := clangExt_AutoType_getNumArgs(Self.BaseType);
end;

function TAutoTypeW.getArg(Idx: Cardinal): TemplateArgument;
begin
  Result := clangExt_AutoType_getArg(Self.BaseType, Idx);
end;

function TAutoTypeW.getNumTypeConstraintArgument: Cardinal;
begin
  Result := clangExt_AutoType_getNumTypeConstraintArgument(Self.BaseType);
end;

function TAutoTypeW.getTypeConstraintArgument(Idx: Cardinal): TemplateArgument;
begin
  Result := clangExt_AutoType_getTypeConstraintArgument(Self.BaseType, Idx);
end;

function TAutoTypeW.getTypeConstraintConcept: ConceptDecl;
begin
  Result := clangExt_AutoType_getTypeConstraintConcept(Self.BaseType);
end;

function TAutoTypeW.isConstrained: Boolean;
begin
  Result := clangExt_AutoType_isConstrained(Self.BaseType);
end;

function TAutoTypeW.isDecltypeAuto: Boolean;
begin
  Result := clangExt_AutoType_isDecltypeAuto(Self.BaseType);
end;

function TAutoTypeW.isGNUAutoType: Boolean;
begin
  Result := clangExt_AutoType_isGNUAutoType(Self.BaseType);
end;

function TAutoTypeW.getKeyword: AutoTypeKeyword;
begin
  Result := clangExt_AutoType_getKeyword(Self.BaseType);
end;

class function TAutoTypeW.classof(const T: TAstTypeW): Boolean;
begin
  Result := clangExt_AutoType_classof(T.BaseType);
end;
{$endregion 'TAutoTypeW'}

{$region 'TDeducedTemplateSpecializationTypeW'}
class function TDeducedTemplateSpecializationTypeW.Create(const T: DeducedTemplateSpecializationType; out oAstType: TDeducedTemplateSpecializationTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDeducedTemplateSpecializationTypeW);
  if (not Assigned(T)) or (not clangExt_DeducedTemplateSpecializationType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDeducedTemplateSpecializationTypeW'}

{$region 'TTemplateSpecializationTypeW'}
class function TTemplateSpecializationTypeW.Create(const T: TemplateSpecializationType; out oAstType: TTemplateSpecializationTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TTemplateSpecializationTypeW);
  if (not Assigned(T)) or (not clangExt_TemplateSpecializationType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TTemplateSpecializationTypeW'}

{$region 'TInjectedClassNameTypeW'}
class function TInjectedClassNameTypeW.Create(const T: InjectedClassNameType; out oAstType: TInjectedClassNameTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TInjectedClassNameTypeW);
  if (not Assigned(T)) or (not clangExt_InjectedClassNameType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TInjectedClassNameTypeW'}

{$region 'TTypeWithKeywordW'}
function TTypeWithKeywordW.getKeyword: ElaboratedTypeKeyword;
begin
  Result := clangExt_TypeWithKeyword_getKeyword(Self.BaseType);
end;

class function TTypeWithKeywordW.getKeywordForTypeSpec(TypeSpec: Cardinal): ElaboratedTypeKeyword;
begin
  Result := clangExt_TypeWithKeyword_getKeywordForTypeSpec(TypeSpec);
end;

class function TTypeWithKeywordW.getTagTypeKindForTypeSpec(TypeSpec: Cardinal): TagTypeKind;
begin
  Result := clangExt_TypeWithKeyword_getTagTypeKindForTypeSpec(TypeSpec);
end;

class function TTypeWithKeywordW.getKeywordForTagTypeKind(Tag: TagTypeKind): ElaboratedTypeKeyword;
begin
  Result := clangExt_TypeWithKeyword_getKeywordForTagTypeKind(Tag);
end;

class function TTypeWithKeywordW.getTagTypeKindForKeyword(Keyword: ElaboratedTypeKeyword): TagTypeKind;
begin
  Result := clangExt_TypeWithKeyword_getTagTypeKindForKeyword(Keyword);
end;

class function TTypeWithKeywordW.KeywordIsTagTypeKind(Keyword: ElaboratedTypeKeyword): Boolean;
begin
  Result := clangExt_TypeWithKeyword_KeywordIsTagTypeKind(Keyword);
end;

class function TTypeWithKeywordW.getKeywordName(Keyword: ElaboratedTypeKeyword): string;
begin
  Result := clangExt_TypeWithKeyword_getKeywordName(Keyword).ToString;
end;

class function TTypeWithKeywordW.getTagTypeKindName(Kind: TagTypeKind): string;
begin
  Result := clangExt_TypeWithKeyword_getTagTypeKindName(Kind).ToString;
end;
{$endregion 'TTypeWithKeywordW'}

{$region 'TElaboratedTypeW'}
class function TElaboratedTypeW.Create(const T: ElaboratedType; out oAstType: TElaboratedTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TElaboratedTypeW);
  if (not Assigned(T)) or (not clangExt_ElaboratedType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;

function TElaboratedTypeW.getQualifier: NestedNameSpecifier;
begin
  Result := clangExt_ElaboratedType_getQualifier(Self.BaseType);
end;

function TElaboratedTypeW.getNamedType: CXQualType;
begin
  Result := clangExt_ElaboratedType_getNamedType(Self.BaseType);
end;

function TElaboratedTypeW.desugar: CXQualType;
begin
  Result := clangExt_ElaboratedType_desugar(Self.BaseType);
end;

function TElaboratedTypeW.isSugared: Boolean;
begin
  Result := clangExt_ElaboratedType_isSugared(Self.BaseType);
end;

function TElaboratedTypeW.getOwnedTagDecl: TTagDeclW;
begin
  clangExt_ElaboratedType_getOwnedTagDecl(Self.BaseType).Wrap(Result);
end;

class function TElaboratedTypeW.classof(T: TAstTypeW): Boolean;
begin
  Result := clangExt_ElaboratedType_classof(T.BaseType);
end;
{$endregion 'TElaboratedTypeW'}

{$region 'TDependentNameTypeW'}
class function TDependentNameTypeW.Create(const T: DependentNameType; out oAstType: TDependentNameTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentNameTypeW);
  if (not Assigned(T)) or (not clangExt_DependentNameType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentNameTypeW'}

{$region 'TDependentTemplateSpecializationTypeW'}
class function TDependentTemplateSpecializationTypeW.Create(const T: DependentTemplateSpecializationType; out oAstType: TDependentTemplateSpecializationTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentTemplateSpecializationTypeW);
  if (not Assigned(T)) or (not clangExt_DependentTemplateSpecializationType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentTemplateSpecializationTypeW'}

{$region 'TPackExpansionTypeW'}
class function TPackExpansionTypeW.Create(const T: PackExpansionType; out oAstType: TPackExpansionTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TPackExpansionTypeW);
  if (not Assigned(T)) or (not clangExt_PackExpansionType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TPackExpansionTypeW'}

{$region 'TObjCTypeParamTypeW'}
class function TObjCTypeParamTypeW.Create(const T: ObjCTypeParamType; out oAstType: TObjCTypeParamTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TObjCTypeParamTypeW);
  if (not Assigned(T)) or (not clangExt_ObjCTypeParamType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TObjCTypeParamTypeW'}

{$region 'TObjCObjectTypeW'}
class function TObjCObjectTypeW.Create(const T: ObjCObjectType; out oAstType: TObjCObjectTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TObjCObjectTypeW);
  if (not Assigned(T)) or (not clangExt_ObjCObjectType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TObjCObjectTypeW'}

{$region 'TObjCObjectTypeImplW'}
class function TObjCObjectTypeImplW.Create(const T: ObjCObjectTypeImpl; out oAstType: TObjCObjectTypeImplW): Boolean;
begin
  Result := False;
  oAstType := Default(TObjCObjectTypeImplW);
  if (not Assigned(T)) or (not clangExt_ObjCObjectTypeImpl_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TObjCObjectTypeImplW'}

{$region 'TObjCInterfaceTypeW'}
class function TObjCInterfaceTypeW.Create(const T: ObjCInterfaceType; out oAstType: TObjCInterfaceTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TObjCInterfaceTypeW);
  if (not Assigned(T)) or (not clangExt_ObjCInterfaceType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TObjCInterfaceTypeW'}

{$region 'TObjCObjectPointerTypeW'}
class function TObjCObjectPointerTypeW.Create(const T: ObjCObjectPointerType; out oAstType: TObjCObjectPointerTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TObjCObjectPointerTypeW);
  if (not Assigned(T)) or (not clangExt_ObjCObjectPointerType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TObjCObjectPointerTypeW'}

{$region 'TAtomicTypeW'}
class function TAtomicTypeW.Create(const T: AtomicType; out oAstType: TAtomicTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TAtomicTypeW);
  if (not Assigned(T)) or (not clangExt_AtomicType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TAtomicTypeW'}

{$region 'TPipeTypeW'}
class function TPipeTypeW.Create(const T: PipeType; out oAstType: TPipeTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TPipeTypeW);
  if (not Assigned(T)) or (not clangExt_PipeType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TPipeTypeW'}

{$region 'TBitIntTypeW'}
class function TBitIntTypeW.Create(const T: BitIntType; out oAstType: TBitIntTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TBitIntTypeW);
  if (not Assigned(T)) or (not clangExt_BitIntType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TBitIntTypeW'}

{$region 'TDependentBitIntTypeW'}
class function TDependentBitIntTypeW.Create(const T: DependentBitIntType; out oAstType: TDependentBitIntTypeW): Boolean;
begin
  Result := False;
  oAstType := Default(TDependentBitIntTypeW);
  if (not Assigned(T)) or (not clangExt_DependentBitIntType_classof(T)) then
    Exit;
  oAstType.BaseType := T;
  Result := True;
end;
{$endregion 'TDependentBitIntTypeW'}

{$region 'CXQualTypeHelper2'}

function CXQualTypeHelper2.castAs_BuiltinType(out Ty: TBuiltinTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_BuiltinType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ComplexType(out Ty: TComplexTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ComplexType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ParenType(out Ty: TParenTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ParenType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_PointerType(out Ty: TPointerTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_PointerType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_AdjustedType(out Ty: TAdjustedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_AdjustedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DecayedType(out Ty: TDecayedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DecayedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_BlockPointerType(out Ty: TBlockPointerTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_BlockPointerType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ReferenceType(out Ty: TReferenceTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ReferenceType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_LValueReferenceType(out Ty: TLValueReferenceTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_LValueReferenceType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_RValueReferenceType(out Ty: TRValueReferenceTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_RValueReferenceType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_MemberPointerType(out Ty: TMemberPointerTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_MemberPointerType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentAddressSpaceType(out Ty: TDependentAddressSpaceTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentAddressSpaceType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentSizedExtVectorType(out Ty: TDependentSizedExtVectorTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentSizedExtVectorType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_VectorType(out Ty: TVectorTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_VectorType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentVectorType(out Ty: TDependentVectorTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentVectorType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ExtVectorType(out Ty: TExtVectorTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ExtVectorType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_MatrixType(out Ty: TMatrixTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_MatrixType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ConstantMatrixType(out Ty: TConstantMatrixTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ConstantMatrixType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentSizedMatrixType(out Ty: TDependentSizedMatrixTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentSizedMatrixType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_FunctionType(out Ty: TFunctionTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_FunctionType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_FunctionNoProtoType(out Ty: TFunctionNoProtoTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_FunctionNoProtoType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_FunctionProtoType(out Ty: TFunctionProtoTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_FunctionProtoType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_UnresolvedUsingType(out Ty: TUnresolvedUsingTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_UnresolvedUsingType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_UsingType(out Ty: TUsingTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_UsingType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TypedefType(out Ty: TTypedefTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TypedefType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_MacroQualifiedType(out Ty: TMacroQualifiedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_MacroQualifiedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TypeOfExprType(out Ty: TTypeOfExprTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TypeOfExprType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentTypeOfExprType(out Ty: TDependentTypeOfExprTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentTypeOfExprType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TypeOfType(out Ty: TTypeOfTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TypeOfType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DecltypeType(out Ty: TDecltypeTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DecltypeType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentDecltypeType(out Ty: TDependentDecltypeTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentDecltypeType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_UnaryTransformType(out Ty: TUnaryTransformTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_UnaryTransformType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentUnaryTransformType(out Ty: TDependentUnaryTransformTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentUnaryTransformType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TagType(out Ty: TTagTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TagType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_RecordType(out Ty: TRecordTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_RecordType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_EnumType(out Ty: TEnumTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_EnumType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_AttributedType(out Ty: TAttributedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_AttributedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_BTFTagAttributedType(out Ty: TBTFTagAttributedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_BTFTagAttributedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TemplateTypeParmType(out Ty: TTemplateTypeParmTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TemplateTypeParmType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_SubstTemplateTypeParmType(out Ty: TSubstTemplateTypeParmTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_SubstTemplateTypeParmType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_SubstTemplateTypeParmPackType(out Ty: TSubstTemplateTypeParmPackTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_SubstTemplateTypeParmPackType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DeducedType(out Ty: TDeducedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DeducedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_AutoType(out Ty: TAutoTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_AutoType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DeducedTemplateSpecializationType(out Ty: TDeducedTemplateSpecializationTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DeducedTemplateSpecializationType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_TemplateSpecializationType(out Ty: TTemplateSpecializationTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_TemplateSpecializationType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_InjectedClassNameType(out Ty: TInjectedClassNameTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_InjectedClassNameType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ElaboratedType(out Ty: TElaboratedTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ElaboratedType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentNameType(out Ty: TDependentNameTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentNameType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentTemplateSpecializationType(out Ty: TDependentTemplateSpecializationTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentTemplateSpecializationType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_PackExpansionType(out Ty: TPackExpansionTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_PackExpansionType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ObjCTypeParamType(out Ty: TObjCTypeParamTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ObjCTypeParamType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ObjCObjectType(out Ty: TObjCObjectTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ObjCObjectType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_ObjCObjectPointerType(out Ty: TObjCObjectPointerTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_ObjCObjectPointerType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_AtomicType(out Ty: TAtomicTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_AtomicType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_PipeType(out Ty: TPipeTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_PipeType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_BitIntType(out Ty: TBitIntTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_BitIntType(Self).Wrap(Ty);
end;

function CXQualTypeHelper2.castAs_DependentBitIntType(out Ty: TDependentBitIntTypeW): Boolean;
begin
  Result := clangExt_QualType_castAs_DependentBitIntType(Self).Wrap(Ty);
end;
       
{$endregion 'CXQualTypeHelper2'}

{$region 'Helper'}

function AstTypeHelper.Wrap(out T: TAstTypeW): Boolean;
begin
  Result := TAstTypeW.Create(Self, T);
end;

function BuiltinTypeHelper.Wrap(out T: TBuiltinTypeW): Boolean;
begin
  Result := TBuiltinTypeW.Create(Self, T);
end;

function ComplexTypeHelper.Wrap(out T: TComplexTypeW): Boolean;
begin
  Result := TComplexTypeW.Create(Self, T);
end;

function ParenTypeHelper.Wrap(out T: TParenTypeW): Boolean;
begin
  Result := TParenTypeW.Create(Self, T);
end;

function PointerTypeHelper.Wrap(out T: TPointerTypeW): Boolean;
begin
  Result := TPointerTypeW.Create(Self, T);
end;

function AdjustedTypeHelper.Wrap(out T: TAdjustedTypeW): Boolean;
begin
  Result := TAdjustedTypeW.Create(Self, T);
end;

function DecayedTypeHelper.Wrap(out T: TDecayedTypeW): Boolean;
begin
  Result := TDecayedTypeW.Create(Self, T);
end;
       
function BlockPointerTypeHelper.Wrap(out T: TBlockPointerTypeW): Boolean;
begin
  Result := TBlockPointerTypeW.Create(Self, T);
end;

function ReferenceTypeHelper.Wrap(out T: TReferenceTypeW): Boolean;
begin
  Result := TReferenceTypeW.Create(Self, T);
end;

function LValueReferenceTypeHelper.Wrap(out T: TLValueReferenceTypeW): Boolean;
begin
  Result := TLValueReferenceTypeW.Create(Self, T);
end;

function RValueReferenceTypeHelper.Wrap(out T: TRValueReferenceTypeW): Boolean;
begin
  Result := TRValueReferenceTypeW.Create(Self, T);
end;

function MemberPointerTypeHelper.Wrap(out T: TMemberPointerTypeW): Boolean;
begin
  Result := TMemberPointerTypeW.Create(Self, T);
end;

function ArrayTypeHelper.Wrap(out T: TArrayTypeW): Boolean;
begin
  Result := TArrayTypeW.Create(Self, T);
end;

function ConstantArrayTypeHelper.Wrap(out T: TConstantArrayTypeW): Boolean;
begin
  Result := TConstantArrayTypeW.Create(Self, T);
end;

function IncompleteArrayTypeHelper.Wrap(out T: TIncompleteArrayTypeW): Boolean;
begin
  Result := TIncompleteArrayTypeW.Create(Self, T);
end;

function VariableArrayTypeHelper.Wrap(out T: TVariableArrayTypeW): Boolean;
begin
  Result := TVariableArrayTypeW.Create(Self, T);
end;

function DependentSizedArrayTypeHelper.Wrap(out T: TDependentSizedArrayTypeW): Boolean;
begin
  Result := TDependentSizedArrayTypeW.Create(Self, T);
end;

function DependentAddressSpaceTypeHelper.Wrap(out T: TDependentAddressSpaceTypeW): Boolean;
begin
  Result := TDependentAddressSpaceTypeW.Create(Self, T);
end;

function DependentSizedExtVectorTypeHelper.Wrap(out T: TDependentSizedExtVectorTypeW): Boolean;
begin
  Result := TDependentSizedExtVectorTypeW.Create(Self, T);
end;

function VectorTypeHelper.Wrap(out T: TVectorTypeW): Boolean;
begin
  Result := TVectorTypeW.Create(Self, T);
end;

function DependentVectorTypeHelper.Wrap(out T: TDependentVectorTypeW): Boolean;
begin
  Result := TDependentVectorTypeW.Create(Self, T);
end;

function ExtVectorTypeHelper.Wrap(out T: TExtVectorTypeW): Boolean;
begin
  Result := TExtVectorTypeW.Create(Self, T);
end;

function MatrixTypeHelper.Wrap(out T: TMatrixTypeW): Boolean;
begin
  Result := TMatrixTypeW.Create(Self, T);
end;

function ConstantMatrixTypeHelper.Wrap(out T: TConstantMatrixTypeW): Boolean;
begin
  Result := TConstantMatrixTypeW.Create(Self, T);
end;

function DependentSizedMatrixTypeHelper.Wrap(out T: TDependentSizedMatrixTypeW): Boolean;
begin
  Result := TDependentSizedMatrixTypeW.Create(Self, T);
end;

function FunctionTypeHelper.Wrap(out T: TFunctionTypeW): Boolean;
begin
  Result := TFunctionTypeW.Create(Self, T);
end;

function FunctionNoProtoTypeHelper.Wrap(out T: TFunctionNoProtoTypeW): Boolean;
begin
  Result := TFunctionNoProtoTypeW.Create(Self, T);
end;
         
function FunctionProtoTypeHelper.Wrap(out T: TFunctionProtoTypeW): Boolean;
begin
  Result := TFunctionProtoTypeW.Create(Self, T);
end;

function UnresolvedUsingTypeHelper.Wrap(out T: TUnresolvedUsingTypeW): Boolean;
begin
  Result := TUnresolvedUsingTypeW.Create(Self, T);
end;

function UsingTypeHelper.Wrap(out T: TUsingTypeW): Boolean;
begin
  Result := TUsingTypeW.Create(Self, T);
end;

function TypedefTypeHelper.Wrap(out T: TTypedefTypeW): Boolean;
begin
  Result := TTypedefTypeW.Create(Self, T);
end;

function MacroQualifiedTypeHelper.Wrap(out T: TMacroQualifiedTypeW): Boolean;
begin
  Result := TMacroQualifiedTypeW.Create(Self, T);
end;

function TypeOfExprTypeHelper.Wrap(out T: TTypeOfExprTypeW): Boolean;
begin
  Result := TTypeOfExprTypeW.Create(Self, T);
end;
   
function DependentTypeOfExprTypeHelper.Wrap(out T: TDependentTypeOfExprTypeW): Boolean;
begin
  Result := TDependentTypeOfExprTypeW.Create(Self, T);
end;

function TypeOfTypeHelper.Wrap(out T: TTypeOfTypeW): Boolean;
begin
  Result := TTypeOfTypeW.Create(Self, T);
end;

function DecltypeTypeHelper.Wrap(out T: TDecltypeTypeW): Boolean;
begin
  Result := TDecltypeTypeW.Create(Self, T);
end;

function DependentDecltypeTypeHelper.Wrap(out T: TDependentDecltypeTypeW
  ): Boolean;
begin
  Result := TDependentDecltypeTypeW.Create(Self, T);
end;

function UnaryTransformTypeHelper.Wrap(out T: TUnaryTransformTypeW): Boolean;
begin
  Result := TUnaryTransformTypeW.Create(Self, T);
end;

function DependentUnaryTransformTypeHelper.Wrap(out
  T: TDependentUnaryTransformTypeW): Boolean;
begin
  Result := TDependentUnaryTransformTypeW.Create(Self, T);
end;

function TagTypeHelper.Wrap(out T: TTagTypeW): Boolean;
begin
  Result := TTagTypeW.Create(Self, T);
end;

function RecordTypeHelper.Wrap(out T: TRecordTypeW): Boolean;
begin
  Result := TRecordTypeW.Create(Self, T);
end;

function EnumTypeHelper.Wrap(out T: TEnumTypeW): Boolean;
begin
  Result := TEnumTypeW.Create(Self, T);
end;

function AttributedTypeHelper.Wrap(out T: TAttributedTypeW): Boolean;
begin
  Result := TAttributedTypeW.Create(Self, T);
end;

function BTFTagAttributedTypeHelper.Wrap(out T: TBTFTagAttributedTypeW
  ): Boolean;
begin
  Result := TBTFTagAttributedTypeW.Create(Self, T);
end;

function TemplateTypeParmTypeHelper.Wrap(out T: TTemplateTypeParmTypeW
  ): Boolean;
begin
  Result := TTemplateTypeParmTypeW.Create(Self, T);
end;

function SubstTemplateTypeParmTypeHelper.Wrap(out T: TSubstTemplateTypeParmTypeW
  ): Boolean;
begin
  Result := TSubstTemplateTypeParmTypeW.Create(Self, T);
end;

function SubstTemplateTypeParmPackTypeHelper.Wrap(out
  T: TSubstTemplateTypeParmPackTypeW): Boolean;
begin
  Result := TSubstTemplateTypeParmPackTypeW.Create(Self, T);
end;

function DeducedTypeHelper.Wrap(out T: TDeducedTypeW): Boolean;
begin
  Result := TDeducedTypeW.Create(Self, T);
end;

function AutoTypeHelper.Wrap(out T: TAutoTypeW): Boolean;
begin
  Result := TAutoTypeW.Create(Self, T);
end;

function DeducedTemplateSpecializationTypeHelper.Wrap(out
  T: TDeducedTemplateSpecializationTypeW): Boolean;
begin
  Result := TDeducedTemplateSpecializationTypeW.Create(Self, T);
end;

function TemplateSpecializationTypeHelper.Wrap(out
  T: TTemplateSpecializationTypeW): Boolean;
begin
  Result := TTemplateSpecializationTypeW.Create(Self, T);
end;

function InjectedClassNameTypeHelper.Wrap(out T: TInjectedClassNameTypeW
  ): Boolean;
begin
  Result := TInjectedClassNameTypeW.Create(Self, T);
end;

function ElaboratedTypeHelper.Wrap(out T: TElaboratedTypeW
  ): Boolean;
begin
  Result := TElaboratedTypeW.Create(Self, T);
end;

function TypeWithKeywordHelper.Wrap(out T: TTypeWithKeywordW): Boolean;
begin
  Result := TTypeWithKeywordW.Create(Self, T);
end;

function DependentNameTypeHelper.Wrap(out T: TDependentNameTypeW): Boolean;
begin
  Result := TDependentNameTypeW.Create(Self, T);
end;

function DependentTemplateSpecializationTypeHelper.Wrap(out
  T: TDependentTemplateSpecializationTypeW): Boolean;
begin
  Result := TDependentTemplateSpecializationTypeW.Create(Self, T);
end;

function PackExpansionTypeHelper.Wrap(out T: TPackExpansionTypeW): Boolean;
begin
  Result := TPackExpansionTypeW.Create(Self, T);
end;

function ObjCTypeParamTypeHelper.Wrap(out T: TObjCTypeParamTypeW): Boolean;
begin
  Result := TObjCTypeParamTypeW.Create(Self, T);
end;

function ObjCObjectTypeHelper.Wrap(out T: TObjCObjectTypeW): Boolean;
begin
  Result := TObjCObjectTypeW.Create(Self, T);
end;

function ObjCObjectTypeImplHelper.Wrap(out T: TObjCObjectTypeImplW): Boolean;
begin
  Result := TObjCObjectTypeImplW.Create(Self, T);
end;

function ObjCInterfaceTypeHelper.Wrap(out T: TObjCInterfaceTypeW): Boolean;
begin
  Result := TObjCInterfaceTypeW.Create(Self, T);
end;

function ObjCObjectPointerTypeHelper.Wrap(out T: TObjCObjectPointerTypeW
  ): Boolean;
begin
  Result := TObjCObjectPointerTypeW.Create(Self, T);
end;

function AtomicTypeHelper.Wrap(out T: TAtomicTypeW): Boolean;
begin
  Result := TAtomicTypeW.Create(Self, T);
end;

function PipeTypeHelper.Wrap(out T: TPipeTypeW): Boolean;
begin
  Result := TPipeTypeW.Create(Self, T);
end;

function BitIntTypeHelper.Wrap(out T: TBitIntTypeW): Boolean;
begin
  Result := TBitIntTypeW.Create(Self, T);
end;

function DependentBitIntTypeHelper.Wrap(out T: TDependentBitIntTypeW): Boolean;
begin
  Result := TDependentBitIntTypeW.Create(Self, T);
end;

{$endregion 'Helper'}

end.

