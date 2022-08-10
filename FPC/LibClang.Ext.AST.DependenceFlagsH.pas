unit LibClang.Ext.AST.DependenceFlagsH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  ExprDependence = type Byte;

  { ExprDependenceHelper }

  ExprDependenceHelper = type helper for ExprDependence
  public const
    UnexpandedPack = 1;
    // This expr depends in any way on
    //   - a template parameter, it implies that the resolution of this expr may
    //     cause instantiation to fail
    //   - or an error (often in a non-template context)
    //
    // Note that C++ standard doesn't define the instantiation-dependent term,
    // we follow the formal definition coming from the Itanium C++ ABI, and
    // extend it to errors.
    Instantiation = 2;
    // The type of this expr depends on a template parameter, or an error.
    Type_ = 4;
    // The value of this expr depends on a template parameter, or an error.
    Value_ = 8;

    // clang extension: this expr contains or references an error, and is
    // considered dependent on how that error is resolved.
    Error = 16;

    None = 0;
    All = 31;

    TypeValue = Type_ or Value_;
    TypeInstantiation = Type_ or Instantiation;
    ValueInstantiation = Value_ or Instantiation;
    TypeValueInstantiation = Type_ or Value_ or Instantiation;
    ErrorDependent = Error or ValueInstantiation;

    LLVM_MARK_AS_BITMASK_ENUM = Error;
  public
    function Value: Byte;
    function ToString(aShowType: Boolean = True): string;
  end;

  TypeDependence = type Byte;

  { TypeDependenceHelper }

  TypeDependenceHelper = type helper for TypeDependence
  public const
    /// Whether this type contains an unexpanded parameter pack
    /// (for C++11 variadic templates)
    UnexpandedPack = 1;
    /// Whether this type somehow involves
    ///   - a template parameter, even if the resolution of the type does not
    ///     depend on a template parameter.
    ///   - or an error.
    Instantiation = 2;
    /// Whether this type
    ///   - is a dependent type (C++ [temp.dep.type])
    ///   - or it somehow involves an error, e.g. decltype(recovery-expr)
    Dependent = 4;
    /// Whether this type is a variably-modified type (C99 6.7.5).
    VariablyModified = 8;

    /// Whether this type references an error, e.g. decltype(err-expression)
    /// yields an error type.
    Error = 16;

    None = 0;
    All = 31;

    DependentInstantiation = Dependent or Instantiation;

    LLVM_MARK_AS_BITMASK_ENUM = Error;
  public
    function Value: Byte;
    function ToString(aShowType: Boolean = True): string;
  end;

implementation

uses
SysUtils;

{ ExprDependenceHelper }

function ExprDependenceHelper.Value: Byte;
begin
  Result := Self;
end;

function ExprDependenceHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    UnexpandedPack: Result := 'UnexpandedPack';
    Instantiation: Result := 'Instantiation';
    Type_: Result := 'Type';
    Value_: Result := 'Value';
    Error: Result := 'Error';
    None: Result := 'None';
    All: Result := 'All';

    TypeValue: Result := 'TypeValue';
    TypeInstantiation: Result := 'TypeInstantiation';
    ValueInstantiation: Result := 'ValueInstantiation';
    TypeValueInstantiation: Result := 'TypeValueInstantiation';
    ErrorDependent: Result := 'ErrorDependent';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ TypeDependenceHelper }

function TypeDependenceHelper.Value: Byte;
begin
  Result := Self;
end;

function TypeDependenceHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    UnexpandedPack: Result := 'UnexpandedPack';
    Instantiation: Result := 'Instantiation';
    Dependent: Result := 'Dependent';
    VariablyModified: Result := 'VariablyModified';
    Error: Result := 'Error';
    None: Result := 'None';
    All: Result := 'All';
    DependentInstantiation: Result := 'DependentInstantiation';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

