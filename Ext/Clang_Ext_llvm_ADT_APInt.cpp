#include "Clang_Ext_llvm_ADT_APInt.h"
#include "CXString.h"

using namespace clang;

void clangExt_APInt_Dispose(llvm::APInt* a) {
	delete(a);
}
unsigned clangExt_APInt_getBitWidth(const llvm::APInt* a) {
	return a->getBitWidth();
}
uint64_t clangExt_APInt_getZExtValue(const llvm::APInt* a) {
	return a->getZExtValue();
}
int64_t clangExt_APInt_getSExtValue(const llvm::APInt* a) {
	return a->getSExtValue();
}
CXString clangExt_APInt_toString(const llvm::APInt* a, unsigned Radix, bool Signed, bool formatAsCLiteral) {
	llvm::SmallString<16> Buffer;
	a->toString(Buffer, Radix, Signed, formatAsCLiteral);
	return cxstring::createDup(Buffer.str());
}