#include "Clang_Ext_Lex_Token.h"
#include "CXSourceLocation.h"
#include "CXString.h"

void clangExt_Token_Dispose(Token* t) {
    if (t)
        delete (t);
}
tok::TokenKind clangExt_Token_getKind(const Token* t) {
    return t->getKind();
}
bool clangExt_Token_is(const Token* t, tok::TokenKind K) {
    return t->is(K);
}
bool clangExt_Token_isNot(const Token* t, tok::TokenKind K) {
    return t->isNot(K);
}
bool clangExt_Token_isOneOf(const Token* t, tok::TokenKind K1, tok::TokenKind K2) {
    return t->isOneOf(K1, K2);
}
bool clangExt_Token_isAnyIdentifier(const Token* t) {
    return t->isAnyIdentifier();
}
bool clangExt_Token_isLiteral(const Token* t) {
    return t->isLiteral();
}
bool clangExt_Token_isAnnotation(const Token* t) {
    return t->isAnnotation();
}
CXSourceLocation clangExt_Token_getLocation(const Token* t, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), t->getLocation());
}
unsigned clangExt_Token_getLength(const Token* t) {
    return t->getLength();
}
CXSourceLocation clangExt_Token_getAnnotationEndLoc(const Token* t, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), t->getAnnotationEndLoc());
}
CXSourceLocation clangExt_Token_getLastLoc(const Token* t, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), t->getLastLoc());
}
CXSourceLocation clangExt_Token_getEndLoc(const Token* t, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), t->getEndLoc());
}
CXSourceRange clangExt_Token_getAnnotationRange(const Token* t, const ASTContext* Ctx) {
    return cxloc::translateSourceRange(const_cast<ASTContext&>(*Ctx), t->getAnnotationRange());
}
const char* clangExt_Token_getName(const Token* t) {
    return t->getName();
}
const IdentifierInfo* clangExt_Token_getIdentifierInfo(const Token* t) {
    return t->getIdentifierInfo();
}
const void* clangExt_Token_getEofData(const Token* t) {
    return t->getEofData();
}
CXString clangExt_Token_getRawIdentifier(const Token* t) {
    return cxstring::createDup(t->getRawIdentifier());
}
const char* clangExt_Token_getLiteralData(const Token* t) {
    return t->getLiteralData();
}
const void* clangExt_Token_getAnnotationValue(const Token* t) {
    return t->getAnnotationValue();
}
bool clangExt_Token_getFlag(const Token* t, Token::TokenFlags Flag) {
    return t->getFlag(Flag);
}
unsigned clangExt_Token_getFlags(const Token* t) {
    return t->getFlags();
}
bool clangExt_Token_isAtStartOfLine(const Token* t) {
    return t->isAtStartOfLine();
}
bool clangExt_Token_hasLeadingSpace(const Token* t) {
    return t->hasLeadingSpace();
}
bool clangExt_Token_isExpandDisabled(const Token* t) {
    return t->isExpandDisabled();
}
bool clangExt_Token_isObjCAtKeyword(const Token* t, tok::ObjCKeywordKind objcKey) {
    return t->isObjCAtKeyword(objcKey);
}
tok::ObjCKeywordKind clangExt_Token_getObjCKeywordID(const Token* t) {
    return t->getObjCKeywordID();
}
bool clangExt_Token_needsCleaning(const Token* t) {
    return t->needsCleaning();
}
bool clangExt_Token_hasLeadingEmptyMacro(const Token* t) {
    return t->hasLeadingEmptyMacro();
}
bool clangExt_Token_hasUDSuffix(const Token* t) {
    return t->hasUDSuffix();
}
bool clangExt_Token_hasUCN(const Token* t) {
    return t->hasUCN();
}
bool clangExt_Token_stringifiedInMacro(const Token* t) {
    return t->stringifiedInMacro();
}
bool clangExt_Token_commaAfterElided(const Token* t) {
    return t->commaAfterElided();
}
bool clangExt_Token_isEditorPlaceholder(const Token* t) {
    return t->isEditorPlaceholder();
}
//=======================================================================================================================
CXSourceLocation clangExt_PPConditionalInfo_IfLoc(const PPConditionalInfo* p, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), p->IfLoc);
}
bool clangExt_PPConditionalInfo_WasSkipping(const PPConditionalInfo* p) {
    return p->WasSkipping;
}
bool clangExt_PPConditionalInfo_FoundNonSkip(const PPConditionalInfo* p) {
    return p->FoundNonSkip;
}
bool clangExt_PPConditionalInfo_FoundElse(const PPConditionalInfo* p) {
    return p->FoundElse;
}
//=======================================================================================================================
