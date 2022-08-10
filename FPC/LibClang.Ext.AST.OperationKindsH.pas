unit LibClang.Ext.AST.OperationKindsH;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Base,
  LibClang.CXString;

type
  CastKind = type Integer;

  { CastKindHelper }

  CastKindHelper = type helper for CastKind
  public const
    {$i 'CastKind_h.inc'}
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;
          
  BinaryOperatorKind = type Integer;

  { BinaryOperatorKindHelper }

  BinaryOperatorKindHelper = type helper for BinaryOperatorKind
  public const
    {$i 'BinaryOperatorKind_h.inc'}
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;
           
  UnaryOperatorKind = type Integer;

  { UnaryOperatorKindHelper }

  UnaryOperatorKindHelper = type helper for UnaryOperatorKind
  public const
    {$i 'UnaryOperatorKind_h.inc'}
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

  /// The kind of bridging performed by the Objective-C bridge cast.
  ObjCBridgeCastKind = type Integer;

  { ObjCBridgeCastKindHelper }

  ObjCBridgeCastKindHelper = type helper for ObjCBridgeCastKind
  public const
    /// Bridging via __bridge, which does nothing but reinterpret
    /// the bits.
    OBC_Bridge = 0;
    /// Bridging via __bridge_transfer, which transfers ownership of an
    /// Objective-C pointer into ARC.
    OBC_BridgeTransfer = 1;
    /// Bridging via __bridge_retain, which makes an ARC object available
    /// as a +1 C pointer.
    OBC_BridgeRetained = 2;  
  public
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

function clangExt_CastKind_GetName(K: CastKind): CXString; cdecl; external LibClang_dll;
function clangExt_BinaryOperatorKind_GetName(K: BinaryOperatorKind): CXString; cdecl; external LibClang_dll;
function clangExt_UnaryOperatorKind_GetName(K: UnaryOperatorKind): CXString; cdecl; external LibClang_dll;

implementation

uses
  SysUtils;

{ CastKindHelper }

function CastKindHelper.Value: Integer;
begin
  Result := Self;
end;

function CastKindHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    {$i 'CastKind_impl.inc'}
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
    
{ BinaryOperatorKindHelper }

function BinaryOperatorKindHelper.Value: Integer;
begin
  Result := Self;
end;

function BinaryOperatorKindHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    {$i 'BinaryOperatorKind_impl.inc'}
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
   
{ UnaryOperatorKindHelper }

function UnaryOperatorKindHelper.Value: Integer;
begin
  Result := Self;
end;

function UnaryOperatorKindHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    {$i 'UnaryOperatorKind_impl.inc'}
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;
    
{ ObjCBridgeCastKindHelper }

function ObjCBridgeCastKindHelper.Value: Integer;
begin
  Result := Self;
end;

function ObjCBridgeCastKindHelper.ToString(aShowKind: Boolean): string;
begin
  case Self of
    OBC_Bridge: Result := 'Bridge';
    OBC_BridgeTransfer: Result := 'BridgeTransfer';
    OBC_BridgeRetained: Result := 'BridgeRetained';
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

end.

