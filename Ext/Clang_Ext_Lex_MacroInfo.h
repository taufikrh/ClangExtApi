#ifndef LIB_CLANG_EXT_LEX_MACROINFO_H
#define LIB_CLANG_EXT_LEX_MACROINFO_H

#include <clang/AST/ASTContext.h>
#include <clang/Lex/MacroInfo.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE CXSourceLocation clangExt_MacroInfo_getDefinitionLoc(const MacroInfo* m, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_MacroInfo_getDefinitionEndLoc(const MacroInfo* m, const ASTContext* Ctx);
CINDEX_LINKAGE unsigned clangExt_MacroInfo_getDefinitionLength(const MacroInfo* m, const SourceManager* SM);
CINDEX_LINKAGE bool clangExt_MacroInfo_isIdenticalTo(const MacroInfo* m, const MacroInfo* Other, const Preprocessor* PP, bool Syntactically);
CINDEX_LINKAGE bool clangExt_MacroInfo_param_empty(const MacroInfo* m);
CINDEX_LINKAGE unsigned clangExt_MacroInfo_getNumParams(const MacroInfo* m);
CINDEX_LINKAGE const IdentifierInfo* clangExt_MacroInfo_getParams(const MacroInfo* m, unsigned i);
CINDEX_LINKAGE int clangExt_MacroInfo_getParameterNum(const MacroInfo* m, const IdentifierInfo* Arg);
CINDEX_LINKAGE bool clangExt_MacroInfo_isFunctionLike(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isObjectLike(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isC99Varargs(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isGNUVarargs(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isVariadic(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isBuiltinMacro(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_hasCommaPasting(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isUsed(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isAllowRedefinitionsWithoutWarning(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isWarnIfUnused(const MacroInfo* m);
CINDEX_LINKAGE unsigned clangExt_MacroInfo_getNumTokens(const MacroInfo* m);
CINDEX_LINKAGE const Token* clangExt_MacroInfo_getReplacementToken(const MacroInfo* m, unsigned Tok);
CINDEX_LINKAGE bool clangExt_MacroInfo_tokens_empty(const MacroInfo* m);
CINDEX_LINKAGE const Token* clangExt_MacroInfo_getTokens(const MacroInfo* m, unsigned i);
CINDEX_LINKAGE bool clangExt_MacroInfo_isEnabled(const MacroInfo* m);
CINDEX_LINKAGE bool clangExt_MacroInfo_isUsedForHeaderGuard(const MacroInfo* m);

LLVM_CLANG_C_EXTERN_C_END

#endif