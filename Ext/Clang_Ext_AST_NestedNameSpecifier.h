#ifndef LIB_CLANG_EXT_AST_NESTEDNAMESPECIFIER_H
#define LIB_CLANG_EXT_AST_NESTEDNAMESPECIFIER_H

#include <clang/AST/NestedNameSpecifier.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE void clangExt_NestedNameSpecifierLoc_Dispose(NestedNameSpecifierLoc* n);

//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif