unit LibClang.Ext.AST.NestedNameSpecifierU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.Ext.AST.NestedNameSpecifierH;

procedure clangExt_NestedNameSpecifierLoc_Dispose(n: NestedNameSpecifierLoc); cdecl; external LibClang_dll;

implementation

end.

