unit LibClang.Ext.Lex.TokenH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  LexToken = type Pointer;
  PLexToken = ^LexToken;

  TokenFlags = type Cardinal;
  TokenFlagsHelper = type helper for TokenFlags
  public const
    StartOfLine = $01;          // At start of line or only after whitespace
                                // (considering the line after macro expansion).
    LeadingSpace = $02;         // Whitespace exists before this token (considering
                                // whitespace after macro expansion).
    DisableExpand = $04;        // This identifier may never be macro expanded.
    NeedsCleaning = $08;        // Contained an escaped newline or trigraph.
    LeadingEmptyMacro = $10;    // Empty macro exists before this token.
    HasUDSuffix = $20;          // This string or character literal has a ud-suffix.
    HasUCN = $40;               // This identifier contains a UCN.
    IgnoredComma = $80;         // This comma is not a macro argument separator (MS).
    StringifiedInMacro = $100;  // This string or character literal is formed by
                                // macro stringizing or charizing operator.
    CommaAfterElided = $200;    // The comma following this token was elided (MS).
    IsEditorPlaceholder = $400; // This identifier is a placeholder.
    IsReinjected = $800;        // A phase 4 token that was produced before and
                                // re-added, e.g. via EnterTokenStream. Annotation
                                // tokens are *not* reinjected.
  end;

  PPConditionalInfo = type Pointer;

implementation

end.

