#include "Clang_Ext_AST_OperationKinds.h"
#include "CXString.h"

using namespace clang;

CXString clangExt_CastKind_GetName(CastKind K) {
	const char* s = nullptr;
#define TCASTKIND(X) case CastKind::##X: s = ""  #X  ""; break

	switch (K) {
#define CAST_OPERATION(Name) TCASTKIND(CK_##Name);
#include "clang/AST/OperationKinds.def"
	}
#undef TCASTKIND

	return cxstring::createRef(s);
}
CXString clangExt_BinaryOperatorKind_GetName(BinaryOperatorKind K) {
	const char* s = nullptr;
#define TBINARYOPERATORKIND(X) case BinaryOperatorKind::##X: s = ""  #X  ""; break

	switch (K) {
#define BINARY_OPERATION(Name, Spelling) TBINARYOPERATORKIND(BO_##Name);
#include "clang/AST/OperationKinds.def"
	}
#undef TBINARYOPERATORKIND

	return cxstring::createRef(s);
}
CINDEX_LINKAGE CXString clangExt_UnaryOperatorKind_GetName(UnaryOperatorKind K) {
	const char* s = nullptr;
#define TUNARYOPERATORKIND(X) case UnaryOperatorKind::##X: s = ""  #X  ""; break

	switch (K) {
#define UNARY_OPERATION(Name, Spelling) TUNARYOPERATORKIND(UO_##Name);
#include "clang/AST/OperationKinds.def"
	}
#undef TUNARYOPERATORKIND

	return cxstring::createRef(s);
}