#ifndef LIB_CLANG_EXT_AST_OPERATIONKINDS_H
#define LIB_CLANG_EXT_AST_OPERATIONKINDS_H

#include <clang/AST/OperationKinds.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE CXString clangExt_CastKind_GetName(CastKind K);
CINDEX_LINKAGE CXString clangExt_BinaryOperatorKind_GetName(BinaryOperatorKind K);
CINDEX_LINKAGE CXString clangExt_UnaryOperatorKind_GetName(UnaryOperatorKind K);

LLVM_CLANG_C_EXTERN_C_END

#endif