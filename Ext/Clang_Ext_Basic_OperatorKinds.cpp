#include "Clang_Ext_Basic_OperatorKinds.h"
#include "CXString.h"
#include "CXSourceLocation.h"

int clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindLength() {
	return OverloadedOperatorKind::NUM_OVERLOADED_OPERATORS;
}
CXString clangExt_OverloadedOperatorKind_EnumGetOverloadedOperatorKindName(OverloadedOperatorKind i) {
	const char* s = nullptr;
#define TOVERLOADEDOPERATORKIND(X) case OverloadedOperatorKind::##X: s = ""  #X  ""; break

	switch (i) {
	case OverloadedOperatorKind::OO_None: s = "OO_None"; break;
	case OverloadedOperatorKind::NUM_OVERLOADED_OPERATORS: s = "NUM_OVERLOADED_OPERATORS"; break;
#define OVERLOADED_OPERATOR(Name,Spelling,Token,Unary,Binary,MemberOnly) TOVERLOADEDOPERATORKIND(OO_##Name);
#include "clang/Basic/OperatorKinds.def"
	}
#undef TOVERLOADEDOPERATORKIND

	return cxstring::createRef(s);
}
const char* clangExt_OverloadedOperatorKind_getOperatorSpelling(OverloadedOperatorKind Operator) {
	return getOperatorSpelling(Operator);
}
OverloadedOperatorKind clangExt_OverloadedOperatorKind_getRewrittenOverloadedOperator(OverloadedOperatorKind Kind) {
	return getRewrittenOverloadedOperator(Kind);
}
bool clangExt_OverloadedOperatorKind_isCompoundAssignmentOperator(OverloadedOperatorKind Kind) {
	return isCompoundAssignmentOperator(Kind);
}