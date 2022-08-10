unit LibClang.Ext.AST.StmtW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  //LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.AttrH,  
  LibClang.Ext.AST.StmtU,
  LibClang.Ext.AST.ExprH
  ;

type
              
{$region 'TStmtW'}
  { TStmtW }

  TStmtW = object
    S: Stmt;
  public
    class function Create(aStmt: Stmt; out oStmt: TStmtW): Boolean; static;
    class function getNumStmtClass: Integer; static;
    class function getNameStmtClass(i: StmtClass): string; static;
  public
    function IsNull: Boolean;
    function getStmtClass: StmtClass;
    function getStmtClassName: string;
    function getSourceRange(const Ctx: ASTContext): CXSourceRange;
    function getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLikelihood: StmtLikelihood;
    function getLikelihoodAttr: Attr;
    function dump(const Context: ASTContext): string;
    function printPretty(const Policy: CXPrintingPolicy; Indentation: Cardinal = 0; const NewlineSymbol: PChar = #13#10; const Context: ASTContext = nil): string;
    function IgnoreContainers(IgnoreCaptured: Boolean = False): TStmtW;
    function stripLabelLikeStatements: TStmtW;
    function getNumChildren: Cardinal;
    function getChildren(i: Cardinal): TStmtW;
  end;     
{$endregion 'TStmtW'}

  { TValueStmtW }

  TValueStmtW = object(TStmtW)
  public
    class function Create(aStmt: ValueStmt; out oStmt: TValueStmtW): Boolean; static;
  public
    function getExprStmt: Expr;
    class function classof(const T: TStmtW): Boolean;
  end;
                       
{$region 'Helper'}

  StmtHelper = type helper for Stmt
    function Wrap(out S: TStmtW): Boolean;
  end;

  ValueStmtHelper = type helper for ValueStmt
    function Wrap(out S: TValueStmtW): Boolean;
  end;

{$endregion 'Helper'}

implementation

{$region 'Helper'}

function StmtHelper.Wrap(out S: TStmtW): Boolean;
begin
  Result := TStmtW.Create(Self, S);
end;
     
function ValueStmtHelper.Wrap(out S: TValueStmtW): Boolean;
begin
  Result := TValueStmtW.Create(Self, S);
end;

{$endregion 'Helper'}

{$region 'TStmtW'}

class function TStmtW.Create(aStmt: Stmt; out oStmt: TStmtW): Boolean;
begin
  Result := False;
  oStmt := Default(TStmtW);
  if not Assigned(aStmt) then
    Exit;
  oStmt.S := aStmt;
  Result := True;
end;

class function TStmtW.getNumStmtClass: Integer;
begin
  Result := clangExt_Stmt_getNumStmtClass;
end;

class function TStmtW.getNameStmtClass(i: StmtClass): string;
begin
  Result := clangExt_Stmt_getNameStmtClass(i).ToString;
end;

function TStmtW.IsNull: Boolean;
begin
  Result := not Assigned(Self.S);
end;

function TStmtW.getStmtClass: StmtClass;
begin
  Result := clangExt_Stmt_getStmtClass(Self.S);
end;

function TStmtW.getStmtClassName: string;
begin
  Result := StrPas(clangExt_Stmt_getStmtClassName(Self.S));
end;

function TStmtW.getSourceRange(const Ctx: ASTContext): CXSourceRange;
begin
  Result := clangExt_Stmt_getSourceRange(Self.S, Ctx);
end;

function TStmtW.getBeginLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Stmt_getBeginLoc(Self.S, Ctx);
end;

function TStmtW.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Stmt_getEndLoc(Self.S, Ctx);
end;

function TStmtW.getLikelihood: StmtLikelihood;
begin
  Result := clangExt_Stmt_getLikelihood(Self.S);
end;

function TStmtW.getLikelihoodAttr: Attr;
begin
  Result := clangExt_Stmt_getLikelihoodAttr(Self.S);
end;

function TStmtW.dump(const Context: ASTContext): string;
begin
  Result := clangExt_Stmt_dump(Self.S, Context).ToString;
end;

function TStmtW.printPretty(const Policy: CXPrintingPolicy;
  Indentation: Cardinal; const NewlineSymbol: PChar; const Context: ASTContext
  ): string;
begin
  Result := clangExt_Stmt_printPretty(Self.S, Policy, Indentation, NewlineSymbol, Context).ToString;
end;

function TStmtW.IgnoreContainers(IgnoreCaptured: Boolean): TStmtW;
begin
  clangExt_Stmt_IgnoreContainers(Self.S, IgnoreCaptured).Wrap(Result);
end;

function TStmtW.stripLabelLikeStatements: TStmtW;
begin
  clangExt_Stmt_stripLabelLikeStatements(Self.S).Wrap(Result);
end;

function TStmtW.getNumChildren: Cardinal;
begin
  Result := clangExt_Stmt_getNumChildren(Self.S);
end;

function TStmtW.getChildren(i: Cardinal): TStmtW;
begin
  clangExt_Stmt_getChildren(Self.S, i).Wrap(Result);
end;
      
{$endregion 'TStmtW'}

{$region 'TValueStmtW'}

class function TValueStmtW.Create(aStmt: ValueStmt; out oStmt: TValueStmtW
  ): Boolean;
begin
  Result := False;
  oStmt := Default(TValueStmtW);
  if (not Assigned(aStmt)) or (not clangExt_ValueStmt_classof(aStmt)) then
    Exit;
  oStmt.S := aStmt;
  Result := True;
end;

function TValueStmtW.getExprStmt: Expr;
begin
  Result := clangExt_ValueStmt_getExprStmt(Self.S);
end;

class function TValueStmtW.classof(const T: TStmtW): Boolean;
begin
  Result := clangExt_ValueStmt_classof(T.S);
end;
     
{$endregion 'TValueStmtW'}

end.

