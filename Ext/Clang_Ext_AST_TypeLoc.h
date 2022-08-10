#ifndef LIB_CLANG_EXT_AST_TYPELOC_H
#define LIB_CLANG_EXT_AST_TYPELOC_H

#include <clang/AST/Type.h>
#include <clang/AST/TypeLoc.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

#include "Clang_Ext_AST_TypeLoc.inc"
//======================================================================================================================= TypeLoc
CINDEX_LINKAGE int clangExt_TypeLoc_EnumTypeLocClassGetLast();
CINDEX_LINKAGE CXString clangExt_TypeLoc_EnumTypeLocClassGetName(TypeLoc::TypeLocClass i);
//=======================================================================================================================
CINDEX_LINKAGE TypeLoc::TypeLocClass clangExt_TypeLoc_getTypeLocClass(CXTypeLoc loc);
CINDEX_LINKAGE bool clangExt_TypeLoc_isNull(CXTypeLoc loc);
CINDEX_LINKAGE unsigned clangExt_TypeLoc_getFullDataSizeForType(const CXQualType Ty);
CINDEX_LINKAGE unsigned clangExt_TypeLoc_getLocalAlignmentForType(const CXQualType Ty);
CINDEX_LINKAGE const CXQualType clangExt_TypeLoc_getType(CXTypeLoc loc);
CINDEX_LINKAGE const Type* clangExt_TypeLoc_getTypePtr(CXTypeLoc loc);
CINDEX_LINKAGE const void* clangExt_TypeLoc_getOpaqueData(CXTypeLoc loc);
CINDEX_LINKAGE CXSourceLocation clangExt_TypeLoc_getBeginLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_TypeLoc_getEndLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceRange clangExt_TypeLoc_getSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE unsigned clangExt_TypeLoc_getFullDataSize(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_TypeLoc_getNextTypeLoc(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_TypeLoc_getUnqualifiedLoc(CXTypeLoc loc); // UnqualTypeLoc
CINDEX_LINKAGE CXTypeLoc clangExt_TypeLoc_IgnoreParens(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_TypeLoc_findExplicitQualifierLoc(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_TypeLoc_getContainedAutoTypeLoc(CXTypeLoc loc); // AutoTypeLoc
CINDEX_LINKAGE CXSourceLocation clangExt_TypeLoc_findNullabilityLoc(CXTypeLoc loc, const ASTContext* Context);
//======================================================================================================================= UnqualTypeLoc
CINDEX_LINKAGE const Type* clangExt_UnqualTypeLoc_getTypePtr(CXTypeLoc loc);
CINDEX_LINKAGE TypeLoc::TypeLocClass clangExt_UnqualTypeLoc_getTypeLocClass(CXTypeLoc loc);
//======================================================================================================================= QualifiedTypeLoc
CINDEX_LINKAGE CXSourceRange clangExt_QualifiedTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXTypeLoc clangExt_QualifiedTypeLoc_getUnqualifiedLoc(CXTypeLoc loc); // UnqualTypeLoc
CINDEX_LINKAGE CXTypeLoc clangExt_QualifiedTypeLoc_getNextTypeLoc(CXTypeLoc loc);
CINDEX_LINKAGE unsigned clangExt_QualifiedTypeLoc_getLocalDataSize(CXTypeLoc loc);
CINDEX_LINKAGE unsigned clangExt_QualifiedTypeLoc_getLocalDataAlignment(CXTypeLoc loc);
//======================================================================================================================= TypeSpecTypeLoc
ConcreteTypeLoc_H(TypeSpecTypeLoc, Type)
//
CINDEX_LINKAGE CXSourceLocation clangExt_TypeSpecTypeLoc_getNameLoc(CXTypeLoc loc, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceRange clangExt_TypeSpecTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Ctx);
//======================================================================================================================= TypedefTypeLoc
InheritingConcreteTypeLoc_H(TypedefTypeLoc, TypedefType)
CINDEX_LINKAGE const TypedefNameDecl* clangExt_TypedefNameDecl_getTypedefNameDecl(CXTypeLoc loc);
//======================================================================================================================= AttributedTypeLoc
ConcreteTypeLoc_H(AttributedTypeLoc, AttributedType)
//
CINDEX_LINKAGE attr::Kind clangExt_AttributedTypeLoc_getAttrKind(CXTypeLoc loc);
CINDEX_LINKAGE bool clangExt_AttributedTypeLoc_isQualifier(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_AttributedTypeLoc_getModifiedLoc(CXTypeLoc loc);
CINDEX_LINKAGE const Attr* clangExt_AttributedTypeLoc_getAttr(CXTypeLoc loc);
CINDEX_LINKAGE CXSourceRange clangExt_AttributedTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE const CXQualType clangExt_AttributedTypeLoc_getInnerType(CXTypeLoc loc);
//======================================================================================================================= ParenTypeLoc
ConcreteTypeLoc_H(ParenTypeLoc, ParenType)
//
CINDEX_LINKAGE CXSourceLocation clangExt_ParenTypeLoc_getLParenLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_ParenTypeLoc_getRParenLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceRange clangExt_ParenTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXTypeLoc clangExt_ParenTypeLoc_getInnerLoc(CXTypeLoc loc);
CINDEX_LINKAGE const CXQualType clangExt_ParenTypeLoc_getInnerType(CXTypeLoc loc);
//======================================================================================================================= PointerTypeLoc
// ConcreteTypeLoc
ConcreteTypeLoc_H(PointerTypeLoc, PointerType)
// PointerLikeTypeLoc
PointerLikeTypeLoc_H(PointerTypeLoc)
// PointerTypeLoc
CINDEX_LINKAGE CXSourceLocation clangExt_PointerTypeLoc_getStarLoc(CXTypeLoc loc, const ASTContext* Context);
//======================================================================================================================= FunctionTypeLoc
// ConcreteTypeLoc
ConcreteTypeLoc_H(FunctionTypeLoc, FunctionType)
//
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionTypeLoc_getLocalRangeBegin(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionTypeLoc_getLocalRangeEnd(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionTypeLoc_getLParenLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_FunctionTypeLoc_getRParenLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionTypeLoc_getParensRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionTypeLoc_getExceptionSpecRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE ParmVarDecl** clangExt_FunctionTypeLoc_getParmArray(CXTypeLoc loc);
CINDEX_LINKAGE unsigned clangExt_FunctionTypeLoc_getNumParams(CXTypeLoc loc);
CINDEX_LINKAGE const ParmVarDecl* clangExt_FunctionTypeLoc_getParam(CXTypeLoc loc, unsigned i);
CINDEX_LINKAGE CXTypeLoc clangExt_FunctionTypeLoc_getReturnLoc(CXTypeLoc loc);
CINDEX_LINKAGE CXSourceRange clangExt_FunctionTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE unsigned clangExt_FunctionTypeLoc_getExtraLocalDataSize(CXTypeLoc loc);
CINDEX_LINKAGE unsigned clangExt_FunctionTypeLoc_getExtraLocalDataAlignment(CXTypeLoc loc);
CINDEX_LINKAGE const CXQualType clangExt_FunctionTypeLoc_getInnerType(CXTypeLoc loc);
//======================================================================================================================= FunctionProtoTypeLoc
InheritingConcreteTypeLoc_H(FunctionProtoTypeLoc, FunctionProtoType)
//======================================================================================================================= FunctionNoProtoTypeLoc
InheritingConcreteTypeLoc_H(FunctionNoProtoTypeLoc, FunctionNoProtoType)
//======================================================================================================================= ArrayTypeLoc
// ConcreteTypeLoc
ConcreteTypeLoc_H(ArrayTypeLoc, ArrayType)
//
CINDEX_LINKAGE CXSourceLocation clangExt_ArrayTypeLoc_getLBracketLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceLocation clangExt_ArrayTypeLoc_getRBracketLoc(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE CXSourceRange clangExt_ArrayTypeLoc_getBracketsRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE const Expr* clangExt_ArrayTypeLoc_getSizeExpr(CXTypeLoc loc);
CINDEX_LINKAGE CXTypeLoc clangExt_ArrayTypeLoc_getElementLoc(CXTypeLoc loc);
CINDEX_LINKAGE CXSourceRange clangExt_ArrayTypeLoc_getLocalSourceRange(CXTypeLoc loc, const ASTContext* Context);
CINDEX_LINKAGE const CXQualType clangExt_ArrayTypeLoc_getInnerType(CXTypeLoc loc);
//======================================================================================================================= ConstantArrayTypeLoc
InheritingConcreteTypeLoc_H(ConstantArrayTypeLoc, ConstantArrayType)
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif