#ifndef LIB_CLANG_EXT_BASIC_TOKENKINDS_H
#define LIB_CLANG_EXT_BASIC_TOKENKINDS_H

#include <clang/Basic/TokenKinds.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE unsigned short clangExt_TokenKind_GetLast();
CINDEX_LINKAGE const char* clangExt_TokenKind_getName(tok::TokenKind Kind);
//=======================================================================================================================
CINDEX_LINKAGE const char* clangExt_TokenKind_getTokenName(tok::TokenKind Kind);
CINDEX_LINKAGE const char* clangExt_TokenKind_getPunctuatorSpelling(tok::TokenKind Kind);
CINDEX_LINKAGE const char* clangExt_TokenKind_getKeywordSpelling(tok::TokenKind Kind);
CINDEX_LINKAGE bool clangExt_TokenKind_isAnyIdentifier(tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_TokenKind_isStringLiteral(tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_TokenKind_isLiteral(tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_TokenKind_isAnnotation(tok::TokenKind K);
CINDEX_LINKAGE bool clangExt_TokenKind_isPragmaAnnotation(tok::TokenKind K);
CINDEX_LINKAGE const char* clangExt_PPKeywordKind_getPPKeywordSpelling(tok::PPKeywordKind Kind);
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_PPKeywordKind_GetLast();
CINDEX_LINKAGE const char* clangExt_PPKeywordKind_getName(tok::PPKeywordKind Kind);
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_ObjCKeywordKind_GetLast();
CINDEX_LINKAGE const char* clangExt_ObjCKeywordKind_getName(tok::ObjCKeywordKind Kind);
//=======================================================================================================================
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif