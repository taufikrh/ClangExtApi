#include "Clang_Ext_AST_Stmt.h"
#include "CXString.h"
#include "CXSourceLocation.h"

int clangExt_Stmt_getNumStmtClass() {
	return Stmt::StmtClass::lastStmtConstant;
}
CXString clangExt_Stmt_getNameStmtClass(Stmt::StmtClass i) {
	const char* s = nullptr;
#define TSTMTCLASS(X) case Stmt::StmtClass::##X: s = ""  #X  ""; break

	switch (i) {
		TSTMTCLASS(NoStmtClass);
#define STMT(CLASS, PARENT) TSTMTCLASS(CLASS##Class);
#define ABSTRACT_STMT(STMT)
#include "clang/AST/StmtNodes.inc"
	}
#undef TSTMTCLASS

	return cxstring::createRef(s);
}
Stmt::StmtClass clangExt_Stmt_getStmtClass(const Stmt* s) {
	return s->getStmtClass();
}
const char* clangExt_Stmt_getStmtClassName(const Stmt* s) {
	return s->getStmtClassName();
}
CXSourceRange clangExt_Stmt_getSourceRange(const Stmt* s, const ASTContext* Ctx) {
    return cxloc::translateSourceRange(const_cast<ASTContext&>(*Ctx), s->getSourceRange());
}
CXSourceLocation clangExt_Stmt_getBeginLoc(const Stmt* s, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), s->getBeginLoc());
}
CXSourceLocation clangExt_Stmt_getEndLoc(const Stmt* s, const ASTContext* Ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*Ctx), s->getEndLoc());
}
Stmt::Likelihood clangExt_Stmt_getLikelihood(const Stmt* s) {
    return Stmt::getLikelihood(s);
}
const Attr* clangExt_Stmt_getLikelihoodAttr(const Stmt* s) {
    return Stmt::getLikelihoodAttr(s);
}
CXString clangExt_Stmt_dump(const Stmt* s, const ASTContext* Context) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	s->dump(infoOut, const_cast<ASTContext&>(*Context));
	return cxstring::createDup(info.c_str());
}
CXString clangExt_Stmt_printPretty(const Stmt* s, const CXPrintingPolicy Policy, unsigned Indentation, const char* NewlineSymbol, const ASTContext* Context) {
	std::string info;
	llvm::raw_string_ostream infoOut(info);
	s->printPretty(infoOut, nullptr, *static_cast<PrintingPolicy*>(Policy), Indentation, StringRef(NewlineSymbol), Context);
	return cxstring::createDup(info.c_str());
}
const Stmt* clangExt_Stmt_IgnoreContainers(const Stmt* s, bool IgnoreCaptured) {
    return s->IgnoreContainers(IgnoreCaptured);
}
const Stmt* clangExt_Stmt_stripLabelLikeStatements(const Stmt* s) {
    return s->stripLabelLikeStatements();
}
unsigned clangExt_Stmt_getNumChildren(const Stmt* s) {
    SmallVector<const Stmt*, 4> stmts = { s->child_begin(), s->child_end() };
    return stmts.size();
}
const Stmt* clangExt_Stmt_getChildren(const Stmt* s, unsigned i) {
    SmallVector<const Stmt*, 4> stmts = { s->child_begin(), s->child_end() };
	if (i < stmts.size())
		return stmts[i];
	else
		return nullptr;
		
}
//=======================================================================================================================
const Expr* clangExt_ValueStmt_getExprStmt(const ValueStmt* s) {
	return s->getExprStmt();
}
bool clangExt_ValueStmt_classof(const Stmt* T) {
	return ValueStmt::classof(T);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================