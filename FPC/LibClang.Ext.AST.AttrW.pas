unit LibClang.Ext.AST.AttrW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.AttrU,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.AST.TypeH
  ;

type

  TAttributeCommonInfoW = object
    A: Attr;   
  public
    function getParsedKind: CX_AttributeCommonInfoKind;
    function getSyntax: CX_AttributeCommonInfoSyntax;
    function getAttrName: IdentifierInfo;
    function getLoc(const ctx: ASTContext): CXSourceLocation;
    function getRange(const ctx: ASTContext): CXSourceRange;
    function hasScope: Boolean;
    function getScopeName: IdentifierInfo;
    function getScopeLoc(const ctx: ASTContext): CXSourceLocation;
    function getNormalizedFullName: string;
    function isDeclspecAttribute: Boolean;
    function isMicrosoftAttribute: Boolean;
    function isGNUScope: Boolean;
    function isAlignasAttribute: Boolean;
    function isCXX11Attribute: Boolean;
    function isC2xAttribute: Boolean;
    function isStandardAttributeSyntax: Boolean;
    function isKeywordAttribute: Boolean;
    function isContextSensitiveKeywordAttribute: Boolean;
    function getAttributeSpellingListIndex: Cardinal;
  end; 

  TAttrW = object(TAttributeCommonInfoW)
  public
    class function Create(attrIn: Attr; out AttrOut: TAttrW): Boolean; static;
  public
    function getKind: CX_AttrKind;
    function getSpellingListIndex: Cardinal;
    function getSpelling: string;
    function getLocation(const ctx: ASTContext): CXSourceLocation;
    function isInherited: Boolean;
    function isImplicit: Boolean;
    function isPackExpansion: Boolean;
    function isLateParsed: Boolean;
    function printPretty(Policy: CXPrintingPolicy): string;
  end;
  PAttrW = ^TAttrW;

  TTypeAttrW = object(TAttrW)
  public
    class function Create(attrIn: TypeAttr; out AttrOut: TTypeAttrW): Boolean; static;
  public
    class function classof(attrIn: TAttrW): Boolean; static;
  end;

  TStmtAttrW = object(TAttrW)
  public
    class function Create(attrIn: StmtAttr; out AttrOut: TStmtAttrW): Boolean; static;
  public
    class function classof(attrIn: TAttrW): Boolean; static;
  end;

  TInheritableAttrW = object(TAttrW)
  public
    class function Create(attrIn: InheritableAttr; out AttrOut: TInheritableAttrW): Boolean; static;
  public
    function shouldInheritEvenIfAlreadyPresent: Boolean;
    class function classof(attrIn: TAttrW): Boolean; static;
  end;    

  TDeclOrStmtAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: DeclOrStmtAttr; out AttrOut: TDeclOrStmtAttrW): Boolean; static;
  public
    class function classof(attrIn: TAttrW): Boolean; static;
  end; 

  TInheritableParamAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: InheritableParamAttr; out AttrOut: TInheritableParamAttrW): Boolean; static;
  public
    class function classof(attrIn: TAttrW): Boolean; static;
  end;     

  TParameterABIAttrW = object(TInheritableParamAttrW)
  public
    class function Create(attrIn: ParameterABIAttr; out AttrOut: TParameterABIAttrW): Boolean; static;
  public
    function getABI: ParameterABI;
    class function classof(attrIn: TAttrW): Boolean; static;
  end;  

  { TAlignedAttrW }

  TAlignedAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: AlignedAttr; out AttrOut: TAlignedAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function getSemanticSpelling: AlignedAttr_Spelling;
    function isGNU: Boolean;
    function isC11: Boolean;
    function isAlignas: Boolean;
    function isDeclspec: Boolean;
    function isAlignmentDependent: Boolean;
    function isAlignmentErrorDependent: Boolean;
    function getAlignment(const Ctx: ASTContext): Cardinal;
    function isAlignmentExpr: Boolean;
    function getAlignmentExpr: Expr;
    function getAlignmentType: TypeSourceInfo;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TAnnotateAttrW }

  TAnnotateAttrW = object(TInheritableParamAttrW)
  public
    class function Create(attrIn: AnnotateAttr; out AttrOut: TAnnotateAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function getAnnotation: string;
    function getAnnotationLength: Cardinal;
    function args_size: Cardinal;
    function arg(i: Cardinal): Expr;
    function delayedArgs_size: Cardinal;
    function delayedArg(i: Cardinal): Expr;
    class function classof(attrIn: TAttrW): Boolean; static;
  end;

  { TDLLImportAttrW }

  TDLLImportAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: DLLImportAttr; out AttrOut: TDLLImportAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function wasPropagatedToBaseTemplate: Boolean;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TDLLExportAttrW }

  TDLLExportAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: DLLExportAttr; out AttrOut: TDLLExportAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;
  { TExternalSourceSymbolAttrW }

  TExternalSourceSymbolAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: ExternalSourceSymbolAttr; out AttrOut: TExternalSourceSymbolAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function getLanguage: string;
    function getLanguageLength: Cardinal;
    function getDefinedIn: string;
    function getDefinedInLength: Cardinal;
    function getGeneratedDeclaration: Boolean;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TMSNoVTableAttrW }

  TMSNoVTableAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: MSNoVTableAttr; out AttrOut: TMSNoVTableAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TMaxFieldAlignmentAttrW }

  TMaxFieldAlignmentAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: MaxFieldAlignmentAttr; out AttrOut: TMaxFieldAlignmentAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function getAlignment: Cardinal;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TSelectAnyAttrW }

  TSelectAnyAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: SelectAnyAttr; out AttrOut: TSelectAnyAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TStdCallAttrW }

  TStdCallAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: StdCallAttr; out AttrOut: TStdCallAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

  { TUuidAttrW }

  TUuidAttrW = object(TInheritableAttrW)
  public
    class function Create(attrIn: UuidAttr; out AttrOut: TUuidAttrW): Boolean; static;
  public
    function printPretty(Policy: CXPrintingPolicy): string;
    function getSpelling: string;
    function getGuid: string;
    function getGuidLength: Cardinal;
    function getGuidDecl: MSGuidDecl;
    class function classof(AttrIn: TAttrW): Boolean; static;
  end;

{$region 'Helper'}

  AttrHelper = type helper for Attr
    function Wrap(out A: TAttrW): Boolean;
  end;

  TypeAttrHelper = type helper for TypeAttr
    function Wrap(out A: TTypeAttrW): Boolean;
  end;       

  StmtAttrHelper = type helper for StmtAttr
    function Wrap(out A: TStmtAttrW): Boolean;
  end;

  InheritableAttrHelper = type helper for InheritableAttr
    function Wrap(out A: TInheritableAttrW): Boolean;
  end;

  DeclOrStmtAttrHelper = type helper for DeclOrStmtAttr
    function Wrap(out A: TDeclOrStmtAttrW): Boolean;
  end;

  InheritableParamAttrHelper = type helper for InheritableParamAttr
    function Wrap(out A: TInheritableParamAttrW): Boolean;
  end;

  ParameterABIAttrHelper = type helper for ParameterABIAttr
    function Wrap(out A: TParameterABIAttrW): Boolean;
  end;

  AnnotateAttrHelper = type helper for AnnotateAttr
    function Wrap(out A: TAnnotateAttrW): Boolean;
  end;
{$endregion 'Helper'}

implementation

uses
  SysUtils;

{$region 'Helper'}

function AttrHelper.Wrap(out A: TAttrW): Boolean;
begin    
  Result := TAttrW.Create(Self, A);
end;

function TypeAttrHelper.Wrap(out A: TTypeAttrW): Boolean;
begin
  Result := TTypeAttrW.Create(Self, A);
