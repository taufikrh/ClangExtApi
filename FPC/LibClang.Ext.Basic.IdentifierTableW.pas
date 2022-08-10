unit LibClang.Ext.Basic.IdentifierTableW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Basic.TokenKindsH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.Basic.IdentifierTableU;

type

  { IdentifierInfoHelper }

  IdentifierInfoHelper = type helper for IdentifierInfo
  public
    function getNameStart: PChar;
    function getLength: Cardinal;
    function getName: string;
    function hasMacroDefinition: Boolean;
    function hadMacroDefinition: Boolean;
    function isDeprecatedMacro: Boolean;
    function isRestrictExpansion: Boolean;
    function isFinal: Boolean;
    function getTokenID: Tok_TokenKind;
    function hasRevertedTokenIDToIdentifier: Boolean;
    function getPPKeywordID: Tok_PPKeywordKind;
    function getObjCKeywordID: Tok_ObjCKeywordKind;
    function getBuiltinID: Cardinal;
    function getObjCOrBuiltinID: Cardinal;
    function isExtensionToken: Boolean;
    function isFutureCompatKeyword: Boolean;
    function isPoisoned: Boolean;
    function isCPlusPlusOperatorKeyword: Boolean;
    function isKeyword(const LangOpts: LangOptions): Boolean;
    function isCPlusPlusKeyword(const LangOpts: LangOptions): Boolean;
    function getFETokenInfo: Pointer;
    function isHandleIdentifierCase: Boolean;
    function isFromAST: Boolean;
    function hasChangedSinceDeserialization: Boolean;
    function hasFETokenInfoChangedSinceDeserialization: Boolean;
    function isOutOfDate: Boolean;
    function isModulesImport: Boolean;
    function isMangledOpenMPVariantName: Boolean;
    function isEditorPlaceholder: Boolean;
    function isReserved(const LangOpts: LangOptions): ReservedIdentifierStatus;
    function deuglifiedName: string;
  end;

implementation

{ IdentifierInfoHelper }

function IdentifierInfoHelper.getNameStart: PChar;
begin
  Result := clangExt_IdentifierInfo_getNameStart(Self);
end;

function IdentifierInfoHelper.getLength: Cardinal;
begin
  Result := clangExt_IdentifierInfo_getLength(Self);
end;

function IdentifierInfoHelper.getName: string;
begin
  Result := clangExt_IdentifierInfo_getName(Self).ToString;
end;

function IdentifierInfoHelper.hasMacroDefinition: Boolean;
begin
  Result := clangExt_IdentifierInfo_hasMacroDefinition(Self);
end;

function IdentifierInfoHelper.hadMacroDefinition: Boolean;
begin
  Result := clangExt_IdentifierInfo_hadMacroDefinition(Self);
end;

function IdentifierInfoHelper.isDeprecatedMacro: Boolean;
begin
  Result := clangExt_IdentifierInfo_isDeprecatedMacro(Self);
end;

function IdentifierInfoHelper.isRestrictExpansion: Boolean;
begin
  Result := clangExt_IdentifierInfo_isRestrictExpansion(Self);
end;

function IdentifierInfoHelper.isFinal: Boolean;
begin
  Result := clangExt_IdentifierInfo_isFinal(Self);
end;

function IdentifierInfoHelper.getTokenID: Tok_TokenKind;
begin
  Result := clangExt_IdentifierInfo_getTokenID(Self);
end;

function IdentifierInfoHelper.hasRevertedTokenIDToIdentifier: Boolean;
begin
  Result := clangExt_IdentifierInfo_hasRevertedTokenIDToIdentifier(Self);
end;

function IdentifierInfoHelper.getPPKeywordID: Tok_PPKeywordKind;
begin
  Result := clangExt_IdentifierInfo_getPPKeywordID(Self);
end;

function IdentifierInfoHelper.getObjCKeywordID: Tok_ObjCKeywordKind;
begin
  Result := clangExt_IdentifierInfo_getObjCKeywordID(Self);
end;

function IdentifierInfoHelper.getBuiltinID: Cardinal;
begin
  Result := clangExt_IdentifierInfo_getBuiltinID(Self);
end;

function IdentifierInfoHelper.getObjCOrBuiltinID: Cardinal;
begin
  Result := clangExt_IdentifierInfo_getObjCOrBuiltinID(Self);
end;

function IdentifierInfoHelper.isExtensionToken: Boolean;
begin
  Result := clangExt_IdentifierInfo_isExtensionToken(Self);
end;

function IdentifierInfoHelper.isFutureCompatKeyword: Boolean;
begin
  Result := clangExt_IdentifierInfo_isFutureCompatKeyword(Self);
end;

function IdentifierInfoHelper.isPoisoned: Boolean;
begin
  Result := clangExt_IdentifierInfo_isPoisoned(Self);
end;

function IdentifierInfoHelper.isCPlusPlusOperatorKeyword: Boolean;
begin
  Result := clangExt_IdentifierInfo_isCPlusPlusOperatorKeyword(Self);
end;

function IdentifierInfoHelper.isKeyword(const LangOpts: LangOptions): Boolean;
begin
  Result := clangExt_IdentifierInfo_isKeyword(Self, LangOpts);
end;

function IdentifierInfoHelper.isCPlusPlusKeyword(const LangOpts: LangOptions
  ): Boolean;
begin
  Result := clangExt_IdentifierInfo_isCPlusPlusKeyword(Self, LangOpts);
end;

function IdentifierInfoHelper.getFETokenInfo: Pointer;
begin
  Result := clangExt_IdentifierInfo_getFETokenInfo(Self);
end;

function IdentifierInfoHelper.isHandleIdentifierCase: Boolean;
begin
  Result := clangExt_IdentifierInfo_isHandleIdentifierCase(Self);
end;

function IdentifierInfoHelper.isFromAST: Boolean;
begin
  Result := clangExt_IdentifierInfo_isFromAST(Self);
end;

function IdentifierInfoHelper.hasChangedSinceDeserialization: Boolean;
begin
  Result := clangExt_IdentifierInfo_hasChangedSinceDeserialization(Self);
end;

function IdentifierInfoHelper.hasFETokenInfoChangedSinceDeserialization: Boolean;
begin
  Result := clangExt_IdentifierInfo_hasFETokenInfoChangedSinceDeserialization(Self);
end;

function IdentifierInfoHelper.isOutOfDate: Boolean;
begin
  Result := clangExt_IdentifierInfo_isOutOfDate(Self);
end;

function IdentifierInfoHelper.isModulesImport: Boolean;
begin
  Result := clangExt_IdentifierInfo_isModulesImport(Self);
end;

function IdentifierInfoHelper.isMangledOpenMPVariantName: Boolean;
begin
  Result := clangExt_IdentifierInfo_isMangledOpenMPVariantName(Self);
end;

function IdentifierInfoHelper.isEditorPlaceholder: Boolean;
begin
  Result := clangExt_IdentifierInfo_isEditorPlaceholder(Self);
end;

function IdentifierInfoHelper.isReserved(const LangOpts: LangOptions
  ): ReservedIdentifierStatus;
begin
  Result := clangExt_IdentifierInfo_isReserved(Self, LangOpts);
end;

function IdentifierInfoHelper.deuglifiedName: string;
begin
  Result := clangExt_IdentifierInfo_deuglifiedName(Self).ToString;
end;

end.

