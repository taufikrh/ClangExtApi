unit LibClang.Ext.Basic.TokenKindsW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.Basic.TokenKindsH;

type
  { Tok_TokenKind_Helper }

  Tok_TokenKind_Helper = type helper for Tok_TokenKind
  public const
    {$i Tok_TokenKinds_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
  public
    function getTokenName: string;
    function getPunctuatorSpelling: string;
    function getKeywordSpelling: string;
    function isAnyIdentifier: Boolean;
    function isStringLiteral: Boolean;
    function isLiteral: Boolean;
    function isAnnotation: Boolean;
    function isPragmaAnnotation: Boolean;
  end;

  { Tok_PPKeywordKind_Helper }

  Tok_PPKeywordKind_Helper = type helper for Tok_PPKeywordKind
  public const
    {$i Tok_PPKeywordKind_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;   
  public
    function getPPKeywordSpelling: string;
  end;

  { Tok_ObjCKeywordKind_Helper }

  Tok_ObjCKeywordKind_Helper = type helper for Tok_ObjCKeywordKind
  public const
    {$i ObjCKeywordKind_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
  end;

implementation

uses
  SysUtils,
  LibClang.Ext.Basic.TokenKindsU;

{ Tok_TokenKind_Helper }

function Tok_TokenKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function Tok_TokenKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i Tok_TokenKinds_impl.inc}
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function Tok_TokenKind_Helper.getTokenName: string;
begin
  Result := StrPas(clangExt_TokenKind_getTokenName(Self));
end;

function Tok_TokenKind_Helper.getPunctuatorSpelling: string;
begin
  Result := StrPas(clangExt_TokenKind_getPunctuatorSpelling(Self));
end;

function Tok_TokenKind_Helper.getKeywordSpelling: string;
begin
  Result := StrPas(clangExt_TokenKind_getKeywordSpelling(Self));
end;

function Tok_TokenKind_Helper.isAnyIdentifier: Boolean;
begin
  Result := clangExt_TokenKind_isAnyIdentifier(Self);
end;

function Tok_TokenKind_Helper.isStringLiteral: Boolean;
begin
  Result := clangExt_TokenKind_isStringLiteral(Self);
end;

function Tok_TokenKind_Helper.isLiteral: Boolean;
begin
  Result := clangExt_TokenKind_isLiteral(Self);
end;

function Tok_TokenKind_Helper.isAnnotation: Boolean;
begin
  Result := clangExt_TokenKind_isAnnotation(Self);
end;

function Tok_TokenKind_Helper.isPragmaAnnotation: Boolean;
begin
  Result := clangExt_TokenKind_isPragmaAnnotation(Self);
end;

{ Tok_PPKeywordKind_Helper }

function Tok_PPKeywordKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function Tok_PPKeywordKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i Tok_PPKeywordKind_impl.inc}
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function Tok_PPKeywordKind_Helper.getPPKeywordSpelling: string;
begin
  Result := StrPas(clangExt_PPKeywordKind_getPPKeywordSpelling(Self));
end;

{ Tok_ObjCKeywordKind_Helper }

function Tok_ObjCKeywordKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function Tok_ObjCKeywordKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i ObjCKeywordKind_impl.inc}
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

