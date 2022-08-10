unit LibClang.ExtendedW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.Helper,
  LibClang.Extended,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.Frontend.ASTUnitH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Lex.PreprocessingRecordH
  ;

type

  { CXCursorHelper2 }

  CXCursorHelper2 = record helper(CXCursorHelper) for CXCursor
    function getCursorDecl: Decl;
    function getCursorExpr: Expr;
    function getCursorStmt: Stmt;
    function getCursorAttr: Attr;
    function getASTUnit: ASTUnit;
    function getASTContext: ASTContext;
    function getCursorMacroDefinition: MacroDefinitionRecord;
    function getCursorInclusionDirective: InclusionDirective;
    function getNumAttrs: Cardinal;
    function getAttr(i: Cardinal): CXCursor;
    function getAttrKind(out kind: CX_AttrKind): Boolean;
  end;

implementation

{$region 'CXCursorHelper2'}

function CXCursorHelper2.getCursorDecl: Decl;
begin
  Result := clangExt_Cursor_getCursorDecl(Self);
end;

function CXCursorHelper2.getCursorExpr: Expr;
begin
  Result := clangExt_Cursor_getCursorExpr(Self);
end;

function CXCursorHelper2.getCursorStmt: Stmt;
begin
  Result := clangExt_Cursor_getCursorStmt(Self);
end;

function CXCursorHelper2.getCursorAttr: Attr;
begin
  Result := clangExt_Cursor_getCursorAttr(Self);
end;

function CXCursorHelper2.getASTUnit: ASTUnit;
begin
  Result := clangExt_Cursor_getASTUnit(Self);
end;

function CXCursorHelper2.getASTContext: ASTContext;
begin
  Result := clangExt_Cursor_getASTContext(Self);
end;

function CXCursorHelper2.getCursorMacroDefinition: MacroDefinitionRecord;
begin
  Result := clangExt_Cursor_getCursorMacroDefinition(Self);
end;

function CXCursorHelper2.getCursorInclusionDirective: InclusionDirective;
begin
  Result := clangExt_Cursor_getCursorInclusionDirective(Self);
end;

function CXCursorHelper2.getNumAttrs: Cardinal;
begin
  Result := clangExt_Cursor_getNumAttrs(Self);
end;

function CXCursorHelper2.getAttr(i: Cardinal): CXCursor;
begin
  Result := clangExt_Cursor_getAttr(Self, i);
end;

function CXCursorHelper2.getAttrKind(out kind: CX_AttrKind): Boolean;
begin
  Result := clangExt_Cursor_getAttrKind(Self, Kind);
end;
       
{$endregion 'CXCursorHelper2'}

end.

