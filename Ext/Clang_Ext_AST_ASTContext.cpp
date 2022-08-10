#include "Clang_Ext_AST_ASTContext.h"

const CXPrintingPolicy clangExt_ASTContext_getPrintingPolicy(const ASTContext* C) {
	return new PrintingPolicy(C->getPrintingPolicy());
}
const CXQualType clangExt_ASTContext_getAttributedType(const ASTContext* C, attr::Kind attrKind, const CXQualType modifiedType, const CXQualType equivalentType) {
	return const_cast<ASTContext&>(*C).getAttributedType(
		attrKind, 
		QualType::getFromOpaquePtr(modifiedType), 
		QualType::getFromOpaquePtr(equivalentType)
	).getAsOpaquePtr();
}