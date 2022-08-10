unit LibClang.Ext.Basic.VisibilityH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  Visibility = type Integer;
  VisibilityHelper = type helper for Visibility
  public const
    /// Objects with "hidden" visibility are not seen by the dynamic
    /// linker.
    HiddenVisibility = 0;

    /// Objects with "protected" visibility are seen by the dynamic
    /// linker but always dynamically resolve to an object within this
    /// shared object.
    ProtectedVisibility = 1;

    /// Objects with "default" visibility are seen by the dynamic linker
    /// and act like normal objects.
    DefaultVisibility = 2;
  end;

implementation

end.

