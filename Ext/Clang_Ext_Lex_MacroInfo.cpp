#include "Clang_Ext_Lex_MacroInfo.h"
#include "CXSourceLocation.h"

CXSourceLocation clangExt_MacroInfo_getDefinitionLoc(const MacroInfo* m, const ASTContext* Ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), m->getDefinitionLoc());
}
CXSourceLocation clangExt_MacroInfo_getDefinitionEndLoc(const MacroInfo* m, const ASTContext* Ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), m->getDefinitionEndLoc());
}
unsigned clangExt_MacroInfo_getDefinitionLength(const MacroInfo* m, const SourceManager* SM) {
	return m->getDefinitionLength(*SM);
}
bool clangExt_MacroInfo_isIdenticalTo(const MacroInfo* m, const MacroInfo* Other, const Preprocessor* PP, bool Syntactically) {
	return m->isIdenticalTo(*Other, const_cast<Preprocessor&>(*PP), Syntactically);
}
bool clangExt_MacroInfo_param_empty(const MacroInfo* m) {
	return m->param_empty();
}
unsigned clangExt_MacroInfo_getNumParams(const MacroInfo* m) {
	return m->getNumParams();
}
const IdentifierInfo* clangExt_MacroInfo_getParams(const MacroInfo* m, unsigned i) {
	if (i < m->getNumParams())
		return m->params()[i];
	else
		return nullptr;
}
int clangExt_MacroInfo_getParameterNum(const MacroInfo* m, const IdentifierInfo* Arg) {
	return m->getParameterNum(Arg);
}
bool clangExt_MacroInfo_isFunctionLike(const MacroInfo* m) {
	return m->isFunctionLike();
}
bool clangExt_MacroInfo_isObjectLike(const MacroInfo* m) {
	return m->isObjectLike();
}
bool clangExt_MacroInfo_isC99Varargs(const MacroInfo* m) {
	return m->isC99Varargs();
}
bool clangExt_MacroInfo_isGNUVarargs(const MacroInfo* m) {
	return m->isGNUVarargs();
}
bool clangExt_MacroInfo_isVariadic(const MacroInfo* m) {
	return m->isVariadic();
}
bool clangExt_MacroInfo_isBuiltinMacro(const MacroInfo* m) {
	return m->isBuiltinMacro();
}
bool clangExt_MacroInfo_hasCommaPasting(const MacroInfo* m) {
	return m->hasCommaPasting();
}
bool clangExt_MacroInfo_isUsed(const MacroInfo* m) {
	return m->isUsed();
}
bool clangExt_MacroInfo_isAllowRedefinitionsWithoutWarning(const MacroInfo* m) {
	return m->isAllowRedefinitionsWithoutWarning();
}
bool clangExt_MacroInfo_isWarnIfUnused(const MacroInfo* m) {
	return m->isWarnIfUnused();
}
unsigned clangExt_MacroInfo_getNumTokens(const MacroInfo* m) {
	return m->getNumTokens();
}
const Token* clangExt_MacroInfo_getReplacementToken(const MacroInfo* m, unsigned Tok) {
	return &m->getReplacementToken(Tok);
}
bool clangExt_MacroInfo_tokens_empty(const MacroInfo* m) {
	return m->tokens_empty();
}
const Token* clangExt_MacroInfo_getTokens(const MacroInfo* m, unsigned i) {
	if (i < m->getNumTokens())
		return &m->tokens()[i];
	else
		return nullptr;
}
bool clangExt_MacroInfo_isEnabled(const MacroInfo* m) {
	return m->isEnabled();
}
bool clangExt_MacroInfo_isUsedForHeaderGuard(const MacroInfo* m) {
	return m->isUsedForHeaderGuard();
}