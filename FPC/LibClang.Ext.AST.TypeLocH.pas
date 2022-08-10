unit LibClang.Ext.AST.TypeLocH;

{$mode ObjFPC}{$H+}
{$PACKRECORDS C}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.AST.TypeH;

type
  TypeLocClass = type Integer;

  { TypeLocClassHelper }

  TypeLocClassHelper = type helper for TypeLocClass
  public const
    {$i TypeLocClass_h.inc}
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;
  
  CXTypeLoc = record
    Ty: AstType;
    Data: Pointer;
  end;

  UnqualTypeLoc = type CXTypeLoc;
  QualifiedTypeLoc = type CXTypeLoc;

  TypeSpecTypeLoc = type UnqualTypeLoc;
  BuiltinTypeLoc = type UnqualTypeLoc;
  UsingTypeLoc = type TypeSpecTypeLoc;
  TypedefTypeLoc = type TypeSpecTypeLoc;
  InjectedClassNameTypeLoc = type TypeSpecTypeLoc;
  UnresolvedUsingTypeLoc = type TypeSpecTypeLoc;
  TagTypeLoc = type TypeSpecTypeLoc;
  RecordTypeLoc = type TagTypeLoc;
  EnumTypeLoc = type TagTypeLoc;
  TemplateTypeParmTypeLoc = type TypeSpecTypeLoc;
  ObjCTypeParamTypeLoc = type UnqualTypeLoc;
  SubstTemplateTypeParmTypeLoc = type TypeSpecTypeLoc;
  SubstTemplateTypeParmPackTypeLoc = type TypeSpecTypeLoc;
  AttributedTypeLoc = type UnqualTypeLoc;
  BTFTagAttributedTypeLoc = type UnqualTypeLoc;
  ObjCObjectTypeLoc = type UnqualTypeLoc;
  ObjCInterfaceTypeLoc = type ObjCObjectTypeLoc;
  MacroQualifiedTypeLoc = type UnqualTypeLoc; 
  ParenTypeLoc = type UnqualTypeLoc;
  AdjustedTypeLoc = type UnqualTypeLoc;
  DecayedTypeLoc = type AdjustedTypeLoc;
  PointerTypeLoc = type UnqualTypeLoc;
  BlockPointerTypeLoc = type UnqualTypeLoc;
  MemberPointerTypeLoc = type UnqualTypeLoc;
  ObjCObjectPointerTypeLoc = type UnqualTypeLoc;
  ReferenceTypeLoc = type UnqualTypeLoc;
  LValueReferenceTypeLoc = type ReferenceTypeLoc;
  RValueReferenceTypeLoc = type ReferenceTypeLoc;
  FunctionTypeLoc = type UnqualTypeLoc;
  FunctionProtoTypeLoc = type FunctionTypeLoc;
  FunctionNoProtoTypeLoc = type FunctionTypeLoc;
  ArrayTypeLoc = type UnqualTypeLoc;
  ConstantArrayTypeLoc = type ArrayTypeLoc;
  IncompleteArrayTypeLoc = type ArrayTypeLoc;
  DependentSizedArrayTypeLoc = type ArrayTypeLoc;
  VariableArrayTypeLoc = type ArrayTypeLoc;
  TemplateSpecializationTypeLoc = type UnqualTypeLoc;
  DependentAddressSpaceTypeLoc = type UnqualTypeLoc;
  VectorTypeLoc = type UnqualTypeLoc;
  DependentVectorTypeLoc = type UnqualTypeLoc;
  ExtVectorTypeLoc = type VectorTypeLoc;
  DependentSizedExtVectorTypeLoc = type UnqualTypeLoc;
  MatrixTypeLoc = type UnqualTypeLoc;
  ConstantMatrixTypeLoc = type  MatrixTypeLoc;
  DependentSizedMatrixTypeLoc = type  MatrixTypeLoc;
  ComplexTypeLoc = type TypeSpecTypeLoc;
  TypeOfExprTypeLoc = type UnqualTypeLoc;
  TypeOfTypeLoc = type UnqualTypeLoc;
  DecltypeTypeLoc = type UnqualTypeLoc;
  UnaryTransformTypeLoc = type UnqualTypeLoc;
  DeducedTypeLoc = type TypeSpecTypeLoc;
  AutoTypeLoc = type DeducedTypeLoc;
  DeducedTemplateSpecializationTypeLoc = type DeducedTypeLoc;
  ElaboratedTypeLoc = type UnqualTypeLoc;
  DependentNameTypeLoc = type UnqualTypeLoc;
  DependentTemplateSpecializationTypeLoc = type UnqualTypeLoc;
  PackExpansionTypeLoc = type UnqualTypeLoc;
  AtomicTypeLoc = type UnqualTypeLoc;
  PipeTypeLoc = type UnqualTypeLoc;
  BitIntTypeLoc = type TypeSpecTypeLoc;
  DependentBitIntTypeLoc = type TypeSpecTypeLoc;


implementation

uses
  SysUtils;

{ TypeLocClassHelper }

function TypeLocClassHelper.Value: Integer;
begin
  Result := Self;
end;

function TypeLocClassHelper.ToString(aShowType: Boolean): string;
begin
   case Self of
    {$i TypeLocClass_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

