unit LibClang.Ext.AST.DeclH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.TypeH;

type
  TranslationUnitDecl = type Decl; // DeclContext 
  PragmaCommentDecl = type Decl;   
  PragmaDetectMismatchDecl = type Decl; 
  ExternCContextDecl = type Decl; // DeclContext
  NamedDecl = type Decl;
  PNamedDecl = ^NamedDecl;
  LabelDecl = type NamedDecl;   
  NamespaceDecl = type NamedDecl; // DeclContext  
  ValueDecl = type NamedDecl;   
  DeclaratorDecl = type ValueDecl;    
  VarDecl = type DeclaratorDecl;    
  ImplicitParamDecl = type VarDecl;    
  ParmVarDecl = type VarDecl;
  PParmVarDecl = ^ParmVarDecl;
  FunctionDecl = type DeclaratorDecl; // DeclContext  
  FieldDecl = type DeclaratorDecl;  
  EnumConstantDecl = type ValueDecl;   
  IndirectFieldDecl = type ValueDecl;   
  TypeDecl = type NamedDecl;    
  TypedefNameDecl = type TypeDecl;    
  TypedefDecl = type TypedefNameDecl; 
  TypeAliasDecl = type TypedefNameDecl;  
  TagDecl = type TypeDecl; // DeclContext  
  EnumDecl = type TagDecl;      
  RecordDecl = type TagDecl;  
  FileScopeAsmDecl = type Decl;    
  BlockDecl = type Decl; // DeclContext 
  CapturedDecl = type Decl; // DeclContext  
  ImportDecl = type Decl;      
  ExportDecl = type Decl; // DeclContext  
  EmptyDecl = type Decl;

  MultiVersionKind = type Integer;
  MultiVersionKindHelper = type helper for MultiVersionKind
  public const
    None = 0;
    Target = 1;
    CPUSpecific = 2;
    CPUDispatch = 3;
    TargetClones = 4;
  end;

{$region 'PragmaCommentDecl'}
  PragmaMSCommentKind = type Integer;
  PragmaMSCommentKindHelper = type helper for PragmaMSCommentKind
  public const
    PCK_Unknown = 0;
    PCK_Linker = 1;   // #pragma comment(linker, ...)
    PCK_Lib = 2;      // #pragma comment(lib, ...)
    PCK_Compiler = 3; // #pragma comment(compiler, ...)
    PCK_ExeStr = 4;   // #pragma comment(exestr, ...)
    PCK_User = 5;     // #pragma comment(user, ...)
  end;  
{$endregion 'PragmaCommentDecl'}

{$region 'VarDecl'}
  CX_VarDecl_TLSKind = type Integer;
  CX_VarDecl_TLSKind_Helper = type helper for CX_VarDecl_TLSKind
  public const
    TLS_None = 0;
    TLS_Static = 1;
    TLS_Dynamic = 2;
  end;

  CX_VarDecl_DefinitionKind = type Integer;

  { CX_VarDecl_DefinitionKind_Helper }

  CX_VarDecl_DefinitionKind_Helper = type helper for CX_VarDecl_DefinitionKind
  public const
    DeclarationOnly = 0;
    TentativeDefinition = 1;
    Definition = 2;
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  EvaluatedStmt = type Pointer;

  CX_VarDecl_InitializationStyle = type Integer;

  { CX_VarDecl_InitializationStyle_Helepr }

  CX_VarDecl_InitializationStyle_Helepr = type helper for CX_VarDecl_InitializationStyle
  public const
    CInit = 0;
    CallInit = 1;
    ListInit = 2;   
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;  
{$endregion 'VarDecl'}

{$region 'ImplicitParamDecl'}
  CX_ImplicitParamDecl_ImplicitParamKind = type Cardinal;
  CX_ImplicitParamDecl_ImplicitParamKindHelper = type helper for CX_ImplicitParamDecl_ImplicitParamKind
  public const
    /// Parameter for Objective-C 'self' argument
    ObjCSelf = 0;

    /// Parameter for Objective-C '_cmd' argument
    ObjCCmd = 1;

    /// Parameter for C++ 'this' argument
    CXXThis = 2;

    /// Parameter for C++ virtual table pointers
    CXXVTT = 3;

    /// Parameter for captured context
    CapturedContext = 4;

    /// Parameter for Thread private variable
    ThreadPrivateVar = 5;

    /// Other implicit parameter
    Other = 6;
  end;      
{$endregion 'ImplicitParamDecl'}

{$region 'FunctionDecl'}
type
  // TemplatedKind
  CX_FunctionDecl_TemplatedKind = type Integer;

  { CX_FunctionDecl_TemplatedKind_Helper }

  CX_FunctionDecl_TemplatedKind_Helper = type helper for CX_FunctionDecl_TemplatedKind
  public const
    // Not templated.
    TK_NonTemplate = 0;
    // The pattern in a function template declaration.
    TK_FunctionTemplate = 1;
    // A non-template function that is an instantiation or explicit
    // specialization of a member of a templated class.
    TK_MemberSpecialization = 2;
    // An instantiation or explicit specialization of a function template.
    // Note: this might have been instantiated from a templated class if it
    // is a class-scope explicit specialization.
    TK_FunctionTemplateSpecialization = 3;
    // A function template specialization that hasn't yet been resolved to a
    // particular specialized function template.
    TK_DependentFunctionTemplateSpecialization = 4;  
  public
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;    
{$endregion 'FunctionDecl'}
          
{$region 'TagDecl'}
type
  CX_TagDecl_TagKind = TagTypeKind;
{$endregion 'TagDecl'}
        
{$region 'RecordDecl'}
type
  CX_RecordDecl_ArgPassingKind = type Integer;
  CX_RecordDecl_ArgPassingKind_Helper = type helper for CX_RecordDecl_ArgPassingKind
  public const
    APK_CanPassInRegs = 0;

    /// The argument of this type cannot be passed directly in registers.
    /// Records containing this type as a subobject are not forced to be passed
    /// indirectly. This value is used only in C++. This value is required by
    /// C++ because, in uncommon situations, it is possible for a class to have
    /// only trivial copy/move constructors even when one of its subobjects has
    /// a non-trivial copy/move constructor (if e.g. the corresponding copy/move
    /// constructor in the derived class is deleted).
    APK_CannotPassInRegs = 1;

    /// The argument of this type cannot be passed directly in registers.
    /// Records containing this type as a subobject are forced to be passed
    /// indirectly.
    APK_CanNeverPassInRegs = 2;
  end;   
{$endregion 'RecordDecl'}
      
{$region 'BlockDecl'}
type
  BlockDecl_Capture = type Pointer;   
{$endregion 'BlockDecl'}

implementation

uses
  SysUtils;

{ CX_VarDecl_DefinitionKind_Helper }

function CX_VarDecl_DefinitionKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function CX_VarDecl_DefinitionKind_Helper.ToString(aShowType: Boolean): string;
begin
  case Self of
    DeclarationOnly: Result := 'DeclarationOnly';
    TentativeDefinition: Result := 'TentativeDefinition';
    Definition: Result := 'Definition';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CX_VarDecl_InitializationStyle_Helepr }

function CX_VarDecl_InitializationStyle_Helepr.Value: Integer;
begin
  Result := Self;
end;

function CX_VarDecl_InitializationStyle_Helepr.ToString(aShowType: Boolean
  ): string;
begin
  case Self of
    CInit: Result := 'CInit';
    CallInit: Result := 'CallInit';
    ListInit: Result := 'ListInit';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function CX_FunctionDecl_TemplatedKind_Helper.Value: Integer;
begin
  Result := Self;
end;

function CX_FunctionDecl_TemplatedKind_Helper.ToString(aShowType: Boolean
  ): string;
begin
  case Self of
    TK_NonTemplate: Result := 'NonTemplate';
    TK_FunctionTemplate: Result := 'FunctionTemplate';
    TK_MemberSpecialization: Result := 'MemberSpecialization';
    TK_FunctionTemplateSpecialization: Result := 'FunctionTemplateSpecialization';
    TK_DependentFunctionTemplateSpecialization: Result := 'DependentFunctionTemplateSpecialization';
  else
    Result := 'Unknow';
  end;

  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

