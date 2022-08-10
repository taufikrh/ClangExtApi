unit LibClang.Ext.llvm.ADT.APFloatW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.CXString,
  LibClang.Ext.llvm.ADT.APFloatH,
  LibClang.Ext.llvm.ADT.APFloatU
  ;

type

  { TAPFloatHelper }

  TAPFloatHelper = type helper for APFloat
  public
    procedure Dispose;
    function convertToDouble: Double;
    function convertToFloat: Single;
    function isZero: Boolean;
    function isInfinity: Boolean;
    function isNaN: Boolean;
    function isNegative: Boolean;
    function isDenormal: Boolean;
    function isSignaling: Boolean;
    function isNormal: Boolean;
    function isFinite: Boolean;
    function getCategory: APFloatBase_fltCategory;
    function isNonZero: Boolean;
    function isFiniteNonZero: Boolean;
    function isPosZero: Boolean;
    function isNegZero: Boolean;
    function isSmallest: Boolean;
    function isLargest: Boolean;
    function isInteger: Boolean;
    function isIEEE: Boolean;
    function toString(FormatPrecision: Cardinal = 0; FormatMaxPadding: Cardinal = 3; TruncateZero: Boolean = True): string;
    //
    function GetApproxValue: Double;
  end;

implementation

{ TAPFloatHelper }

procedure TAPFloatHelper.Dispose;
begin
  clangExt_APFloat_Dispose(Self);
end;

function TAPFloatHelper.convertToDouble: Double;
begin
  Result := clangExt_APFloat_convertToDouble(Self);
end;

function TAPFloatHelper.convertToFloat: Single;
begin
  Result := clangExt_APFloat_convertToFloat(Self);
end;

function TAPFloatHelper.isZero: Boolean;
begin
  Result := clangExt_APFloat_isZero(Self);
end;

function TAPFloatHelper.isInfinity: Boolean;
begin
  Result := clangExt_APFloat_isInfinity(Self);
end;

function TAPFloatHelper.isNaN: Boolean;
begin
  Result := clangExt_APFloat_isNaN(Self);
end;

function TAPFloatHelper.isNegative: Boolean;
begin
  Result := clangExt_APFloat_isNegative(Self);
end;

function TAPFloatHelper.isDenormal: Boolean;
begin
  Result := clangExt_APFloat_isDenormal(Self);
end;

function TAPFloatHelper.isSignaling: Boolean;
begin
  Result := clangExt_APFloat_isSignaling(Self);
end;

function TAPFloatHelper.isNormal: Boolean;
begin
  Result := clangExt_APFloat_isNormal(Self);
end;

function TAPFloatHelper.isFinite: Boolean;
begin
  Result := clangExt_APFloat_isFinite(Self);
end;

function TAPFloatHelper.getCategory: APFloatBase_fltCategory;
begin
  Result := clangExt_APFloat_getCategory(Self);
end;

function TAPFloatHelper.isNonZero: Boolean;
begin
  Result := clangExt_APFloat_isNonZero(Self);
end;

function TAPFloatHelper.isFiniteNonZero: Boolean;
begin
  Result := clangExt_APFloat_isFiniteNonZero(Self);
end;

function TAPFloatHelper.isPosZero: Boolean;
begin
  Result := clangExt_APFloat_isPosZero(Self);
end;

function TAPFloatHelper.isNegZero: Boolean;
begin
  Result := clangExt_APFloat_isNegZero(Self);
end;

function TAPFloatHelper.isSmallest: Boolean;
begin
  Result := clangExt_APFloat_isSmallest(Self);
end;

function TAPFloatHelper.isLargest: Boolean;
begin
  Result := clangExt_APFloat_isLargest(Self);
end;

function TAPFloatHelper.isInteger: Boolean;
begin
  Result := clangExt_APFloat_isInteger(Self);
end;

function TAPFloatHelper.isIEEE: Boolean;
begin
  Result := clangExt_APFloat_isIEEE(Self);
end;

function TAPFloatHelper.toString(FormatPrecision: Cardinal;
  FormatMaxPadding: Cardinal; TruncateZero: Boolean): string;
begin
  Result := clangExt_APFloat_toString(Self, FormatPrecision, FormatMaxPadding, TruncateZero).ToString;
end;

function TAPFloatHelper.GetApproxValue: Double;
begin
  Result := clangExt_APFloat_GetApproxValue(Self);
end;

end.

