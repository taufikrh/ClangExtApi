#ifndef LIB_CLANG_EXT_LLVM_ADT_APSINT_H
#define LIB_CLANG_EXT_LLVM_ADT_APSINT_H

#include <llvm/ADT/APSInt.h>
#include "clang-c/Index.h"

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE void clangExt_APSInt_Dispose(llvm::APSInt* a);
CINDEX_LINKAGE bool clangExt_APSInt_isNegative(const llvm::APSInt* a);
CINDEX_LINKAGE bool clangExt_APSInt_isNonNegative(const llvm::APSInt* a);
CINDEX_LINKAGE bool clangExt_APSInt_isStrictlyPositive(const llvm::APSInt* a);
CINDEX_LINKAGE bool clangExt_APSInt_isSigned(const llvm::APSInt* a);
CINDEX_LINKAGE bool clangExt_APSInt_isUnsigned(const llvm::APSInt* a);
CINDEX_LINKAGE CXString clangExt_APSInt_toString(const llvm::APSInt* a, unsigned Radix = 10);
CINDEX_LINKAGE int64_t clangExt_APSInt_getExtValue(const llvm::APSInt* a);
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif