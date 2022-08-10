unit LibClang.Ext.Lex.MacroInfoW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Lex.MacroInfoH,
  LibClang.Ext.Basic.SourceManagerH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Lex.MacroInfoU
  ;

type

  { MacroInfoHelper }

  MacroInfoHelper = type helper for MacroInfo
    function getDefinitionLoc(const Ctx: ASTContext): CXSourceLocation;
    function getDefinitionEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getDefinitionLength(const SM: SourceManager): Cardinal;
    function isIdenticalTo(const Other: MacroInfo; const PP: Preprocessor; Syntactically: Boolean): Boolean;
    function param_empty: Boolean;
    function getNumParams: Cardinal;
    function getParams(i: Cardinal): IdentifierInfo;
    function getParameterNum(const Arg: IdentifierInfo): Integer;
    function isFunctionLike: Boolean;
    function isObjectLike: Boolean;
    function isC99Varargs: Boolean;
    function isGNUVarargs: Boolean;
    function isVariadic: Boolean;
    function isBuiltinMacro: Boolean;
    function hasCommaPasting: Boolean;
    function isUsed: Boolean;
    function isAllowRedefinitionsWithoutWarning: Boolean;
    function isWarnIfUnused: Boolean;
    function getNumTokens: Cardinal;
    function getReplacementToken(Tok: Cardinal): LexToken;
    function tokens_empty: Boolean;
    function getTokens(i: Cardinal): LexToken;
    function isEnabled: Boolean;
    function isUsedForHeaderGuard: Boolean;
  end;

implementation

{$region 'MacroInfoHelper'}

function MacroInfoHelper.getDefinitionLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_MacroInfo_getDefinitionLoc(Self, Ctx);
end;

function MacroInfoHelper.getDefinitionEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_MacroInfo_getDefinitionEndLoc(Self, Ctx);
end;

function MacroInfoHelper.getDefinitionLength(const SM: SourceManager): Cardinal;
begin
  Result := clangExt_MacroInfo_getDefinitionLength(Self, SM);
end;

function MacroInfoHelper.isIdenticalTo(const Other: MacroInfo; const PP: Preprocessor; Syntactically: Boolean): Boolean;
begin
  Result := clangExt_MacroInfo_isIdenticalTo(Self, Other, PP, Syntactically);
end;

function MacroInfoHelper.param_empty: Boolean;
begin
  Result := clangExt_MacroInfo_param_empty(Self);
end;

function MacroInfoHelper.getNumParams: Cardinal;
begin
  Result := clangExt_MacroInfo_getNumParams(Self);
end;

function MacroInfoHelper.getParams(i: Cardinal): IdentifierInfo;
begin
  Result := clangExt_MacroInfo_getParams(Self, i);
end;

function MacroInfoHelper.getParameterNum(const Arg: IdentifierInfo): Integer;
begin
  Result := clangExt_MacroInfo_getParameterNum(Self, Arg);
end;

function MacroInfoHelper.isFunctionLike: Boolean;
begin
  Result := clangExt_MacroInfo_isFunctionLike(Self);
end;

function MacroInfoHelper.isObjectLike: Boolean;
begin
  Result := clangExt_MacroInfo_isObjectLike(Self);
end;

function MacroInfoHelper.isC99Varargs: Boolean;
begin
  Result := clangExt_MacroInfo_isC99Varargs(Self);
end;

function MacroInfoHelper.isGNUVarargs: Boolean;
begin
  Result := clangExt_MacroInfo_isGNUVarargs(Self);
end;

function MacroInfoHelper.isVariadic: Boolean;
begin
  Result := clangExt_MacroInfo_isVariadic(Self);
end;

function MacroInfoHelper.isBuiltinMacro: Boolean;
begin
  Result := clangExt_MacroInfo_isBuiltinMacro(Self);
end;

function MacroInfoHelper.hasCommaPasting: Boolean;
begin
  Result := clangExt_MacroInfo_hasCommaPasting(Self);
end;

function MacroInfoHelper.isUsed: Boolean;
begin
  Result := clangExt_MacroInfo_isUsed(Self);
end;

function MacroInfoHelper.isAllowRedefinitionsWithoutWarning: Boolean;
begin
  Result := clangExt_MacroInfo_isAllowRedefinitionsWithoutWarning(Self);
end;

function MacroInfoHelper.isWarnIfUnused: Boolean;
begin
  Result := clangExt_MacroInfo_isWarnIfUnused(Self);
end;

function MacroInfoHelper.getNumTokens: Cardinal;
begin
  Result := clangExt_MacroInfo_getNumTokens(Self);
end;

function MacroInfoHelper.getReplacementToken(Tok: Cardinal): LexToken;
begin
  Result := clangExt_MacroInfo_getReplacementToken(Self, Tok);
end;

function MacroInfoHelper.tokens_empty: Boolean;
begin
  Result := clangExt_MacroInfo_tokens_empty(Self);
end;

function MacroInfoHelper.getTokens(i: Cardinal): LexToken;
begin
  Result := clangExt_MacroInfo_getTokens(Self, i);
end;

function MacroInfoHelper.isEnabled: Boolean;
begin
  Result := clangExt_MacroInfo_isEnabled(Self);
end;

function MacroInfoHelper.isUsedForHeaderGuard: Boolean;
begin
  Result := clangExt_MacroInfo_isUsedForHeaderGuard(Self);
end;
          
{$endregion 'MacroInfoHelper'}

end.

