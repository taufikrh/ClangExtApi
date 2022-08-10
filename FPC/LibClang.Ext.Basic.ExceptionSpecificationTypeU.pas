unit LibClang.Ext.Basic.ExceptionSpecificationTypeU;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  ExceptionSpecificationType = type Integer;

  { ExceptionSpecificationTypeHelper }

  ExceptionSpecificationTypeHelper = type helper for ExceptionSpecificationType
  public const
    EST_None = 0;             ///< no exception specification
    EST_DynamicNone = 1;      ///< throw()
    EST_Dynamic = 2;          ///< throw(T1, T2)
    EST_MSAny = 3;            ///< Microsoft throw(...) extension
    EST_NoThrow = 4;          ///< Microsoft __declspec(nothrow) extension
    EST_BasicNoexcept = 5;    ///< noexcept
    EST_DependentNoexcept = 6;///< noexcept(expression), value-dependent
    EST_NoexceptFalse = 7;    ///< noexcept(expression), evals to 'false'
    EST_NoexceptTrue = 8;     ///< noexcept(expression), evals to 'true'
    EST_Unevaluated = 9;      ///< not evaluated yet, for special member function
    EST_Uninstantiated = 10;  ///< not instantiated yet
    EST_Unparsed = 11;        ///< not parsed yet
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  CanThrowResult = type Integer;
  CanThrowResultHelper = type helper for CanThrowResult
  public const
    CT_Cannot = 0;
    CT_Dependent = 1;
    CT_Can = 2;
  end;

implementation

uses
  SysUtils;

{ ExceptionSpecificationTypeHelper }

function ExceptionSpecificationTypeHelper.Value: Integer;
begin
  Result := Self;
end;

function ExceptionSpecificationTypeHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    EST_None: Result := 'None';
    EST_DynamicNone: Result := 'DynamicNone';
    EST_Dynamic: Result := 'Dynamic';
    EST_MSAny: Result := 'MSAny';
    EST_NoThrow: Result := 'NoThrow';
    EST_BasicNoexcept: Result := 'BasicNoexcept';
    EST_DependentNoexcept: Result := 'DependentNoexcept';
    EST_NoexceptFalse: Result := 'NoexceptFalse';
    EST_NoexceptTrue: Result := 'NoexceptTrue';
    EST_Unevaluated: Result := 'Unevaluated';
    EST_Uninstantiated: Result := 'Uninstantiated';
    EST_Unparsed: Result := 'Unparsed';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

