unit LibClang.Ext.AST.TypeLocU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.TypeLocH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.ExprH;

function clangExt_TypeLoc_EnumTypeLocClassGetLast(): Integer; cdecl; external LibClang_dll;
function clangExt_TypeLoc_EnumTypeLocClassGetName(i: TypeLocClass): CXString; cdecl; external LibClang_dll;
//======================================================================================================================
function clangExt_TypeLoc_getTypeLocClass(loc: CXTypeLoc): TypeLocClass; cdecl; external LibClang_dll;
function clangExt_TypeLoc_isNull(loc: CXTypeLoc): Boolean; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getFullDataSizeForType(const Ty: CXQualType): Cardinal; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getLocalAlignmentForType(const Ty: CXQualType): Cardinal; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getType(loc: CXTypeLoc): CXQualType; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getTypePtr(loc: CXTypeLoc): AstType; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getOpaqueData(loc: CXTypeLoc): Pointer; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getBeginLoc(loc: CXTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getEndLoc(loc: CXTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getSourceRange(loc: CXTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getFullDataSize(loc: CXTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getNextTypeLoc(loc: CXTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getUnqualifiedLoc(loc: CXTypeLoc): UnqualTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeLoc_IgnoreParens(loc: CXTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeLoc_findExplicitQualifierLoc(loc: CXTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeLoc_getContainedAutoTypeLoc(loc: CXTypeLoc): AutoTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeLoc_findNullabilityLoc(loc: CXTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
//======================================================================================================================
function clangExt_UnqualTypeLoc_getTypePtr(loc: UnqualTypeLoc): AstType; cdecl; external LibClang_dll;
function clangExt_UnqualTypeLoc_getTypeLocClass(loc: UnqualTypeLoc): TypeLocClass; cdecl; external LibClang_dll;
//======================================================================================================================
function clangExt_QualifiedTypeLoc_getLocalSourceRange(loc: QualifiedTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_QualifiedTypeLoc_getUnqualifiedLoc(loc: QualifiedTypeLoc): UnqualTypeLoc; cdecl; external LibClang_dll;
function clangExt_QualifiedTypeLoc_getNextTypeLoc(loc: QualifiedTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_QualifiedTypeLoc_getLocalDataSize(loc: QualifiedTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_QualifiedTypeLoc_getLocalDataAlignment(loc: QualifiedTypeLoc): Cardinal; cdecl; external LibClang_dll;
//======================================================================================================================
// ConcreteTypeLoc
function clangExt_TypeSpecTypeLoc_getLocalDataAlignment(loc: TypeSpecTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_TypeSpecTypeLoc_getLocalDataSize(loc: TypeSpecTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_TypeSpecTypeLoc_getNextTypeLoc(loc: TypeSpecTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_TypeSpecTypeLoc_getTypePtr(loc: TypeSpecTypeLoc): ASTType; cdecl; external LibClang_dll;
//
function clangExt_TypeSpecTypeLoc_getNameLoc(loc: TypeSpecTypeLoc; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_TypeSpecTypeLoc_getLocalSourceRange(loc: TypeSpecTypeLoc; const Ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
//======================================================================================================================
function clangExt_TypedefTypeLoc_getTypePtr(loc: TypedefTypeLoc): TypedefType; cdecl; external LibClang_dll;
function clangExt_TypedefNameDecl_getTypedefNameDecl(loc: TypedefTypeLoc): TypedefNameDecl; cdecl; external LibClang_dll;
//======================================================================================================================
// ConcreteTypeLoc
function clangExt_AttributedTypeLoc_getLocalDataAlignment(loc: AttributedTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getLocalDataSize(loc: AttributedTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getNextTypeLoc(loc: AttributedTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getTypePtr(loc: AttributedTypeLoc): AttributedType; cdecl; external LibClang_dll;
//
function clangExt_AttributedTypeLoc_getAttrKind(loc: AttributedTypeLoc): CX_AttrKind; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_isQualifier(loc: AttributedTypeLoc): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getModifiedLoc(loc: AttributedTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getAttr(loc: AttributedTypeLoc): Attr; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getLocalSourceRange(loc: AttributedTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_AttributedTypeLoc_getInnerType(loc: AttributedTypeLoc): CXQualType; cdecl; external LibClang_dll;
//======================================================================================================================
// ConcreteTypeLoc
function clangExt_ParenTypeLoc_getLocalDataAlignment(loc: ParenTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getLocalDataSize(loc: ParenTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getNextTypeLoc(loc: ParenTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getTypePtr(loc: ParenTypeLoc): ParenType; cdecl; external LibClang_dll;
//
function clangExt_ParenTypeLoc_getLParenLoc(loc: ParenTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getRParenLoc(loc: ParenTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getLocalSourceRange(loc: ParenTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getInnerLoc(loc: ParenTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_ParenTypeLoc_getInnerType(loc: ParenTypeLoc): CXQualType; cdecl; external LibClang_dll;
//======================================================================================================================
// ConcreteTypeLoc
function clangExt_PointerTypeLoc_getLocalDataAlignment(loc: PointerTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getLocalDataSize(loc: PointerTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getNextTypeLoc(loc: PointerTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getTypePtr(loc: PointerTypeLoc): PointerType; cdecl; external LibClang_dll;
// PointerLikeTypeLoc
function clangExt_PointerTypeLoc_getSigilLoc(loc: PointerTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getPointeeLoc(loc: PointerTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getLocalSourceRange(loc: PointerTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_PointerTypeLoc_getInnerType(loc: PointerTypeLoc): CXQualType; cdecl; external LibClang_dll;
//
function clangExt_PointerTypeLoc_getStarLoc(loc: PointerTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
//====================================================================================================================== FunctionTypeLoc
// ConcreteTypeLoc
function clangExt_FunctionTypeLoc_getLocalDataAlignment(loc: FunctionTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getLocalDataSize(loc: FunctionTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getNextTypeLoc(loc: FunctionTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getTypePtr(loc: FunctionTypeLoc): FunctionType; cdecl; external LibClang_dll;
//
function clangExt_FunctionTypeLoc_getLocalRangeBegin(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getLocalRangeEnd(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getLParenLoc(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getRParenLoc(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getParensRange(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getExceptionSpecRange(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getParmArray(loc: FunctionTypeLoc): PParmVarDecl; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getNumParams(loc: FunctionTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getParam(loc: FunctionTypeLoc; i: Cardinal): ParmVarDecl; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getReturnLoc(loc: FunctionTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getLocalSourceRange(loc: FunctionTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getExtraLocalDataSize(loc: FunctionTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getExtraLocalDataAlignment(loc: FunctionTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_FunctionTypeLoc_getInnerType(loc: FunctionTypeLoc): CXQualType; cdecl; external LibClang_dll;                  
//====================================================================================================================== FunctionProtoTypeLoc
function clangExt_FunctionProtoTypeLoc_getTypePtr(loc: FunctionProtoTypeLoc): FunctionProtoType; cdecl; external LibClang_dll;
//====================================================================================================================== FunctionNoProtoTypeLoc   
function clangExt_FunctionNoProtoTypeLoc_getTypePtr(loc: FunctionNoProtoTypeLoc): FunctionNoProtoType; cdecl; external LibClang_dll;
//====================================================================================================================== ArrayTypeLoc
// ConcreteTypeLoc
function clangExt_ArrayTypeLoc_getLocalDataAlignment(loc: ArrayTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getLocalDataSize(loc: ArrayTypeLoc): Cardinal; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getNextTypeLoc(loc: ArrayTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getTypePtr(loc: ArrayTypeLoc): ArrayType; cdecl; external LibClang_dll;
//
function clangExt_ArrayTypeLoc_getLBracketLoc(loc: ArrayTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getRBracketLoc(loc: ArrayTypeLoc; const Context: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getBracketsRange(loc: ArrayTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getSizeExpr(loc: ArrayTypeLoc): Expr; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getElementLoc(loc: ArrayTypeLoc): CXTypeLoc; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getLocalSourceRange(loc: ArrayTypeLoc; const Context: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_ArrayTypeLoc_getInnerType(loc: ArrayTypeLoc): CXQualType; cdecl; external LibClang_dll;
//====================================================================================================================== ConstantArrayTypeLoc
function clangExt_ConstantArrayTypeLoc_getTypePtr(loc: ConstantArrayTypeLoc): ConstantArrayType; cdecl; external LibClang_dll;
//======================================================================================================================

implementation

end.

