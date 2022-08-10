unit LibClang.Ext.Frontend.ASTUnitW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Helper,

  LibClang.Ext.Frontend.ASTUnitH,
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Frontend.ASTUnitU;

type

  TGetTokensVisitorProc = function (const t: LexToken; args: TCXClientDataArray): Boolean;
  TGetTokensVisitorMethod = function (const t: LexToken; args: TCXClientDataArray): Boolean of object;

  { ASTUnitHelper }

  ASTUnitHelper = type helper for ASTUnit
    function getPreprocessorPtr: Preprocessor;
    function getMainFileName: string;
    function getTokens(event: TGetTokensVisitorMethod; Range: CXSourceRange; createToken: Boolean = False; args: TCXClientDataArray = []): Boolean; overload;
    function getTokens(event: TGetTokensVisitorProc; Range: CXSourceRange; createToken: Boolean = False; args: TCXClientDataArray = []): Boolean; overload;
    function getTokenPtrsFromSourceRange(Range: CXSourceRange; out Tokens: PLexToken; out NumTokens: Cardinal): Boolean; // clangExt_disposeTokenPtrs
    function getTokenPtrsFromSourceLocation(Location: CXSourceLocation; out Tokens: PLexToken; out NumTokens: Cardinal): Boolean; // clangExt_disposeTokenPtrs
  end;

implementation

uses
  LibClang.Extended;

{ ASTUnitHelper }

function ASTUnitHelper.getPreprocessorPtr: Preprocessor;
begin
  Result := clangExt_ASTUnit_getPreprocessorPtr(Self);
end;

function ASTUnitHelper.getMainFileName: string;
begin
  Result := clangExt_ASTUnit_getMainFileName(Self).ToString;
end;

type
  TInternal_GetTokensVisitor_Event = record
    eMethod: TGetTokensVisitorMethod;
    eProc: TGetTokensVisitorProc;
    args: TCXClientDataArray;
  end;
  PInternal_GetTokensVisitor_Event = ^TInternal_GetTokensVisitor_Event;

function _Internal_GetTokensVisitor(
  const t: LexToken; client_data: CXClientData
  ): Boolean; cdecl;
var
  e: PInternal_GetTokensVisitor_Event absolute client_data;
begin
  if Assigned(e^.eMethod) then
    Result := e^.eMethod(t, e^.args)
  else
    Result := e^.eProc(t, e^.args);
end;

function ASTUnitHelper.getTokens(event: TGetTokensVisitorMethod;
  Range: CXSourceRange; createToken: Boolean; args: TCXClientDataArray
  ): Boolean;
var
  e: TInternal_GetTokensVisitor_Event;
begin
  e.eMethod := event;
  e.eProc := nil;
  e.args := args;
  Result := clangExt_getTokens(Self, Range, @_Internal_GetTokensVisitor, @e, createToken);
end;

function ASTUnitHelper.getTokens(event: TGetTokensVisitorProc;
  Range: CXSourceRange; createToken: Boolean; args: TCXClientDataArray
  ): Boolean;
var
  e: TInternal_GetTokensVisitor_Event;
begin
  e.eMethod := nil;
  e.eProc := event;
  e.args := args;
  Result := clangExt_getTokens(Self, Range, @_Internal_GetTokensVisitor, @e, createToken);
end;

function ASTUnitHelper.getTokenPtrsFromSourceRange(Range: CXSourceRange; out
  Tokens: PLexToken; out NumTokens: Cardinal): Boolean;
begin
  Result := clangExt_getTokenPtrsFromSourceRange(Self, Range, Tokens, NumTokens);
end;

function ASTUnitHelper.getTokenPtrsFromSourceLocation(
  Location: CXSourceLocation; out Tokens: PLexToken; out NumTokens: Cardinal
  ): Boolean;
begin
  Result := clangExt_getTokenPtrsFromSourceLocation(Self, Location, Tokens, NumTokens);
end;

end.

