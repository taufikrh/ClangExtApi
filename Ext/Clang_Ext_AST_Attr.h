#ifndef LIB_CLANG_EXT_AST_ATTR_H
#define LIB_CLANG_EXT_AST_ATTR_H

#include <clang/Basic/AttrKinds.h>
#include <clang/AST/Attr.h>
#include <clang/AST/DeclBase.h>
#include <clang-c/Index.h>

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=================================================================================================================
CINDEX_LINKAGE int clangExt_AttributeCommonInfo_Kind_getLast();
CINDEX_LINKAGE CXString clangExt_AttributeCommonInfo_Kind_getName(AttributeCommonInfo::Kind i);
//
CINDEX_LINKAGE AttributeCommonInfo::Kind clangExt_AttributeCommonInfo_getParsedKind(const AttributeCommonInfo* A);
CINDEX_LINKAGE AttributeCommonInfo::Syntax clangExt_AttributeCommonInfo_getSyntax(const AttributeCommonInfo* A);
CINDEX_LINKAGE const IdentifierInfo* clangExt_AttributeCommonInfo_getAttrName(const AttributeCommonInfo* A);
CINDEX_LINKAGE CXSourceLocation clangExt_AttributeCommonInfo_getLoc(const AttributeCommonInfo* A, const ASTContext* ctx);
CINDEX_LINKAGE CXSourceRange clangExt_AttributeCommonInfo_getRange(const AttributeCommonInfo* A, const ASTContext* ctx);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_hasScope(const AttributeCommonInfo* A);
CINDEX_LINKAGE const IdentifierInfo* clangExt_AttributeCommonInfo_getScopeName(const AttributeCommonInfo* A);
CINDEX_LINKAGE CXSourceLocation clangExt_AttributeCommonInfo_getScopeLoc(const AttributeCommonInfo* A, const ASTContext* ctx);
CINDEX_LINKAGE CXString clangExt_AttributeCommonInfo_getNormalizedFullName(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isDeclspecAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isMicrosoftAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isGNUScope(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isAlignasAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isCXX11Attribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isC2xAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isStandardAttributeSyntax(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isKeywordAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE bool clangExt_AttributeCommonInfo_isContextSensitiveKeywordAttribute(const AttributeCommonInfo* A);
CINDEX_LINKAGE unsigned clangExt_AttributeCommonInfo_getAttributeSpellingListIndex(const AttributeCommonInfo* A);
//=================================================================================================================
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstTypeAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastTypeAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstStmtAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastStmtAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstDeclOrStmtAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastDeclOrStmtAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstInheritableAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastInheritableAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstDeclOrTypeAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastDeclOrTypeAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstInheritableParamAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastInheritableParamAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getFirstParameterABIAttr();
CINDEX_LINKAGE int clangExt_Attr_Kind_getLastParameterABIAttr();
CINDEX_LINKAGE CXString clangExt_Attr_Kind_getName(attr::Kind i);
//=================================================================================================================
CINDEX_LINKAGE attr::Kind clangExt_Attr_getKind(const Attr* A);
CINDEX_LINKAGE unsigned clangExt_Attr_getSpellingListIndex(const Attr* A);
CINDEX_LINKAGE const char* clangExt_Attr_getSpelling(const Attr* A);
CINDEX_LINKAGE CXSourceLocation clangExt_Attr_getLocation(const Attr* A, const ASTContext* ctx);
CINDEX_LINKAGE bool clangExt_Attr_isInherited(const Attr* A);
CINDEX_LINKAGE bool clangExt_Attr_isImplicit(const Attr* A);
CINDEX_LINKAGE bool clangExt_Attr_isPackExpansion(const Attr* A);
CINDEX_LINKAGE bool clangExt_Attr_isLateParsed(const Attr* A);
CINDEX_LINKAGE CXString clangExt_Attr_printPretty(const Attr* A, CXPrintingPolicy Policy);
//=================================================================================================================
CINDEX_LINKAGE bool clangExt_TypeAttr_classof(const Attr* A);
//=================================================================================================================
CINDEX_LINKAGE bool clangExt_StmtAttr_classof(const Attr* A);
//=================================================================================================================
CINDEX_LINKAGE bool clangExt_InheritableAttr_shouldInheritEvenIfAlreadyPresent(const InheritableAttr* A);
CINDEX_LINKAGE bool clangExt_InheritableAttr_classof(const Attr* A);
//=================================================================================================================
CINDEX_LINKAGE bool clangExt_DeclOrStmtAttr_classof(const Attr* A);
//=================================================================================================================
CINDEX_LINKAGE bool clangExt_InheritableParamAttr_classof(const Attr* A);
//=================================================================================================================
CINDEX_LINKAGE ParameterABI clangExt_ParameterABIAttr_getABI(const ParameterABIAttr* A);
CINDEX_LINKAGE bool clangExt_ParameterABIAttr_classof(const Attr* A);
//================================================================================================================= 698
CINDEX_LINKAGE CXString clangExt_AlignedAttr_printPretty(const AlignedAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_AlignedAttr_getSpelling(const AlignedAttr* A);
CINDEX_LINKAGE AlignedAttr::Spelling clangExt_AlignedAttr_getSemanticSpelling(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isGNU(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isC11(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isAlignas(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isDeclspec(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isAlignmentDependent(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isAlignmentErrorDependent(const AlignedAttr* A);
CINDEX_LINKAGE unsigned clangExt_AlignedAttr_getAlignment(const AlignedAttr* A, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_AlignedAttr_isAlignmentExpr(const AlignedAttr* A);
CINDEX_LINKAGE const Expr* clangExt_AlignedAttr_getAlignmentExpr(const AlignedAttr* A);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_AlignedAttr_getAlignmentType(const AlignedAttr* A);
CINDEX_LINKAGE bool clangExt_AlignedAttr_classof(const Attr* A);
//================================================================================================================= 928
CINDEX_LINKAGE CXString clangExt_AnnotateAttr_printPretty(const AnnotateAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_AnnotateAttr_getSpelling(const AnnotateAttr* A);
CINDEX_LINKAGE CXString clangExt_AnnotateAttr_getAnnotation(const AnnotateAttr* A);
CINDEX_LINKAGE unsigned clangExt_AnnotateAttr_getAnnotationLength(const AnnotateAttr* A);
CINDEX_LINKAGE unsigned clangExt_AnnotateAttr_args_size(const AnnotateAttr* A);
CINDEX_LINKAGE const Expr* clangExt_AnnotateAttr_arg(const AnnotateAttr* A, unsigned i);
CINDEX_LINKAGE unsigned clangExt_AnnotateAttr_delayedArgs_size(const AnnotateAttr* A);
CINDEX_LINKAGE const Expr* clangExt_AnnotateAttr_delayedArg(const AnnotateAttr* A, unsigned i);
CINDEX_LINKAGE bool clangExt_AnnotateAttr_classof(const Attr* A);
//================================================================================================================= 3228
CINDEX_LINKAGE CXString clangExt_DLLExportAttr_printPretty(const DLLExportAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_DLLExportAttr_getSpelling(const DLLExportAttr* A);
CINDEX_LINKAGE bool clangExt_DLLExportAttr_classof(const Attr* A);
//================================================================================================================= 3279
CINDEX_LINKAGE CXString clangExt_DLLImportAttr_printPretty(const DLLImportAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_DLLImportAttr_getSpelling(const DLLImportAttr* A);
CINDEX_LINKAGE bool clangExt_DLLImportAttr_wasPropagatedToBaseTemplate(const DLLImportAttr* A);
CINDEX_LINKAGE bool clangExt_DLLImportAttr_classof(const Attr* A);
//================================================================================================================= 3968
CINDEX_LINKAGE CXString clangExt_ExternalSourceSymbolAttr_printPretty(const ExternalSourceSymbolAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_ExternalSourceSymbolAttr_getSpelling(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE CXString clangExt_ExternalSourceSymbolAttr_getLanguage(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE unsigned clangExt_ExternalSourceSymbolAttr_getLanguageLength(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE CXString clangExt_ExternalSourceSymbolAttr_getDefinedIn(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE unsigned clangExt_ExternalSourceSymbolAttr_getDefinedInLength(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE bool clangExt_ExternalSourceSymbolAttr_getGeneratedDeclaration(const ExternalSourceSymbolAttr* A);
CINDEX_LINKAGE bool clangExt_ExternalSourceSymbolAttr_classof(const Attr* A);
//================================================================================================================= 5309
CINDEX_LINKAGE CXString clangExt_MSNoVTableAttr_printPretty(const MSNoVTableAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_MSNoVTableAttr_getSpelling(const MSNoVTableAttr* A);
CINDEX_LINKAGE bool clangExt_MSNoVTableAttr_classof(const Attr* A);
//================================================================================================================= 5425
CINDEX_LINKAGE CXString clangExt_MaxFieldAlignmentAttr_printPretty(const MaxFieldAlignmentAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_MaxFieldAlignmentAttr_getSpelling(const MaxFieldAlignmentAttr* A);
CINDEX_LINKAGE unsigned clangExt_MaxFieldAlignmentAttr_getAlignment(const MaxFieldAlignmentAttr* A);
CINDEX_LINKAGE bool clangExt_MaxFieldAlignmentAttr_classof(const Attr* A);
//================================================================================================================= 10281
CINDEX_LINKAGE CXString clangExt_SelectAnyAttr_printPretty(const SelectAnyAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_SelectAnyAttr_getSpelling(const SelectAnyAttr* A);
CINDEX_LINKAGE bool clangExt_SelectAnyAttr_classof(const Attr* A);
//================================================================================================================= 10352
CINDEX_LINKAGE CXString clangExt_StdCallAttr_printPretty(const StdCallAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_StdCallAttr_getSpelling(const StdCallAttr* A);
CINDEX_LINKAGE bool clangExt_StdCallAttr_classof(const Attr* A);
//================================================================================================================= 11978
CINDEX_LINKAGE CXString clangExt_UuidAttr_printPretty(const UuidAttr* A, CXPrintingPolicy Policy);
CINDEX_LINKAGE const char* clangExt_UuidAttr_getSpelling(const UuidAttr* A);
CINDEX_LINKAGE CXString clangExt_UuidAttr_getGuid(const UuidAttr* A);
CINDEX_LINKAGE unsigned clangExt_UuidAttr_getGuidLength(const UuidAttr* A);
CINDEX_LINKAGE const MSGuidDecl* clangExt_UuidAttr_getGuidDecl(const UuidAttr* A);
CINDEX_LINKAGE bool clangExt_UuidAttr_classof(const Attr* A);
//=================================================================================================================
//=================================================================================================================
//=================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif