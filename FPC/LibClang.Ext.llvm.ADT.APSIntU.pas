unit LibClang.Ext.llvm.ADT.APSIntU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.llvm.ADT.APSIntH;

procedure clangExt_APSInt_Dispose(a: APSInt); cdecl; external LibClang_dll;
function clangExt_APSInt_isNegative(const a: APSInt): Boolean; external LibClang_dll;
function clangExt_APSInt_isNonNegative(const a: APSInt): Boolean; external LibClang_dll;
function clangExt_APSInt_isStrictlyPositive(const a: APSInt): Boolean; external LibClang_dll;
function clangExt_APSInt_isSigned(const a: APSInt): Boolean; external LibClang_dll;
function clangExt_APSInt_isUnsigned(const a: APSInt): Boolean; external LibClang_dll;
function clangExt_APSInt_toString(const a: APSInt; Radix: Cardinal = 10): CXString; external LibClang_dll;
function clangExt_APSInt_getExtValue(const a: APSInt): Int64; external LibClang_dll;

implementation

end.

