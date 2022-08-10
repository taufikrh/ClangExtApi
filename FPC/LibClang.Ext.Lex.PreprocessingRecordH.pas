unit LibClang.Ext.Lex.PreprocessingRecordH;

{$mode ObjFPC}{$H+}  
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  PreprocessedEntity = type Pointer;
  PreprocessingDirective = type PreprocessedEntity;
  InclusionDirective = type PreprocessingDirective;
  MacroDefinitionRecord = type PreprocessingDirective;
  MacroExpansion = type PreprocessedEntity;

  PreprocessingRecord = type Pointer;

  /// The kind of preprocessed entity an object describes.
  PreprocessedEntityKind = type Integer;

  { PreprocessedEntityKindHelper }

  PreprocessedEntityKindHelper = type helper for PreprocessedEntityKind
  public const
    /// Indicates a problem trying to load the preprocessed entity.
    InvalidKind = 0;

    /// A macro expansion.
    MacroExpansionKind = 1;

    /// \defgroup Preprocessing directives
    /// @{

    /// A macro definition.
    MacroDefinitionKind = 2;

    /// An inclusion directive, such as \c \#include, \c
    /// \#import, or \c \#include_next.
    InclusionDirectiveKind = 3;

    /// @}

    FirstPreprocessingDirective = MacroDefinitionKind;
    LastPreprocessingDirective = InclusionDirectiveKind;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  InclusionDirectiveKind = type Integer;

  { InclusionDirectiveKindHelper }

  InclusionDirectiveKindHelper = type helper for InclusionDirectiveKind
  public const
    /// An \c \#include directive.
    Include = 0;

    /// An Objective-C \c \#import directive.
    Import = 1;

    /// A GNU \c \#include_next directive.
    IncludeNext = 2;

    /// A Clang \c \#__include_macros directive.
    IncludeMacros = 3;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

implementation

uses
  SysUtils;

{ InclusionDirectiveKindHelper }

function InclusionDirectiveKindHelper.Value: Integer;
begin
  Result := Self;
end;

function InclusionDirectiveKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    Include: Result := 'Include';
    Import: Result := 'Import';
    IncludeNext: Result := 'IncludeNext';
    IncludeMacros: Result := 'IncludeMacros';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ PreprocessedEntityKindHelper }

function PreprocessedEntityKindHelper.Value: Integer;
begin
  Result := Self;
end;

function PreprocessedEntityKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    InvalidKind: Result := 'Invalid';
    MacroExpansionKind: Result := 'MacroExpansion';
    MacroDefinitionKind: Result := 'MacroDefinition';
    InclusionDirectiveKind: Result := 'InclusionDirective';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

