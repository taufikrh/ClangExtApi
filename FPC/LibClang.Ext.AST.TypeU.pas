unit LibClang.Ext.AST.TypeU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Basic.AddressSpacesU,
  LibClang.Ext.AST.AttrH, 
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.DependenceFlagsH,
  LibClang.Ext.Basic.LinkageH,
  LibClang.Ext.Basic.VisibilityH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.AST.NestedNameSpecifierH,
  LibClang.Ext.AST.TemplateBaseH,
  LibClang.Ext.Basic.ExceptionSpecificationTypeU,
  LibClang.Ext.llvm.ADT.APIntH
  ;
                            
{$region 'Extended CXType'}
function clangExt_CXType_GetQualType(CT: CXType): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXType_GetTU(CT: CXType): CXTranslationUnit; cdecl; external LibClang_dll;
function clangExt_CXType_getNumArgTypes(CT: CXType): Integer; cdecl; external LibClang_dll;    
{$endregion 'Extended CXType'}

{$region 'SplitQualType'}
//procedure clangExt_SplitQualType_Dispose(q: SplitQualType); cdecl; external LibClang_dll;
//function clangExt_SplitQualType_GetQuals(const q: SplitQualType): CXQualifiers; cdecl; external LibClang_dll;
//function clangExt_SplitQualType_GetType(const q: SplitQualType): AstType; cdecl; external LibClang_dll;
{$endregion 'SplitQualType'}

