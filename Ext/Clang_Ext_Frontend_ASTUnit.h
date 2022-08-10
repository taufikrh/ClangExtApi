#ifndef LIB_CLANG_EXT_FRONTEND_ASTUNIT
#define LIB_CLANG_EXT_FRONTEND_ASTUNIT

//#include <clang/Lex/Preprocessor.h>
#include <clang/Frontend/ASTUnit.h>
#include <clang-c/Index.h>

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE const Preprocessor* clangExt_ASTUnit_getPreprocessorPtr(const ASTUnit* u);
CINDEX_LINKAGE CXString clangExt_ASTUnit_getMainFileName(const ASTUnit* u);

LLVM_CLANG_C_EXTERN_C_END

#endif