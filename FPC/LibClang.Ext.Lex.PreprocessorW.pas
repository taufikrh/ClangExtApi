unit LibClang.Ext.Lex.PreprocessorW;

{$mode ObjFPC}{$H+} 
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Lex.PreprocessingRecordH,
  LibClang.Ext.Lex.PreprocessorU,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Lex.MacroInfoH,
  LibClang.Ext.Lex.TokenH,
  LibClang.Ext.Basic.TargetInfoH,
  LibClang.Ext.Basic.LangOptionsH
  ;

type

  { PreprocessorHelper }

  PreprocessorHelper = type helper for Preprocessor
    function getLangOpts: LangOptions;
    function getTargetInfo: TargetInfo;
    function getAuxTargetInfo: TargetInfo;
    function getNumDirectives: Cardinal;
    function getTokenCount: Cardinal;
    function getNumMacros: Cardinal;

    function isMacroDefined(Id: string): Boolean;
    function isMacroDefinedByIdentifierInfo(const II: IdentifierInfo): Boolean;
    function getMacroInfo(const II: IdentifierInfo): MacroInfo;

    function getIdentifierInfo(Name: string): IdentifierInfo;
    function getPreprocessingRecord: PreprocessingRecord;
    function getRawToken(Loc: CXSourceLocation; out Ret: LexToken; IgnoreWhiteSpace: Boolean = False): Boolean; // dispose with clangExt_Token_Dispose
    function LookUpIdentifierInfo(const Identifier: LexToken): IdentifierInfo;
    function isRecordingPreamble: Boolean;
    function hasRecordedPreamble: Boolean;
    function getNumPreambleConditionalStack: Cardinal;
    function getPreambleConditionalStack(i: Cardinal): PPConditionalInfo;
  end;

implementation

{ PreprocessorHelper }

function PreprocessorHelper.getLangOpts: LangOptions;
begin
  Result := clangExt_Preprocessor_getLangOpts(Self);
end;

function PreprocessorHelper.getTargetInfo: TargetInfo;
begin
  Result := clangExt_Preprocessor_getTargetInfo(Self);
end;

function PreprocessorHelper.getAuxTargetInfo: TargetInfo;
begin
  Result := clangExt_Preprocessor_getAuxTargetInfo(Self);
end;

function PreprocessorHelper.getNumDirectives: Cardinal;
begin
  Result := clangExt_Preprocessor_getNumDirectives(Self);
end;

function PreprocessorHelper.getTokenCount: Cardinal;
begin
  Result := clangExt_Preprocessor_getTokenCount(Self);
end;

function PreprocessorHelper.getNumMacros: Cardinal;
begin
  Result := clangExt_Preprocessor_getNumMacros(Self);
end;

function PreprocessorHelper.isMacroDefined(Id: string): Boolean;
begin
  Result := clangExt_Preprocessor_isMacroDefined(Self, CXString.CreateRef(Id));
end;

function PreprocessorHelper.isMacroDefinedByIdentifierInfo(
  const II: IdentifierInfo): Boolean;
begin
  Result := clangExt_Preprocessor_isMacroDefinedByIdentifierInfo(Self, II);
end;

function PreprocessorHelper.getMacroInfo(const II: IdentifierInfo): MacroInfo;
begin
  Result := clangExt_Preprocessor_getMacroInfo(Self, II);
end;

function PreprocessorHelper.getIdentifierInfo(Name: string): IdentifierInfo;
begin
  Result := clangExt_Preprocessor_getIdentifierInfo(Self, CXString.CreateRef(Name));
end;
    
function PreprocessorHelper.getPreprocessingRecord: PreprocessingRecord;
begin
  Result := clangExt_Preprocessor_getPreprocessingRecord(Self);
end;

function PreprocessorHelper.getRawToken(Loc: CXSourceLocation; out
  Ret: LexToken; IgnoreWhiteSpace: Boolean): Boolean;
begin
  Result := clangExt_Preprocessor_getRawToken(Self, Loc, @Ret, IgnoreWhiteSpace);
end;

function PreprocessorHelper.LookUpIdentifierInfo(const Identifier: LexToken
  ): IdentifierInfo;
begin
  Result := clangExt_Preprocessor_LookUpIdentifierInfo(Self, Identifier);
end;

function PreprocessorHelper.isRecordingPreamble: Boolean;
begin
  Result := clangExt_Preprocessor_isRecordingPreamble(Self);
end;

function PreprocessorHelper.hasRecordedPreamble: Boolean;
begin
  Result := clangExt_Preprocessor_hasRecordedPreamble(Self);
end;

function PreprocessorHelper.getNumPreambleConditionalStack: Cardinal;
begin
  Result := clangExt_Preprocessor_getNumPreambleConditionalStack(Self);
end;

function PreprocessorHelper.getPreambleConditionalStack(i: Cardinal
  ): PPConditionalInfo;
begin
  Result := clangExt_Preprocessor_getPreambleConditionalStack(Self, i);
end;

end.