end;

function StmtAttrHelper.Wrap(out A: TStmtAttrW): Boolean;
begin
  Result := TStmtAttrW.Create(Self, A);
end;

function InheritableAttrHelper.Wrap(out A: TInheritableAttrW): Boolean;
begin
  Result := TInheritableAttrW.Create(Self, A);
end;
      
function DeclOrStmtAttrHelper.Wrap(out A: TDeclOrStmtAttrW): Boolean;
begin
  Result := TDeclOrStmtAttrW.Create(Self, A);
end;
    
function InheritableParamAttrHelper.Wrap(out A: TInheritableParamAttrW
  ): Boolean;
begin
  Result := TInheritableParamAttrW.Create(Self, A);
end;

function ParameterABIAttrHelper.Wrap(out A: TParameterABIAttrW): Boolean;
begin
  Result := TParameterABIAttrW.Create(Self, A);
end;

function AnnotateAttrHelper.Wrap(out A: TAnnotateAttrW): Boolean;
begin
  Result := TAnnotateAttrW.Create(Self, A);
end;

{$endregion 'Helper'}

{$region 'TAttributeCommonInfoW'}

function TAttributeCommonInfoW.getParsedKind: CX_AttributeCommonInfoKind;
begin
  Result := clangExt_AttributeCommonInfo_getParsedKind(A);
end;

function TAttributeCommonInfoW.getSyntax: CX_AttributeCommonInfoSyntax;
begin
  Result := clangExt_AttributeCommonInfo_getSyntax(A);
end;

function TAttributeCommonInfoW.getAttrName: IdentifierInfo;
begin
  Result := clangExt_AttributeCommonInfo_getAttrName(A);
end;

