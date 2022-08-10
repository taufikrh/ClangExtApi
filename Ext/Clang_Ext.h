#ifndef LIB_CLANG_EXT_H
#define LIB_CLANG_EXT_H

#include <clang/AST/Decl.h>
#include <clang/AST/Expr.h>
#include <clang/AST/Attr.h>
#include <clang/AST/Stmt.h>
//#include <clang/AST/VTableBuilder.h>
#include <clang-c/Index.h>
#include <clang/Frontend/ASTUnit.h>
#include <clang/Lex/Token.h>

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE int clangExt_SizeOf();

CINDEX_LINKAGE const Decl *clangExt_Cursor_getCursorDecl(CXCursor Cursor);
CINDEX_LINKAGE const Expr *clangExt_Cursor_getCursorExpr(CXCursor Cursor);
CINDEX_LINKAGE const Stmt *clangExt_Cursor_getCursorStmt(CXCursor Cursor);
CINDEX_LINKAGE const Attr *clangExt_Cursor_getCursorAttr(CXCursor Cursor);
//=======================================================================================================================
CINDEX_LINKAGE const ASTUnit *clangExt_Cursor_getASTUnit(CXCursor Cursor);
CINDEX_LINKAGE const ASTContext *clangExt_Cursor_getASTContext(CXCursor Cursor);
CINDEX_LINKAGE const MacroDefinitionRecord* clangExt_Cursor_getCursorMacroDefinition(CXCursor C);
CINDEX_LINKAGE const InclusionDirective* clangExt_Cursor_getCursorInclusionDirective(CXCursor C);
//=======================================================================================================================
CINDEX_LINKAGE unsigned clangExt_Cursor_getNumAttrs(CXCursor C);
CINDEX_LINKAGE CXCursor clangExt_Cursor_getAttr(CXCursor C, unsigned i);
CINDEX_LINKAGE bool clangExt_Cursor_getAttrKind(CXCursor C, attr::Kind* kind);
CINDEX_LINKAGE bool clangExt_Cursor_getDeclKind(CXCursor C, Decl::Kind *kind);
//=======================================================================================================================
CINDEX_LINKAGE CXString clangExt_getDeclUSR(const Decl* D, CXTranslationUnit TU);

typedef bool(*clangExt_getTokensVisitor)(const Token* t, CXClientData client_data);
// create new token should be dispose with clangExt_Token_Dispose
CINDEX_LINKAGE bool clangExt_getTokens(const ASTUnit* CXXUnit, CXSourceRange Range, clangExt_getTokensVisitor visitor, CXClientData client_data, bool createToken = false);
CINDEX_LINKAGE bool clangExt_getTokenPtrsFromSourceRange(const ASTUnit* CXXUnit, CXSourceRange Range, Token** Tokens, unsigned* NumTokens); // clangExt_disposeTokenPtrs
CINDEX_LINKAGE bool clangExt_getTokenPtrsFromSourceLocation(const ASTUnit* CXXUnit, CXSourceLocation Location, Token** Tokens, unsigned* NumTokens); // clangExt_disposeTokenPtrs
CINDEX_LINKAGE void clangExt_disposeTokenPtrs(Token** Tokens, unsigned NumTokens);

//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif