#include "Clang_Ext_AST_TypeLoc.h"
#include "CXString.h"
#include "CXSourceLocation.h"

static inline TypeLoc CXTypeLocToTypeLoc(CXTypeLoc loc) {
	return TypeLoc{ loc.Ty, loc.Data };
}

static inline CXTypeLoc TypeLocToCXTypeLoc(TypeLoc ty) {
	return { ty.getTypePtr(), ty.getOpaqueData() };
}

int clangExt_TypeLoc_EnumTypeLocClassGetLast() {
	return TypeLoc::TypeLocClass::Qualified;
}

CXString clangExt_TypeLoc_EnumTypeLocClassGetName(TypeLoc::TypeLocClass i) {
	const char* s = nullptr;
#define TCLASS(X) case TypeLoc::TypeLocClass::##X: s = ""  #X  ""; break

	switch (i) {
#define ABSTRACT_TYPE(Derived, Base)
#define TYPE(Derived, Base) TCLASS(Derived);
#include "clang/AST/TypeNodes.inc"
	case TypeLoc::TypeLocClass::Qualified: s = "Qualified";
		break;
	}
#undef TCLASS

	return cxstring::createRef(s);
}
//=======================================================================================================================
TypeLoc::TypeLocClass clangExt_TypeLoc_getTypeLocClass(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).getTypeLocClass();
}
bool clangExt_TypeLoc_isNull(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).isNull();
}
unsigned clangExt_TypeLoc_getFullDataSizeForType(const CXQualType Ty) {
	return TypeLoc::getFullDataSizeForType(QualType::getFromOpaquePtr(Ty));
}
unsigned clangExt_TypeLoc_getLocalAlignmentForType(const CXQualType Ty) {
	return TypeLoc::getLocalAlignmentForType(QualType::getFromOpaquePtr(Ty));
}
const CXQualType clangExt_TypeLoc_getType(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).getType().getAsOpaquePtr();
}
const Type* clangExt_TypeLoc_getTypePtr(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).getTypePtr();
}
const void* clangExt_TypeLoc_getOpaqueData(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).getOpaqueData();
}
CXSourceLocation clangExt_TypeLoc_getBeginLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).getBeginLoc());
}
CXSourceLocation clangExt_TypeLoc_getEndLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).getEndLoc());
}
CXSourceRange clangExt_TypeLoc_getSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).getSourceRange());
}
unsigned clangExt_TypeLoc_getFullDataSize(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).getFullDataSize();
}
CXTypeLoc clangExt_TypeLoc_getNextTypeLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).getNextTypeLoc());
}
CXTypeLoc clangExt_TypeLoc_getUnqualifiedLoc(CXTypeLoc loc) { // UnqualTypeLoc
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).getUnqualifiedLoc());
}
CXTypeLoc clangExt_TypeLoc_IgnoreParens(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).IgnoreParens());
}
CXTypeLoc clangExt_TypeLoc_findExplicitQualifierLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).findExplicitQualifierLoc());
}
CXTypeLoc clangExt_TypeLoc_getContainedAutoTypeLoc(CXTypeLoc loc) { // AutoTypeLoc
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).getContainedAutoTypeLoc());
}
CXSourceLocation clangExt_TypeLoc_findNullabilityLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).findNullabilityLoc());
}
//=======================================================================================================================
const Type* clangExt_UnqualTypeLoc_getTypePtr(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<UnqualTypeLoc>().getTypePtr();
}
TypeLoc::TypeLocClass clangExt_UnqualTypeLoc_getTypeLocClass(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<UnqualTypeLoc>().getTypeLocClass();
}
//=======================================================================================================================
CXSourceRange clangExt_QualifiedTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<QualifiedTypeLoc>().getLocalSourceRange());
}
CXTypeLoc clangExt_QualifiedTypeLoc_getUnqualifiedLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<QualifiedTypeLoc>().getUnqualifiedLoc());
}
CXTypeLoc clangExt_QualifiedTypeLoc_getNextTypeLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<QualifiedTypeLoc>().getNextTypeLoc());
}
unsigned clangExt_QualifiedTypeLoc_getLocalDataSize(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<QualifiedTypeLoc>().getLocalDataSize();
}
unsigned clangExt_QualifiedTypeLoc_getLocalDataAlignment(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<QualifiedTypeLoc>().getLocalDataAlignment();
}
//=======================================================================================================================
ConcreteTypeLoc_I(TypeSpecTypeLoc, Type)
//
CXSourceLocation clangExt_TypeSpecTypeLoc_getNameLoc(CXTypeLoc loc, const ASTContext* Ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), CXTypeLocToTypeLoc(loc).castAs<TypeSpecTypeLoc>().getNameLoc());
}
CXSourceRange clangExt_TypeSpecTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Ctx) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Ctx), CXTypeLocToTypeLoc(loc).castAs<TypeSpecTypeLoc>().getLocalSourceRange());
}
//=======================================================================================================================
InheritingConcreteTypeLoc_I(TypedefTypeLoc, TypedefType)
const TypedefNameDecl* clangExt_TypedefNameDecl_getTypedefNameDecl(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<TypedefTypeLoc>().getTypedefNameDecl();
}
//=======================================================================================================================
ConcreteTypeLoc_I(AttributedTypeLoc, AttributedType)
//
attr::Kind clangExt_AttributedTypeLoc_getAttrKind(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().getAttrKind();
}
bool clangExt_AttributedTypeLoc_isQualifier(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().isQualifier();
}
CXTypeLoc clangExt_AttributedTypeLoc_getModifiedLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().getModifiedLoc());
}
const Attr* clangExt_AttributedTypeLoc_getAttr(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().getAttr();
}
CXSourceRange clangExt_AttributedTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().getLocalSourceRange());
}
const CXQualType clangExt_AttributedTypeLoc_getInnerType(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<AttributedTypeLoc>().getInnerType().getAsOpaquePtr();
}
//=======================================================================================================================
ConcreteTypeLoc_I(ParenTypeLoc, ParenType)
//
CXSourceLocation clangExt_ParenTypeLoc_getLParenLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ParenTypeLoc>().getLParenLoc());
}
CXSourceLocation clangExt_ParenTypeLoc_getRParenLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ParenTypeLoc>().getRParenLoc());
}
CXSourceRange clangExt_ParenTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ParenTypeLoc>().getLocalSourceRange());
}
CXTypeLoc clangExt_ParenTypeLoc_getInnerLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<ParenTypeLoc>().getInnerLoc());
}
const CXQualType clangExt_ParenTypeLoc_getInnerType(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<ParenTypeLoc>().getInnerType().getAsOpaquePtr();
}
//=======================================================================================================================
ConcreteTypeLoc_I(PointerTypeLoc, PointerType)
PointerLikeTypeLoc_I(PointerTypeLoc)
//
CXSourceLocation clangExt_PointerTypeLoc_getStarLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<PointerTypeLoc>().getStarLoc());
}
//======================================================================================================================= FunctionTypeLoc
ConcreteTypeLoc_I(FunctionTypeLoc, FunctionType)
//
CXSourceLocation clangExt_FunctionTypeLoc_getLocalRangeBegin(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getLocalRangeBegin());
}
CXSourceLocation clangExt_FunctionTypeLoc_getLocalRangeEnd(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getLocalRangeEnd());
}
CXSourceLocation clangExt_FunctionTypeLoc_getLParenLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getLParenLoc());
}
CXSourceLocation clangExt_FunctionTypeLoc_getRParenLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getRParenLoc());
}
CXSourceRange clangExt_FunctionTypeLoc_getParensRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getParensRange());
}
CXSourceRange clangExt_FunctionTypeLoc_getExceptionSpecRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getExceptionSpecRange());
}
ParmVarDecl** clangExt_FunctionTypeLoc_getParmArray(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getParmArray();
}
unsigned clangExt_FunctionTypeLoc_getNumParams(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getNumParams();
}
const ParmVarDecl* clangExt_FunctionTypeLoc_getParam(CXTypeLoc loc, unsigned i) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getParam(i);
}
CXTypeLoc clangExt_FunctionTypeLoc_getReturnLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getReturnLoc());
}
CXSourceRange clangExt_FunctionTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getLocalSourceRange());
}
unsigned clangExt_FunctionTypeLoc_getExtraLocalDataSize(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getExtraLocalDataSize();
}
unsigned clangExt_FunctionTypeLoc_getExtraLocalDataAlignment(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getExtraLocalDataAlignment();
}
const CXQualType clangExt_FunctionTypeLoc_getInnerType(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<FunctionTypeLoc>().getInnerType().getAsOpaquePtr();
}
//======================================================================================================================= FunctionProtoTypeLoc
InheritingConcreteTypeLoc_I(FunctionProtoTypeLoc, FunctionProtoType)
//======================================================================================================================= FunctionNoProtoTypeLoc
InheritingConcreteTypeLoc_I(FunctionNoProtoTypeLoc, FunctionNoProtoType)
//======================================================================================================================= ArrayTypeLoc
ConcreteTypeLoc_I(ArrayTypeLoc, ArrayType)
//
CXSourceLocation clangExt_ArrayTypeLoc_getLBracketLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getLBracketLoc());
}
CXSourceLocation clangExt_ArrayTypeLoc_getRBracketLoc(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getRBracketLoc());
}
CXSourceRange clangExt_ArrayTypeLoc_getBracketsRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getBracketsRange());
}
const Expr* clangExt_ArrayTypeLoc_getSizeExpr(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getSizeExpr();
}
CXTypeLoc clangExt_ArrayTypeLoc_getElementLoc(CXTypeLoc loc) {
	return TypeLocToCXTypeLoc(CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getElementLoc());
}
CXSourceRange clangExt_ArrayTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Context), CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getLocalSourceRange());
}
const CXQualType clangExt_ArrayTypeLoc_getInnerType(CXTypeLoc loc) {
	return CXTypeLocToTypeLoc(loc).castAs<ArrayTypeLoc>().getInnerType().getAsOpaquePtr();
}
//======================================================================================================================= ConstantArrayTypeLoc
InheritingConcreteTypeLoc_I(ConstantArrayTypeLoc, ConstantArrayType)
//=======================================================================================================================