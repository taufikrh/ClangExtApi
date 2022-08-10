#include "Clang_Ext_AST_NestedNameSpecifier.h"

void clangExt_NestedNameSpecifierLoc_Dispose(NestedNameSpecifierLoc* n) {
	delete(n);
}