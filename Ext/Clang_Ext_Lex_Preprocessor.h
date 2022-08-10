#ifndef LIB_CLANG_EXT_LEX_PREPROCESSOR_H
#define LIB_CLANG_EXT_LEX_PREPROCESSOR_H

#include <clang/Lex/PreprocessingRecord.h>
#include <clang/Lex/Preprocessor.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE const LangOptions *clangExt_Preprocessor_getLangOpts(const Preprocessor *p);
CINDEX_LINKAGE const TargetInfo* clangExt_Preprocessor_getTargetInfo(const Preprocessor *p);
CINDEX_LINKAGE const TargetInfo* clangExt_Preprocessor_getAuxTargetInfo(const Preprocessor* p);
CINDEX_LINKAGE unsigned clangExt_Preprocessor_getNumDirectives(const Preprocessor* p);
CINDEX_LINKAGE unsigned clangExt_Preprocessor_getTokenCount(const Preprocessor* p);
CINDEX_LINKAGE unsigned clangExt_Preprocessor_getNumMacros(const Preprocessor* p);
CINDEX_LINKAGE bool clangExt_Preprocessor_isMacroDefined(const Preprocessor* p, CXString Id);
CINDEX_LINKAGE bool clangExt_Preprocessor_isMacroDefinedByIdentifierInfo(const Preprocessor* p, const IdentifierInfo* II);
CINDEX_LINKAGE const MacroInfo* clangExt_Preprocessor_getMacroInfo(const Preprocessor* p, const IdentifierInfo* II);

CINDEX_LINKAGE const IdentifierInfo* clangExt_Preprocessor_getIdentifierInfo(const Preprocessor* p, CXString Name);
CINDEX_LINKAGE const PreprocessingRecord* clangExt_Preprocessor_getPreprocessingRecord(const Preprocessor* p); //1376
CINDEX_LINKAGE bool clangExt_Preprocessor_getRawToken(const Preprocessor* p, CXSourceLocation Loc, const Token** Result, bool IgnoreWhiteSpace = false); // 1866. dispose with clangExt_Token_Dispose
CINDEX_LINKAGE const IdentifierInfo* clangExt_Preprocessor_LookUpIdentifierInfo(const Preprocessor* p, const Token* Identifier); // 1995
CINDEX_LINKAGE bool clangExt_Preprocessor_isRecordingPreamble(const Preprocessor* p); // 2474
CINDEX_LINKAGE bool clangExt_Preprocessor_hasRecordedPreamble(const Preprocessor* p);
CINDEX_LINKAGE unsigned clangExt_Preprocessor_getNumPreambleConditionalStack(const Preprocessor* p);
CINDEX_LINKAGE const PPConditionalInfo* clangExt_Preprocessor_getPreambleConditionalStack(const Preprocessor* p, unsigned i);

LLVM_CLANG_C_EXTERN_C_END


#endif