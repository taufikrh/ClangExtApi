unit LibClang.Ext.AST.TypeLocW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  //LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.TypeLocU,
  LibClang.Ext.AST.TypeW,
  LibClang.Ext.AST.DeclW,  
  LibClang.Ext.AST.ExprW
  ;

type

  { TTypeLocW }

  TTypeLocW = object
    Loc: CXTypeLoc;
  public
    class function Create(inLoc: CXTypeLoc; out outLoc: TTypeLocW): Boolean; static;
  public
    function getTypeLocClass: TypeLocClass;
    function isNull: Boolean;
    class function getFullDataSizeForType(const Ty: CXQualType): Cardinal; static;
    class function getLocalAlignmentForType(const Ty: CXQualType): Cardinal; static;
    function getType: CXQualType;
    function getTypePtr: TAstTypeW;
    function getOpaqueData: Pointer;
    function getBeginLoc(const Context: ASTContext): CXSourceLocation;
    function getEndLoc(const Context: ASTContext): CXSourceLocation;
    function getSourceRange(const Context: ASTContext): CXSourceRange;
    function getFullDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getUnqualifiedLoc: UnqualTypeLoc;
    function IgnoreParens: TTypeLocW;
    function findExplicitQualifierLoc: TTypeLocW;
    function getContainedAutoTypeLoc: AutoTypeLoc;
    function findNullabilityLoc(const Context: ASTContext): CXSourceLocation;
  end;
       
  { CXTypeLocHelper }

  CXTypeLocHelper = record helper for CXTypeLoc
    function Wrap(out loc: TTypeLocW): Boolean; inline;
  end;

  { TUnqualTypeLocW }

  TUnqualTypeLocW = object(TTypeLocW)
    function getTypePtr: TAstTypeW;
    function getTypeLocClass: TypeLocClass;
  end;

  { TQualifiedTypeLocW }

  TQualifiedTypeLocW = object(TTypeLocW)
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getUnqualifiedLoc: TUnqualTypeLocW;
    function getNextTypeLoc: TTypeLocW;
    function getLocalDataSize: Cardinal;
    function getLocalDataAlignment: Cardinal;
  end;

  { TTypeSpecTypeLocW }

  TTypeSpecTypeLocW = object(TUnqualTypeLocW)
    // ConcreteTypeLoc
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TAstTypeW;
    //
    function getNameLoc(const Ctx: ASTContext): CXSourceLocation;
    function getLocalSourceRange(const Ctx: ASTContext): CXSourceRange;
  end;

  { TTypedefTypeLoc }

  TTypedefTypeLocW = object(TTypeSpecTypeLocW)
    function getTypePtr: TTypedefTypeW;
    function getTypedefNameDecl: TTypedefNameDeclW;
  end;

  { TAttributedTypeLocW }

  TAttributedTypeLocW = object(TUnqualTypeLocW)
    // ConcreteTypeLoc
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TAttributedTypeW;
    //
    function getAttrKind: CX_AttrKind;
    function isQualifier: Boolean;
    function getModifiedLoc: TTypeLocW;
    function getAttr: Attr;
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getInnerType: CXQualType;
  end;

  { TParenTypeLocW }

  TParenTypeLocW = object(TUnqualTypeLocW)
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TParenTypeW;
    //
    function getLParenLoc(const Context: ASTContext): CXSourceLocation;
    function getRParenLoc(const Context: ASTContext): CXSourceLocation;
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getInnerLoc: TTypeLocW;
    function getInnerType: CXQualType;
  end;

  { TPointerTypeLocW }

  TPointerTypeLocW = object(TUnqualTypeLocW)
    // ConcreteTypeLoc
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TPointerTypeW;
    // PointerLikeTypeLoc
    function getSigilLoc(const Context: ASTContext): CXSourceLocation;
    function getPointeeLoc: TTypeLocW;
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getInnerType: CXQualType;
    //
    function getStarLoc(const Context: ASTContext): CXSourceLocation;
  end;

  { TFunctionTypeLocW }

  TFunctionTypeLocW = object(TUnqualTypeLocW)
    // ConcreteTypeLoc
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TFunctionTypeW;
    //
    function getLocalRangeBegin(const Context: ASTContext): CXSourceLocation;
    function getLocalRangeEnd(const Context: ASTContext): CXSourceLocation;
    function getLParenLoc(const Context: ASTContext): CXSourceLocation;
    function getRParenLoc(const Context: ASTContext): CXSourceLocation;
    function getParensRange(const Context: ASTContext): CXSourceRange;
    function getExceptionSpecRange(const Context: ASTContext): CXSourceRange;
    function getParmArray: PParmVarDecl;
    function getNumParams: Cardinal;
    function getParam(i: Cardinal): TParmVarDeclW;
    function getReturnLoc: TTypeLocW;
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getExtraLocalDataSize: Cardinal;
    function getExtraLocalDataAlignment: Cardinal;
    function getInnerType: CXQualType;
  end;

  { TFunctionProtoTypeLocW }

  TFunctionProtoTypeLocW = object(TFunctionTypeLocW)
    function getTypePtr: TFunctionProtoTypeW;
  end;

  { TFunctionNoProtoTypeLocW }

  TFunctionNoProtoTypeLocW = object(TFunctionTypeLocW)
    function getTypePtr: TFunctionNoProtoTypeW;
  end;

  { TArrayTypeLocW }

  TArrayTypeLocW = object(TUnqualTypeLocW)
    // ConcreteTypeLoc
    function getLocalDataAlignment: Cardinal;
    function getLocalDataSize: Cardinal;
    function getNextTypeLoc: TTypeLocW;
    function getTypePtr: TArrayTypeW;
    //
    function getLBracketLoc(const Context: ASTContext): CXSourceLocation;
    function getRBracketLoc(const Context: ASTContext): CXSourceLocation;
    function getBracketsRange(const Context: ASTContext): CXSourceRange;
    function getSizeExpr: TExprW;
    function getElementLoc: TTypeLocW;
    function getLocalSourceRange(const Context: ASTContext): CXSourceRange;
    function getInnerType: CXQualType;
  end;

  { TConstantArrayTypeLocW }

  TConstantArrayTypeLocW = object(TArrayTypeLocW)
    function getTypePtr: TConstantArrayTypeW;
  end;

