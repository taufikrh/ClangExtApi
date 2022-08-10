unit LibClang.Ext.Basic.TokenKindsU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.Ext.Basic.TokenKindsH;

function clangExt_TokenKind_GetLast(): Word; cdecl; external LibClang_dll;
function clangExt_TokenKind_getName(Kind: tok_TokenKind): PChar; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_TokenKind_getTokenName(Kind: tok_TokenKind): PChar; cdecl; external LibClang_dll;
function clangExt_TokenKind_getPunctuatorSpelling(Kind: tok_TokenKind): PChar; cdecl; external LibClang_dll;
function clangExt_TokenKind_getKeywordSpelling(Kind: tok_TokenKind): PChar; cdecl; external LibClang_dll;
function clangExt_TokenKind_isAnyIdentifier(K: tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TokenKind_isStringLiteral(K: tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TokenKind_isLiteral(K: tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TokenKind_isAnnotation(K: tok_TokenKind): Boolean; cdecl; external LibClang_dll;
function clangExt_TokenKind_isPragmaAnnotation(K: tok_TokenKind): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_PPKeywordKind_getPPKeywordSpelling(Kind: Tok_PPKeywordKind): PChar; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_PPKeywordKind_GetLast(): Integer; cdecl; external LibClang_dll;
function clangExt_PPKeywordKind_getName(Kind: Tok_PPKeywordKind): PChar; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_ObjCKeywordKind_GetLast(): Integer; cdecl; external LibClang_dll;
function clangExt_ObjCKeywordKind_getName(Kind: Tok_ObjCKeywordKind): PChar; cdecl; external LibClang_dll;

implementation

end.

