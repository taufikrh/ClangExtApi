unit LibClang.Ext.AST.ExprH;

{$mode ObjFPC}{$H+} 
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.AST.StmtH;

type
  Expr_LValueClassification = type Integer;
  Expr_LValueClassification_Helper = type helper for Expr_LValueClassification
  public const
    LV_Valid = 0;
    LV_NotObjectType = 1;
    LV_IncompleteVoidType = 2;
    LV_DuplicateVectorComponents = 3;
    LV_InvalidExpression = 4;
    LV_InvalidMessageExpression = 5;
    LV_MemberFunction = 6;
    LV_SubObjCPropertySetting = 7;
    LV_ClassTemporary = 8;
    LV_ArrayTemporary = 9;
  end;

  Expr_isModifiableLvalueResult = type Integer;
  Expr_isModifiableLvalueResult_Helper = type helper for Expr_isModifiableLvalueResult
  public const
    MLV_Valid = 0;
    MLV_NotObjectType = 1;
    MLV_IncompleteVoidType = 2;
    MLV_DuplicateVectorComponents = 3;
    MLV_InvalidExpression = 4;
    MLV_LValueCast = 5;           // Specialized form of MLV_InvalidExpression.
    MLV_IncompleteType = 6;
    MLV_ConstQualified = 7;
    MLV_ConstQualifiedField = 8;
    MLV_ConstAddrSpace = 9;
    MLV_ArrayType = 10;
    MLV_NoSetterProperty = 11;
    MLV_MemberFunction = 12;
    MLV_SubObjCPropertySetting = 13;
    MLV_InvalidMessageExpression = 14;
    MLV_ClassTemporary = 15;
    MLV_ArrayTemporary = 16;
  end;

  NullPointerConstantKind = type Integer;
  NullPointerConstantKindhelper = type helper for NullPointerConstantKind
  public const
    /// Expression is not a Null pointer constant.
    NPCK_NotNull = 0;

    /// Expression is a Null pointer constant built from a zero integer
    /// expression that is not a simple, possibly parenthesized, zero literal.
    /// C++ Core Issue 903 will classify these expressions as "not pointers"
    /// once it is adopted.
    /// http://www.open-std.org/jtc1/sc22/wg21/docs/cwg_active.html#903
    NPCK_ZeroExpression = 1;

    /// Expression is a Null pointer constant built from a literal zero.
    NPCK_ZeroLiteral = 2;

    /// Expression is a C++11 nullptr.
    NPCK_CXX11_nullptr = 3;

    /// Expression is a GNU-style __null constant.
    NPCK_GNUNull = 4;
  end;

  /// Enumeration used to describe how \c isNullPointerConstant()
  /// should cope with value-dependent expressions.
  NullPointerConstantValueDependence = type Integer;
  NullPointerConstantValueDependenceHelper = type helper for NullPointerConstantValueDependence
  public const
    /// Specifies that the expression should never be value-dependent.
    NPC_NeverValueDependent = 0;

    /// Specifies that a value-dependent expression of integral or
    /// dependent type should be considered a null pointer constant.
    NPC_ValueDependentIsNull = 1;

    /// Specifies that a value-dependent expression should be considered
    /// to never be a null pointer constant.
    NPC_ValueDependentIsNotNull = 2;
  end;

  Expr = type ValueStmt;
  PExpr = ^Expr;
  FullExpr = type Expr;
  ConstantExpr = type FullExpr;

  ConstantExpr_ResultStorageKind = type Integer;

  { ConstantExpr_ResultStorageKind_Helper }

  ConstantExpr_ResultStorageKind_Helper = type helper for ConstantExpr_ResultStorageKind
  public const
    RSK_None = 0;
    RSK_Int64 = 1;
    RSK_APValue = 2;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  StringLiteral_StringKind = type Integer;

  { StringLiteral_StringKind_Helper }

  StringLiteral_StringKind_Helper = type helper for StringLiteral_StringKind
  public const
    Ordinary = 0;
    Wide = 1;
    UTF8 = 2;
    UTF16 = 3;
    UTF32 = 4;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  CharacterLiteral_CharacterKind = type Integer;

  { CharacterLiteral_CharacterKind_Helper }

  CharacterLiteral_CharacterKind_Helper = type helper for CharacterLiteral_CharacterKind
  public const
    Ascii = 0;
    Wide = 1;
    UTF8 = 2;
    UTF16 = 3;
    UTF32 = 4;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  DeclRefExpr = type Expr;
  IntegerLiteral = type Expr;
  CharacterLiteral = type Expr;
  FloatingLiteral = type Expr;
  StringLiteral = type Expr; 
  ParenExpr = type Expr;
  UnaryOperator = type Expr;
  UnaryExprOrTypeTraitExpr = type Expr;
  CastExpr = type Expr;
  ImplicitCastExpr = type CastExpr;
  ExplicitCastExpr = type CastExpr;
  CStyleCastExpr = type ExplicitCastExpr;
  BinaryOperator = type Expr;
  AddrLabelExpr = type Expr;
  StmtExpr = type Expr;
  InitListExpr = type Expr;

implementation

uses
  SysUtils;

{ CharacterLiteral_CharacterKind_Helper }

function CharacterLiteral_CharacterKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function CharacterLiteral_CharacterKind_Helper.ToString(aShowType: Boolean
  ): string;
begin
  case Self of
    Ascii:   Result := 'Ascii';
    Wide:   Result := 'Wide';
    UTF8:   Result := 'UTF8';
    UTF16:  Result := 'UTF16';
    UTF32:  Result := 'UTF32';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ StringLiteral_StringKind_Helper }

function StringLiteral_StringKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function StringLiteral_StringKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    Ordinary: Result := 'Ordinary';
    Wide: Result := 'Wide';
    UTF8: Result := 'UTF8';
    UTF16: Result := 'UTF16';
    UTF32: Result := 'UTF32';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ ConstantExpr_ResultStorageKind_Helper }

function ConstantExpr_ResultStorageKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function ConstantExpr_ResultStorageKind_Helper.ToString(aShowType: Boolean
  ): string;
begin
  case Self of
    RSK_None:     Result := 'RSK_None';
    RSK_Int64:    Result := 'RSK_Int64';
    RSK_APValue:  Result := 'RSK_APValue';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

