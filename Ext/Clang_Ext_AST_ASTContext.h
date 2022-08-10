#ifndef LIB_CLANG_EXT_AST_ASTCONTEXT_H
#define LIB_CLANG_EXT_AST_ASTCONTEXT_H

#include <clang/AST/ASTContext.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE const CXPrintingPolicy clangExt_ASTContext_getPrintingPolicy(const ASTContext* C);
CINDEX_LINKAGE const CXQualType clangExt_ASTContext_getAttributedType(const ASTContext* C, attr::Kind attrKind, const CXQualType modifiedType, const CXQualType equivalentType);

LLVM_CLANG_C_EXTERN_C_END

#endif