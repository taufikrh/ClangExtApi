#ifndef LIB_CLANG_EXT_LLVM_ADT_APINT_H
#define LIB_CLANG_EXT_LLVM_ADT_APINT_H

#include <llvm/ADT/APInt.h>
#include "clang-c/Index.h"

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE void clangExt_APInt_Dispose(llvm::APInt* a);
CINDEX_LINKAGE unsigned clangExt_APInt_getBitWidth(const llvm::APInt* a); // 1423
CINDEX_LINKAGE uint64_t clangExt_APInt_getZExtValue(const llvm::APInt* a); // 1478
CINDEX_LINKAGE int64_t clangExt_APInt_getSExtValue(const llvm::APInt* a);
CINDEX_LINKAGE CXString clangExt_APInt_toString(const llvm::APInt* a, unsigned Radix, bool Signed, bool formatAsCLiteral = false);

//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif