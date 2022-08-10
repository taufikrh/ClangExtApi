#ifndef LIB_CLANG_EXT_BASIC_OPERATORKINDS_H
#define LIB_CLANG_EXT_BASIC_OPERATORKINDS_H

#include <clang/Basic/OperatorKinds.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindLength();
CINDEX_LINKAGE CXString clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindName(OverloadedOperatorKind i);
//
CINDEX_LINKAGE const char* clangExt_OverloadedOperatorKind_getOperatorSpelling(OverloadedOperatorKind Operator);
CINDEX_LINKAGE OverloadedOperatorKind clangExt_OverloadedOperatorKind_getRewrittenOverloadedOperator(OverloadedOperatorKind Kind);
CINDEX_LINKAGE bool clangExt_OverloadedOperatorKind_isCompoundAssignmentOperator(OverloadedOperatorKind Kind);
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif