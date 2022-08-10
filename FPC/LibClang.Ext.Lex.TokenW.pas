unit LibClang.Ext.Lex.TokenW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.TokenKindsH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Lex.TokenU
  ;

type

  { TokenHelper }

  TokenHelper = type helper for LexToken
  public
    procedure Dispose;
    function getKind: tok_TokenKind;
    function isA(K: tok_TokenKind): Boolean;
    function isNot(K: tok_TokenKind): Boolean;
    function isOneOf(K1: tok_TokenKind; K2: tok_TokenKind): Boolean;
    function isAnyIdentifier: Boolean;
    function isLiteral: Boolean;
    function isAnnotation: Boolean;
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    function getLength: Cardinal;
    function getAnnotationEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLastLoc(const Ctx: ASTContext): CXSourceLocation;
    function getEndLoc(const Ctx: ASTContext): CXSourceLocation;
    function getAnnotationRange(const Ctx: ASTContext): CXSourceRange;
    function getName: string;
    function getIdentifierInfo: IdentifierInfo;
    function getEofData: Pointer;
    function getRawIdentifier: string;
    function getLiteralData: PChar;
    function getAnnotationValue: Pointer;
    function getFlag(Flag: TokenFlags): Boolean;
    function getFlags: Cardinal;
    function isAtStartOfLine: Boolean;
    function hasLeadingSpace: Boolean;
    function isExpandDisabled: Boolean;
    function isObjCAtKeyword(objcKey: tok_ObjCKeywordKind): Boolean;
    function getObjCKeywordID: tok_ObjCKeywordKind;
    function needsCleaning: Boolean;
    function hasLeadingEmptyMacro: Boolean;
    function hasUDSuffix: Boolean;
    function hasUCN: Boolean;
    function stringifiedInMacro: Boolean;
    function commaAfterElided: Boolean;
    function isEditorPlaceholder: Boolean;
  public
    class procedure DisposeTokenPtr(var Tokens: PLexToken; var NumTokens: Cardinal) static;
  end;

  PPConditionalInfoHelper = type helper for PPConditionalInfo
    function IfLoc(const Ctx: ASTContext): CXSourceLocation;
    function WasSkipping: Boolean;
    function FoundNonSkip: Boolean;
    function FoundElse: Boolean;
  end;

implementation

uses
  LibClang.Extended;

{$region 'TokenHelper'}

procedure TokenHelper.Dispose;
begin
  clangExt_Token_Dispose(Self);
  Self := nil;
end;

function TokenHelper.getKind: tok_TokenKind;
begin
  Result := clangExt_Token_getKind(Self);
end;

function TokenHelper.isA(K: tok_TokenKind): Boolean;
begin
  Result := clangExt_Token_is(Self, K);
end;

function TokenHelper.isNot(K: tok_TokenKind): Boolean;
begin
  Result := clangExt_Token_isNot(Self, K);
end;

function TokenHelper.isOneOf(K1: tok_TokenKind; K2: tok_TokenKind): Boolean;
begin
  Result := clangExt_Token_isOneOf(Self, K1, K2);
end;

function TokenHelper.isAnyIdentifier: Boolean;
begin
  Result := clangExt_Token_isAnyIdentifier(Self);
end;

function TokenHelper.isLiteral: Boolean;
begin
  Result := clangExt_Token_isLiteral(Self);
end;

function TokenHelper.isAnnotation: Boolean;
begin
  Result := clangExt_Token_isAnnotation(Self);
end;

function TokenHelper.getLocation(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Token_getLocation(Self, Ctx);
end;

function TokenHelper.getLength: Cardinal;
begin
  Result := clangExt_Token_getLength(Self);
end;

function TokenHelper.getAnnotationEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Token_getAnnotationEndLoc(Self, Ctx);
end;

function TokenHelper.getLastLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Token_getLastLoc(Self, Ctx);
end;

function TokenHelper.getEndLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Token_getEndLoc(Self, Ctx);
end;

function TokenHelper.getAnnotationRange(const Ctx: ASTContext): CXSourceRange;
begin
  Result := clangExt_Token_getAnnotationRange(Self, Ctx);
end;

function TokenHelper.getName: string;
begin
  Result := StrPas(clangExt_Token_getName(Self));
end;

function TokenHelper.getIdentifierInfo: IdentifierInfo;
begin
  Result := clangExt_Token_getIdentifierInfo(Self);
end;

function TokenHelper.getEofData: Pointer;
begin
  Result := clangExt_Token_getEofData(Self);
end;

function TokenHelper.getRawIdentifier: string;
begin
  Result := clangExt_Token_getRawIdentifier(Self).ToString;
end;

function TokenHelper.getLiteralData: PChar;
begin
  Result := clangExt_Token_getLiteralData(Self);
end;

function TokenHelper.getAnnotationValue: Pointer;
begin
  Result := clangExt_Token_getAnnotationValue(Self);
end;

function TokenHelper.getFlag(Flag: TokenFlags): Boolean;
begin
  Result := clangExt_Token_getFlag(Self, Flag);
end;

function TokenHelper.getFlags: Cardinal;
begin
  Result := clangExt_Token_getFlags(Self);
end;

function TokenHelper.isAtStartOfLine: Boolean;
begin
  Result := clangExt_Token_isAtStartOfLine(Self);
end;

function TokenHelper.hasLeadingSpace: Boolean;
begin
  Result := clangExt_Token_hasLeadingSpace(Self);
end;

function TokenHelper.isExpandDisabled: Boolean;
begin
  Result := clangExt_Token_isExpandDisabled(Self);
end;

function TokenHelper.isObjCAtKeyword(objcKey: tok_ObjCKeywordKind): Boolean;
begin
  Result := clangExt_Token_isObjCAtKeyword(Self, objcKey);
end;

function TokenHelper.getObjCKeywordID: tok_ObjCKeywordKind;
begin
  Result := clangExt_Token_getObjCKeywordID(Self);
end;

function TokenHelper.needsCleaning: Boolean;
begin
  Result := clangExt_Token_needsCleaning(Self);
end;

function TokenHelper.hasLeadingEmptyMacro: Boolean;
begin
  Result := clangExt_Token_hasLeadingEmptyMacro(Self);
end;

function TokenHelper.hasUDSuffix: Boolean;
begin
  Result := clangExt_Token_hasUDSuffix(Self);
end;

function TokenHelper.hasUCN: Boolean;
begin
  Result := clangExt_Token_hasUCN(Self);
end;

function TokenHelper.stringifiedInMacro: Boolean;
begin
  Result := clangExt_Token_stringifiedInMacro(Self);
end;

function TokenHelper.commaAfterElided: Boolean;
begin
  Result := clangExt_Token_commaAfterElided(Self);
end;

function TokenHelper.isEditorPlaceholder: Boolean;
begin
  Result := clangExt_Token_isEditorPlaceholder(Self);
end;

class procedure TokenHelper.DisposeTokenPtr(var Tokens: PLexToken;
  var NumTokens: Cardinal);
begin
  if Assigned(Tokens) then
  begin
    clangExt_disposeTokenPtrs(Tokens, NumTokens);
    Tokens := nil;
    NumTokens := 0;
  end;
end;

{$endregion 'TokenHelper'}
  
{$region 'PPConditionalInfoHelper'}

function PPConditionalInfoHelper.IfLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_PPConditionalInfo_IfLoc(Self, Ctx);
end;

function PPConditionalInfoHelper.WasSkipping: Boolean;
begin
  Result := clangExt_PPConditionalInfo_WasSkipping(Self);
end;

function PPConditionalInfoHelper.FoundNonSkip: Boolean;
begin
  Result := clangExt_PPConditionalInfo_FoundNonSkip(Self);
end;

function PPConditionalInfoHelper.FoundElse: Boolean;
begin
  Result := clangExt_PPConditionalInfo_FoundElse(Self);
end;
 
{$endregion 'PPConditionalInfoHelper'}

end.

