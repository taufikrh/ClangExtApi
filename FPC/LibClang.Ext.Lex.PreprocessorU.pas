unit LibClang.Ext.Lex.PreprocessorU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Lex.PreprocessingRecordH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Lex.MacroInfoH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Basic.TargetInfoH,
  LibClang.Ext.Basic.LangOptionsH;

function clangExt_Preprocessor_getLangOpts(const p: Preprocessor): LangOptions; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getTargetInfo(const p: Preprocessor): TargetInfo; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getAuxTargetInfo(const p: Preprocessor): TargetInfo; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getNumDirectives(const p: Preprocessor): Cardinal; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getTokenCount(const p: Preprocessor): Cardinal; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getNumMacros(const p: Preprocessor): Cardinal; cdecl; external LibClang_dll;

function clangExt_Preprocessor_isMacroDefined(const p: Preprocessor; Id: CXString): Boolean; cdecl; external LibClang_dll;
function clangExt_Preprocessor_isMacroDefinedByIdentifierInfo(const p: Preprocessor; const II: IdentifierInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getMacroInfo(const p: Preprocessor; const II: IdentifierInfo): MacroInfo; cdecl; external LibClang_dll;

function clangExt_Preprocessor_getIdentifierInfo(const p: Preprocessor; Name: CXString): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getPreprocessingRecord(const p: Preprocessor): PreprocessingRecord; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getRawToken(const p: Preprocessor; Loc: CXSourceLocation; const Result: PLexToken; IgnoreWhiteSpace: Boolean = False): Boolean; cdecl; external LibClang_dll; // dispose with clangExt_Token_Dispose
function clangExt_Preprocessor_LookUpIdentifierInfo(const p: Preprocessor; const Identifier: LexToken): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_Preprocessor_isRecordingPreamble(const p: Preprocessor): Boolean; cdecl; external LibClang_dll;
function clangExt_Preprocessor_hasRecordedPreamble(const p: Preprocessor): Boolean; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getNumPreambleConditionalStack(const p: Preprocessor): Cardinal; cdecl; external LibClang_dll;
function clangExt_Preprocessor_getPreambleConditionalStack(const p: Preprocessor; i: Cardinal): PPConditionalInfo; cdecl; external LibClang_dll;


implementation

end.

