unit LibClang.Ext.llvm.ADT.APIntU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.llvm.ADT.APIntH;

procedure clangExt_APInt_Dispose(a: APInt); cdecl; external LibClang_dll;
function clangExt_APInt_getBitWidth(const a: APInt): Cardinal; cdecl; external LibClang_dll;
function clangExt_APInt_getZExtValue(const a: APInt): UInt64; cdecl; external LibClang_dll;
function clangExt_APInt_getSExtValue(const a: APInt): Int64; cdecl; external LibClang_dll;
function clangExt_APInt_toString(const a: APInt; Radix: Cardinal; Signed: Boolean; formatAsCLiteral: Boolean = False): CXString; cdecl; external LibClang_dll;

implementation

end.

