#include "Clang_Ext_Lex_Preprocessor.h"
#include "CXSourceLocation.h"

const LangOptions* clangExt_Preprocessor_getLangOpts(const Preprocessor* p) {
	return &p->getLangOpts();
}
const TargetInfo* clangExt_Preprocessor_getTargetInfo(const Preprocessor* p) {
	return &p->getTargetInfo();
}
const TargetInfo* clangExt_Preprocessor_getAuxTargetInfo(const Preprocessor* p) {
	return p->getAuxTargetInfo();
}
unsigned clangExt_Preprocessor_getNumDirectives(const Preprocessor* p) {
	return p->getNumDirectives();
}
unsigned clangExt_Preprocessor_getTokenCount(const Preprocessor* p) {
	return p->getTokenCount();
}
unsigned clangExt_Preprocessor_getNumMacros(const Preprocessor* p) {
	SmallVector<Preprocessor::macro_iterator, 4> macros = { p->macro_begin(), p->macro_end() };
	return macros.size();
}
bool clangExt_Preprocessor_isMacroDefined(const Preprocessor* p, CXString Id) {
	return const_cast<Preprocessor&>(*p).isMacroDefined(StringRef(clang_getCString(Id)));
}
bool clangExt_Preprocessor_isMacroDefinedByIdentifierInfo(const Preprocessor* p, const IdentifierInfo* II) {
	return const_cast<Preprocessor&>(*p).isMacroDefined(II);
}
const MacroInfo* clangExt_Preprocessor_getMacroInfo(const Preprocessor* p, const IdentifierInfo* II) {
	return const_cast<Preprocessor&>(*p).getMacroInfo(II);
}

const IdentifierInfo* clangExt_Preprocessor_getIdentifierInfo(const Preprocessor* p, CXString Name) {
	return const_cast<Preprocessor&>(*p).getIdentifierInfo(StringRef(clang_getCString(Name)));
}
const PreprocessingRecord* clangExt_Preprocessor_getPreprocessingRecord(const Preprocessor* p) {
	return p->getPreprocessingRecord();
}
bool clangExt_Preprocessor_getRawToken(const Preprocessor* p, CXSourceLocation Loc, const Token** Result, bool IgnoreWhiteSpace) {
	if (!Result)
		return false;
	Token tok;
	/// Relex the token at the specified location.
	/// \returns true if there was a failure, false on success.
	if (const_cast<Preprocessor&>(*p).getRawToken(cxloc::translateSourceLocation(Loc), tok, IgnoreWhiteSpace)) {
		*Result = nullptr;
		return false;
	}
	else
	{
		*Result = new Token(tok);
		return true;
	}
}
const IdentifierInfo* clangExt_Preprocessor_LookUpIdentifierInfo(const Preprocessor* p, const Token* Identifier) {
	return p->LookUpIdentifierInfo(const_cast<Token&>(*Identifier));
}
bool clangExt_Preprocessor_isRecordingPreamble(const Preprocessor* p) {
	return p->isRecordingPreamble();
}
bool clangExt_Preprocessor_hasRecordedPreamble(const Preprocessor* p) {
	return p->hasRecordedPreamble();
}
unsigned clangExt_Preprocessor_getNumPreambleConditionalStack(const Preprocessor* p) {
	return p->getPreambleConditionalStack().size();
}
const PPConditionalInfo* clangExt_Preprocessor_getPreambleConditionalStack(const Preprocessor* p, unsigned i) {
	if (i < p->getPreambleConditionalStack().size())
		return &p->getPreambleConditionalStack()[i];
	else
		return nullptr;
}