implementation

{ CXTypeLocHelper }

function CXTypeLocHelper.Wrap(out loc: TTypeLocW): Boolean;
begin
  Result := TTypeLocW.Create(Self, loc);
end;

{$region 'TTypeLocW'}

class function TTypeLocW.Create(inLoc: CXTypeLoc; out outLoc: TTypeLocW
  ): Boolean;
begin
  Result := False;
  outLoc := Default(TTypeLocW);
  if (not Assigned(inLoc.Ty)) or (not Assigned(inLoc.Data)) or (clangExt_TypeLoc_isNull(inLoc)) then
    Exit;
  outLoc.Loc := inLoc;
  Result := True;
end;

function TTypeLocW.getTypeLocClass: TypeLocClass;
begin
  Result := clangExt_TypeLoc_getTypeLocClass(Self.Loc);
end;

function TTypeLocW.isNull: Boolean;
begin
  Result := clangExt_TypeLoc_isNull(Self.Loc);
end;

class function TTypeLocW.getFullDataSizeForType(const Ty: CXQualType): Cardinal;
begin
  Result := clangExt_TypeLoc_getFullDataSizeForType(Ty);
end;

class function TTypeLocW.getLocalAlignmentForType(const Ty: CXQualType
  ): Cardinal;
begin
  Result := clangExt_TypeLoc_getLocalAlignmentForType(Ty);
end;

function TTypeLocW.getType: CXQualType;
begin
  Result := clangExt_TypeLoc_getType(Self.Loc);
end;

function TTypeLocW.getTypePtr: TAstTypeW;
begin
  clangExt_TypeLoc_getTypePtr(Self.Loc).Wrap(Result);
end;

function TTypeLocW.getOpaqueData: Pointer;
begin
  Result := clangExt_TypeLoc_getOpaqueData(Self.Loc);
end;

function TTypeLocW.getBeginLoc(const Context: ASTContext): CXSourceLocation;
begin
  Result := clangExt_TypeLoc_getBeginLoc(Self.Loc, Context);
end;

function TTypeLocW.getEndLoc(const Context: ASTContext): CXSourceLocation;
begin
  Result := clangExt_TypeLoc_getEndLoc(Self.Loc, Context);
end;

function TTypeLocW.getSourceRange(const Context: ASTContext): CXSourceRange;
begin
  Result := clangExt_TypeLoc_getSourceRange(Self.Loc, Context);
end;

function TTypeLocW.getFullDataSize: Cardinal;
begin
  Result := clangExt_TypeLoc_getFullDataSize(Self.Loc);
end;

function TTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  TTypeLocW.Create(clangExt_TypeLoc_getNextTypeLoc(Self.Loc), Result);
end;

function TTypeLocW.getUnqualifiedLoc: UnqualTypeLoc;
begin
  Result := clangExt_TypeLoc_getUnqualifiedLoc(Self.Loc);
end;

function TTypeLocW.IgnoreParens: TTypeLocW;
begin
  TTypeLocW.Create(clangExt_TypeLoc_IgnoreParens(Self.Loc), Result);
end;

function TTypeLocW.findExplicitQualifierLoc: TTypeLocW;
begin
  TTypeLocW.Create(clangExt_TypeLoc_findExplicitQualifierLoc(Self.Loc), Result);
end;

function TTypeLocW.getContainedAutoTypeLoc: AutoTypeLoc;
begin
  Result := clangExt_TypeLoc_getContainedAutoTypeLoc(Self.Loc);
end;

function TTypeLocW.findNullabilityLoc(const Context: ASTContext): CXSourceLocation;
begin
  Result := clangExt_TypeLoc_findNullabilityLoc(Self.Loc, Context);
end;   

{$endregion 'TTypeLocW'}

{$region 'TUnqualTypeLocW'}

function TUnqualTypeLocW.getTypePtr: TAstTypeW;
begin
  clangExt_UnqualTypeLoc_getTypePtr(UnqualTypeLoc(Loc)).Wrap(Result);
end;

function TUnqualTypeLocW.getTypeLocClass: TypeLocClass;
begin
  Result := clangExt_UnqualTypeLoc_getTypeLocClass(UnqualTypeLoc(Loc));
end;

{$endregion 'TUnqualTypeLocW'}
                                 
{$region 'TQualifiedTypeLocW'}

function TQualifiedTypeLocW.getLocalSourceRange(const Context: ASTContext): CXSourceRange;
begin
  Result := clangExt_QualifiedTypeLoc_getLocalSourceRange(QualifiedTypeLoc(Self.Loc), Context);
end;

function TQualifiedTypeLocW.getUnqualifiedLoc: TUnqualTypeLocW;
begin
  TUnqualTypeLocW.Create(CXTypeLoc(clangExt_QualifiedTypeLoc_getUnqualifiedLoc(QualifiedTypeLoc(Self.Loc))), Result);
end;

function TQualifiedTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  TTypeLocW.Create(CXTypeLoc(clangExt_QualifiedTypeLoc_getNextTypeLoc(QualifiedTypeLoc(Self.Loc))), Result);
end;

function TQualifiedTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_QualifiedTypeLoc_getLocalDataSize(QualifiedTypeLoc(Self.Loc));
end;

function TQualifiedTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_QualifiedTypeLoc_getLocalDataAlignment(QualifiedTypeLoc(Self.Loc));
end;

{$endregion 'TQualifiedTypeLocW'}

{$region 'TTypeSpecTypeLocW'}

function TTypeSpecTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_TypeSpecTypeLoc_getLocalDataAlignment(TypeSpecTypeLoc(Self.Loc));
end;

function TTypeSpecTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_TypeSpecTypeLoc_getLocalDataSize(TypeSpecTypeLoc(Self.Loc));
end;

function TTypeSpecTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_TypeSpecTypeLoc_getNextTypeLoc(TypeSpecTypeLoc(Self.Loc)).Wrap(Result);
end;

function TTypeSpecTypeLocW.getTypePtr: TAstTypeW;
begin
  clangExt_TypeSpecTypeLoc_getTypePtr(TypeSpecTypeLoc(Self.Loc)).Wrap(Result);
end;

function TTypeSpecTypeLocW.getNameLoc(const Ctx: ASTContext): CXSourceLocation;
begin
  Result := clangExt_TypeSpecTypeLoc_getNameLoc(TypeSpecTypeLoc(Self.Loc), Ctx);
end;

function TTypeSpecTypeLocW.getLocalSourceRange(const Ctx: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_TypeSpecTypeLoc_getLocalSourceRange(TypeSpecTypeLoc(Self.Loc), Ctx);
end;
     
{$endregion 'TTypeSpecTypeLocW'}

{$region 'TTypedefTypeLocW'}

function TTypedefTypeLocW.getTypePtr: TTypedefTypeW;
begin
  clangExt_TypedefTypeLoc_getTypePtr(TypedefTypeLoc(Self.Loc)).Wrap(Result);
end;

function TTypedefTypeLocW.getTypedefNameDecl: TTypedefNameDeclW;
begin
  clangExt_TypedefNameDecl_getTypedefNameDecl(TypedefTypeLoc(Self.Loc)).Wrap(Result);
end;
     
{$endregion 'TTypedefTypeLocW'}

{$region 'TAttributedTypeLocW'}

function TAttributedTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_AttributedTypeLoc_getLocalDataAlignment(AttributedTypeLoc(Self.Loc));
end;

function TAttributedTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_AttributedTypeLoc_getLocalDataSize(AttributedTypeLoc(Self.Loc));
end;

function TAttributedTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_AttributedTypeLoc_getNextTypeLoc(AttributedTypeLoc(Self.Loc)).Wrap(Result);
end;

function TAttributedTypeLocW.getTypePtr: TAttributedTypeW;
begin
  clangExt_AttributedTypeLoc_getTypePtr(AttributedTypeLoc(Self.Loc)).Wrap(Result);
end;

function TAttributedTypeLocW.getAttrKind: CX_AttrKind;
begin
  Result := clangExt_AttributedTypeLoc_getAttrKind(AttributedTypeLoc(Self.Loc));
end;

function TAttributedTypeLocW.isQualifier: Boolean;
begin
  Result := clangExt_AttributedTypeLoc_isQualifier(AttributedTypeLoc(Self.Loc));
end;

function TAttributedTypeLocW.getModifiedLoc: TTypeLocW;
begin
  clangExt_AttributedTypeLoc_getModifiedLoc(AttributedTypeLoc(Self.Loc)).Wrap(Result);
end;

function TAttributedTypeLocW.getAttr: Attr;
begin
  Result := clangExt_AttributedTypeLoc_getAttr(AttributedTypeLoc(Self.Loc));
end;

function TAttributedTypeLocW.getLocalSourceRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_AttributedTypeLoc_getLocalSourceRange(AttributedTypeLoc(Self.Loc), Context);
end;

function TAttributedTypeLocW.getInnerType: CXQualType;
begin
  Result := clangExt_AttributedTypeLoc_getInnerType(AttributedTypeLoc(Self.Loc));
end;

{$endregion 'TAttributedTypeLocW'}

{$region 'TParenTypeLocW'}

function TParenTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_ParenTypeLoc_getLocalDataAlignment(ParenTypeLoc(Self.Loc));
end;

function TParenTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_ParenTypeLoc_getLocalDataSize(ParenTypeLoc(Self.Loc));
end;

function TParenTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_ParenTypeLoc_getNextTypeLoc(ParenTypeLoc(Self.Loc)).Wrap(Result);
end;

function TParenTypeLocW.getTypePtr: TParenTypeW;
begin
  clangExt_ParenTypeLoc_getTypePtr(ParenTypeLoc(Self.Loc)).Wrap(Result);
end;

function TParenTypeLocW.getLParenLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_ParenTypeLoc_getLParenLoc(ParenTypeLoc(Self.Loc), Context);
end;

function TParenTypeLocW.getRParenLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_ParenTypeLoc_getRParenLoc(ParenTypeLoc(Self.Loc), Context);
end;

function TParenTypeLocW.getLocalSourceRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_ParenTypeLoc_getLocalSourceRange(ParenTypeLoc(Self.Loc), Context);
end;

function TParenTypeLocW.getInnerLoc: TTypeLocW;
begin
  clangExt_ParenTypeLoc_getInnerLoc(ParenTypeLoc(Self.Loc)).Wrap(Result);
end;

function TParenTypeLocW.getInnerType: CXQualType;
begin
  Result := clangExt_ParenTypeLoc_getInnerType(ParenTypeLoc(Self.Loc));
end;
            
{$endregion 'TParenTypeLocW'}

{$region 'TPointerTypeLocW'}

function TPointerTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_PointerTypeLoc_getLocalDataAlignment(PointerTypeLoc(Self.Loc));
end;

function TPointerTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_PointerTypeLoc_getLocalDataSize(PointerTypeLoc(Self.Loc));
end;

function TPointerTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_PointerTypeLoc_getNextTypeLoc(PointerTypeLoc(Self.Loc)).Wrap(Result);
end;

function TPointerTypeLocW.getTypePtr: TPointerTypeW;
begin
  clangExt_PointerTypeLoc_getTypePtr(PointerTypeLoc(Self.Loc)).Wrap(Result);
end;

function TPointerTypeLocW.getSigilLoc(const Context: ASTContext): CXSourceLocation;
begin
  Result := clangExt_PointerTypeLoc_getSigilLoc(PointerTypeLoc(Self.Loc), Context);
end;

function TPointerTypeLocW.getPointeeLoc: TTypeLocW;
begin
  clangExt_PointerTypeLoc_getPointeeLoc(PointerTypeLoc(Self.Loc)).Wrap(Result);
end;

function TPointerTypeLocW.getLocalSourceRange(const Context: ASTContext): CXSourceRange;
begin
  Result := clangExt_PointerTypeLoc_getLocalSourceRange(PointerTypeLoc(Self.Loc), Context);
end;

function TPointerTypeLocW.getInnerType: CXQualType;
begin
  Result := clangExt_PointerTypeLoc_getInnerType(PointerTypeLoc(Self.Loc));
end;

function TPointerTypeLocW.getStarLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_PointerTypeLoc_getStarLoc(PointerTypeLoc(Self.Loc), Context);
end;

{$endregion 'TPointerTypeLocW'}

{$region 'TFunctionTypeLocW'}

function TFunctionTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_FunctionTypeLoc_getLocalDataAlignment(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_FunctionTypeLoc_getLocalDataSize(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_FunctionTypeLoc_getNextTypeLoc(FunctionTypeLoc(Self.Loc)).Wrap(Result);
end;

function TFunctionTypeLocW.getTypePtr: TFunctionTypeW;
begin
  clangExt_FunctionTypeLoc_getTypePtr(FunctionTypeLoc(Self.Loc)).Wrap(Result);
end;

function TFunctionTypeLocW.getLocalRangeBegin(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_FunctionTypeLoc_getLocalRangeBegin(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getLocalRangeEnd(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_FunctionTypeLoc_getLocalRangeEnd(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getLParenLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_FunctionTypeLoc_getLParenLoc(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getRParenLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_FunctionTypeLoc_getRParenLoc(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getParensRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_FunctionTypeLoc_getParensRange(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getExceptionSpecRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_FunctionTypeLoc_getExceptionSpecRange(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getParmArray: PParmVarDecl;
begin
  Result := clangExt_FunctionTypeLoc_getParmArray(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getNumParams: Cardinal;
begin
  Result := clangExt_FunctionTypeLoc_getNumParams(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getParam(i: Cardinal): TParmVarDeclW;
begin
  clangExt_FunctionTypeLoc_getParam(FunctionTypeLoc(Self.Loc), i).Wrap(Result);
end;

function TFunctionTypeLocW.getReturnLoc: TTypeLocW;
begin
  clangExt_FunctionTypeLoc_getReturnLoc(FunctionTypeLoc(Self.Loc)).Wrap(Result);
end;

function TFunctionTypeLocW.getLocalSourceRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_FunctionTypeLoc_getLocalSourceRange(FunctionTypeLoc(Self.Loc), Context);
end;

function TFunctionTypeLocW.getExtraLocalDataSize: Cardinal;
begin
  Result := clangExt_FunctionTypeLoc_getExtraLocalDataSize(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getExtraLocalDataAlignment: Cardinal;
begin
  Result := clangExt_FunctionTypeLoc_getExtraLocalDataAlignment(FunctionTypeLoc(Self.Loc));
end;

function TFunctionTypeLocW.getInnerType: CXQualType;
begin
  Result := clangExt_FunctionTypeLoc_getInnerType(FunctionTypeLoc(Self.Loc));
end;
     
{$endregion 'TFunctionTypeLocW'}

{$region 'TFunctionProtoTypeLocW'}

function TFunctionProtoTypeLocW.getTypePtr: TFunctionProtoTypeW;
begin
  clangExt_FunctionProtoTypeLoc_getTypePtr(FunctionProtoTypeLoc(Self.Loc)).Wrap(Result);
end;
       
{$endregion 'TFunctionProtoTypeLocW'}

{$region 'TFunctionNoProtoTypeLocW'}

function TFunctionNoProtoTypeLocW.getTypePtr: TFunctionNoProtoTypeW;
begin
  clangExt_FunctionNoProtoTypeLoc_getTypePtr(FunctionNoProtoTypeLoc(Self.Loc)).Wrap(Result);
end;  
{$endregion 'TFunctionNoProtoTypeLocW'}

{$region 'TArrayTypeLocW'}

function TArrayTypeLocW.getLocalDataAlignment: Cardinal;
begin
  Result := clangExt_ArrayTypeLoc_getLocalDataAlignment(ArrayTypeLoc(Self.Loc));
end;

function TArrayTypeLocW.getLocalDataSize: Cardinal;
begin
  Result := clangExt_ArrayTypeLoc_getLocalDataSize(ArrayTypeLoc(Self.Loc));
end;

function TArrayTypeLocW.getNextTypeLoc: TTypeLocW;
begin
  clangExt_ArrayTypeLoc_getNextTypeLoc(ArrayTypeLoc(Self.Loc)).Wrap(Result);
end;

function TArrayTypeLocW.getTypePtr: TArrayTypeW;
begin
  clangExt_ArrayTypeLoc_getTypePtr(ArrayTypeLoc(Self.Loc)).Wrap(Result);
end;

function TArrayTypeLocW.getLBracketLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_ArrayTypeLoc_getLBracketLoc(ArrayTypeLoc(Self.Loc), Context);
end;

function TArrayTypeLocW.getRBracketLoc(const Context: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_ArrayTypeLoc_getRBracketLoc(ArrayTypeLoc(Self.Loc), Context);
end;

function TArrayTypeLocW.getBracketsRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_ArrayTypeLoc_getBracketsRange(ArrayTypeLoc(Self.Loc), Context);
end;

function TArrayTypeLocW.getSizeExpr: TExprW;
begin
  clangExt_ArrayTypeLoc_getSizeExpr(ArrayTypeLoc(Self.Loc)).Wrap(Result);
end;

function TArrayTypeLocW.getElementLoc: TTypeLocW;
begin
  clangExt_ArrayTypeLoc_getElementLoc(ArrayTypeLoc(Self.Loc)).Wrap(Result);
end;

function TArrayTypeLocW.getLocalSourceRange(const Context: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_ArrayTypeLoc_getLocalSourceRange(ArrayTypeLoc(Self.Loc), Context);
end;

function TArrayTypeLocW.getInnerType: CXQualType;
begin
  Result := clangExt_ArrayTypeLoc_getInnerType(ArrayTypeLoc(Self.Loc));
end;
  
{$endregion 'TArrayTypeLocW'}
                            
{$region 'TConstantArrayTypeLocW'}

function TConstantArrayTypeLocW.getTypePtr: TConstantArrayTypeW;
begin
  clangExt_ConstantArrayTypeLoc_getTypePtr(ConstantArrayTypeLoc(Self.Loc)).Wrap(Result);
end;
      
{$endregion 'TConstantArrayTypeLocW'}

end.

