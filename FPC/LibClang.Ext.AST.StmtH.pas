unit LibClang.Ext.AST.StmtH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  StmtClass = type Integer;

  { StmtClassHelper }

  StmtClassHelper = type helper for StmtClass
  public const
    {$i StmtClass_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowValue: Boolean = True): string;
  end;

  StmtLikelihood = type Integer;
  StmtLikelihoodHelper = type helper for StmtLikelihood
  public const
    LH_Unlikely = -1; ///< Branch has the [[unlikely]] attribute.
    LH_None = 0;      ///< No attribute set or branches of the IfStmt have
                      ///< the same attribute.
    LH_Likely = 1;    ///< Branch has the [[likely]] attribute.
  end;

  Stmt = type Pointer;
  PStmt = ^Stmt;

  ValueStmt = type Stmt;
  LabelStmt = type ValueStmt;
  CompoundStmt = type Stmt;

implementation

uses
  SysUtils;

{ StmtClassHelper }

function StmtClassHelper.Value: Integer;
begin
  Result := Self;
end;

function StmtClassHelper.ToString(aShowValue: Boolean): string;
begin
  case Self of
    {$i StmtClass_impl.inc}
  else
    Result := 'Unknow';
  end;

  if aShowValue then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