function TAttributeCommonInfoW.getLoc(const ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_AttributeCommonInfo_getLoc(A, ctx);
end;

function TAttributeCommonInfoW.getRange(const ctx: ASTContext): CXSourceRange;
begin
  Result := clangExt_AttributeCommonInfo_getRange(A, ctx);
end;

function TAttributeCommonInfoW.hasScope: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_hasScope(A);
end;

function TAttributeCommonInfoW.getScopeName: IdentifierInfo;
begin
  Result := clangExt_AttributeCommonInfo_getScopeName(A);
end;

function TAttributeCommonInfoW.getScopeLoc(const ctx: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_AttributeCommonInfo_getScopeLoc(A, ctx);
end;

function TAttributeCommonInfoW.getNormalizedFullName: string;
begin
  Result := clangExt_AttributeCommonInfo_getNormalizedFullName(A).ToString;
end;

function TAttributeCommonInfoW.isDeclspecAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isDeclspecAttribute(A);
end;

function TAttributeCommonInfoW.isMicrosoftAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isMicrosoftAttribute(A);
end;

function TAttributeCommonInfoW.isGNUScope: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isGNUScope(A);
end;

function TAttributeCommonInfoW.isAlignasAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isAlignasAttribute(A);
end;

function TAttributeCommonInfoW.isCXX11Attribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isCXX11Attribute(A);
end;

function TAttributeCommonInfoW.isC2xAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isC2xAttribute(A);
end;

function TAttributeCommonInfoW.isStandardAttributeSyntax: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isStandardAttributeSyntax(A);
end;

function TAttributeCommonInfoW.isKeywordAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isKeywordAttribute(A);
end;

function TAttributeCommonInfoW.isContextSensitiveKeywordAttribute: Boolean;
begin
  Result := clangExt_AttributeCommonInfo_isContextSensitiveKeywordAttribute(A);
end;

function TAttributeCommonInfoW.getAttributeSpellingListIndex: Cardinal;
begin
  Result := clangExt_AttributeCommonInfo_getAttributeSpellingListIndex(A);
end;  

{$endregion 'TAttributeCommonInfoW'}

{$region 'TAttrW'}

class function TAttrW.Create(attrIn: Attr; out AttrOut: TAttrW): Boolean;
begin          
  Result := False;
  AttrOut := Default(TAttrW);
  if not Assigned(attrIn) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TAttrW.getKind: CX_AttrKind;
begin
  Result := clangExt_Attr_getKind(A);
end;

function TAttrW.getSpellingListIndex: Cardinal;
begin
  Result := clangExt_Attr_getSpellingListIndex(A);
end;

function TAttrW.getSpelling: string;
var
  p: PChar;
begin
  p := clangExt_Attr_getSpelling(A);
  if Assigned(p) then
    Result := StrPas(p)
  else
    Result := EmptyStr;
end;

function TAttrW.getLocation(const ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_Attr_getLocation(A, Ctx);
end;

function TAttrW.isInherited: Boolean;
begin
  Result := clangExt_Attr_isInherited(A);
end;

function TAttrW.isImplicit: Boolean;
begin
  Result := clangExt_Attr_isImplicit(A);
end;

function TAttrW.isPackExpansion: Boolean;
begin
  Result := clangExt_Attr_isPackExpansion(A);
end;

function TAttrW.isLateParsed: Boolean;
begin
  Result := clangExt_Attr_isLateParsed(A);
end;

function TAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_Attr_printPretty(A, Policy).ToString;
end;

{$endregion 'TAttrW'}

{$region 'TTypeAttrW'}

class function TTypeAttrW.Create(attrIn: TypeAttr; out AttrOut: TTypeAttrW
  ): Boolean;
begin
  Result := False;
  AttrOut := Default(TTypeAttrW);
  if (not Assigned(attrIn)) or (not clangExt_TypeAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

class function TTypeAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_TypeAttr_classof(attrIn.A);
end;  

{$endregion 'TTypeAttrW'}
               
{$region 'TStmtAttrW'}

class function TStmtAttrW.Create(attrIn: StmtAttr; out AttrOut: TStmtAttrW
  ): Boolean;
begin
  Result := False;
  AttrOut := Default(TStmtAttrW);
  if (not Assigned(attrIn)) or (not clangExt_StmtAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

class function TStmtAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_StmtAttr_classof(attrIn.A);
end;    

{$endregion 'TStmtAttrW'}

{$region 'TInheritableAttrW'}

class function TInheritableAttrW.Create(attrIn: InheritableAttr; out
  AttrOut: TInheritableAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TInheritableAttrW);
  if (not Assigned(attrIn)) or (not clangExt_InheritableAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TInheritableAttrW.shouldInheritEvenIfAlreadyPresent: Boolean;
begin
  Result := clangExt_InheritableAttr_shouldInheritEvenIfAlreadyPresent(A);
end;

class function TInheritableAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_InheritableAttr_classof(attrIn.A);
end;

{$endregion 'TInheritableAttrW'}

{$region 'TDeclOrStmtAttrW'}

class function TDeclOrStmtAttrW.Create(attrIn: DeclOrStmtAttr; out
  AttrOut: TDeclOrStmtAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TDeclOrStmtAttrW);
  if (not Assigned(attrIn)) or (not clangExt_DeclOrStmtAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

class function TDeclOrStmtAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_DeclOrStmtAttr_classof(attrIn.A);
end;  

{$endregion 'TDeclOrStmtAttrW'}

{$region 'TInheritableParamAttrW'}

class function TInheritableParamAttrW.Create(attrIn: InheritableParamAttr; out
  AttrOut: TInheritableParamAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TInheritableParamAttrW);
  if (not Assigned(attrIn)) or (not clangExt_InheritableParamAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

class function TInheritableParamAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_InheritableParamAttr_classof(attrIn.A);
end;       

{$endregion 'TInheritableParamAttrW'}

{$region 'TInheritableParamAttrW'}

class function TParameterABIAttrW.Create(attrIn: ParameterABIAttr; out
  AttrOut: TParameterABIAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TParameterABIAttrW);
  if (not Assigned(attrIn)) or (not clangExt_ParameterABIAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TParameterABIAttrW.getABI: ParameterABI;
begin
  Result := clangExt_ParameterABIAttr_getABI(A);
end;

class function TParameterABIAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_ParameterABIAttr_classof(attrIn.A);
end;   

{$endregion 'TParameterABIAttrW'}

{$region 'TAlignedAttrW'}

class function TAlignedAttrW.Create(attrIn: AlignedAttr; out
  AttrOut: TAlignedAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TAlignedAttrW);
  if (not Assigned(attrIn)) or (not clangExt_AlignedAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TAlignedAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_AlignedAttr_printPretty(A, Policy).ToString;
end;

function TAlignedAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_AlignedAttr_getSpelling(A));
end;

function TAlignedAttrW.getSemanticSpelling: AlignedAttr_Spelling;
begin
  Result := clangExt_AlignedAttr_getSemanticSpelling(A);
end;

function TAlignedAttrW.isGNU: Boolean;
begin
  Result := clangExt_AlignedAttr_isGNU(A);
end;

function TAlignedAttrW.isC11: Boolean;
begin
  Result := clangExt_AlignedAttr_isC11(A);
end;

function TAlignedAttrW.isAlignas: Boolean;
begin
  Result := clangExt_AlignedAttr_isAlignas(A);
end;

function TAlignedAttrW.isDeclspec: Boolean;
begin
  Result := clangExt_AlignedAttr_isDeclspec(A);
end;

function TAlignedAttrW.isAlignmentDependent: Boolean;
begin
  Result := clangExt_AlignedAttr_isAlignmentDependent(A);
end;

function TAlignedAttrW.isAlignmentErrorDependent: Boolean;
begin
  Result := clangExt_AlignedAttr_isAlignmentErrorDependent(A);
end;

function TAlignedAttrW.getAlignment(const Ctx: ASTContext): Cardinal;
begin
  Result := clangExt_AlignedAttr_getAlignment(A, Ctx);
end;

function TAlignedAttrW.isAlignmentExpr: Boolean;
begin
  Result := clangExt_AlignedAttr_isAlignmentExpr(A);
end;

function TAlignedAttrW.getAlignmentExpr: Expr;
begin
  Result := clangExt_AlignedAttr_getAlignmentExpr(A);
end;

function TAlignedAttrW.getAlignmentType: TypeSourceInfo;
begin
  Result := clangExt_AlignedAttr_getAlignmentType(A);
end;

class function TAlignedAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_AlignedAttr_classof(AttrIn.A);
end;

{$endregion 'TAlignedAttrW'}

{$region 'TAnnotateAttrW'}

class function TAnnotateAttrW.Create(attrIn: AnnotateAttr; out
  AttrOut: TAnnotateAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TAnnotateAttrW);
  if (not Assigned(attrIn)) or (not clangExt_AnnotateAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TAnnotateAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_AnnotateAttr_printPretty(A, Policy).ToString;
end;

function TAnnotateAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_AnnotateAttr_getSpelling(A)) ;
end;

function TAnnotateAttrW.getAnnotation: string;
begin
  Result := clangExt_AnnotateAttr_getAnnotation(A).ToString;
end;

function TAnnotateAttrW.getAnnotationLength: Cardinal;
begin
  Result := clangExt_AnnotateAttr_getAnnotationLength(A);
end;

function TAnnotateAttrW.args_size: Cardinal;
begin
  Result := clangExt_AnnotateAttr_args_size(A);
end;

function TAnnotateAttrW.arg(i: Cardinal): Expr;
begin
  Result := clangExt_AnnotateAttr_arg(A, i);
end;

function TAnnotateAttrW.delayedArgs_size: Cardinal;
begin
  Result := clangExt_AnnotateAttr_delayedArgs_size(A);
end;

function TAnnotateAttrW.delayedArg(i: Cardinal): Expr;
begin
  Result := clangExt_AnnotateAttr_delayedArg(A, i);
end;

class function TAnnotateAttrW.classof(attrIn: TAttrW): Boolean;
begin
  Result := clangExt_AnnotateAttr_classof(attrIn.A);
end;   

{$endregion 'TAnnotateAttrW'}

{$region 'TDLLExportAttrW'}

class function TDLLExportAttrW.Create(attrIn: DLLExportAttr; out
  AttrOut: TDLLExportAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TDLLExportAttrW);
  if (not Assigned(attrIn)) or (not clangExt_DLLExportAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TDLLExportAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_DLLExportAttr_printPretty(A, Policy).ToString;
end;

function TDLLExportAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_DLLExportAttr_getSpelling(A));
end;

class function TDLLExportAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_DLLExportAttr_classof(AttrIn.A);
end;
    
{$endregion 'TDLLExportAttrW'}

{$region 'TDLLImportAttrW'}

class function TDLLImportAttrW.Create(attrIn: DLLImportAttr; out
  AttrOut: TDLLImportAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TDLLImportAttrW);
  if (not Assigned(attrIn)) or (not clangExt_DLLImportAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TDLLImportAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_DLLImportAttr_printPretty(A, Policy).ToString;
end;

function TDLLImportAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_DLLImportAttr_getSpelling(A));
end;

function TDLLImportAttrW.wasPropagatedToBaseTemplate: Boolean;
begin
  Result := clangExt_DLLImportAttr_wasPropagatedToBaseTemplate(A);
end;

class function TDLLImportAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_DLLImportAttr_classof(AttrIn.A);
end;

{$endregion 'TDLLImportAttrW'}

{$region 'TExternalSourceSymbolAttrW'}

class function TExternalSourceSymbolAttrW.Create(
  attrIn: ExternalSourceSymbolAttr; out AttrOut: TExternalSourceSymbolAttrW
  ): Boolean;
begin
  Result := False;
  AttrOut := Default(TExternalSourceSymbolAttrW);
  if (not Assigned(attrIn)) or (not clangExt_ExternalSourceSymbolAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TExternalSourceSymbolAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_ExternalSourceSymbolAttr_printPretty(A, Policy).ToString;
end;

function TExternalSourceSymbolAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_ExternalSourceSymbolAttr_getSpelling(A));
end;

function TExternalSourceSymbolAttrW.getLanguage: string;
begin
  Result := clangExt_ExternalSourceSymbolAttr_getLanguage(A).ToString;
end;

function TExternalSourceSymbolAttrW.getLanguageLength: Cardinal;
begin
  Result := clangExt_ExternalSourceSymbolAttr_getLanguageLength(A);
end;

function TExternalSourceSymbolAttrW.getDefinedIn: string;
begin
  Result := clangExt_ExternalSourceSymbolAttr_getDefinedIn(A).ToString;
end;

function TExternalSourceSymbolAttrW.getDefinedInLength: Cardinal;
begin
  Result := clangExt_ExternalSourceSymbolAttr_getDefinedInLength(A);
end;

function TExternalSourceSymbolAttrW.getGeneratedDeclaration: Boolean;
begin
  Result := clangExt_ExternalSourceSymbolAttr_getGeneratedDeclaration(A);
end;

class function TExternalSourceSymbolAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_ExternalSourceSymbolAttr_classof(AttrIn.A);
end;

{$endregion 'TExternalSourceSymbolAttrW'}

{$region 'TMSNoVTableAttrW'}

class function TMSNoVTableAttrW.Create(attrIn: MSNoVTableAttr; out
  AttrOut: TMSNoVTableAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TMSNoVTableAttrW);
  if (not Assigned(attrIn)) or (not clangExt_MSNoVTableAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TMSNoVTableAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_MSNoVTableAttr_printPretty(A, Policy).ToString;
end;

function TMSNoVTableAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_MSNoVTableAttr_getSpelling(A));
end;

class function TMSNoVTableAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_MSNoVTableAttr_classof(AttrIn.A);
end;      

{$endregion 'TMSNoVTableAttrW'}

{$region 'TMaxFieldAlignmentAttrW'}

class function TMaxFieldAlignmentAttrW.Create(attrIn: MaxFieldAlignmentAttr;
  out AttrOut: TMaxFieldAlignmentAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TMaxFieldAlignmentAttrW);
  if (not Assigned(attrIn)) or (not clangExt_MaxFieldAlignmentAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TMaxFieldAlignmentAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_MaxFieldAlignmentAttr_printPretty(A, Policy).ToString;
end;

function TMaxFieldAlignmentAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_MaxFieldAlignmentAttr_getSpelling(A));
end;

function TMaxFieldAlignmentAttrW.getAlignment: Cardinal;
begin
  Result := clangExt_MaxFieldAlignmentAttr_getAlignment(A);
end;

class function TMaxFieldAlignmentAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_MaxFieldAlignmentAttr_classof(AttrIn.A);
end;
     
{$endregion 'TMaxFieldAlignmentAttrW'}

{$region 'TSelectAnyAttrW'}

class function TSelectAnyAttrW.Create(attrIn: SelectAnyAttr; out
  AttrOut: TSelectAnyAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TSelectAnyAttrW);
  if (not Assigned(attrIn)) or (not clangExt_SelectAnyAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TSelectAnyAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_SelectAnyAttr_printPretty(A, Policy).ToString;
end;

function TSelectAnyAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_SelectAnyAttr_getSpelling(A));
end;

class function TSelectAnyAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_SelectAnyAttr_classof(AttrIn.A);
end;

{$endregion 'TSelectAnyAttrW'}

{$region 'TStdCallAttrW'}

class function TStdCallAttrW.Create(attrIn: StdCallAttr; out
  AttrOut: TStdCallAttrW): Boolean;
begin
  Result := False;
  AttrOut := Default(TStdCallAttrW);
  if (not Assigned(attrIn)) or (not clangExt_StdCallAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TStdCallAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_StdCallAttr_printPretty(A, Policy).ToString;
end;

function TStdCallAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_StdCallAttr_getSpelling(A));
end;

class function TStdCallAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_StdCallAttr_classof(AttrIn.A);
end;
      
{$endregion 'TStdCallAttrW'}

{$region 'TUuidAttrW'}

class function TUuidAttrW.Create(attrIn: UuidAttr; out AttrOut: TUuidAttrW
  ): Boolean;
begin
  Result := False;
  AttrOut := Default(TUuidAttrW);
  if (not Assigned(attrIn)) or (not clangExt_UuidAttr_classof(attrIn)) then
    Exit;

  AttrOut.A := attrIn;
  Result := True;
end;

function TUuidAttrW.printPretty(Policy: CXPrintingPolicy): string;
begin
  Result := clangExt_UuidAttr_printPretty(A, Policy).ToString;
end;

function TUuidAttrW.getSpelling: string;
begin
  Result := StrPas(clangExt_UuidAttr_getSpelling(A));
end;

function TUuidAttrW.getGuid: string;
begin
  Result := clangExt_UuidAttr_getGuid(A).ToString;
end;

function TUuidAttrW.getGuidLength: Cardinal;
begin
  Result := clangExt_UuidAttr_getGuidLength(A);
end;

function TUuidAttrW.getGuidDecl: MSGuidDecl;
begin
  Result := clangExt_UuidAttr_getGuidDecl(A);
end;

class function TUuidAttrW.classof(AttrIn: TAttrW): Boolean;
begin
  Result := clangExt_UuidAttr_classof(AttrIn.A);
end;

{$endregion 'TUuidAttrW'}

end.

