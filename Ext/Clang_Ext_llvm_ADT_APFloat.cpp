#include "Clang_Ext_llvm_ADT_APFloat.h"
#include "CXString.h"

using namespace clang;

void clangExt_APFloat_Dispose(llvm::APFloat* a) {
	delete(a);
}
double clangExt_APFloat_convertToDouble(const llvm::APFloat* a) {
	return a->convertToDouble();
}
float clangExt_APFloat_convertToFloat(const llvm::APFloat* a) {
	return a->convertToFloat();
}
bool clangExt_APFloat_isZero(const llvm::APFloat* a) {
	return a->isZero();
}
bool clangExt_APFloat_isInfinity(const llvm::APFloat* a) {
	return a->isInfinity();
}
bool clangExt_APFloat_isNaN(const llvm::APFloat* a) {
	return a->isNaN();
}
bool clangExt_APFloat_isNegative(const llvm::APFloat* a) {
	return a->isNegative();
}
bool clangExt_APFloat_isDenormal(const llvm::APFloat* a) {
	return a->isDenormal();
}
bool clangExt_APFloat_isSignaling(const llvm::APFloat* a) {
	return a->isSignaling();
}
bool clangExt_APFloat_isNormal(const llvm::APFloat* a) {
	return a->isNormal();
}
bool clangExt_APFloat_isFinite(const llvm::APFloat* a) {
	return a->isFinite();
}
llvm::APFloatBase::fltCategory clangExt_APFloat_getCategory(const llvm::APFloat* a) {
	return a->getCategory();
}
bool clangExt_APFloat_isNonZero(const llvm::APFloat* a) {
	return a->isNonZero();
}
bool clangExt_APFloat_isFiniteNonZero(const llvm::APFloat* a) {
	return a->isFiniteNonZero();
}
bool clangExt_APFloat_isPosZero(const llvm::APFloat* a) {
	return a->isPosZero();
}
bool clangExt_APFloat_isNegZero(const llvm::APFloat* a) {
	return a->isNegZero();
}
bool clangExt_APFloat_isSmallest(const llvm::APFloat* a) {
	return a->isSmallest();
}
bool clangExt_APFloat_isLargest(const llvm::APFloat* a) {
	return a->isLargest();
}
bool clangExt_APFloat_isInteger(const llvm::APFloat* a) {
	return a->isInteger();
}
bool clangExt_APFloat_isIEEE(const llvm::APFloat* a) {
	return a->isIEEE();
}
CXString clangExt_APFloat_toString(const llvm::APFloat* a, unsigned FormatPrecision, unsigned FormatMaxPadding, bool TruncateZero) {
	llvm::SmallString<16> Buffer;
	a->toString(Buffer, FormatPrecision, FormatMaxPadding, TruncateZero);
	return cxstring::createDup(Buffer.str());
}
double clangExt_APFloat_GetApproxValue(const llvm::APFloat* a) {
	llvm::APFloat V = *a;
	bool ignored;
	V.convert(llvm::APFloat::IEEEdouble(), llvm::APFloat::rmNearestTiesToEven,
		&ignored);
	return V.convertToDouble();
}