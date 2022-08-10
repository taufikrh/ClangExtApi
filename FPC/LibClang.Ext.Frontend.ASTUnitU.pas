unit LibClang.Ext.Frontend.ASTUnitU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.Lex.PreprocessorH,
  LibClang.Ext.Frontend.ASTUnitH;

  function clangExt_ASTUnit_getPreprocessorPtr(const u: ASTUnit): Preprocessor; cdecl; external LibClang_dll;
  function clangExt_ASTUnit_getMainFileName(const u: ASTUnit): CXString; cdecl; external LibClang_dll;


implementation

end.

