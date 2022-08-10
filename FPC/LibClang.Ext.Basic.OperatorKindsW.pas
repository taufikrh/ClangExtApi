unit LibClang.Ext.Basic.OperatorKindsW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.Basic.OperatorKindsU;

type

  { OverloadedOperatorKindHelper2 }

  OverloadedOperatorKindHelper2 = type helper(OverloadedOperatorKindHelper) for OverloadedOperatorKind
  public
    function getOperatorSpelling: string;
    function getRewrittenOverloadedOperator: OverloadedOperatorKind;
    function isCompoundAssignmentOperator: Boolean;
  end;

implementation

{ OverloadedOperatorKindHelper2 }

function OverloadedOperatorKindHelper2.getOperatorSpelling: string;
begin
  Result := StrPas(clangExt_OverloadedOperatorKind_getOperatorSpelling(Self));
end;

function OverloadedOperatorKindHelper2.getRewrittenOverloadedOperator: OverloadedOperatorKind;
begin
  Result := clangExt_OverloadedOperatorKind_getRewrittenOverloadedOperator(Self);
end;

function OverloadedOperatorKindHelper2.isCompoundAssignmentOperator: Boolean;
begin
  Result := clangExt_OverloadedOperatorKind_isCompoundAssignmentOperator(Self);
end;

end.

