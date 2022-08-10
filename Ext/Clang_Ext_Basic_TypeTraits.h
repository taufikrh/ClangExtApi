#ifndef LIB_CLANG_EXT_BASIC_TYPETRAITS_H
#define LIB_CLANG_EXT_BASIC_TYPETRAITS_H

#include <clang/Basic/TypeTraits.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_TypeTrait_get_UTT_Last();
CINDEX_LINKAGE int clangExt_TypeTrait_get_BTT_Last();
CINDEX_LINKAGE int clangExt_TypeTrait_get_TT_Last();
CINDEX_LINKAGE const char* clangExt_TypeTrait_getName(int i);
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_ArrayTypeTrait_getLast();
CINDEX_LINKAGE const char* clangExt_ArrayTypeTrait_getName(int i);
//=======================================================================================================================
CINDEX_LINKAGE int clangExt_UnaryExprOrTypeTrait_getLast();
CINDEX_LINKAGE const char* clangExt_UnaryExprOrTypeTrait_getName(int i);
//=======================================================================================================================
CINDEX_LINKAGE const char* clangExt_TypeTrait_getTraitName(TypeTrait T);
CINDEX_LINKAGE const char* clangExt_TypeTrait_getTraitSpelling(TypeTrait T);
//=======================================================================================================================
CINDEX_LINKAGE const char* clangExt_ArrayTypeTrait_getTraitName(ArrayTypeTrait T);
CINDEX_LINKAGE const char* clangExt_ArrayTypeTrait_getTraitSpelling(ArrayTypeTrait T);
//=======================================================================================================================
CINDEX_LINKAGE const char* clangExt_UnaryExprOrTypeTrait_getTraitName(UnaryExprOrTypeTrait T);
CINDEX_LINKAGE const char* clangExt_UnaryExprOrTypeTrait_getTraitSpelling(UnaryExprOrTypeTrait T);
//=======================================================================================================================
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif