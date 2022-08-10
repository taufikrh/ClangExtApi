unit LibClang.Ext.AST.DeclCXXH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.DeclH;

type
  LinkageSpecDecl = type Decl; // DeclContext
  AccessSpecDecl = type Decl;
  CXXRecordDecl = type RecordDecl;
  CXXDeductionGuideDecl = type FunctionDecl;
  RequiresExprBodyDecl = type Decl; // DeclContext
  CXXMethodDecl = type FunctionDecl;
  CXXConstructorDecl = type CXXMethodDecl;
  CXXDestructorDecl = type CXXMethodDecl;
  CXXConversionDecl = type CXXMethodDecl;
  UsingDirectiveDecl = type NamedDecl;
  NamespaceAliasDecl = type NamedDecl;
  LifetimeExtendedTemporaryDecl = type Decl;
  UsingShadowDecl = type NamedDecl;
  BaseUsingDecl = type NamedDecl;
  UsingDecl = type BaseUsingDecl;
  ConstructorUsingShadowDecl = type UsingShadowDecl;
  UsingEnumDecl = type BaseUsingDecl;
  UsingPackDecl = type NamedDecl;
  UnresolvedUsingValueDecl = type ValueDecl;
  UnresolvedUsingTypenameDecl = type TypeDecl;
  UnresolvedUsingIfExistsDecl = type NamedDecl;
  StaticAssertDecl = type Decl;
  BindingDecl = type ValueDecl;
  DecompositionDecl = type VarDecl;
  MSPropertyDecl = type DeclaratorDecl;
  MSGuidDecl = type ValueDecl;
  UnnamedGlobalConstantDecl = type ValueDecl;


  CXXBaseSpecifier = type Pointer;
  ExplicitSpecifier = type Pointer;
   
{$region 'LinkageSpecDecl'}
  CX_LinkageSpecDecl_LanguageIDs = type Integer;
  CX_LinkageSpecDecl_LanguageIDs_Helper = type helper for CX_LinkageSpecDecl_LanguageIDs
  public const
    lang_c = 1;
    lang_cxx = 2;
  end;  
{$endregion 'LinkageSpecDecl'}

  MSGuidDeclParts = record
    /// {01234567-...
    Part1: Cardinal;
    /// ...-89ab-...
    Part2: Word;
    /// ...-cdef-...
    Part3: Word;
    /// ...-0123-456789abcdef}
    Part4And5: array [0 .. 7] of Byte;
  end;

implementation

end.

