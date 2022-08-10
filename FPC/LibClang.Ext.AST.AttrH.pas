unit LibClang.Ext.AST.AttrH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

type
  CX_AttributeCommonInfoKind = type Integer;

  { CX_AttributeCommonInfoKind_Helper }

  CX_AttributeCommonInfoKind_Helper = type helper for CX_AttributeCommonInfoKind
  public const
    {$i AttributeCommonInfo_Kind_h.inc}  
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
  end;

  CX_AttributeCommonInfoSyntax = type Integer;
  CX_AttributeCommonInfoSyntax_Helper = type helper for CX_AttributeCommonInfoSyntax
  public const
    AS_GNU = 0;
    AS_CXX11 = 1;
    AS_C2x = 2;
    AS_Declspec = 3;
    AS_Microsoft = 4;
    AS_Keyword = 5;
    AS_Pragma = 6;
    AS_ContextSensitiveKeyword = 7;
    AS_HLSLSemantic = 8;
  end;

  CX_AttrKind = type Integer;

  { CX_AttrKindHelper }

  CX_AttrKindHelper = type helper for CX_AttrKind
  public const
    Invalid = -1;

    {$i Attr_Kind_h.inc}
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
    function IsTypeAttr: Boolean; inline;
    function IsStmtAttr: Boolean; inline;
    function IsDeclOrStmtAttr: Boolean; inline;
    function IsInheritableAttr: Boolean; inline;
    function IsDeclOrTypeAttr: Boolean; inline;
    function IsInheritableParamAttr: Boolean; inline;
    function IsParameterABIAttr: Boolean; inline;
  end;

  AlignedAttr_Spelling = type Integer;

  { AlignedAttr_Spelling_Helper }

  AlignedAttr_Spelling_Helper = type helper for AlignedAttr_Spelling
  public const
    GNU_aligned = 0;
    CXX11_gnu_aligned = 1;
    C2x_gnu_aligned = 2;
    Declspec_align = 3;
    Keyword_alignas_ = 4;
    Keyword_Alignas = 5;
    SpellingNotCalculated = 15;
  public
    function Value: Integer; inline;
    function ToString(aShowType: Boolean = True): string;
  end;
              
  // ---------------------------------------------------------------------------
  AttributeCommonInfo = type Pointer;
  Attr = type AttributeCommonInfo;
  TypeAttr = type Attr;
  StmtAttr = type Attr;
  InheritableAttr = type Attr;
  DeclOrStmtAttr = type InheritableAttr;
  InheritableParamAttr = type InheritableAttr;
  ParameterABIAttr = type InheritableParamAttr;
  // ---------------------------------------------------------------------------
  AlignedAttr = type InheritableAttr; // 698
  AnnotateAttr = type InheritableParamAttr; // 928
  DLLExportAttr = type InheritableAttr; // 3228
  DLLImportAttr = type InheritableAttr; // 3279  
  ExternalSourceSymbolAttr = type InheritableAttr; // 3968
  MSNoVTableAttr = type InheritableAttr; // 5309
  MaxFieldAlignmentAttr  = type InheritableAttr; // 5425
  SelectAnyAttr = type InheritableAttr; // 10281
  StdCallAttr = type InheritableAttr; // 10352
  UuidAttr = type InheritableAttr; // 11978
  // ---------------------------------------------------------------------------

implementation

uses
  SysUtils;

{ CX_AttributeCommonInfoKind_Helper }

function CX_AttributeCommonInfoKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function CX_AttributeCommonInfoKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i AttributeCommonInfo_Kind_impl.inc}

  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{$region 'CX_AttrKindHelper'}

function CX_AttrKindHelper.Value: Integer;
begin
  Result := Self;
end;

function CX_AttrKindHelper.ToString(aShowType: Boolean): string;
begin
  case Self of
    {$i Attr_Kind_impl.inc}

    Invalid: Result := 'Invalid';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function CX_AttrKindHelper.IsTypeAttr: Boolean;
begin
  Result := (Self >= FirstTypeAttr) and (Self <= LastTypeAttr);
end;

function CX_AttrKindHelper.IsStmtAttr: Boolean;
begin
  Result := (Self >= FirstStmtAttr) and (Self <= LastStmtAttr);
end;

function CX_AttrKindHelper.IsDeclOrStmtAttr: Boolean;
begin
  Result := (Self >= FirstDeclOrStmtAttr) and (Self <= LastDeclOrStmtAttr);
end;

function CX_AttrKindHelper.IsInheritableAttr: Boolean;
begin
  Result := (Self >= FirstInheritableAttr) and (Self <= LastInheritableAttr);
end;

function CX_AttrKindHelper.IsDeclOrTypeAttr: Boolean;
begin
  Result := (Self >= FirstDeclOrTypeAttr) and (Self <= LastDeclOrTypeAttr);
end;

function CX_AttrKindHelper.IsInheritableParamAttr: Boolean;
begin
  Result := (Self >= FirstInheritableParamAttr) and (Self <= LastInheritableParamAttr);
end;

function CX_AttrKindHelper.IsParameterABIAttr: Boolean;
begin
  Result := (Self >= FirstParameterABIAttr) and (Self <= LastParameterABIAttr);
end;

{$endregion 'CX_AttrKindHelper'}

{$region 'AlignedAttr_Spelling_Helper'}

function AlignedAttr_Spelling_Helper.Value: Integer;
begin
  Result := Self;
end;

function AlignedAttr_Spelling_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    GNU_aligned: Result := 'GNU_aligned';
    CXX11_gnu_aligned: Result := 'CXX11_gnu_aligned';
    C2x_gnu_aligned: Result := 'C2x_gnu_aligned';
    Declspec_align: Result := 'Declspec_align';
    Keyword_alignas_: Result := 'Keyword_alignas';
    Keyword_Alignas: Result := 'Keyword_Alignas';
    SpellingNotCalculated: Result := 'SpellingNotCalculated';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
     
{$endregion 'AlignedAttr_Spelling_Helper'}

end.

