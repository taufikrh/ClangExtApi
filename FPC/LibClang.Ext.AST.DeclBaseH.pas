unit LibClang.Ext.AST.DeclBaseH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}
{$minenumsize 4}

interface

{$region 'Declaration'}

type
  CX_DeclKind = type Integer;

  { CX_DeclKindHelper }

  CX_DeclKindHelper = type helper for CX_DeclKind
  public const
    Invalid = -1;

    {$i Decl_Kind_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
  end;

type
  TemplateParameterList = type Pointer;

type
  DeclContext = type Pointer;
  Decl = type Pointer;

{$endregion 'Declaration'}

type
  CX_Decl_ModuleOwnershipKind = type Integer;
  CX_Decl_ModuleOwnershipKind_Helper = type helper for CX_Decl_ModuleOwnershipKind
  public const
    Unowned = 0;
    Visible = 1;
    VisibleWhenImported = 2;
    ReachableWhenImported = 3;
    ModulePrivate = 4;
  end;

  CX_Decl_FriendObjectKind = type Integer;
  CX_Decl_FriendObjectKindHelper = type helper for CX_Decl_FriendObjectKind
  public const
    FOK_None = 0;       ///< Not a friend object.
    FOK_Declared = 1;   ///< A friend of a previously-declared entity.
    FOK_Undeclared = 2; ///< A friend of a previously-undeclared entity.
  end;

  CX_Decl_ObjCDeclQualifier = type Cardinal;
  CX_Decl_ObjCDeclQualifier_Helper = type helper for CX_Decl_ObjCDeclQualifier
  public const
    OBJC_TQ_None = $0;
    OBJC_TQ_In = $1;
    OBJC_TQ_Inout = $2;
    OBJC_TQ_Out = $4;
    OBJC_TQ_Bycopy = $8;
    OBJC_TQ_Byref = $10;
    OBJC_TQ_Oneway = $20;

    /// The nullability qualifier is set when the nullability of the
    /// result or parameter was expressed via a context-sensitive
    /// keyword.
    OBJC_TQ_CSNullability = $40;
  end;

  ASTDumpOutputFormat = (
    ADOF_Default,
    ADOF_JSON
  );

implementation

uses
  SysUtils;

{$region 'CX_DeclKindHelper'}

{ CX_DeclKindHelper }

function CX_DeclKindHelper.Value: Integer;
begin
  Result := Self;
end;

function CX_DeclKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i Decl_Kind_impl.inc}

    Invalid: Result := 'Invalid';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{$endregion 'CX_DeclKindHelper'}

end.

