unit LibClang.Ext.Basic.LinkageH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  /// Describes the different kinds of linkage
  /// (C++ [basic.link], C99 6.2.2) that an entity may have.
  Linkage = type Byte;
  LinkageHelper = type helper for Linkage
  public const
    /// No linkage, which means that the entity is unique and
    /// can only be referred to from within its scope.
    NoLinkage = 0;

    /// Internal linkage, which indicates that the entity can
    /// be referred to from within the translation unit (but not other
    /// translation units).
    InternalLinkage = 1;

    /// External linkage within a unique namespace.
    ///
    /// From the language perspective, these entities have external
    /// linkage. However, since they reside in an anonymous namespace,
    /// their names are unique to this translation unit, which is
    /// equivalent to having internal linkage from the code-generation
    /// point of view.
    UniqueExternalLinkage = 2;

    /// No linkage according to the standard, but is visible from other
    /// translation units because of types defined in a inline function.
    VisibleNoLinkage = 3;

    /// Internal linkage according to the Modules TS, but can be referred
    /// to from other translation units indirectly through inline functions and
    /// templates in the module interface.
    ModuleInternalLinkage = 4;

    /// Module linkage, which indicates that the entity can be referred
    /// to from other translation units within the same module, and indirectly
    /// from arbitrary other translation units through inline functions and
    /// templates in the module interface.
    ModuleLinkage = 5;

    /// External linkage, which indicates that the entity can
    /// be referred to from other translation units.
    ExternalLinkage = 6;
  end;

  LanguageLinkage = type Integer;

  { LanguageLinkageHelper }

  LanguageLinkageHelper = type helper for LanguageLinkage
  public const
    CLanguageLinkage = 0;
    CXXLanguageLinkage = 1;
    NoLanguageLinkage = 2;
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

implementation

uses
  SysUtils;

{ LanguageLinkageHelper }

function LanguageLinkageHelper.Value: Integer;
begin
  Result := Self;
end;

function LanguageLinkageHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    CLanguageLinkage: Result := 'CLanguageLinkage';
    CXXLanguageLinkage: Result := 'CXXLanguageLinkage';
    NoLanguageLinkage: Result := 'NoLanguageLinkage';
  else
    Result := 'Unknow';
  end;
  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

