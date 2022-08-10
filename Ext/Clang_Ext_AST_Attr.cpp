#include "Clang_Ext_AST_Attr.h"
#include "CXSourceLocation.h"
#include "CXString.h"

int clangExt_AttributeCommonInfo_Kind_getLast() {
	return AttributeCommonInfo::Kind::UnknownAttribute;
}
CXString clangExt_AttributeCommonInfo_Kind_getName(AttributeCommonInfo::Kind i) {
	const char* s = nullptr;
#define TATTRKIND(X) case AttributeCommonInfo::Kind::##X: s = ""  #X  ""; break

	switch (i) {
#define PARSED_ATTR(NAME) TATTRKIND(AT_##NAME);
#include "clang/Sema/AttrParsedAttrList.inc"
#undef PARSED_ATTR
		TATTRKIND(NoSemaHandlerAttribute);
		TATTRKIND(IgnoredAttribute);
		TATTRKIND(UnknownAttribute);
//#define ATTR(X) TATTRKIND(X);
//#include "clang/Basic/AttrList.inc"
	}
#undef TATTRKIND
	
	return cxstring::createRef(s);
}
AttributeCommonInfo::Kind clangExt_AttributeCommonInfo_getParsedKind(const AttributeCommonInfo* A) {
	return A->getParsedKind();
}
AttributeCommonInfo::Syntax clangExt_AttributeCommonInfo_getSyntax(const AttributeCommonInfo* A) {
	return A->getSyntax();
}
const IdentifierInfo* clangExt_AttributeCommonInfo_getAttrName(const AttributeCommonInfo* A) {
	return A->getAttrName();
}
CXSourceLocation clangExt_AttributeCommonInfo_getLoc(const AttributeCommonInfo* A, const ASTContext* ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), A->getLoc());
}
CXSourceRange clangExt_AttributeCommonInfo_getRange(const AttributeCommonInfo* A, const ASTContext* ctx) {
	return cxloc::translateSourceRange(const_cast<ASTContext&>(*ctx), A->getRange());
}
bool clangExt_AttributeCommonInfo_hasScope(const AttributeCommonInfo* A) {
	return A->hasScope();
}
const IdentifierInfo* clangExt_AttributeCommonInfo_getScopeName(const AttributeCommonInfo* A) {
	return A->getScopeName();
}
CXSourceLocation clangExt_AttributeCommonInfo_getScopeLoc(const AttributeCommonInfo* A, const ASTContext* ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), A->getScopeLoc());
}
CXString clangExt_AttributeCommonInfo_getNormalizedFullName(const AttributeCommonInfo* A) {
	return cxstring::createDup(A->getNormalizedFullName().c_str());
}
bool clangExt_AttributeCommonInfo_isDeclspecAttribute(const AttributeCommonInfo* A) {
	return A->isDeclspecAttribute();
}
bool clangExt_AttributeCommonInfo_isMicrosoftAttribute(const AttributeCommonInfo* A) {
	return A->isMicrosoftAttribute();
}
bool clangExt_AttributeCommonInfo_isGNUScope(const AttributeCommonInfo* A) {
	return A->isGNUScope();
}
bool clangExt_AttributeCommonInfo_isAlignasAttribute(const AttributeCommonInfo* A) {
	return A->isAlignasAttribute();
}
bool clangExt_AttributeCommonInfo_isCXX11Attribute(const AttributeCommonInfo* A) {
	return A->isCXX11Attribute();
}
bool clangExt_AttributeCommonInfo_isC2xAttribute(const AttributeCommonInfo* A) {
	return A->isC2xAttribute();
}
bool clangExt_AttributeCommonInfo_isStandardAttributeSyntax(const AttributeCommonInfo* A) {
	return A->isStandardAttributeSyntax();
}
bool clangExt_AttributeCommonInfo_isKeywordAttribute(const AttributeCommonInfo* A) {
	return A->isKeywordAttribute();
}
bool clangExt_AttributeCommonInfo_isContextSensitiveKeywordAttribute(const AttributeCommonInfo* A) {
	return A->isContextSensitiveKeywordAttribute();
}
unsigned clangExt_AttributeCommonInfo_getAttributeSpellingListIndex(const AttributeCommonInfo* A) {
	return A->getAttributeSpellingListIndex();
}
//=======================================================================================================================
int clangExt_Attr_Kind_getFirstAttr() {
	return attr::Kind::FirstAttr;
}
int clangExt_Attr_Kind_getLastAttr() {
	return attr::Kind::LastAttr;
}
int clangExt_Attr_Kind_getFirstTypeAttr() {
	return attr::Kind::FirstTypeAttr;
}
int clangExt_Attr_Kind_getLastTypeAttr() {
	return attr::Kind::LastTypeAttr;
}
int clangExt_Attr_Kind_getFirstStmtAttr() {
	return attr::Kind::FirstStmtAttr;
}
int clangExt_Attr_Kind_getLastStmtAttr() {
	return attr::Kind::LastStmtAttr;
}
int clangExt_Attr_Kind_getFirstDeclOrStmtAttr() {
	return attr::Kind::FirstDeclOrStmtAttr;
}
int clangExt_Attr_Kind_getLastDeclOrStmtAttr() {
	return attr::Kind::LastDeclOrStmtAttr;
}
int clangExt_Attr_Kind_getFirstInheritableAttr() {
	return attr::Kind::FirstInheritableAttr;
}
int clangExt_Attr_Kind_getLastInheritableAttr() {
	return attr::Kind::LastInheritableAttr;
}
int clangExt_Attr_Kind_getFirstDeclOrTypeAttr() {
	return attr::Kind::FirstDeclOrTypeAttr;
}
int clangExt_Attr_Kind_getLastDeclOrTypeAttr() {
	return attr::Kind::LastDeclOrTypeAttr;
}
int clangExt_Attr_Kind_getFirstInheritableParamAttr() {
	return attr::Kind::FirstInheritableParamAttr;
}
int clangExt_Attr_Kind_getLastInheritableParamAttr() {
	return attr::Kind::LastInheritableParamAttr;
}
int clangExt_Attr_Kind_getFirstParameterABIAttr() {
	return attr::Kind::FirstParameterABIAttr;
}
int clangExt_Attr_Kind_getLastParameterABIAttr() {
	return attr::Kind::LastParameterABIAttr;
}
CXString clangExt_Attr_Kind_getName(attr::Kind i) {
	const char* s = nullptr;
#define TATTRKIND(X) case attr::Kind::##X: s = ""  #X  ""; break

	switch (i) {
#define ATTR(X) TATTRKIND(X);
#include "clang/Basic/AttrList.inc"
	}
#undef TATTRKIND

	return cxstring::createRef(s);
}
//=======================================================================================================================
attr::Kind clangExt_Attr_getKind(const Attr* A) {
	return A->getKind();
}
unsigned clangExt_Attr_getSpellingListIndex(const Attr* A) {
	return A->getSpellingListIndex();
}
const char* clangExt_Attr_getSpelling(const Attr* A) {
	return A->getSpelling();
}
CXSourceLocation clangExt_Attr_getLocation(const Attr* A, const ASTContext* ctx) {
	return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), A->getLocation());
}
bool clangExt_Attr_isInherited(const Attr* A) {
	return A->isInherited();
}
bool clangExt_Attr_isImplicit(const Attr* A) {
	return A->isImplicit();
}
bool clangExt_Attr_isPackExpansion(const Attr* A) {
	return A->isPackExpansion();
}
bool clangExt_Attr_isLateParsed(const Attr* A) {
	return A->isLateParsed();
}
CXString clangExt_Attr_printPretty(const Attr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
//=======================================================================================================================
bool clangExt_TypeAttr_classof(const Attr* A) {
	return TypeAttr::classof(A);
}
//=================================================================================================================
bool clangExt_StmtAttr_classof(const Attr* A) {
	return StmtAttr::classof(A);
}
//=================================================================================================================
bool clangExt_InheritableAttr_shouldInheritEvenIfAlreadyPresent(const InheritableAttr* A) {
	return A->shouldInheritEvenIfAlreadyPresent();
}
bool clangExt_InheritableAttr_classof(const Attr* A) {
	return InheritableAttr::classof(A);
}
//=================================================================================================================
bool clangExt_DeclOrStmtAttr_classof(const Attr* A) {
	return DeclOrStmtAttr::classof(A);
}
//=================================================================================================================
bool clangExt_InheritableParamAttr_classof(const Attr* A) {
	return InheritableParamAttr::classof(A);
}
//=================================================================================================================
ParameterABI clangExt_ParameterABIAttr_getABI(const ParameterABIAttr* A) {
	return A->getABI();
}
bool clangExt_ParameterABIAttr_classof(const Attr* A) {
	return ParameterABIAttr::classof(A);
}
//=================================================================================================================
CXString clangExt_AlignedAttr_printPretty(const AlignedAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_AlignedAttr_getSpelling(const AlignedAttr* A) {
	return A->getSpelling();
}
AlignedAttr::Spelling clangExt_AlignedAttr_getSemanticSpelling(const AlignedAttr* A) {
	return A->getSemanticSpelling();
}
bool clangExt_AlignedAttr_isGNU(const AlignedAttr* A) {
	return A->isGNU();
}
bool clangExt_AlignedAttr_isC11(const AlignedAttr* A) {
	return A->isC11();
}
bool clangExt_AlignedAttr_isAlignas(const AlignedAttr* A) {
	return A->isAlignas();
}
bool clangExt_AlignedAttr_isDeclspec(const AlignedAttr* A) {
	return A->isDeclspec();
}
bool clangExt_AlignedAttr_isAlignmentDependent(const AlignedAttr* A) {
	return A->isAlignmentDependent();
}
bool clangExt_AlignedAttr_isAlignmentErrorDependent(const AlignedAttr* A) {
	return A->isAlignmentErrorDependent();
}
unsigned clangExt_AlignedAttr_getAlignment(const AlignedAttr* A, const ASTContext* Ctx) {
	return A->getAlignment(const_cast<ASTContext&>(*Ctx));
}
bool clangExt_AlignedAttr_isAlignmentExpr(const AlignedAttr* A) {
	return A->isAlignmentExpr();
}
const Expr* clangExt_AlignedAttr_getAlignmentExpr(const AlignedAttr* A) {
	return A->getAlignmentExpr();
}
const TypeSourceInfo* clangExt_AlignedAttr_getAlignmentType(const AlignedAttr* A) {
	return A->getAlignmentType();
}
bool clangExt_AlignedAttr_classof(const Attr* A) {
	return AlignedAttr::classof(A);
}
//=================================================================================================================
CXString clangExt_AnnotateAttr_printPretty(const AnnotateAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_AnnotateAttr_getSpelling(const AnnotateAttr* A) {
	return A->getSpelling();
}
CXString clangExt_AnnotateAttr_getAnnotation(const AnnotateAttr* A) {
	return cxstring::createRef(A->getAnnotation());
}
unsigned clangExt_AnnotateAttr_getAnnotationLength(const AnnotateAttr* A) {
	return A->getAnnotationLength();
}
unsigned clangExt_AnnotateAttr_args_size(const AnnotateAttr* A) {
	return A->args_size();
}
const Expr* clangExt_AnnotateAttr_arg(const AnnotateAttr* A, unsigned i) {
	if (i < A->args_size()) {
		ArrayRef<Expr*> Exprs = { A->args_begin(), A->args_size() };
		return Exprs[i];
	}
	return nullptr;
}
unsigned clangExt_AnnotateAttr_delayedArgs_size(const AnnotateAttr* A) {
	return A->delayedArgs_size();
}
const Expr* clangExt_AnnotateAttr_delayedArg(const AnnotateAttr* A, unsigned i) {
	if (i < A->args_size()) {
		ArrayRef<Expr*> Exprs = { A->delayedArgs_begin(), A->delayedArgs_end() };
		return Exprs[i];
	}
	return nullptr;
}
bool clangExt_AnnotateAttr_classof(const Attr* A) {
	return AnnotateAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_DLLExportAttr_printPretty(const DLLExportAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_DLLExportAttr_getSpelling(const DLLExportAttr* A) {
	return A->getSpelling();
}
bool clangExt_DLLExportAttr_classof(const Attr* A) {
	return DLLExportAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_DLLImportAttr_printPretty(const DLLImportAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_DLLImportAttr_getSpelling(const DLLImportAttr* A) {
	return A->getSpelling();
}
bool clangExt_DLLImportAttr_wasPropagatedToBaseTemplate(const DLLImportAttr* A) {
	return const_cast<DLLImportAttr&>(*A).wasPropagatedToBaseTemplate();
}
bool clangExt_DLLImportAttr_classof(const Attr* A) {
	return AnnotateAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_ExternalSourceSymbolAttr_printPretty(const ExternalSourceSymbolAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_ExternalSourceSymbolAttr_getSpelling(const ExternalSourceSymbolAttr* A) {
	return A->getSpelling();
}
CXString clangExt_ExternalSourceSymbolAttr_getLanguage(const ExternalSourceSymbolAttr* A) {
	return cxstring::createRef(A->getLanguage());
}
unsigned clangExt_ExternalSourceSymbolAttr_getLanguageLength(const ExternalSourceSymbolAttr* A) {
	return A->getLanguageLength();
}
CXString clangExt_ExternalSourceSymbolAttr_getDefinedIn(const ExternalSourceSymbolAttr* A) {
	return cxstring::createRef(A->getDefinedIn());
}
unsigned clangExt_ExternalSourceSymbolAttr_getDefinedInLength(const ExternalSourceSymbolAttr* A) {
	return A->getDefinedInLength();
}
bool clangExt_ExternalSourceSymbolAttr_getGeneratedDeclaration(const ExternalSourceSymbolAttr* A) {
	return A->getGeneratedDeclaration();
}
bool clangExt_ExternalSourceSymbolAttr_classof(const Attr* A) {
	return ExternalSourceSymbolAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_MSNoVTableAttr_printPretty(const MSNoVTableAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_MSNoVTableAttr_getSpelling(const MSNoVTableAttr* A) {
	return A->getSpelling();
}
bool clangExt_MSNoVTableAttr_classof(const Attr* A) {
	return MSNoVTableAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_MaxFieldAlignmentAttr_printPretty(const MaxFieldAlignmentAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_MaxFieldAlignmentAttr_getSpelling(const MaxFieldAlignmentAttr* A) {
	return A->getSpelling();
}
unsigned clangExt_MaxFieldAlignmentAttr_getAlignment(const MaxFieldAlignmentAttr* A) {
	return A->getAlignment();
}
bool clangExt_MaxFieldAlignmentAttr_classof(const Attr* A) {
	return MaxFieldAlignmentAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_SelectAnyAttr_printPretty(const SelectAnyAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_SelectAnyAttr_getSpelling(const SelectAnyAttr* A) {
	return A->getSpelling();
}
bool clangExt_SelectAnyAttr_classof(const Attr* A) {
	return SelectAnyAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_StdCallAttr_printPretty(const StdCallAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_StdCallAttr_getSpelling(const StdCallAttr* A) {
	return A->getSpelling();
}
bool clangExt_StdCallAttr_classof(const Attr* A) {
	return StdCallAttr::classof(A);
}
//=======================================================================================================================
CXString clangExt_UuidAttr_printPretty(const UuidAttr* A, CXPrintingPolicy Policy) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	A->printPretty(infoOut, *static_cast<PrintingPolicy*>(Policy));
	return cxstring::createDup(info.c_str());
}
const char* clangExt_UuidAttr_getSpelling(const UuidAttr* A) {
	return A->getSpelling();
}
CXString clangExt_UuidAttr_getGuid(const UuidAttr* A) {
	return cxstring::createRef(A->getGuid());
}
unsigned clangExt_UuidAttr_getGuidLength(const UuidAttr* A) {
	return A->getGuidLength();
}
const MSGuidDecl* clangExt_UuidAttr_getGuidDecl(const UuidAttr* A) {
	return A->getGuidDecl();
}
bool clangExt_UuidAttr_classof(const Attr* A) {
	return UuidAttr::classof(A);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================