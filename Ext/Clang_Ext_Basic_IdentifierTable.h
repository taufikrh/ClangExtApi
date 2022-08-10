#ifndef LIB_CLANG_EXT_BASIC_IDENTIFIERTABLE_H
#define LIB_CLANG_EXT_BASIC_IDENTIFIERTABLE_H

#include <clang/Basic/IdentifierTable.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=======================================================================================================================
CINDEX_LINKAGE const char* clangExt_IdentifierInfo_getNameStart(const IdentifierInfo* I);
CINDEX_LINKAGE unsigned clangExt_IdentifierInfo_getLength(const IdentifierInfo* I);
CINDEX_LINKAGE CXString clangExt_IdentifierInfo_getName(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_hasMacroDefinition(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_hadMacroDefinition(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isDeprecatedMacro(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isRestrictExpansion(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isFinal(const IdentifierInfo* I);
CINDEX_LINKAGE tok::TokenKind clangExt_IdentifierInfo_getTokenID(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_hasRevertedTokenIDToIdentifier(const IdentifierInfo* I);
CINDEX_LINKAGE tok::PPKeywordKind clangExt_IdentifierInfo_getPPKeywordID(const IdentifierInfo* I);
CINDEX_LINKAGE tok::ObjCKeywordKind clangExt_IdentifierInfo_getObjCKeywordID(const IdentifierInfo* I);
CINDEX_LINKAGE unsigned clangExt_IdentifierInfo_getBuiltinID(const IdentifierInfo* I);
CINDEX_LINKAGE unsigned clangExt_IdentifierInfo_getObjCOrBuiltinID(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isExtensionToken(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isFutureCompatKeyword(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isPoisoned(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isCPlusPlusOperatorKeyword(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isKeyword(const IdentifierInfo* I, const LangOptions* LangOpts);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isCPlusPlusKeyword(const IdentifierInfo* I, const LangOptions* LangOpts);
CINDEX_LINKAGE void* clangExt_IdentifierInfo_getFETokenInfo(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isHandleIdentifierCase(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isFromAST(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_hasChangedSinceDeserialization(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_hasFETokenInfoChangedSinceDeserialization(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isOutOfDate(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isModulesImport(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isMangledOpenMPVariantName(const IdentifierInfo* I);
CINDEX_LINKAGE bool clangExt_IdentifierInfo_isEditorPlaceholder(const IdentifierInfo* I);
CINDEX_LINKAGE ReservedIdentifierStatus clangExt_IdentifierInfo_isReserved(const IdentifierInfo* I, const LangOptions* LangOpts);
CINDEX_LINKAGE CXString clangExt_IdentifierInfo_deuglifiedName(const IdentifierInfo* I);

//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif