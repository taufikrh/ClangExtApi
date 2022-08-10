unit LibClang.Ext.llvm.ADT.APFloatU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Ext.llvm.ADT.APFloatH
  ;

procedure clangExt_APFloat_Dispose(const a: APFloat); cdecl; external LibClang_dll;
function clangExt_APFloat_convertToDouble(const a: APFloat): Double; cdecl; external LibClang_dll;
function clangExt_APFloat_convertToFloat(const a: APFloat): Single; cdecl; external LibClang_dll;
function clangExt_APFloat_isZero(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isInfinity(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isNaN(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isNegative(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isDenormal(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isSignaling(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isNormal(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isFinite(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_getCategory(const a: APFloat): APFloatBase_fltCategory; cdecl; external LibClang_dll;
function clangExt_APFloat_isNonZero(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isFiniteNonZero(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isPosZero(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isNegZero(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isSmallest(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isLargest(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isInteger(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_isIEEE(const a: APFloat): Boolean; cdecl; external LibClang_dll;
function clangExt_APFloat_toString(const a: APFloat; FormatPrecision: Cardinal = 0; FormatMaxPadding: Cardinal = 3; TruncateZero: Boolean = True): CXString; cdecl; external LibClang_dll;
//
function clangExt_APFloat_GetApproxValue(const a: APFloat): Double; cdecl; external LibClang_dll;

implementation

end.

