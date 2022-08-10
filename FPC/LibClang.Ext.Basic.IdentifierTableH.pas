unit LibClang.Ext.Basic.IdentifierTableH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  ReservedIdentifierStatus = type Integer;
  ReservedIdentifierStatusHelper = type helper for ReservedIdentifierStatus
  public const
    NotReserved = 0;
    StartsWithUnderscoreAtGlobalScope = 1;
    StartsWithUnderscoreAndIsExternC = 2;
    StartsWithDoubleUnderscore = 3;
    StartsWithUnderscoreFollowedByCapitalLetter = 4;
    ContainsDoubleUnderscore = 5;
  end;

  IdentifierInfo = type Pointer;

implementation

end.

