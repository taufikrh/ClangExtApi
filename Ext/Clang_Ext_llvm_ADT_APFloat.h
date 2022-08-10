#ifndef LIB_CLANG_EXT_LLVM_ADT_APFLOAT_H
#define LIB_CLANG_EXT_LLVM_ADT_APFLOAT_H

#include <llvm/ADT/APFloat.h>
#include "clang-c/Index.h"

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE void clangExt_APFloat_Dispose(llvm::APFloat* a);
CINDEX_LINKAGE double clangExt_APFloat_convertToDouble(const llvm::APFloat* a);
CINDEX_LINKAGE float clangExt_APFloat_convertToFloat(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isZero(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isInfinity(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isNaN(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isNegative(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isDenormal(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isSignaling(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isNormal(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isFinite(const llvm::APFloat* a);
CINDEX_LINKAGE llvm::APFloatBase::fltCategory clangExt_APFloat_getCategory(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isNonZero(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isFiniteNonZero(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isPosZero(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isNegZero(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isSmallest(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isLargest(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isInteger(const llvm::APFloat* a);
CINDEX_LINKAGE bool clangExt_APFloat_isIEEE(const llvm::APFloat* a);
CINDEX_LINKAGE CXString clangExt_APFloat_toString(const llvm::APFloat* a, unsigned FormatPrecision = 0, unsigned FormatMaxPadding = 3, bool TruncateZero = true);
//
CINDEX_LINKAGE double clangExt_APFloat_GetApproxValue(const llvm::APFloat* a);

//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif