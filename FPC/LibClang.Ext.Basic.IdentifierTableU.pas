unit LibClang.Ext.Basic.IdentifierTableU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.Basic.TokenKindsH;

function clangExt_IdentifierInfo_getNameStart(const I: IdentifierInfo): PChar; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getLength(const I: IdentifierInfo): Cardinal; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getName(const I: IdentifierInfo): CXString; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_hasMacroDefinition(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_hadMacroDefinition(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isDeprecatedMacro(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isRestrictExpansion(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isFinal(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getTokenID(const I: IdentifierInfo): Tok_TokenKind; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_hasRevertedTokenIDToIdentifier(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getPPKeywordID(const I: IdentifierInfo): Tok_PPKeywordKind; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getObjCKeywordID(const I: IdentifierInfo): Tok_ObjCKeywordKind; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getBuiltinID(const I: IdentifierInfo): Cardinal; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getObjCOrBuiltinID(const I: IdentifierInfo): Cardinal; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isExtensionToken(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isFutureCompatKeyword(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isPoisoned(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isCPlusPlusOperatorKeyword(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isKeyword(const I: IdentifierInfo; const LangOpts: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isCPlusPlusKeyword(const I: IdentifierInfo; const LangOpts: LangOptions): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_getFETokenInfo(const I: IdentifierInfo): Pointer; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isHandleIdentifierCase(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isFromAST(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_hasChangedSinceDeserialization(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_hasFETokenInfoChangedSinceDeserialization(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isOutOfDate(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isModulesImport(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isMangledOpenMPVariantName(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isEditorPlaceholder(const I: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_isReserved(const I: IdentifierInfo; const LangOpts: LangOptions): ReservedIdentifierStatus; cdecl; external LibClang_dll;
function clangExt_IdentifierInfo_deuglifiedName(const I: IdentifierInfo): CXString; cdecl; external LibClang_dll;

implementation

end.

