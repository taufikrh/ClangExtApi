unit LibClang.Ext.AST.DeclTemplateH;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Ext.AST.DeclH;

type
  MemberSpecializationInfo = type Pointer;

  TemplateDecl = type NamedDecl;

  RedeclarableTemplateDecl = type TemplateDecl;

  FunctionTemplateDecl = type RedeclarableTemplateDecl;

  FunctionTemplateSpecializationInfo = type Pointer;

  TemplateArgumentList = type Pointer;

  DependentFunctionTemplateSpecializationInfo = type Pointer;

  ClassTemplateDecl = type RedeclarableTemplateDecl;

  TypeAliasTemplateDecl = type RedeclarableTemplateDecl;

  VarTemplateDecl = type RedeclarableTemplateDecl;

  ConceptDecl = type TemplateDecl;

implementation

end.

