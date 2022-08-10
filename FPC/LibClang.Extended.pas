unit LibClang.Extended;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Base, 
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.StmtH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Frontend.ASTUnitH,
  LibClang.Ext.Lex.PreprocessingRecordH
  ;


function clangExt_SizeOf: Integer; cdecl; external LibClang_dll;

{$region 'Extended Cursor Api'}
function clangExt_Cursor_getCursorDecl(Cursor: CXCursor): Decl {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getCursorExpr(Cursor: CXCursor): Expr {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getCursorStmt(Cursor: CXCursor): Stmt {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getCursorAttr(Cursor: CXCursor): Attr {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getASTUnit(Cursor: CXCursor): ASTUnit {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getASTContext(Cursor: CXCursor): ASTContext {const}; cdecl; external LibClang_dll;
function clangExt_Cursor_getCursorMacroDefinition(Cursor: CXCursor): MacroDefinitionRecord; cdecl; external LibClang_dll;
function clangExt_Cursor_getCursorInclusionDirective(Cursor: CXCursor): InclusionDirective; cdecl; external LibClang_dll;
function clangExt_Cursor_getNumAttrs(C: CXCursor): Cardinal; cdecl; external LibClang_dll;
function clangExt_Cursor_getAttr(C: CXCursor; i: Cardinal): CXCursor; cdecl; external LibClang_dll;
function clangExt_Cursor_getAttrKind(C: CXCursor; out kind: CX_AttrKind): Boolean; cdecl; external LibClang_dll;   
{$endregion 'Extended Cursor Api'}

function clangExt_getDeclUSR(const D: Decl; TU: CXTranslationUnit): CXString; cdecl; external LibClang_dll;

type
  clangExt_getTokensVisitor = function (const t: LexToken; client_data: CXClientData): Boolean; cdecl;
// create new token should be dispose with clangExt_Token_Dispose
function clangExt_getTokens(const CXXUnit: ASTUnit; Range: CXSourceRange; visitor: clangExt_getTokensVisitor; client_data: CXClientData; createToken: Boolean = False): Boolean; cdecl; external LibClang_dll;
function clangExt_getTokenPtrsFromSourceRange(const CXXUnit: ASTUnit; Range: CXSourceRange; out Tokens: PLexToken; out NumTokens: Cardinal): Boolean; cdecl; external LibClang_dll; // clangExt_disposeTokenPtrs
function clangExt_getTokenPtrsFromSourceLocation(const CXXUnit: ASTUnit; Location: CXSourceLocation; out Tokens: PLexToken; out NumTokens: Cardinal): Boolean; cdecl; external LibClang_dll; // clangExt_disposeTokenPtrs
procedure clangExt_disposeTokenPtrs(Tokens: PLexToken; NumTokens: Cardinal); cdecl; external LibClang_dll;

implementation

end.

