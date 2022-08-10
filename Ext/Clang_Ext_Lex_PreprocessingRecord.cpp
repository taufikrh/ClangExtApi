
#include "Clang_Ext_Lex_PreprocessingRecord.h"
#include "CXSourceLocation.h"
#include "CXString.h"

//=======================================================================================================================
PreprocessedEntity::EntityKind clangExt_PreprocessedEntity_getKind(const PreprocessedEntity* e) {
	return e->getKind();
}
CXSourceRange clangExt_PreprocessedEntity_getSourceRange(const PreprocessedEntity* e, const ASTContext* Ctx) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*Ctx), e->getSourceRange());
}
bool clangExt_PreprocessedEntity_isInvalid(const PreprocessedEntity* e) {
	return e->isInvalid();
}
//=======================================================================================================================
bool clangExt_PreprocessingDirective_classof(const PreprocessedEntity* PE) {
	return PreprocessingDirective::classof(PE);
}
//=======================================================================================================================
const IdentifierInfo* clangExt_MacroDefinitionRecord_getName(const MacroDefinitionRecord* m) {
	return m->getName();
}
CXSourceLocation clangExt_MacroDefinitionRecord_getLocation(const MacroDefinitionRecord* m, const ASTContext* Ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), m->getLocation());
}
bool clangExt_MacroDefinitionRecord_classof(const PreprocessedEntity* PE) {
	return MacroDefinitionRecord::classof(PE);
}
//=======================================================================================================================
bool clangExt_MacroExpansion_isBuiltinMacro(const MacroExpansion* m) {
	return m->isBuiltinMacro();
}
const IdentifierInfo* clangExt_MacroExpansion_getName(const MacroExpansion* m) {
	return m->getName();
}
const MacroDefinitionRecord* clangExt_MacroExpansion_getDefinition(const MacroExpansion* m) {
	return m->getDefinition();
}
bool clangExt_MacroExpansion_classof(const PreprocessedEntity* PE) {
	return MacroExpansion::classof(PE);
}
//=======================================================================================================================
InclusionDirective::InclusionKind clangExt_InclusionDirective_getKind(const InclusionDirective* i) {
	return i->getKind();
}
CXString clangExt_InclusionDirective_getFileName(const InclusionDirective* i) {
	return cxstring::createDup(i->getFileName());
}
bool clangExt_InclusionDirective_wasInQuotes(const InclusionDirective* i) {
	return i->wasInQuotes();
}
bool clangExt_InclusionDirective_importedModule(const InclusionDirective* i) {
	return i->importedModule();
}
const FileEntry* clangExt_InclusionDirective_getFile(const InclusionDirective* i) {
	//Optional<FileEntryRef> f = i->getFile();
	return i->getFile().getValue();
}
bool clangExt_InclusionDirective_classof(const PreprocessedEntity* PE) {
	return InclusionDirective::classof(PE);
}
//=======================================================================================================================
size_t clangExt_PreprocessingRecord_getTotalMemory(const PreprocessingRecord* p) {
	return p->getTotalMemory();
}
bool clangExt_PreprocessingRecord_getPreprocessedEntitiesAll(
	const PreprocessingRecord* p,
	PreprocessingRecordVisitor visitor,
	CXClientData client_data
) {
	PreprocessingRecord& prep = const_cast<PreprocessingRecord&>(*p);
	PreprocessingRecord::iterator begin = prep.begin();
	PreprocessingRecord::iterator end = prep.end();
	for (; begin != end; ++begin) {
		PreprocessedEntity* PPE = *begin;
		if (!PPE)
			continue;
		if (!visitor(PPE, client_data))
			return false;
	}
	return true;
}
bool clangExt_PreprocessingRecord_getPreprocessedEntitiesLocal(
	const PreprocessingRecord* p,
	PreprocessingRecordVisitor visitor,
	CXClientData client_data
) {
	PreprocessingRecord& prep = const_cast<PreprocessingRecord&>(*p);
	PreprocessingRecord::iterator begin = prep.local_begin();
	PreprocessingRecord::iterator end = prep.local_end();
	for (; begin != end; ++begin) {
		PreprocessedEntity* PPE = *begin;
		if (!PPE)
			continue;
		if (!visitor(PPE, client_data))
			return false;
	}
	return true;
}
bool clangExt_PreprocessingRecord_getPreprocessedEntitiesInRange(
	const PreprocessingRecord* p,
	CXSourceRange R,
	PreprocessingRecordVisitor visitor,
	CXClientData client_data
) {
	SourceRange r = cxloc::translateCXSourceRange(R);
	if (r.isInvalid())
		return false;
	PreprocessingRecord& prep = const_cast<PreprocessingRecord&>(*p);
	const auto& Entities = prep.getPreprocessedEntitiesInRange(r);
	PreprocessingRecord::iterator begin = Entities.begin();
	PreprocessingRecord::iterator end = Entities.end();
	for (; begin != end; ++begin) {
		PreprocessedEntity* PPE = *begin;
		if (!PPE)
			continue;
		if (!visitor(PPE, client_data))
			return false;
	}
	return true;
}