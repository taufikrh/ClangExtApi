#include "Clang_Ext.h"
#include "CXCursor.h"
#include "CXSourceLocation.h"
#include "CXString.h"
#include "CXTranslationUnit.h"

int clangExt_SizeOf() {
    return sizeof(SplitQualType);
}
const Decl *clangExt_Cursor_getCursorDecl(CXCursor Cursor) {
    if (clang_isDeclaration(Cursor.kind))
        return cxcursor::getCursorDecl(Cursor);
    else if (clang_isTranslationUnit(Cursor.kind)) {
        CXTranslationUnit TU = cxcursor::getCursorTU(Cursor);
        ASTUnit* CXXUnit = cxtu::getASTUnit(TU);
        return CXXUnit->getASTContext().getTranslationUnitDecl();
    }
    else
        return nullptr;
}
const Expr* clangExt_Cursor_getCursorExpr(CXCursor Cursor) {
    if (clang_isExpression(Cursor.kind))
        return cxcursor::getCursorExpr(Cursor);
    else
        return nullptr;
}
const Stmt *clangExt_Cursor_getCursorStmt(CXCursor Cursor) {
    if (clang_isStatement(Cursor.kind))
        return cxcursor::getCursorStmt(Cursor);
    else
        return nullptr;
}
const ASTUnit* clangExt_Cursor_getASTUnit(CXCursor Cursor) {
    return cxcursor::getCursorASTUnit(Cursor);
}
const ASTContext* clangExt_Cursor_getASTContext(CXCursor Cursor) {
    return const_cast<const ASTContext*>(&cxcursor::getCursorContext(Cursor));
}
const MacroDefinitionRecord* clangExt_Cursor_getCursorMacroDefinition(CXCursor C) {
    return cxcursor::getCursorMacroDefinition(C);
}
const InclusionDirective* clangExt_Cursor_getCursorInclusionDirective(CXCursor C) {
    return cxcursor::getCursorInclusionDirective(C);
}
const Attr *clangExt_Cursor_getCursorAttr(CXCursor Cursor) {
    if (clang_isAttribute(Cursor.kind))
        return cxcursor::getCursorAttr(Cursor);
    else
        return nullptr;
}
unsigned clangExt_Cursor_getNumAttrs(CXCursor C) {
    if (clang_isDeclaration(C.kind)) {
        const Decl *D = cxcursor::getCursorDecl(C);
        if (D) {
            if (D->hasAttrs()) {
                return D->getAttrs().size();
            }
        }
    } else if ((clang_isStatement(C.kind)) || (clang_isExpression(C.kind))) {
        const Stmt *S = cxcursor::getCursorStmt(C);
        if (S) {
            if (const auto *AS = dyn_cast_or_null<AttributedStmt>(S))
                return AS->getAttrs().size();
        }
    }

    return 0;
}
CXCursor clangExt_Cursor_getAttr(CXCursor C, unsigned i) {
    if (clang_isDeclaration(C.kind)) {
        const Decl *D = cxcursor::getCursorDecl(C);
        if (D) {
            SmallVector<Attr *, 4> attrs = D->getAttrs();

            if (i < attrs.size()) {
                return cxcursor::MakeCXCursor(attrs[i], D, cxcursor::getCursorTU(C));
            }
        }
    } else if ((clang_isStatement(C.kind)) || (clang_isExpression(C.kind))) {
        const Stmt *S = cxcursor::getCursorStmt(C);
        if (S) {
            if (const auto *AS = dyn_cast_or_null<AttributedStmt>(S)) {
                ArrayRef<const Attr *> attrs = AS->getAttrs();
                if (i < attrs.size()) {
                    return cxcursor::MakeCXCursor(attrs[i], cxcursor::getCursorDecl(C), cxcursor::getCursorTU(C));
                }
            }
        }
    } else {
        return clang_Cursor_getArgument(C, i);
    }
  
    return clang_getNullCursor();
}
bool clangExt_Cursor_getAttrKind(CXCursor C, attr::Kind *kind) {
    if (clang_isAttribute(C.kind)) {
        const Attr *A = cxcursor::getCursorAttr(C);
        *kind = A->getKind();
        return true;
    }

    return false;
}
bool clangExt_Cursor_getDeclKind(CXCursor C, Decl::Kind *kind) {
    const auto *D = cxcursor::getCursorDecl(C);
    if (D) {
        *kind = D->getKind();
        return true;
    }

    return false;
}
//=======================================================================================================================
CXString clangExt_getDeclUSR(const Decl* D, CXTranslationUnit TU) {
    cxstring::CXStringBuf* buf = cxstring::getCXStringBuf(TU);
    if (!buf)
        return cxstring::createEmpty();

    bool Ignore = cxcursor::getDeclCursorUSR(D, buf->Data);
    if (Ignore) {
        buf->dispose();
        return cxstring::createEmpty();
    }

    buf->Data.push_back('\0');
    return createCXString(buf);
}
bool clangExt_getTokens(const ASTUnit* CXXUnit, CXSourceRange Range, clangExt_getTokensVisitor visitor, CXClientData client_data, bool createToken) {
    if (!visitor)
        return false;
    SourceRange R = cxloc::translateCXSourceRange(Range);
    if (R.isInvalid())
        return false;

    SourceManager& SourceMgr = const_cast<ASTUnit*>(CXXUnit)->getSourceManager();
    std::pair<FileID, unsigned> BeginLocInfo =
        SourceMgr.getDecomposedSpellingLoc(R.getBegin());
    std::pair<FileID, unsigned> EndLocInfo =
        SourceMgr.getDecomposedSpellingLoc(R.getEnd());

    // Cannot tokenize across files.
    if (BeginLocInfo.first != EndLocInfo.first)
        return false;

    // Create a lexer
    bool Invalid = false;
    StringRef Buffer = SourceMgr.getBufferData(BeginLocInfo.first, &Invalid);
    if (Invalid)
        return false;

    Lexer Lex(SourceMgr.getLocForStartOfFile(BeginLocInfo.first),
        CXXUnit->getASTContext().getLangOpts(), Buffer.begin(),
        Buffer.data() + BeginLocInfo.second, Buffer.end());
    Lex.SetCommentRetentionState(true);

    // Lex tokens until we hit the end of the range.
    const char* EffectiveBufferEnd = Buffer.data() + EndLocInfo.second;
    Token Tok;
    do {
        // Lex the next token
        Lex.LexFromRawLexer(Tok);
        if (Tok.is(tok::eof))
            break;
        if (createToken) {
            Token* t = new Token(Tok);
            if (!visitor(t, client_data))
                return false;
        }
        else {
            if (!visitor(&Tok, client_data))
                return false;
        }
    } while (Lex.getBufferLocation() < EffectiveBufferEnd);

    return true;
}
bool clangExt_getTokenPtrs(const ASTUnit* CXXUnit, SourceRange R, Token** Tokens, unsigned* NumTokens) {
    if (R.isInvalid())
        return false;

    SourceManager& SourceMgr = const_cast<ASTUnit*>(CXXUnit)->getSourceManager();
    std::pair<FileID, unsigned> BeginLocInfo =
        SourceMgr.getDecomposedSpellingLoc(R.getBegin());
    std::pair<FileID, unsigned> EndLocInfo =
        SourceMgr.getDecomposedSpellingLoc(R.getEnd());

    // Cannot tokenize across files.
    if (BeginLocInfo.first != EndLocInfo.first)
        return false;

    // Create a lexer
    bool Invalid = false;
    StringRef Buffer = SourceMgr.getBufferData(BeginLocInfo.first, &Invalid);
    if (Invalid)
        return false;

    Lexer Lex(SourceMgr.getLocForStartOfFile(BeginLocInfo.first),
        CXXUnit->getASTContext().getLangOpts(), Buffer.begin(),
        Buffer.data() + BeginLocInfo.second, Buffer.end());
    Lex.SetCommentRetentionState(true);

    // Lex tokens until we hit the end of the range.
    const char* EffectiveBufferEnd = Buffer.data() + EndLocInfo.second;
    Token Tok;
    SmallVector<Token*, 32> ts;
    do {
        // Lex the next token
        Lex.LexFromRawLexer(Tok);
        if (Tok.is(tok::eof))
            break;
        ts.push_back(new Token(Tok));
    } while (Lex.getBufferLocation() < EffectiveBufferEnd);

    if (ts.empty())
        return false;

    *Tokens = static_cast<Token*>(llvm::safe_malloc(sizeof(void*) * ts.size()));
    memmove(*Tokens, ts.data(), sizeof(void*) * ts.size());
    *NumTokens = ts.size();

    return true;
}
bool clangExt_getTokenPtrsFromSourceRange(const ASTUnit* CXXUnit, CXSourceRange Range, Token** Tokens, unsigned* NumTokens) {
    if (Tokens)
        *Tokens = nullptr;
    else
        return false;
    if (NumTokens)
        *NumTokens = 0;
    else
        return false;
    SourceRange R = cxloc::translateCXSourceRange(Range);

    return clangExt_getTokenPtrs(CXXUnit, R, Tokens, NumTokens);
}
bool clangExt_getTokenPtrsFromSourceLocation(const ASTUnit* CXXUnit, CXSourceLocation Location, Token** Tokens, unsigned* NumTokens) {
    if (Tokens)
        *Tokens = nullptr;
    else
        return false;
    if (NumTokens)
        *NumTokens = 0;
    else
        return false;

    SourceLocation Begin = cxloc::translateSourceLocation(Location);
    if (Begin.isInvalid())
        return false;
    SourceManager& SM = const_cast<ASTUnit*>(CXXUnit)->getSourceManager();
    std::pair<FileID, unsigned> DecomposedEnd = SM.getDecomposedLoc(Begin);
    DecomposedEnd.second +=  Lexer::MeasureTokenLength(Begin, SM, CXXUnit->getLangOpts());

    SourceLocation End = SM.getComposedLoc(DecomposedEnd.first, DecomposedEnd.second);

    return clangExt_getTokenPtrs(CXXUnit, SourceRange(Begin, End), Tokens, NumTokens);
}
void clangExt_disposeTokenPtrs(Token** Tokens, unsigned NumTokens) {
    if (Tokens && NumTokens) {
        for (unsigned i = 0; i < NumTokens; i++)
            delete(Tokens[i]);
        free(Tokens);
    }
}
//=======================================================================================================================