{$region 'CXQualifiers'}
function clangExt_CXQualifiers_hasConst(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasOnlyConst(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withConst(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasVolatile(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasOnlyVolatile(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withVolatile(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasRestrict(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasOnlyRestrict(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withRestrict(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasCVRQualifiers(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getCVRQualifiers(q: CXQualifiers): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getCVRUQualifiers(q: CXQualifiers): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasUnaligned(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasObjCGCAttr(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getObjCGCAttr(q: CXQualifiers): CXQualifiers_GC; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withoutObjCGCAttr(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withoutObjCLifetime(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_withoutAddressSpace(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasObjCLifetime(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getObjCLifetime(q: CXQualifiers): CXQualifiers_ObjCLifetime; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasNonTrivialObjCLifetime(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasStrongOrWeakObjCLifetime(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasAddressSpace(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getAddressSpace(q: CXQualifiers): LangAS; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasTargetSpecificAddressSpace(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getAddressSpaceAttributePrintValue(q: CXQualifiers): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasFastQualifiers(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getFastQualifiers(q: CXQualifiers): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasNonFastQualifiers(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getNonFastQualifiers(q: CXQualifiers): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_hasQualifiers(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_empty(q: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_isAddressSpaceSupersetOf(A: LangAS; B: LangAS): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_isAddressSpaceSupersetOfOther(q: CXQualifiers; other: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_compatiblyIncludes(q: CXQualifiers; other: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_compatiblyIncludesObjCLifetime(q: CXQualifiers; other: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_isStrictSupersetOf(q: CXQualifiers; Other: CXQualifiers): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getAsString(q: CXQualifiers): CXString; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getAsStringPrintingPolicy(q: CXQualifiers; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_getAddrSpaceAsString(AS_: LangAS): CXString; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_isEmptyWhenPrinted(q: CXQualifiers; Policy: CXPrintingPolicy): Boolean; cdecl; external LibClang_dll;
function clangExt_CXQualifiers_print(q: CXQualifiers; Policy: CXPrintingPolicy; appendSpaceIfNonEmpty: Boolean = False): CXString; cdecl; external LibClang_dll;
{$endregion 'CXQualifiers'}

{$region 'CXQualType'}
function clangExt_QualType_getLocalFastQualifiers(const Q: CXQualType): Cardinal; cdecl; external LibClang_dll;
function clangExt_QualType_getTypePtr(const Q: CXQualType): AstType; cdecl; external LibClang_dll;
function clangExt_QualType_getTypePtrOrNull(const Q: CXQualType): AstType; cdecl; external LibClang_dll;
function clangExt_QualType_getBaseTypeIdentifier(const Q: CXQualType): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_QualType_split(const Q: CXQualType): CXSplitQualType; cdecl; external LibClang_dll;
function clangExt_QualType_isCanonical(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isCanonicalAsParam(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isNull(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isLocalConstQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isConstQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isLocalRestrictQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isRestrictQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isLocalVolatileQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isVolatileQualified(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasLocalQualifiers(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasQualifiers(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasLocalNonFastQualifiers(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_getLocalQualifiers(const Q: CXQualType): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_QualType_getQualifiers(const Q: CXQualType): CXQualifiers; cdecl; external LibClang_dll; // dispose with clangExt_Qualifiers_Dispose
function clangExt_QualType_getLocalCVRQualifiers(const Q: CXQualType): Cardinal; cdecl; external LibClang_dll;
function clangExt_QualType_getCVRQualifiers(const Q: CXQualType): Cardinal; cdecl; external LibClang_dll;
function clangExt_QualType_isConstant(const Q: CXQualType; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isPODType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isCXX98PODType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isCXX11PODType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isTrivialType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isTriviallyCopyableType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isTriviallyRelocatableType(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_mayBeDynamicClass(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_mayBeNotDynamicClass(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_getCanonicalType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getLocalUnqualifiedType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getUnqualifiedType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getSplitUnqualifiedType(const Q: CXQualType): CXSplitQualType; cdecl; external LibClang_dll;
function clangExt_QualType_isMoreQualifiedThan(const Q: CXQualType; const Other: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isAtLeastAsQualifiedAs(const Q: CXQualType; const Other: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_getNonReferenceType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getNonLValueExprType(const Q: CXQualType; const Context: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getNonPackExpansionType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getDesugaredType(const Q: CXQualType; const Context: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getSplitDesugaredType(const Q: CXQualType): CXSplitQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getSingleStepDesugaredType(const Q: CXQualType; const Context: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_IgnoreParens(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getAsStringSplitQualType(Q: CXSplitQualType; const Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_QualType_getAsStringTypeQualifiers(const Ty: AstType; qs: CXQualifiers; const Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_QualType_getAsString(const Q: CXQualType): CXString; cdecl; external LibClang_dll;
function clangExt_QualType_getAsStringPrintingPolicy(const Q: CXQualType; const Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_QualType_hasAddressSpace(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_getAddressSpace(const Q: CXQualType): LangAS; cdecl; external LibClang_dll;
function clangExt_QualType_isAddressSpaceOverlapping(const Q: CXQualType; const T: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isObjCGCWeak(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isObjCGCStrong(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasNonTrivialObjCLifetime(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasStrongOrWeakObjCLifetime(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isNonWeakInMRRWithObjCWeak(const Q: CXQualType; const Context: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isNonTrivialToPrimitiveDefaultInitialize(const Q: CXQualType): QualType_PrimitiveDefaultInitializeKind; cdecl; external LibClang_dll;
function clangExt_QualType_isNonTrivialToPrimitiveCopy(const Q: CXQualType): QualType_PrimitiveCopyKind; cdecl; external LibClang_dll;
function clangExt_QualType_isNonTrivialToPrimitiveDestructiveMove(const Q: CXQualType): QualType_PrimitiveCopyKind; cdecl; external LibClang_dll;
function clangExt_QualType_isDestructedType(const Q: CXQualType): QualType_DestructionKind; cdecl; external LibClang_dll;
function clangExt_QualType_hasNonTrivialToPrimitiveDefaultInitializeCUnion(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasNonTrivialToPrimitiveDestructCUnion(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_hasNonTrivialToPrimitiveCopyCUnion(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_isCForbiddenLValueType(const Q: CXQualType): Boolean; cdecl; external LibClang_dll;
function clangExt_QualType_stripObjCKindOfType(const Q: CXQualType; const Ctx: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_QualType_getAtomicUnqualifiedType(const Q: CXQualType): CXQualType; cdecl; external LibClang_dll;
//
function clangExt_QualType_castAs_BuiltinType(const Q: CXQualType): BuiltinType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ComplexType(const Q: CXQualType): ComplexType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ParenType(const Q: CXQualType): ParenType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_PointerType(const Q: CXQualType): PointerType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_AdjustedType(const Q: CXQualType): AdjustedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DecayedType(const Q: CXQualType): DecayedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_BlockPointerType(const Q: CXQualType): BlockPointerType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ReferenceType(const Q: CXQualType): ReferenceType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_LValueReferenceType(const Q: CXQualType): LValueReferenceType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_RValueReferenceType(const Q: CXQualType): RValueReferenceType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_MemberPointerType(const Q: CXQualType): MemberPointerType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentAddressSpaceType(const Q: CXQualType): DependentAddressSpaceType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentSizedExtVectorType(const Q: CXQualType): DependentSizedExtVectorType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_VectorType(const Q: CXQualType): VectorType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentVectorType(const Q: CXQualType): DependentVectorType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ExtVectorType(const Q: CXQualType): ExtVectorType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_MatrixType(const Q: CXQualType): MatrixType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ConstantMatrixType(const Q: CXQualType): ConstantMatrixType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentSizedMatrixType(const Q: CXQualType): DependentSizedMatrixType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_FunctionType(const Q: CXQualType): FunctionType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_FunctionNoProtoType(const Q: CXQualType): FunctionNoProtoType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_FunctionProtoType(const Q: CXQualType): FunctionProtoType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_UnresolvedUsingType(const Q: CXQualType): UnresolvedUsingType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_UsingType(const Q: CXQualType): UsingType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TypedefType(const Q: CXQualType): TypedefType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_MacroQualifiedType(const Q: CXQualType): MacroQualifiedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TypeOfExprType(const Q: CXQualType): TypeOfExprType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentTypeOfExprType(const Q: CXQualType): DependentTypeOfExprType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TypeOfType(const Q: CXQualType): TypeOfType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DecltypeType(const Q: CXQualType): DecltypeType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentDecltypeType(const Q: CXQualType): DependentDecltypeType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_UnaryTransformType(const Q: CXQualType): UnaryTransformType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentUnaryTransformType(const Q: CXQualType): DependentUnaryTransformType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TagType(const Q: CXQualType): TagType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_RecordType(const Q: CXQualType): RecordType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_EnumType(const Q: CXQualType): EnumType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_AttributedType(const Q: CXQualType): AttributedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_BTFTagAttributedType(const Q: CXQualType): BTFTagAttributedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TemplateTypeParmType(const Q: CXQualType): TemplateTypeParmType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_SubstTemplateTypeParmType(const Q: CXQualType): SubstTemplateTypeParmType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_SubstTemplateTypeParmPackType(const Q: CXQualType): SubstTemplateTypeParmPackType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DeducedType(const Q: CXQualType): DeducedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_AutoType(const Q: CXQualType): AutoType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DeducedTemplateSpecializationType(const Q: CXQualType): DeducedTemplateSpecializationType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_TemplateSpecializationType(const Q: CXQualType): TemplateSpecializationType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_InjectedClassNameType(const Q: CXQualType): InjectedClassNameType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ElaboratedType(const Q: CXQualType): ElaboratedType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentNameType(const Q: CXQualType): DependentNameType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentTemplateSpecializationType(const Q: CXQualType): DependentTemplateSpecializationType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_PackExpansionType(const Q: CXQualType): PackExpansionType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ObjCTypeParamType(const Q: CXQualType): ObjCTypeParamType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ObjCObjectType(const Q: CXQualType): ObjCObjectType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_ObjCObjectPointerType(const Q: CXQualType): ObjCObjectPointerType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_AtomicType(const Q: CXQualType): AtomicType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_PipeType(const Q: CXQualType): PipeType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_BitIntType(const Q: CXQualType): BitIntType; cdecl; external LibClang_dll;
function clangExt_QualType_castAs_DependentBitIntType(const Q: CXQualType): DependentBitIntType; cdecl; external LibClang_dll;
{$endregion 'CXQualType'}
        
{$region 'TypeSourceInfo'}
function clangExt_TypeSourceInfo_getType(const T: TypeSourceInfo): CXQualType; cdecl; external LibClang_dll;
function clangExt_TypeSourceInfo_getTypeLoc(const T: TypeSourceInfo): CXTypeLoc; cdecl; external LibClang_dll;
{$endregion 'TypeSourceInfo'}

{$region 'Type'}
function clangExt_Type_EnumGetTypeClassLength(): Integer; cdecl; external LibClang_dll;
function clangExt_Type_EnumGetTypeClassName(i: AstType_TypeClass): CXString; cdecl; external LibClang_dll;
function clangExt_Type_getTypeClass(const T: AstType): AstType_TypeClass; cdecl; external LibClang_dll;

function clangExt_Type_isFromAST(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_containsUnexpandedParameterPack(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isCanonicalUnqualified(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getLocallyUnqualifiedSingleStepDesugaredType(const T: AstType): CXQualType; cdecl; external LibClang_dll;
function clangExt_Type_isSizelessType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSizelessBuiltinType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVLSTBuiltinType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getSveEltType(const T: AstType; Ctx: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_Type_isIncompleteType(const T: AstType; Def: PNamedDecl = nil): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIncompleteOrObjectType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjectType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isLiteralType(const T: AstType; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isStructuralType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isStandardLayoutType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isBuiltinType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSpecificBuiltinType(const T: AstType; K: Cardinal): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isPlaceholderType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getAsPlaceholderType(const T: AstType): BuiltinType; cdecl; external LibClang_dll;
function clangExt_Type_isSpecificPlaceholderType(const T: AstType; K: Cardinal): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isNonOverloadPlaceholderType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isEnumeralType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isScopedEnumeralType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isBooleanType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isCharType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isWideCharType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isChar8Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isChar16Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isChar32Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAnyCharacterType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIntegralType(const T: AstType; const Ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIntegralOrEnumerationType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIntegralOrUnscopedEnumerationType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnscopedEnumerationType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isRealFloatingType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isComplexType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAnyComplexType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFloatingType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isHalfType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFloat16Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isBFloat16Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFloat128Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIbm128Type(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isRealType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isArithmeticType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVoidType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isScalarType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAggregateType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFundamentalType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isCompoundType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFunctionType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFunctionNoProtoType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFunctionProtoType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAnyPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isBlockPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVoidPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isReferenceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isLValueReferenceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isRValueReferenceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjectPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFunctionPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFunctionReferenceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isMemberPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isMemberFunctionPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isMemberDataPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isArrayType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isConstantArrayType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isIncompleteArrayType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVariableArrayType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isDependentSizedArrayType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isRecordType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isClassType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isStructureType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCBoxableRecordType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isInterfaceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isStructureOrClassType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnionType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isComplexIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVectorType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isExtVectorType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isExtVectorBoolType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isMatrixType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isConstantMatrixType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isDependentAddressSpaceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCObjectPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCRetainableType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCLifetimeType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCIndirectLifetimeType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCNSObjectType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCIndependentClassType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCObjectType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCQualifiedInterfaceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCQualifiedIdType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCQualifiedClassType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCObjectOrInterfaceType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCIdType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isDecltypeType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCInertUnsafeUnretainedType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCClassType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCClassOrClassKindOfType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isBlockCompatibleObjCPointerType(const T: AstType; const ctx: ASTContext): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCSelType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCBuiltinType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isObjCARCBridgableType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isCARCBridgableType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isTemplateTypeParmType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isNullPtrType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isNothrowT(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAlignValT(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isStdByteType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isAtomicType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUndeducedAutoType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isTypedefNameType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getScalarTypeKind(const T: AstType): AstType_ScalarTypeKind; cdecl; external LibClang_dll;
function clangExt_Type_getDependence(const T: AstType): TypeDependence; cdecl; external LibClang_dll;
function clangExt_Type_containsErrors(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isDependentType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isInstantiationDependentType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUndeducedType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isVariablyModifiedType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasSizedVLAType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasUnnamedOrLocalType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isOverloadableType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isElaboratedTypeSpecifier(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_canDecayToPointerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasPointerRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasObjCPointerRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasIntegerRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasSignedIntegerRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasUnsignedIntegerRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_hasFloatingRepresentation(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getAsStructureType(const T: AstType): RecordType; cdecl; external LibClang_dll;
function clangExt_Type_getAsUnionType(const T: AstType): RecordType; cdecl; external LibClang_dll;
function clangExt_Type_getAsComplexIntegerType(const T: AstType): ComplexType; cdecl; external LibClang_dll;
function clangExt_Type_getAsObjCInterfaceType(const T: AstType): ObjCObjectType; cdecl; external LibClang_dll;
function clangExt_Type_getAsObjCInterfacePointerType(const T: AstType): ObjCObjectPointerType; cdecl; external LibClang_dll;
function clangExt_Type_getAsObjCQualifiedIdType(const T: AstType): ObjCObjectPointerType; cdecl; external LibClang_dll;
function clangExt_Type_getAsObjCQualifiedClassType(const T: AstType): ObjCObjectPointerType; cdecl; external LibClang_dll;
function clangExt_Type_getAsObjCQualifiedInterfaceType(const T: AstType): ObjCObjectType; cdecl; external LibClang_dll;
function clangExt_Type_getAsCXXRecordDecl(const T: AstType): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_Type_getAsRecordDecl(const T: AstType): RecordDecl; cdecl; external LibClang_dll;
function clangExt_Type_getAsTagDecl(const T: AstType): TagDecl; cdecl; external LibClang_dll;
function clangExt_Type_getPointeeCXXRecordDecl(const T: AstType): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_Type_getContainedDeducedType(const T: AstType): DeducedType; cdecl; external LibClang_dll;
function clangExt_Type_getContainedAutoType(const T: AstType): AutoType; cdecl; external LibClang_dll;
function clangExt_Type_hasAutoForTrailingReturnType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getAsArrayTypeUnsafe(const T: AstType): ArrayType; cdecl; external LibClang_dll;
function clangExt_Type_castAsArrayTypeUnsafe(const T: AstType): ArrayType; cdecl; external LibClang_dll;
function clangExt_Type_hasAttr(const T: AstType; AK: CX_AttrKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getBaseElementTypeUnsafe(const T: AstType): AstType; cdecl; external LibClang_dll;
function clangExt_Type_getArrayElementTypeNoTypeQual(const T: AstType): AstType; cdecl; external LibClang_dll;
function clangExt_Type_getPointeeOrArrayElementType(const T: AstType): AstType; cdecl; external LibClang_dll;
function clangExt_Type_getPointeeType(const T: AstType): CXQualType; cdecl; external LibClang_dll;
function clangExt_Type_getUnqualifiedDesugaredType(const T: AstType): AstType; cdecl; external LibClang_dll;
function clangExt_Type_isPromotableIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSignedIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnsignedIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSignedIntegerOrEnumerationType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnsignedIntegerOrEnumerationType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFixedPointType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isFixedPointOrIntegerType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSaturatedFixedPointType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnsaturatedFixedPointType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSignedFixedPointType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isUnsignedFixedPointType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isConstantSizeType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isSpecifierType(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getLinkage(const T: AstType): Linkage; cdecl; external LibClang_dll;
function clangExt_Type_getVisibility(const T: AstType): Visibility; cdecl; external LibClang_dll;
function clangExt_Type_isVisibilityExplicit(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_isLinkageValid(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_canHaveNullability(const T: AstType; ResultIfUnknown: Boolean = True): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_acceptsObjCTypeParams(const T: AstType): Boolean; cdecl; external LibClang_dll;
function clangExt_Type_getTypeClassName(const T: AstType): PChar; cdecl; external LibClang_dll;
function clangExt_Type_getCanonicalTypeInternal(const T: AstType): CXQualType; cdecl; external LibClang_dll;
function clangExt_Type_dump(const T: AstType; const Context: ASTContext): CXString; cdecl; external LibClang_dll;
{$endregion 'Type'}

{$region 'BuiltinType'}
function clangExt_BuiltinType_Kind_LastKind(): Cardinal; cdecl; external LibClang_dll;
function clangExt_BuiltinType_Kind_GetKindName(i: BuiltinTypeKind): CXString; cdecl; external LibClang_dll;
//
function clangExt_BuiltinType_getKind(const T: BuiltinType): BuiltinTypeKind; cdecl; external LibClang_dll;
function clangExt_BuiltinType_getName(const T: BuiltinType; const Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;    
function clangExt_BuiltinType_getNameAsCString(const T: BuiltinType; const Policy: CXPrintingPolicy): PChar; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isSugared(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_desugar(const T: BuiltinType): CXQualType; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isInteger(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isSignedInteger(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isUnsignedInteger(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isFloatingPoint(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isSVEBool(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isPlaceholderTypeKind(K: BuiltinTypeKind): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isPlaceholderType(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_isNonOverloadPlaceholderType(const T: BuiltinType): Boolean; cdecl; external LibClang_dll;
function clangExt_BuiltinType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'BuiltinType'}

{$region 'ComplexType'}
function clangExt_ComplexType_getElementType(const T: ComplexType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ComplexType_isSugared(const T: ComplexType): Boolean; cdecl; external LibClang_dll;
function clangExt_ComplexType_desugar(const T: ComplexType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ComplexType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ComplexType'}

{$region 'ParenType'}
function clangExt_ParenType_getInnerType(const T: ParenType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ParenType_isSugared(const T: ParenType): Boolean; cdecl; external LibClang_dll;
function clangExt_ParenType_desugar(const T: ParenType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ParenType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ParenType'}

{$region 'PointerType'}
function clangExt_PointerType_getPointeeType(const T: PointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_PointerType_isSugared(const T: PointerType): Boolean; cdecl; external LibClang_dll;
function clangExt_PointerType_desugar(const T: PointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_PointerType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'PointerType'}
                           
{$region 'AdjustedType'}
function clangExt_AdjustedType_getOriginalType(const T: AdjustedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AdjustedType_getAdjustedType(const T: AdjustedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AdjustedType_isSugared(const T: AdjustedType): Boolean; cdecl; external LibClang_dll;
function clangExt_AdjustedType_desugar(const T: AdjustedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AdjustedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'AdjustedType'}

{$region 'DecayedType'}
function clangExt_DecayedType_getDecayedType(const T: DecayedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_DecayedType_getPointeeType(const T: DecayedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_DecayedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DecayedType'}

{$region 'BlockPointerType'}
function clangExt_BlockPointerType_getPointeeType(const T: BlockPointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_BlockPointerType_isSugared(const T: BlockPointerType): Boolean; cdecl; external LibClang_dll;
function clangExt_BlockPointerType_desugar(const T: BlockPointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_BlockPointerType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'BlockPointerType'}

{$region 'ReferenceType'}
function clangExt_ReferenceType_isSpelledAsLValue(const T: ReferenceType): Boolean; cdecl; external LibClang_dll;
function clangExt_ReferenceType_isInnerRef(const T: ReferenceType): Boolean; cdecl; external LibClang_dll;
function clangExt_ReferenceType_getPointeeTypeAsWritten(const T: ReferenceType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ReferenceType_getPointeeType(const T: ReferenceType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ReferenceType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ReferenceType'}

{$region 'LValueReferenceType'}
function clangExt_LValueReferenceType_isSugared(const T: LValueReferenceType): Boolean; cdecl; external LibClang_dll;
function clangExt_LValueReferenceType_desugar(const T: LValueReferenceType): CXQualType; cdecl; external LibClang_dll;
function clangExt_LValueReferenceType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'LValueReferenceType'}

{$region 'RValueReferenceType'}       
function clangExt_RValueReferenceType_isSugared(const T: RValueReferenceType): Boolean; cdecl; external LibClang_dll;
function clangExt_RValueReferenceType_desugar(const T: RValueReferenceType): CXQualType; cdecl; external LibClang_dll;
function clangExt_RValueReferenceType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'RValueReferenceType'}

{$region 'MemberPointerType'}
function clangExt_MemberPointerType_getPointeeType(const T: MemberPointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_isMemberFunctionPointer(const T: MemberPointerType): Boolean; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_isMemberDataPointer(const T: MemberPointerType): Boolean; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_getClass(const T: MemberPointerType): AstType; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_getMostRecentCXXRecordDecl(const T: MemberPointerType): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_isSugared(const T: MemberPointerType): Boolean; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_desugar(const T: MemberPointerType): CXQualType; cdecl; external LibClang_dll;
function clangExt_MemberPointerType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'MemberPointerType'}

{$region 'ArrayType'}
function clangExt_ArrayType_getElementType(const T: ArrayType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ArrayType_getSizeModifier(const T: ArrayType): ArrayType_ArraySizeModifier; cdecl; external LibClang_dll;
function clangExt_ArrayType_getIndexTypeQualifiers(const T: ArrayType): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_ArrayType_getIndexTypeCVRQualifiers(const T: ArrayType): Cardinal; cdecl; external LibClang_dll;
function clangExt_ArrayType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ArrayType'}

{$region 'ConstantArrayType'}
function clangExt_ConstantArrayType_getSize(const T: ConstantArrayType): APInt; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_getSizeExpr(const T: ConstantArrayType): Expr; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_isSugared(const T: ConstantArrayType): Boolean; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_desugar(const T: ConstantArrayType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_getNumAddressingBits(const Context: ASTContext; const ElementType: CXQualType;  const NumElements: APInt): Cardinal; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_getMaxSizeBits(const Context: ASTContext): Cardinal; cdecl; external LibClang_dll;
function clangExt_ConstantArrayType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ConstantArrayType'}

{$region 'IncompleteArrayType'}
function clangExt_IncompleteArrayType_isSugared(const T: IncompleteArrayType): Boolean; cdecl; external LibClang_dll;
function clangExt_IncompleteArrayType_desugar(const T: IncompleteArrayType): CXQualType; cdecl; external LibClang_dll;
function clangExt_IncompleteArrayType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'IncompleteArrayType'}

{$region 'VariableArrayType'}
function clangExt_VariableArrayType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'VariableArrayType'}

{$region 'DependentSizedArrayType'}
function clangExt_DependentSizedArrayType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentSizedArrayType'}

{$region 'DependentAddressSpaceType'}
function clangExt_DependentAddressSpaceType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentAddressSpaceType'}

{$region 'DependentSizedExtVectorType'}
function clangExt_DependentSizedExtVectorType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentSizedExtVectorType'}

{$region 'VectorType'}
function clangExt_VectorType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'VectorType'}

{$region 'DependentVectorType'}
function clangExt_DependentVectorType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentVectorType'}

{$region 'ExtVectorType'}
function clangExt_ExtVectorType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ExtVectorType'}

{$region 'MatrixType'}
function clangExt_MatrixType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'MatrixType'}

{$region 'ConstantMatrixType'}
function clangExt_ConstantMatrixType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ConstantMatrixType'}

{$region 'DependentSizedMatrixType'}
function clangExt_DependentSizedMatrixType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentSizedMatrixType'}

{$region 'FunctionType'}
function clangExt_FunctionType_getReturnType(const T: FunctionType): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionType_getHasRegParm(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_getRegParmType(const T: FunctionType): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionType_getNoReturnAttr(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_getCmseNSCallAttr(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_getCallConv(const T: FunctionType): CallingConv; cdecl; external LibClang_dll;
// ExtInfo getExtInfo(const T: FunctionType);
function clangExt_FunctionType_isConst(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_isVolatile(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_isRestrict(const T: FunctionType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionType_getCallResultType(const T: FunctionType; const Context: ASTContext): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionType_getNameForCallConv(CC: CallingConv): CXString; cdecl; external LibClang_dll;
function clangExt_FunctionType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'FunctionType'}

{$region 'FunctionNoProtoType'}
function clangExt_FunctionNoProtoType_isSugared(const T: FunctionNoProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionNoProtoType_desugar(const T: FunctionNoProtoType): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionNoProtoType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'FunctionNoProtoType'}

{$region 'FunctionProtoType'}
function clangExt_FunctionProtoType_getNumParams(const T: FunctionProtoType): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getParamType(const T: FunctionProtoType; i: Cardinal): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getExceptionSpecType(const T: FunctionProtoType): ExceptionSpecificationType; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasExceptionSpec(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasDynamicExceptionSpec(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasNoexceptExceptionSpec(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasDependentExceptionSpec(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasInstantiationDependentExceptionSpec(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getNumExceptions(const T: FunctionProtoType): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getExceptionType(const T: FunctionProtoType; i: Cardinal): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getNoexceptExpr(const T: FunctionProtoType): Expr; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getExceptionSpecDecl(const T: FunctionProtoType): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getExceptionSpecTemplate(const T: FunctionProtoType): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_canThrow(const T: FunctionProtoType): CanThrowResult; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_isNothrow(const T: FunctionProtoType; ResultIfDependent: Boolean = False): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_isVariadic(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getEllipsisLoc(const T: FunctionProtoType; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_isTemplateVariadic(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasTrailingReturn(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getMethodQuals(const T: FunctionProtoType): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getRefQualifier(const T: FunctionProtoType): RefQualifierKind; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_hasExtParameterInfos(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getNumExtParameterInfo(const T: FunctionProtoType): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getExtParameterInfo(const T: FunctionProtoType; i: Cardinal): FunctionProtoType_ExtParameterInfo; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_getParameterABI(const T: FunctionProtoType; i: Cardinal): ParameterABI; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_isParamConsumed(const T: FunctionProtoType; i: Cardinal): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_isSugared(const T: FunctionProtoType): Boolean; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_desugar(const T: FunctionProtoType): CXQualType; cdecl; external LibClang_dll;
function clangExt_FunctionProtoType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'FunctionProtoType'}

{$region 'UnresolvedUsingType'}
function clangExt_UnresolvedUsingType_getDecl(const T: UnresolvedUsingType): UnresolvedUsingTypenameDecl; cdecl; external LibClang_dll;
function clangExt_UnresolvedUsingType_isSugared(const T: UnresolvedUsingType): Boolean; cdecl; external LibClang_dll;
function clangExt_UnresolvedUsingType_desugar(const T: UnresolvedUsingType): CXQualType; cdecl; external LibClang_dll;
function clangExt_UnresolvedUsingType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'UnresolvedUsingType'}

{$region 'UsingType'}
function clangExt_UsingType_getFoundDecl(const T: UsingType): UsingShadowDecl; cdecl; external LibClang_dll;
function clangExt_UsingType_getUnderlyingType(const T: UsingType): CXQualType; cdecl; external LibClang_dll;
function clangExt_UsingType_isSugared(const T: UsingType): Boolean; cdecl; external LibClang_dll;
function clangExt_UsingType_desugar(const T: UsingType): CXQualType; cdecl; external LibClang_dll;
function clangExt_UsingType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'UsingType'}

{$region 'TypedefType'}
function clangExt_TypedefType_getDecl(const T: TypedefType): TypedefNameDecl; cdecl; external LibClang_dll;
function clangExt_TypedefType_isSugared(const T: TypedefType): Boolean; cdecl; external LibClang_dll;
function clangExt_TypedefType_desugar(const T: TypedefType): CXQualType; cdecl; external LibClang_dll;
function clangExt_TypedefType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypedefType'}

{$region 'MacroQualifiedType'}
function clangExt_MacroQualifiedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'MacroQualifiedType'}

{$region 'TypeOfExprType'}
function clangExt_TypeOfExprType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypeOfExprType'}

{$region 'DependentTypeOfExprType'}
function clangExt_DependentTypeOfExprType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentTypeOfExprType'}

{$region 'TypeOfType'}
function clangExt_TypeOfType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypeOfType'}

{$region 'DecltypeType'}
function clangExt_DecltypeType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DecltypeType'}

{$region 'DependentDecltypeType'}
function clangExt_DependentDecltypeType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentDecltypeType'}

{$region 'UnaryTransformType'}
function clangExt_UnaryTransformType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'UnaryTransformType'}

{$region 'DependentUnaryTransformType'}
function clangExt_DependentUnaryTransformType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentUnaryTransformType'}

{$region 'TagType'}
function clangExt_TagType_getDecl(const T: TagType): TagDecl; cdecl; external LibClang_dll;
function clangExt_TagType_isBeingDefined(const T: TagType): Boolean; cdecl; external LibClang_dll;
function clangExt_TagType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TagType'}

{$region 'RecordType'}                                              
function clangExt_RecordType_getDecl(const T: RecordType): RecordDecl; cdecl; external LibClang_dll;
function clangExt_RecordType_hasConstFields(const T: RecordType): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordType_isSugared(const T: RecordType): Boolean; cdecl; external LibClang_dll;
function clangExt_RecordType_desugar(const T: RecordType): CXQualType; cdecl; external LibClang_dll;
function clangExt_RecordType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'RecordType'}

{$region 'EnumType'}
function clangExt_EnumType_getDecl(const T: EnumType): EnumDecl; cdecl; external LibClang_dll;
function clangExt_EnumType_isSugared(const T: EnumType): Boolean; cdecl; external LibClang_dll;
function clangExt_EnumType_desugar(const T: EnumType): CXQualType; cdecl; external LibClang_dll;
function clangExt_EnumType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'EnumType'}

{$region 'AttributedType'}
function clangExt_AttributedType_getAttrKind(const T: AttributedType): CX_AttrKind; cdecl; external LibClang_dll;
function clangExt_AttributedType_getModifiedType(const T: AttributedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AttributedType_getEquivalentType(const T: AttributedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AttributedType_isSugared(const T: AttributedType): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributedType_desugar(const T: AttributedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_AttributedType_isQualifier(const T: AttributedType): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributedType_isMSTypeSpec(const T: AttributedType): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributedType_isCallingConv(const T: AttributedType): Boolean;  cdecl; external LibClang_dll;
function clangExt_AttributedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'AttributedType'}

{$region 'BTFTagAttributedType'}
function clangExt_BTFTagAttributedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'BTFTagAttributedType'}

{$region 'TemplateTypeParmType'}
function clangExt_TemplateTypeParmType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TemplateTypeParmType'}

{$region 'SubstTemplateTypeParmType'}
function clangExt_SubstTemplateTypeParmType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'SubstTemplateTypeParmType'}

{$region 'SubstTemplateTypeParmPackType'}
function clangExt_SubstTemplateTypeParmPackType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'SubstTemplateTypeParmPackType'}

{$region 'DeducedType'}
function clangExt_DeducedType_isSugared(const T: DeducedType): Boolean; cdecl; external LibClang_dll;
function clangExt_DeducedType_desugar(const T: DeducedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_DeducedType_getDeducedType(const T: DeducedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_DeducedType_isDeduced(const T: DeducedType): Boolean; cdecl; external LibClang_dll;
function clangExt_DeducedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DeducedType'}

{$region 'AutoType'}
function clangExt_AutoType_getArgs(const T: AutoType): TemplateArgument; cdecl; external LibClang_dll;
function clangExt_AutoType_getNumArgs(const T: AutoType): Cardinal; cdecl; external LibClang_dll;
function clangExt_AutoType_getArg(const T: AutoType; Idx: Cardinal): TemplateArgument; cdecl; external LibClang_dll;
function clangExt_AutoType_getNumTypeConstraintArgument(const T: AutoType): Cardinal; cdecl; external LibClang_dll;
function clangExt_AutoType_getTypeConstraintArgument(const T: AutoType; Idx: Cardinal): TemplateArgument; cdecl; external LibClang_dll;
function clangExt_AutoType_getTypeConstraintConcept(const T: AutoType): ConceptDecl; cdecl; external LibClang_dll;
function clangExt_AutoType_isConstrained(const T: AutoType): Boolean; cdecl; external LibClang_dll;
function clangExt_AutoType_isDecltypeAuto(const T: AutoType): Boolean; cdecl; external LibClang_dll;
function clangExt_AutoType_isGNUAutoType(const T: AutoType): Boolean; cdecl; external LibClang_dll;
function clangExt_AutoType_getKeyword(const T: AutoType): AutoTypeKeyword; cdecl; external LibClang_dll;
function clangExt_AutoType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'AutoType'}

{$region 'DeducedTemplateSpecializationType'}
function clangExt_DeducedTemplateSpecializationType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DeducedTemplateSpecializationType'}

{$region 'TemplateSpecializationType'}
function clangExt_TemplateSpecializationType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'TemplateSpecializationType'}

{$region 'InjectedClassNameType'}
function clangExt_InjectedClassNameType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'InjectedClassNameType'}

{$region 'TypeWithKeyword'}
function clangExt_TypeWithKeyword_getKeyword(const T: TypeWithKeyword): ElaboratedTypeKeyword; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getKeywordForTypeSpec(TypeSpec: Cardinal): ElaboratedTypeKeyword; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getTagTypeKindForTypeSpec(TypeSpec: Cardinal): TagTypeKind; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getKeywordForTagTypeKind(Tag: TagTypeKind): ElaboratedTypeKeyword; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getTagTypeKindForKeyword(Keyword: ElaboratedTypeKeyword): TagTypeKind; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_KeywordIsTagTypeKind(Keyword: ElaboratedTypeKeyword): Boolean; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getKeywordName(Keyword: ElaboratedTypeKeyword): CXString; cdecl; external LibClang_dll;
function clangExt_TypeWithKeyword_getTagTypeKindName(Kind: TagTypeKind): CXString; cdecl; external LibClang_dll;
{$endregion 'TypeWithKeyword'}

{$region 'ElaboratedType'}
function clangExt_ElaboratedType_getQualifier(const T: ElaboratedType): NestedNameSpecifier; cdecl; external LibClang_dll;
function clangExt_ElaboratedType_getNamedType(const T: ElaboratedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ElaboratedType_desugar(const T: ElaboratedType): CXQualType; cdecl; external LibClang_dll;
function clangExt_ElaboratedType_isSugared(const T: ElaboratedType): Boolean; cdecl; external LibClang_dll;
function clangExt_ElaboratedType_getOwnedTagDecl(const T: ElaboratedType): TagDecl; cdecl; external LibClang_dll;
function clangExt_ElaboratedType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ElaboratedType'}

{$region 'DependentNameType'}
function clangExt_DependentNameType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentNameType'}

{$region 'DependentTemplateSpecializationType'}
function clangExt_DependentTemplateSpecializationType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentTemplateSpecializationType'}

{$region 'PackExpansionType'}
function clangExt_PackExpansionType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'PackExpansionType'}

{$region 'ObjCTypeParamType'}
function clangExt_ObjCTypeParamType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ObjCTypeParamType'}

{$region 'ObjCObjectType'}
function clangExt_ObjCObjectType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ObjCObjectType'}

{$region 'ObjCObjectTypeImpl'}
function clangExt_ObjCObjectTypeImpl_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ObjCObjectTypeImpl'}

{$region 'ObjCInterfaceType'}
function clangExt_ObjCInterfaceType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ObjCInterfaceType'}

{$region 'ObjCObjectPointerType'}
function clangExt_ObjCObjectPointerType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'ObjCObjectPointerType'}

{$region 'AtomicType'}
function clangExt_AtomicType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'AtomicType'}

{$region 'PipeType'}
function clangExt_PipeType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'PipeType'}

{$region 'BitIntType'}
function clangExt_BitIntType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'BitIntType'}

{$region 'DependentBitIntType'}
function clangExt_DependentBitIntType_classof(const T: AstType): Boolean; cdecl; external LibClang_dll;
{$endregion 'DependentBitIntType'}

implementation

end.

