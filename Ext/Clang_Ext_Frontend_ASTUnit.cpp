#include "Clang_Ext_Frontend_ASTUnit.h"
#include "CXString.h"

const Preprocessor* clangExt_ASTUnit_getPreprocessorPtr(const ASTUnit* u) {
	return const_cast<const Preprocessor*>(u->getPreprocessorPtr().get());
}
CXString clangExt_ASTUnit_getMainFileName(const ASTUnit* u) {
	return cxstring::createDup(u->getMainFileName());
}