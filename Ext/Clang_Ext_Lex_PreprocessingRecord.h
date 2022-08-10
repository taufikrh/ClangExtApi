#ifndef LIB_CLANG_EXT_LEX_PREPROCESSINGRECORD_H
#define LIB_CLANG_EXT_LEX_PREPROCESSINGRECORD_H

#include <clang/Lex/PreprocessingRecord.h>
#include <clang/Lex/Preprocessor.h>
#include <clang/AST/ASTContext.h>
#include "clang-c/Index.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

CINDEX_LINKAGE PreprocessedEntity::EntityKind clangExt_PreprocessedEntity_getKind(const PreprocessedEntity* e);
CINDEX_LINKAGE CXSourceRange clangExt_PreprocessedEntity_getSourceRange(const PreprocessedEntity* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_PreprocessedEntity_isInvalid(const PreprocessedEntity* e);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_PreprocessingDirective_classof(const PreprocessedEntity* PE);
//=======================================================================================================================
CINDEX_LINKAGE const IdentifierInfo* clangExt_MacroDefinitionRecord_getName(const MacroDefinitionRecord* m);
CINDEX_LINKAGE CXSourceLocation clangExt_MacroDefinitionRecord_getLocation(const MacroDefinitionRecord* m, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_MacroDefinitionRecord_classof(const PreprocessedEntity* PE);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_MacroExpansion_isBuiltinMacro(const MacroExpansion* m);
CINDEX_LINKAGE const IdentifierInfo* clangExt_MacroExpansion_getName(const MacroExpansion* m);
CINDEX_LINKAGE const MacroDefinitionRecord* clangExt_MacroExpansion_getDefinition(const MacroExpansion* m);
CINDEX_LINKAGE bool clangExt_MacroExpansion_classof(const PreprocessedEntity* PE);
//=======================================================================================================================
CINDEX_LINKAGE InclusionDirective::InclusionKind clangExt_InclusionDirective_getKind(const InclusionDirective* i);
CINDEX_LINKAGE CXString clangExt_InclusionDirective_getFileName(const InclusionDirective* i);
CINDEX_LINKAGE bool clangExt_InclusionDirective_wasInQuotes(const InclusionDirective* i);
CINDEX_LINKAGE bool clangExt_InclusionDirective_importedModule(const InclusionDirective* i);
CINDEX_LINKAGE const FileEntry* clangExt_InclusionDirective_getFile(const InclusionDirective* i);
CINDEX_LINKAGE bool clangExt_InclusionDirective_classof(const PreprocessedEntity* PE);
//=======================================================================================================================
typedef bool(*PreprocessingRecordVisitor)(const PreprocessedEntity* e, CXClientData client_data);

CINDEX_LINKAGE size_t clangExt_PreprocessingRecord_getTotalMemory(const PreprocessingRecord* p);
CINDEX_LINKAGE bool clangExt_PreprocessingRecord_getPreprocessedEntitiesAll(const PreprocessingRecord* p, PreprocessingRecordVisitor visitor, CXClientData client_data);
CINDEX_LINKAGE bool clangExt_PreprocessingRecord_getPreprocessedEntitiesLocal(const PreprocessingRecord* p, PreprocessingRecordVisitor visitor, CXClientData client_data);
CINDEX_LINKAGE bool clangExt_PreprocessingRecord_getPreprocessedEntitiesInRange(const PreprocessingRecord* p, CXSourceRange R, PreprocessingRecordVisitor visitor, CXClientData client_data);
//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif