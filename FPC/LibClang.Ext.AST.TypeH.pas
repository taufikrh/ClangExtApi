unit LibClang.Ext.AST.TypeH;

{$mode ObjFPC}{$H+}  
{$PACKRECORDS C}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  ExtQualsTypeCommonBase = type Pointer;
  TypeSourceInfo = type Pointer;
  //SplitQualType = type Pointer;
  CXQualType = type Pointer;
  FunctionProtoType_ExtParameterInfo = type Pointer;

{$region 'CXQualifiers'}
  CXQualifiers = type Cardinal;

  CXQualifiers_GC = type Integer;
  CXQualifiers_GC_Helper = type helper for CXQualifiers_GC
  public const
    GCNone = 0;
    Weak = 1;
    Strong = 2;
  end;

  CXQualifiers_ObjCLifetime = type Integer;
  CXQualifiers_ObjCLifetime_Helper = type helper for CXQualifiers_ObjCLifetime
  public const
    /// There is no lifetime qualification on this type.
    OCL_None = 0;

    /// This object can be modified without requiring retains or
    /// releases.
    OCL_ExplicitNone = 1;

    /// Assigning into this object requires the old value to be
    /// released and the new value to be retained.  The timing of the
    /// release of the old value is inexact: it may be moved to
    /// immediately after the last known point where the value is
    /// live.
    OCL_Strong = 2;

    /// Reading or writing from this object requires a barrier call.
    OCL_Weak = 3;

    /// Assigning into this object requires a lifetime extension.
    OCL_Autoreleasing = 4;
  end;   
{$endregion 'CXQualifiers'}

  AstType_TypeClass = type Integer;

  { AstType_TypeClass_Helper }

  AstType_TypeClass_Helper = type helper for AstType_TypeClass
  public const
    {$i ASTType_TypeClass_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  AstType = type ExtQualsTypeCommonBase;
  BuiltinType = type AstType;
  ComplexType = type AstType;
  ParenType = type AstType;
  PointerType = type AstType;
  AdjustedType = type AstType;
  DecayedType = type AdjustedType;
  BlockPointerType = type AstType;
  ReferenceType = type AstType;
  LValueReferenceType = type ReferenceType;    
  RValueReferenceType = type ReferenceType;
  MemberPointerType = type AstType;
  ArrayType = type AstType;
  ConstantArrayType = type ArrayType;
  IncompleteArrayType = type ArrayType; 
  VariableArrayType = type ArrayType;
  DependentSizedArrayType = type ArrayType;
  DependentAddressSpaceType = type AstType;
  DependentSizedExtVectorType = type AstType;
  VectorType = type AstType;
  DependentVectorType = type AstType;
  ExtVectorType = type VectorType;
  MatrixType = type AstType;
  ConstantMatrixType = type MatrixType;
  DependentSizedMatrixType = type MatrixType; 
  FunctionType = type AstType;
  FunctionNoProtoType = type FunctionType;   
  FunctionProtoType = type FunctionType; 
  UnresolvedUsingType = type AstType;
  UsingType = type AstType;
  TypedefType = type AstType;
  MacroQualifiedType = type AstType;
  TypeOfExprType = type AstType;
  DependentTypeOfExprType = type TypeOfExprType;
  TypeOfType = type AstType;
  DecltypeType = type AstType;
  DependentDecltypeType = type DecltypeType;
  UnaryTransformType = type AstType;
  DependentUnaryTransformType = type UnaryTransformType; 
  TagType = type AstType;
  RecordType = type TagType;
  EnumType = type TagType;
  AttributedType = type AstType;
  BTFTagAttributedType = type AstType;
  TemplateTypeParmType = type AstType;
  SubstTemplateTypeParmType = type AstType;
  SubstTemplateTypeParmPackType = type AstType;
  DeducedType = type AstType;
  AutoType = type DeducedType;
  DeducedTemplateSpecializationType = type DeducedType;
  TemplateSpecializationType = type AstType;
  InjectedClassNameType = type AstType;
  TypeWithKeyword = type AstType;
  ElaboratedType = type TypeWithKeyword;
  DependentNameType = type TypeWithKeyword;
  DependentTemplateSpecializationType = type TypeWithKeyword;
  PackExpansionType = type AstType;
  ObjCTypeParamType = type AstType;
  ObjCObjectType = type AstType;
  ObjCObjectTypeImpl = type ObjCObjectType;
  ObjCInterfaceType = type ObjCObjectType;
  ObjCObjectPointerType = type AstType;
  AtomicType = type AstType;
  PipeType = type AstType;
  BitIntType = type AstType;
  DependentBitIntType = type AstType;
            
  { CXSplitQualType }

  CXSplitQualType = record
	  /// The locally-unqualified type.
	  Ty: AstType;

	  /// The local qualifiers.
	  Quals: CXQualifiers;
  public
    class operator = (const left, right: CXSplitQualType): Boolean; inline;
    class operator <> (const left, right: CXSplitQualType): Boolean; inline;
  end;

{$region 'CXQualType'}
type
  QualType_PrimitiveDefaultInitializeKind  = type Integer;
  QualType_PrimitiveDefaultInitializeKind_Helper = type helper for QualType_PrimitiveDefaultInitializeKind
  public const
    PDIK_Trivial = 0;
    PDIK_ARCStrong = 1;
    PDIK_ARCWeak = 2;
    PDIK_Struct = 3;
  end;

  QualType_PrimitiveCopyKind = type Integer;
  QualType_PrimitiveCopyKind_Helper = type helper for QualType_PrimitiveCopyKind
  public const
    PCK_Trivial = 0;
    PCK_VolatileTrivial = 1;
    PCK_ARCStrong = 2;
    PCK_ARCWeak = 3;
    PCK_Struct = 4;
  end;

  QualType_DestructionKind = type Integer;

  { QualType_DestructionKind_Helper }

  QualType_DestructionKind_Helper = type helper for QualType_DestructionKind
  public const
    DK_none = 0;
    DK_cxx_destructor = 1;
    DK_objc_strong_lifetime = 2;
    DK_objc_weak_lifetime = 3;
    DK_nontrivial_c_struct = 4;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;
{$endregion 'CXQualType'}

  RefQualifierKind = type Integer;

  { RefQualifierKindHelper }

  RefQualifierKindHelper = type helper for RefQualifierKind
  public const
    // No ref-qualifier was provided.
    RQ_None = 0;

    // An lvalue ref-qualifier was provided (\c &).
    RQ_LValue = 1;

    // An rvalue ref-qualifier was provided (\c &&).
    RQ_RValue = 2;   
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  AutoTypeKeyword = type Integer;

  { AutoTypeKeywordHelper }

  AutoTypeKeywordHelper = type helper for AutoTypeKeyword
  public const
    // auto
    Auto = 0;

    // decltype(auto)
    DecltypeAuto = 1;

    // __auto_type (GNU extension)
    GNUAutoType = 2;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

{$region 'BuiltinType'}
  BuiltinTypeKind = type Integer;

  { BuiltinTypeKindHelper }

  BuiltinTypeKindHelper = type helper for BuiltinTypeKind
  public const
    {$I BuiltinType_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;  
{$endregion 'BuiltinType'}

  TagTypeKind = type Integer;

  { TagTypeKindHelper }

  TagTypeKindHelper = type helper for TagTypeKind
  public const
    // The "struct" keyword.
    TTK_Struct = 0;

    // The "__interface" keyword.
    TTK_Interface = 1;

    // The "union" keyword.
    TTK_Union = 2;

    // The "class" keyword.
    TTK_Class = 3;

    // The "enum" keyword.
    TTK_Enum = 4;  
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  AstType_ScalarTypeKind = type Integer;
  AstType_ScalarTypeKind_Helper = type helper for AstType_ScalarTypeKind
  public const
    STK_CPointer = 0;
    STK_BlockPointer = 1;
    STK_ObjCObjectPointer = 2;
    STK_MemberPointer = 3;
    STK_Bool = 4;
    STK_Integral = 5;
    STK_Floating = 6;
    STK_IntegralComplex = 7;
    STK_FloatingComplex = 8;
    STK_FixedPoint = 9;
  end;

  ElaboratedTypeKeyword = type Integer;

  { ElaboratedTypeKeywordHelper }

  ElaboratedTypeKeywordHelper = type helper for ElaboratedTypeKeyword
  public const
    /// The "struct" keyword introduces the elaborated-type-specifier.
    ETK_Struct = 0;

    /// The "__interface" keyword introduces the elaborated-type-specifier.
    ETK_Interface = 1;

    /// The "union" keyword introduces the elaborated-type-specifier.
    ETK_Union = 2;

    /// The "class" keyword introduces the elaborated-type-specifier.
    ETK_Class = 3;

    /// The "enum" keyword introduces the elaborated-type-specifier.
    ETK_Enum = 4;

    /// The "typename" keyword precedes the qualified type name, e.g.,
    /// \c typename T::type.
    ETK_Typename = 5;

    /// No keyword precedes the qualified type name.
    ETK_None = 6;  
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  ArrayType_ArraySizeModifier = type Integer;
  ArrayType_ArraySizeModifier_Helper = type helper for ArrayType_ArraySizeModifier
  public const
    Normal = 0;
    Static_ = 1;
    Star = 2;
  end;

implementation

uses
  SysUtils;

{ ElaboratedTypeKeywordHelper }

function ElaboratedTypeKeywordHelper.Value: Integer;
begin
  Result := Self;
end;

function ElaboratedTypeKeywordHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    ETK_Struct: Result := 'Struct';

    /// The "__interface" keyword introduces the elaborated-type-specifier.
    ETK_Interface: Result := 'Interface';

    /// The "union" keyword introduces the elaborated-type-specifier.
    ETK_Union: Result := 'Union';

    /// The "class" keyword introduces the elaborated-type-specifier.
    ETK_Class: Result := 'Class';

    /// The "enum" keyword introduces the elaborated-type-specifier.
    ETK_Enum: Result := 'Enum';

    /// The "typename" keyword precedes the qualified type name, e.g.,
    /// \c typename T::type.
    ETK_Typename: Result := 'Typename';

    /// No keyword precedes the qualified type name.
    ETK_None: Result := 'None';
 else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXSplitQualType }

class operator CXSplitQualType. = (const left, right: CXSplitQualType): Boolean;
begin
  Result := (left.Ty = right.Ty) and (left.Quals = right.Quals);
end;

class operator CXSplitQualType. <> (const left, right: CXSplitQualType): Boolean;
begin
  Result := not (left = right);
end;

{ QualType_DestructionKind_Helper }

function QualType_DestructionKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function QualType_DestructionKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    DK_none: Result := 'none';
    DK_cxx_destructor: Result := 'cxx_destructor';
    DK_objc_strong_lifetime: Result := 'objc_strong_lifetime';
    DK_objc_weak_lifetime: Result := 'objc_weak_lifetime';
    DK_nontrivial_c_struct: Result := 'nontrivial_c_struct';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ RefQualifierKindHelper }

function RefQualifierKindHelper.Value: Integer;
begin
  Result := Self;
end;

function RefQualifierKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    RQ_None: Result := 'None';
    RQ_LValue: Result := 'LValue<&>';
    RQ_RValue: Result := 'RValue<&&>';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ AutoTypeKeywordHelper }

function AutoTypeKeywordHelper.Value: Integer;
begin
  Result := Self;
end;

function AutoTypeKeywordHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    Auto: Result := 'Auto';
    DecltypeAuto: Result := 'DecltypeAuto';
    GNUAutoType: Result := 'GNUAutoType';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ AstType_TypeClass_Helper }

function AstType_TypeClass_Helper.Value: Integer;
begin
  Result := Self;
end;

function AstType_TypeClass_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i ASTType_TypeClass_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
   
{ BuiltinTypeKindHelper }

function BuiltinTypeKindHelper.Value: Integer;
begin
  Result := Self;
end;

function BuiltinTypeKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i BuiltinType_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
      
{ TagTypeKindHelper }

function TagTypeKindHelper.Value: Integer;
begin
  Result := Self;
end;

function TagTypeKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    TTK_Struct: Result := 'Struct';
    TTK_Interface: Result := 'Interface';
    TTK_Union: Result := 'Union';
    TTK_Class: Result := 'Class';
    TTK_Enum: Result := 'Enum';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

