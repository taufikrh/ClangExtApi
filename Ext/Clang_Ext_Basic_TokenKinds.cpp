#include "Clang_Ext_Basic_TokenKinds.h"
#include "CXString.h"

//=======================================================================================================================
unsigned short clangExt_TokenKind_GetLast() {
	return tok::TokenKind::NUM_TOKENS;
}
const char* clangExt_TokenKind_getName(tok::TokenKind Kind) {
	const char* s = nullptr;
#define TTOKKIND(X) case tok::TokenKind::##X: s = ""  #X  ""; break

	switch (Kind) {
#define TOK(X) TTOKKIND(X);
#include "clang/Basic/TokenKinds.def"
	default: break;
	}
#undef TTOKKIND

	return s;
}
//=======================================================================================================================
const char* clangExt_TokenKind_getTokenName(tok::TokenKind Kind) {
	return tok::getTokenName(Kind);
}
const char* clangExt_TokenKind_getPunctuatorSpelling(tok::TokenKind Kind) {
	return tok::getPunctuatorSpelling(Kind);
}
const char* clangExt_TokenKind_getKeywordSpelling(tok::TokenKind Kind) {
	return tok::getKeywordSpelling(Kind);
}
bool clangExt_TokenKind_isAnyIdentifier(tok::TokenKind K) {
	return tok::isAnyIdentifier(K);
}
bool clangExt_TokenKind_isStringLiteral(tok::TokenKind K) {
	return tok::isStringLiteral(K);
}
bool clangExt_TokenKind_isLiteral(tok::TokenKind K) {
	return tok::isLiteral(K);
}
bool clangExt_TokenKind_isAnnotation(tok::TokenKind K) {
	return tok::isAnnotation(K);
}
bool clangExt_TokenKind_isPragmaAnnotation(tok::TokenKind K) {
	return tok::isPragmaAnnotation(K);
}
const char* clangExt_PPKeywordKind_getPPKeywordSpelling(tok::PPKeywordKind Kind) {
	return tok::getPPKeywordSpelling(Kind);
}
//=======================================================================================================================
int clangExt_PPKeywordKind_GetLast() {
	return tok::PPKeywordKind::NUM_PP_KEYWORDS;
}
const char* clangExt_PPKeywordKind_getName(tok::PPKeywordKind Kind) {
	const char* s = nullptr;
#define TPPKEYWORDKIND(X) case tok::PPKeywordKind::##X: s = ""  #X  ""; break

	switch (Kind) {
#define PPKEYWORD(X) TPPKEYWORDKIND(pp_##X);
#include "clang/Basic/TokenKinds.def"
	default: break;
	}
#undef TPPKEYWORDKIND

	return s;
}
//=======================================================================================================================
int clangExt_ObjCKeywordKind_GetLast() {
	return tok::ObjCKeywordKind::NUM_OBJC_KEYWORDS;
}
const char* clangExt_ObjCKeywordKind_getName(tok::ObjCKeywordKind Kind) {
	const char* s = nullptr;
#define TOBJCKEYWORDKIND(X) case tok::ObjCKeywordKind::##X: s = ""  #X  ""; break

	switch (Kind) {
#define OBJC_AT_KEYWORD(X) TOBJCKEYWORDKIND(objc_##X);
#include "clang/Basic/TokenKinds.def"
	default: break;
	}
#undef TOBJCKEYWORDKIND

	return s;
}
