unit LibClang.Ext.llvm.ADT.APIntW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Ext.llvm.ADT.APIntH,
  LibClang.Ext.llvm.ADT.APIntU;

type

  { TAPIntW }

  TAPIntW = object
    A: APInt;
  public
    class function Create(iAPInt: APInt; out oAPInt: TAPIntW): Boolean; static;
    procedure Dispose;
    function IsNull: Boolean; inline;
    function getBitWidth: Cardinal;
    function getZExtValue: UInt64;
    function getSExtValue: Int64;
    function toString(Radix: Cardinal; Signed: Boolean; formatAsCLiteral: Boolean = False): string;
    function toStringUnsigned(Radix: Cardinal = 10): string;
    function toStringSigned(Radix: Cardinal = 10): string;
  end;
  PAPIntW = ^TAPIntW;

  { APIntHelper }

  APIntHelper = type helper for APInt
    function Wrap(out a: TAPIntW): Boolean;
  end;

implementation

{ APIntHelper }

function APIntHelper.Wrap(out a: TAPIntW): Boolean;
begin
  Result := TAPIntW.Create(Self, a);
end;

{ TAPIntW }

class function TAPIntW.Create(iAPInt: APInt; out oAPInt: TAPIntW): Boolean;
begin
  Result := False;
  oAPInt := Default(TAPIntW);
  if not Assigned(iAPInt) then
    Exit;
  oAPInt.A := iAPInt;
  Result := True;
end;

procedure TAPIntW.Dispose;
begin
  clangExt_APInt_Dispose(Self.A);
  Self.A := nil;
end;

function TAPIntW.IsNull: Boolean;
begin
  Result := not Assigned(Self.A);
end;

function TAPIntW.getBitWidth: Cardinal;
begin
  Result := clangExt_APInt_getBitWidth(Self.A);
end;

function TAPIntW.getZExtValue: UInt64;
begin
  Result := clangExt_APInt_getZExtValue(Self.A);
end;

function TAPIntW.getSExtValue: Int64;
begin
  Result := clangExt_APInt_getSExtValue(Self.A);
end;

function TAPIntW.toString(Radix: Cardinal; Signed: Boolean;
  formatAsCLiteral: Boolean): string;
begin
  Result := clangExt_APInt_toString(Self.A, Radix, Signed, formatAsCLiteral).ToString;
end;

function TAPIntW.toStringUnsigned(Radix: Cardinal): string;
begin
  Result := toString(Radix, False, False);
end;

function TAPIntW.toStringSigned(Radix: Cardinal): string;
begin
  Result := toString(Radix, True, False);
end;

end.

