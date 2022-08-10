unit LibClang.Ext.Lex.MacroInfoU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.Index,            
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.ASTContextH,    
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Lex.MacroInfoH,
  LibClang.Ext.Basic.SourceManagerH,
  LibClang.Ext.Lex.TokenH
  ;

function clangExt_MacroInfo_getDefinitionLoc(const m: MacroInfo; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getDefinitionEndLoc(const m: MacroInfo; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getDefinitionLength(const m: MacroInfo; const SM: SourceManager): Cardinal; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isIdenticalTo(const m: MacroInfo; const Other: MacroInfo; const PP: Preprocessor; Syntactically: Boolean): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_param_empty(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getNumParams(const m: MacroInfo): Cardinal; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getParams(const m: MacroInfo; i: Cardinal): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getParameterNum(const m: MacroInfo; const Arg: IdentifierInfo): Integer; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isFunctionLike(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isObjectLike(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isC99Varargs(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isGNUVarargs(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isVariadic(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isBuiltinMacro(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_hasCommaPasting(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isUsed(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isAllowRedefinitionsWithoutWarning(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isWarnIfUnused(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getNumTokens(const m: MacroInfo): Cardinal; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getReplacementToken(const m: MacroInfo; Tok: Cardinal): LexToken; cdecl; external LibClang_dll;
function clangExt_MacroInfo_tokens_empty(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_getTokens(const m: MacroInfo; i: Cardinal): LexToken; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isEnabled(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroInfo_isUsedForHeaderGuard(const m: MacroInfo): Boolean; cdecl; external LibClang_dll;


implementation

end.

