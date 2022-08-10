unit LibClang.Ext.Lex.TokenU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.TokenKindsH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Basic.IdentifierTableH;
                 
{$region 'Token'}
procedure clangExt_Token_Dispose(t: LexToken); cdecl; external LibClang_dll;
//
function clangExt_Token_getKind(const t: LexToken): Tok_TokenKind; cdecl; external LibClang_dll;
function clangExt_Token_is(const t: LexToken; K: Tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isNot(const t: LexToken; K: Tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isOneOf(const t: LexToken; K1: Tok_TokenKind; K2: Tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isAnyIdentifier(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isLiteral(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isAnnotation(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_getLocation(const t: LexToken; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Token_getLength(const t: LexToken): Cardinal; cdecl; external LibClang_dll;
function clangExt_Token_getAnnotationEndLoc(const t: LexToken; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Token_getLastLoc(const t: LexToken; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Token_getEndLoc(const t: LexToken; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Token_getAnnotationRange(const t: LexToken; const Ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_Token_getName(const t: LexToken): PChar; cdecl; external LibClang_dll;
function clangExt_Token_getIdentifierInfo(const t: LexToken): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_Token_getEofData(const t: LexToken): Pointer; cdecl; external LibClang_dll;
function clangExt_Token_getRawIdentifier(const t: LexToken): CXString; cdecl; external LibClang_dll;
function clangExt_Token_getLiteralData(const t: LexToken): PChar; cdecl; external LibClang_dll;
function clangExt_Token_getAnnotationValue(const t: LexToken): Pointer; cdecl; external LibClang_dll;
function clangExt_Token_getFlag(const t: LexToken; Flag: TokenFlags): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_getFlags(const t: LexToken): Cardinal; cdecl; external LibClang_dll;
function clangExt_Token_isAtStartOfLine(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_hasLeadingSpace(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isExpandDisabled(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isObjCAtKeyword(const t: LexToken; objcKey: tok_ObjCKeywordKind): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_getObjCKeywordID(const t: LexToken): tok_ObjCKeywordKind; cdecl; external LibClang_dll;
function clangExt_Token_needsCleaning(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_hasLeadingEmptyMacro(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_hasUDSuffix(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_hasUCN(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_stringifiedInMacro(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_commaAfterElided(const t: LexToken): Boolean; cdecl; external LibClang_dll;
function clangExt_Token_isEditorPlaceholder(const t: LexToken): Boolean; cdecl; external LibClang_dll; 
{$endregion 'Token'}

{$region 'PPConditionalInfo'}
function clangExt_PPConditionalInfo_IfLoc(const p: PPConditionalInfo; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_PPConditionalInfo_WasSkipping(const p: PPConditionalInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_PPConditionalInfo_FoundNonSkip(const p: PPConditionalInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_PPConditionalInfo_FoundElse(const p: PPConditionalInfo): Boolean; cdecl; external LibClang_dll;
{$endregion 'PPConditionalInfo'}

implementation

end.

