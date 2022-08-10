unit LibClang.Ext.AST.StmtU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ExprH
  ;

{$region 'Stmt'}
function clangExt_Stmt_getNumStmtClass: Integer; cdecl; external LibClang_dll;
function clangExt_Stmt_getNameStmtClass(i: StmtClass): CXString; cdecl; external LibClang_dll;
//
function clangExt_Stmt_getStmtClass(const s: Stmt): StmtClass; cdecl; external LibClang_dll;
function clangExt_Stmt_getStmtClassName(const s: Stmt): PChar; cdecl; external LibClang_dll;
function clangExt_Stmt_getSourceRange(const s: Stmt; const Ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_Stmt_getBeginLoc(const s: Stmt; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Stmt_getEndLoc(const s: Stmt; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Stmt_getLikelihood(const s: Stmt): StmtLikelihood; cdecl; external LibClang_dll;
function clangExt_Stmt_getLikelihoodAttr(const s: Stmt): Attr; cdecl; external LibClang_dll;
function clangExt_Stmt_dump(const s: Stmt; const Context: ASTContext): CXString; external LibClang_dll;
function clangExt_Stmt_printPretty(const s: Stmt; const Policy: CXPrintingPolicy; Indentation: Cardinal; const NewlineSymbol: PChar; const Context: ASTContext): CXString; external LibClang_dll;
function clangExt_Stmt_IgnoreContainers(const s: Stmt; IgnoreCaptured: Boolean = False): Stmt; cdecl; external LibClang_dll;
function clangExt_Stmt_stripLabelLikeStatements(const s: Stmt): Stmt; cdecl; external LibClang_dll;
function clangExt_Stmt_getNumChildren(const s: Stmt): Cardinal; cdecl; external LibClang_dll;
function clangExt_Stmt_getChildren(const s: Stmt; i: Cardinal): Stmt; cdecl; external LibClang_dll;  
{$endregion 'Stmt'}
          
{$region 'ValueStmt'}
function clangExt_ValueStmt_getExprStmt(const s: ValueStmt): Expr; cdecl; external LibClang_dll;
function clangExt_ValueStmt_classof(const T: Stmt): Boolean; cdecl; external LibClang_dll;      
{$endregion 'ValueStmt'}

implementation

end.

