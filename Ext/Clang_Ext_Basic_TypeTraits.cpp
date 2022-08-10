#include "Clang_Ext_Basic_TypeTraits.h"
#include "CXString.h"

//=======================================================================================================================
int clangExt_TypeTrait_get_UTT_Last() {
	return TypeTrait::UTT_Last;
}
int clangExt_TypeTrait_get_BTT_Last() {
	return TypeTrait::BTT_Last;
}
int clangExt_TypeTrait_get_TT_Last() {
	return TypeTrait::TT_Last;
}
const char* clangExt_TypeTrait_getName(int i) {
	const char* s = nullptr;
#define TTYPETRAIT(X) case TypeTrait::##X: s = ""  #X  ""; break

	switch (i) {
#define TYPE_TRAIT_1(Spelling, Name, Key) TTYPETRAIT(UTT_##Name);
#include "clang/Basic/TokenKinds.def"
			
#define TYPE_TRAIT_2(Spelling, Name, Key) TTYPETRAIT(BTT_##Name);
#include "clang/Basic/TokenKinds.def"
			
#define TYPE_TRAIT_N(Spelling, Name, Key) TTYPETRAIT(TT_##Name);
#include "clang/Basic/TokenKinds.def"

	default: break;
	}
#undef TTYPETRAIT

	return s;
}
//=======================================================================================================================
int clangExt_ArrayTypeTrait_getLast() {
	return ArrayTypeTrait::ATT_Last;
}
const char* clangExt_ArrayTypeTrait_getName(int i) {
	const char* s = nullptr;
#define TARRAYTYPETRAIT(X) case ArrayTypeTrait::##X: s = ""  #X  ""; break

	switch (i) {
#define ARRAY_TYPE_TRAIT(Spelling, Name, Key) TARRAYTYPETRAIT(ATT_##Name);
#include "clang/Basic/TokenKinds.def"
	default: break;
	}
#undef TARRAYTYPETRAIT

	return s;
}
//=======================================================================================================================
int clangExt_UnaryExprOrTypeTrait_getLast() {
	return UnaryExprOrTypeTrait::UETT_Last;
}
const char* clangExt_UnaryExprOrTypeTrait_getName(int i) {
	const char* s = nullptr;
#define TUNARYEXPRORTYPETRAIT(X) case UnaryExprOrTypeTrait::##X: s = ""  #X  ""; break

	switch (i) {
#define UNARY_EXPR_OR_TYPE_TRAIT(Spelling, Name, Key) TUNARYEXPRORTYPETRAIT(UETT_##Name);
#define CXX11_UNARY_EXPR_OR_TYPE_TRAIT(Spelling, Name, Key) TUNARYEXPRORTYPETRAIT(UETT_##Name);
#include "clang/Basic/TokenKinds.def"
	default: break;
	}
#undef TUNARYEXPRORTYPETRAIT

	return s;
}
//=======================================================================================================================
const char* clangExt_TypeTrait_getTraitName(TypeTrait T) {
	return getTraitName(T);
}
const char* clangExt_TypeTrait_getTraitSpelling(TypeTrait T) {
	return getTraitSpelling(T);
}
//=======================================================================================================================
const char* clangExt_ArrayTypeTrait_getTraitName(ArrayTypeTrait T) {
	return getTraitName(T);
}
const char* clangExt_ArrayTypeTrait_getTraitSpelling(ArrayTypeTrait T) {
	return getTraitSpelling(T);
}
//=======================================================================================================================
const char* clangExt_UnaryExprOrTypeTrait_getTraitName(UnaryExprOrTypeTrait T) {
	return getTraitName(T);
}
const char* clangExt_UnaryExprOrTypeTrait_getTraitSpelling(UnaryExprOrTypeTrait T) {
	return getTraitSpelling(T);
}
//=======================================================================================================================