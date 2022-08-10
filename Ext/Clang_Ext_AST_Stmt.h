#ifndef LIB_CLANG_EXT_AST_STMT_H
#define LIB_CLANG_EXT_AST_STMT_H

#include <clang/AST/ASTContext.h>
#include <clang/AST/Stmt.h>
#include <clang/AST/Attr.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE int clangExt_Stmt_getNumStmtClass();
CINDEX_LINKAGE CXString clangExt_Stmt_getNameStmtClass(Stmt::StmtClass i);
//
CINDEX_LINKAGE Stmt::StmtClass clangExt_Stmt_getStmtClass(const Stmt* s);
CINDEX_LINKAGE const char* clangExt_Stmt_getStmtClassName(const Stmt* s);
CINDEX_LINKAGE CXSourceRange clangExt_Stmt_getSourceRange(const Stmt* s, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_Stmt_getBeginLoc(const Stmt* s, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_Stmt_getEndLoc(const Stmt* s, const ASTContext* Ctx);
CINDEX_LINKAGE Stmt::Likelihood clangExt_Stmt_getLikelihood(const Stmt* s);
CINDEX_LINKAGE const Attr* clangExt_Stmt_getLikelihoodAttr(const Stmt* s);
CINDEX_LINKAGE CXString clangExt_Stmt_dump(const Stmt* s, const ASTContext* Context);
CINDEX_LINKAGE CXString clangExt_Stmt_printPretty(const Stmt* s, const CXPrintingPolicy Policy, unsigned Indentation, const char* NewlineSymbol, const ASTContext* Context = nullptr);

CINDEX_LINKAGE const Stmt* clangExt_Stmt_IgnoreContainers(const Stmt* s, bool IgnoreCaptured = false);
CINDEX_LINKAGE const Stmt* clangExt_Stmt_stripLabelLikeStatements(const Stmt* s);
CINDEX_LINKAGE unsigned clangExt_Stmt_getNumChildren(const Stmt* s);
CINDEX_LINKAGE const Stmt* clangExt_Stmt_getChildren(const Stmt* s, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE const Expr* clangExt_ValueStmt_getExprStmt(const ValueStmt* s);
CINDEX_LINKAGE bool clangExt_ValueStmt_classof(const Stmt* T);
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif