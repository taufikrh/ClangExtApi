#include "Clang_Ext_llvm_ADT_APSInt.h"
#include "CXString.h"

using namespace clang;

void clangExt_APSInt_Dispose(llvm::APSInt* a) {
	delete(a);
}
bool clangExt_APSInt_isNegative(const llvm::APSInt* a) {
	return a->isNegative();
}
bool clangExt_APSInt_isNonNegative(const llvm::APSInt* a) {
	return a->isNonNegative();
}
bool clangExt_APSInt_isStrictlyPositive(const llvm::APSInt* a) {
	return a->isStrictlyPositive();
}
bool clangExt_APSInt_isSigned(const llvm::APSInt* a) {
	return a->isSigned();
}
bool clangExt_APSInt_isUnsigned(const llvm::APSInt* a) {
	return a->isUnsigned();
}
CXString clangExt_APSInt_toString(const llvm::APSInt* a, unsigned Radix) {
	llvm::SmallString<16> Buffer;
	a->toString(Buffer, Radix);
	return cxstring::createDup(Buffer.str());
}
int64_t clangExt_APSInt_getExtValue(const llvm::APSInt* a) {
	return a->getExtValue();
}