#include "Clang_Ext_Basic_IdentifierTable.h"
#include "CXString.h"

const char* clangExt_IdentifierInfo_getNameStart(const IdentifierInfo* I) {
	return I->getNameStart();
}
unsigned clangExt_IdentifierInfo_getLength(const IdentifierInfo* I) {
	return I->getLength();
}
CXString clangExt_IdentifierInfo_getName(const IdentifierInfo* I) {
	return cxstring::createRef(I->getName());
}
bool clangExt_IdentifierInfo_hasMacroDefinition(const IdentifierInfo* I) {
	return I->hasMacroDefinition();
}
bool clangExt_IdentifierInfo_hadMacroDefinition(const IdentifierInfo* I) {
	return I->hadMacroDefinition();
}
bool clangExt_IdentifierInfo_isDeprecatedMacro(const IdentifierInfo* I) {
	return I->isDeprecatedMacro();
}
bool clangExt_IdentifierInfo_isRestrictExpansion(const IdentifierInfo* I) {
	return I->isRestrictExpansion();
}
bool clangExt_IdentifierInfo_isFinal(const IdentifierInfo* I) {
	return I->isFinal();
}
tok::TokenKind clangExt_IdentifierInfo_getTokenID(const IdentifierInfo* I) {
	return I->getTokenID();
}
bool clangExt_IdentifierInfo_hasRevertedTokenIDToIdentifier(const IdentifierInfo* I) {
	return I->hasRevertedTokenIDToIdentifier();
}
tok::PPKeywordKind clangExt_IdentifierInfo_getPPKeywordID(const IdentifierInfo* I) {
	return I->getPPKeywordID();
}
tok::ObjCKeywordKind clangExt_IdentifierInfo_getObjCKeywordID(const IdentifierInfo* I) {
	return I->getObjCKeywordID();
}
unsigned clangExt_IdentifierInfo_getBuiltinID(const IdentifierInfo* I) {
	return I->getBuiltinID();
}
unsigned clangExt_IdentifierInfo_getObjCOrBuiltinID(const IdentifierInfo* I) {
	return I->getObjCOrBuiltinID();
}
bool clangExt_IdentifierInfo_isExtensionToken(const IdentifierInfo* I) {
	return I->isExtensionToken();
}
bool clangExt_IdentifierInfo_isFutureCompatKeyword(const IdentifierInfo* I) {
	return I->isFutureCompatKeyword();
}
bool clangExt_IdentifierInfo_isPoisoned(const IdentifierInfo* I) {
	return I->isPoisoned();
}
bool clangExt_IdentifierInfo_isCPlusPlusOperatorKeyword(const IdentifierInfo* I) {
	return I->isCPlusPlusOperatorKeyword();
}
bool clangExt_IdentifierInfo_isKeyword(const IdentifierInfo* I, const LangOptions* LangOpts) {
	return I->isKeyword(const_cast<LangOptions&>(*LangOpts));
}
bool clangExt_IdentifierInfo_isCPlusPlusKeyword(const IdentifierInfo* I, const LangOptions* LangOpts) {
	return I->isCPlusPlusKeyword(const_cast<LangOptions&>(*LangOpts));
}
void* clangExt_IdentifierInfo_getFETokenInfo(const IdentifierInfo* I) {
	return I->getFETokenInfo();
}
bool clangExt_IdentifierInfo_isHandleIdentifierCase(const IdentifierInfo* I) {
	return I->isHandleIdentifierCase();
}
bool clangExt_IdentifierInfo_isFromAST(const IdentifierInfo* I) {
	return I->isFromAST();
}
bool clangExt_IdentifierInfo_hasChangedSinceDeserialization(const IdentifierInfo* I) {
	return I->hasChangedSinceDeserialization();
}
bool clangExt_IdentifierInfo_hasFETokenInfoChangedSinceDeserialization(const IdentifierInfo* I) {
	return I->hasFETokenInfoChangedSinceDeserialization();
}
bool clangExt_IdentifierInfo_isOutOfDate(const IdentifierInfo* I) {
	return I->isOutOfDate();
}
bool clangExt_IdentifierInfo_isModulesImport(const IdentifierInfo* I) {
	return I->isModulesImport();
}
bool clangExt_IdentifierInfo_isMangledOpenMPVariantName(const IdentifierInfo* I) {
	return I->isMangledOpenMPVariantName();
}
bool clangExt_IdentifierInfo_isEditorPlaceholder(const IdentifierInfo* I) {
	return I->isEditorPlaceholder();
}
ReservedIdentifierStatus clangExt_IdentifierInfo_isReserved(const IdentifierInfo* I, const LangOptions* LangOpts) {
	return I->isReserved(const_cast<LangOptions&>(*LangOpts));
}
CXString clangExt_IdentifierInfo_deuglifiedName(const IdentifierInfo* I) {
	return cxstring::createRef(I->deuglifiedName());
}