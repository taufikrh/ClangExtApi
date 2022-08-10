#ifndef LIB_CLANG_EXT_LEX_TOKEN_H
#define LIB_CLANG_EXT_LEX_TOKEN_H

#include <clang/AST/ASTContext.h>
#include <clang/Lex/Token.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE void clangExt_Token_Dispose(Token* t);
//
CINDEX_LINKAGE tok::TokenKind clangExt_Token_getKind(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_is(const Token* t, tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_Token_isNot(const Token* t, tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_Token_isOneOf(const Token* t, tok::TokenKind K1, tok::TokenKind K2);
CINDEX_LINKAGE bool clangExt_Token_isAnyIdentifier(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isLiteral(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isAnnotation(const Token* t);
CINDEX_LINKAGE CXSourceLocation clangExt_Token_getLocation(const Token* t, const ASTContext* Ctx);
CINDEX_LINKAGE unsigned clangExt_Token_getLength(const Token* t);
CINDEX_LINKAGE CXSourceLocation clangExt_Token_getAnnotationEndLoc(const Token* t, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_Token_getLastLoc(const Token* t, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_Token_getEndLoc(const Token* t, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceRange clangExt_Token_getAnnotationRange(const Token* t, const ASTContext* Ctx);
CINDEX_LINKAGE const char* clangExt_Token_getName(const Token* t);
CINDEX_LINKAGE const IdentifierInfo* clangExt_Token_getIdentifierInfo(const Token* t);
CINDEX_LINKAGE const void* clangExt_Token_getEofData(const Token* t);
CINDEX_LINKAGE CXString clangExt_Token_getRawIdentifier(const Token* t);
CINDEX_LINKAGE const char* clangExt_Token_getLiteralData(const Token* t);
CINDEX_LINKAGE const void* clangExt_Token_getAnnotationValue(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_getFlag(const Token* t, Token::TokenFlags Flag);
CINDEX_LINKAGE unsigned clangExt_Token_getFlags(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isAtStartOfLine(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_hasLeadingSpace(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isExpandDisabled(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isObjCAtKeyword(const Token* t, tok::ObjCKeywordKind objcKey);
CINDEX_LINKAGE tok::ObjCKeywordKind clangExt_Token_getObjCKeywordID(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_needsCleaning(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_hasLeadingEmptyMacro(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_hasUDSuffix(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_hasUCN(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_stringifiedInMacro(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_commaAfterElided(const Token* t);
CINDEX_LINKAGE bool clangExt_Token_isEditorPlaceholder(const Token* t);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_PPConditionalInfo_IfLoc(const PPConditionalInfo* p, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_PPConditionalInfo_WasSkipping(const PPConditionalInfo* p);
CINDEX_LINKAGE bool clangExt_PPConditionalInfo_FoundNonSkip(const PPConditionalInfo* p);
CINDEX_LINKAGE bool clangExt_PPConditionalInfo_FoundElse(const PPConditionalInfo* p);

//=======================================================================================================================
//=======================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif