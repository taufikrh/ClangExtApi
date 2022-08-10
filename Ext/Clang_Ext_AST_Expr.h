#ifndef LIB_CLANG_EXT_AST_EXPR_H
#define LIB_CLANG_EXT_AST_EXPR_H

#include <clang/AST/ASTContext.h>
#include <clang/AST/Stmt.h>
#include <clang/AST/Expr.h>
#include "clang-c/Index.h"
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN

//=======================================================================================================================
CINDEX_LINKAGE const CXQualType clangExt_Expr_getType(const Expr* e);
CINDEX_LINKAGE ExprDependence clangExt_Expr_getDependence(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isValueDependent(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isTypeDependent(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isInstantiationDependent(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_containsUnexpandedParameterPack(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_containsErrors(const Expr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_Expr_getExprLoc(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Expr_isReadIfDiscardedInCPlusPlus11(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isLValue(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isPRValue(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isXValue(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isGLValue(const Expr* e);
CINDEX_LINKAGE Expr::LValueClassification clangExt_Expr_ClassifyLValue(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE Expr::isModifiableLvalueResult clangExt_Expr_isModifiableLvalue(const Expr* e, const ASTContext* Ctx, CXSourceLocation* Loc = nullptr);
CINDEX_LINKAGE FPOptions::storage_type clangExt_Expr_getFPFeaturesInEffect(const Expr* e, const LangOptions* LO);
CINDEX_LINKAGE ExprValueKind clangExt_Expr_getValueKind(const Expr* e);
CINDEX_LINKAGE ExprObjectKind clangExt_Expr_getObjectKind(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isOrdinaryOrBitFieldObject(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_refersToBitField(const Expr* e);
CINDEX_LINKAGE const FieldDecl* clangExt_Expr_getSourceBitField(const Expr* e);
CINDEX_LINKAGE const Decl* clangExt_Expr_getReferencedDeclOfCallee(const Expr* e);
CINDEX_LINKAGE const ObjCPropertyRefExpr* clangExt_Expr_getObjCProperty(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isObjCSelfExpr(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_refersToVectorElement(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_refersToMatrixElement(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_refersToGlobalRegisterVar(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_hasPlaceholderType(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_hasPlaceholderTypeKind(const Expr* e, BuiltinType::Kind K);
CINDEX_LINKAGE bool clangExt_Expr_isKnownToHaveBooleanValue(const Expr* e, bool Semantic = true);
CINDEX_LINKAGE bool clangExt_Expr_isIntegerConstantExpr(const Expr* e, const ASTContext* Ctx, CXSourceLocation* Loc = nullptr);
CINDEX_LINKAGE bool clangExt_Expr_isCXX98IntegralConstantExpr(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Expr_isCXX11ConstantExpr(const Expr* e, const ASTContext* Ctx, APValue* Result = nullptr, CXSourceLocation* Loc = nullptr);
CINDEX_LINKAGE bool clangExt_Expr_isConstantInitializer(const Expr* e, const ASTContext* Ctx, bool ForRef, const Expr** Culprit = nullptr);
CINDEX_LINKAGE const ValueDecl* clangExt_Expr_getAsBuiltinConstantDeclRef(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Expr_tryEvaluateStrLen(const Expr* e, uint64_t* Result, const ASTContext* Ctx);
CINDEX_LINKAGE Expr::NullPointerConstantKind clangExt_Expr_isNullPointerConstant(const Expr* e, const ASTContext* Ctx, Expr::NullPointerConstantValueDependence NPC);
CINDEX_LINKAGE bool clangExt_Expr_isOBJCGCCandidate(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_Expr_isBoundMemberFunction(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreUnlessSpelledInSource(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreImpCasts(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreCasts(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreImplicit(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreImplicitAsWritten(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParens(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParenImpCasts(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParenCasts(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreConversionOperatorSingleStep(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParenLValueCasts(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParenNoopCasts(const Expr* e, const ASTContext* Ctx);
CINDEX_LINKAGE const Expr* clangExt_Expr_IgnoreParenBaseCasts(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isDefaultArgument(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isTemporaryObject(const Expr* e, const ASTContext* Ctx, const CXXRecordDecl* TempTy);
CINDEX_LINKAGE bool clangExt_Expr_isImplicitCXXThis(const Expr* e);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_Expr_getBestDynamicClassType(const Expr* e);
CINDEX_LINKAGE const Expr* clangExt_Expr_getBestDynamicClassTypeExpr(const Expr* e);
CINDEX_LINKAGE bool clangExt_Expr_isSameComparisonOperand(const Expr* E1, const Expr* E2);
CINDEX_LINKAGE bool clangExt_Expr_classof(const Stmt* T);
//=======================================================================================================================
CINDEX_LINKAGE const Expr* clangExt_FullExpr_getSubExpr(const FullExpr* e);
CINDEX_LINKAGE bool clangExt_FullExpr_classof(const Stmt* T);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_ConstantExpr_getBeginLoc(const ConstantExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_ConstantExpr_getEndLoc(const ConstantExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_ConstantExpr_classof(const Stmt* T);
CINDEX_LINKAGE APValue::ValueKind clangExt_ConstantExpr_getResultAPValueKind(const ConstantExpr* e);
CINDEX_LINKAGE ConstantExpr::ResultStorageKind clangExt_ConstantExpr_getResultStorageKind(const ConstantExpr* e);
CINDEX_LINKAGE bool clangExt_ConstantExpr_isImmediateInvocation(const ConstantExpr* e);
CINDEX_LINKAGE bool clangExt_ConstantExpr_hasAPValueResult(const ConstantExpr* e);
CINDEX_LINKAGE const APValue* clangExt_ConstantExpr_getAPValueResult(const ConstantExpr* e); // dispose: clangExt_APValue_Dispose
CINDEX_LINKAGE const APValue* clangExt_ConstantExpr_getResultAsAPValue(const ConstantExpr* e); // dispose: clangExt_APValue_Dispose
CINDEX_LINKAGE const llvm::APSInt* clangExt_ConstantExpr_getResultAsAPSInt(const ConstantExpr* e); // dispose: clangExt_APSInt_Dispose
CINDEX_LINKAGE unsigned clangExt_ConstantExpr_getNumChildren(const ConstantExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_ConstantExpr_getChildren(const ConstantExpr* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE const ValueDecl* clangExt_DeclRefExpr_getDecl(const DeclRefExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getLocation(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getBeginLoc(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getEndLoc(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_hasQualifier(const DeclRefExpr* e);
CINDEX_LINKAGE const NestedNameSpecifierLoc* clangExt_DeclRefExpr_getQualifierLoc(const DeclRefExpr* e); // dispose: clangExt_NestedNameSpecifierLoc_Dispose
CINDEX_LINKAGE const NestedNameSpecifier* clangExt_DeclRefExpr_getQualifier(const DeclRefExpr* e);
CINDEX_LINKAGE const NamedDecl* clangExt_DeclRefExpr_getFoundDecl(const DeclRefExpr* e);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_hasTemplateKWAndArgsInfo(const DeclRefExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getTemplateKeywordLoc(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getLAngleLoc(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_DeclRefExpr_getRAngleLoc(const DeclRefExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_hasTemplateKeyword(const DeclRefExpr* e);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_hasExplicitTemplateArgs(const DeclRefExpr* e);
CINDEX_LINKAGE const TemplateArgumentLoc* clangExt_DeclRefExpr_getTemplateArgs(const DeclRefExpr* e);
CINDEX_LINKAGE unsigned clangExt_DeclRefExpr_getNumTemplateArgs(const DeclRefExpr* e);
CINDEX_LINKAGE const TemplateArgumentLoc* clangExt_DeclRefExpr_template_arguments(const DeclRefExpr* e, unsigned i);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_hadMultipleCandidates(const DeclRefExpr* e);
CINDEX_LINKAGE NonOdrUseReason clangExt_DeclRefExpr_isNonOdrUse(const DeclRefExpr* e);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_refersToEnclosingVariableOrCapture(const DeclRefExpr* e);
CINDEX_LINKAGE bool clangExt_DeclRefExpr_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_DeclRefExpr_getNumChildren(const DeclRefExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_DeclRefExpr_getChildren(const DeclRefExpr* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_IntegerLiteral_getBeginLoc(const IntegerLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_IntegerLiteral_getEndLoc(const IntegerLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_IntegerLiteral_getLocation(const IntegerLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE unsigned clangExt_IntegerLiteral_getNumChildren(const IntegerLiteral* e);
CINDEX_LINKAGE const Stmt* clangExt_IntegerLiteral_getChildren(const IntegerLiteral* e, unsigned i);
CINDEX_LINKAGE bool clangExt_IntegerLiteral_classof(const Stmt* T);
CINDEX_LINKAGE const llvm::APInt* clangExt_IntegerLiteral_getValue(const IntegerLiteral* e); // dispose: clangExt_APInt_Dispose
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_CharacterLiteral_getLocation(const CharacterLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CharacterLiteral::CharacterKind clangExt_CharacterLiteral_getKind(const CharacterLiteral* e);
CINDEX_LINKAGE CXSourceLocation clangExt_CharacterLiteral_getBeginLoc(const CharacterLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CharacterLiteral_getEndLoc(const CharacterLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE unsigned clangExt_CharacterLiteral_getValue(const CharacterLiteral* e);
CINDEX_LINKAGE bool clangExt_CharacterLiteral_classof(const Stmt* T);
CINDEX_LINKAGE CXString clangExt_CharacterLiteral_print(unsigned val, CharacterLiteral::CharacterKind Kind);
CINDEX_LINKAGE unsigned clangExt_CharacterLiteral_getNumChildren(const CharacterLiteral* e);
CINDEX_LINKAGE const Stmt* clangExt_CharacterLiteral_getChildren(const CharacterLiteral* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE const llvm::APFloat* clangExt_FloatingLiteral_getValue(const FloatingLiteral* e); // dispose: clangExt_APFloat_Dispose
CINDEX_LINKAGE bool clangExt_FloatingLiteral_isExact(const FloatingLiteral* e);
CINDEX_LINKAGE CXSourceLocation clangExt_FloatingLiteral_getLocation(const FloatingLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_FloatingLiteral_getBeginLoc(const FloatingLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_FloatingLiteral_getEndLoc(const FloatingLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_FloatingLiteral_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_FloatingLiteral_getNumChildren(const FloatingLiteral* e);
CINDEX_LINKAGE const Stmt* clangExt_FloatingLiteral_getChildren(const FloatingLiteral* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE CXString clangExt_StringLiteral_getString(const StringLiteral* e);
CINDEX_LINKAGE CXString clangExt_StringLiteral_getBytes(const StringLiteral* e);
CINDEX_LINKAGE CXString clangExt_StringLiteral_outputString(const StringLiteral* e);
CINDEX_LINKAGE uint32_t clangExt_StringLiteral_getCodeUnit(const StringLiteral* e, size_t i);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_getByteLength(const StringLiteral* e);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_getLength(const StringLiteral* e);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_getCharByteWidth(const StringLiteral* e);
CINDEX_LINKAGE StringLiteral::StringKind clangExt_StringLiteral_getKind(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isOrdinary(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isWide(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isUTF8(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isUTF16(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isUTF32(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_isPascal(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_containsNonAscii(const StringLiteral* e);
CINDEX_LINKAGE bool clangExt_StringLiteral_containsNonAsciiOrNull(const StringLiteral* e);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_getNumConcatenated(const StringLiteral* e);
CINDEX_LINKAGE CXSourceLocation clangExt_StringLiteral_getStrTokenLoc(const StringLiteral* e, unsigned TokNum, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_StringLiteral_getLocationOfByte(const StringLiteral* e, unsigned ByteNo, const SourceManager* SM,
    const LangOptions* Features, const TargetInfo* Target, const ASTContext* Ctx,
    unsigned* StartToken = nullptr,
    unsigned* StartTokenByteOffset = nullptr);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_GetToklocNum(const StringLiteral* e);
CINDEX_LINKAGE CXSourceLocation clangExt_StringLiteral_GetTokloc(const StringLiteral* e, unsigned i, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_StringLiteral_getBeginLoc(const StringLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_StringLiteral_getEndLoc(const StringLiteral* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_StringLiteral_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_StringLiteral_getNumChildren(const StringLiteral* e);
CINDEX_LINKAGE const Stmt* clangExt_StringLiteral_getChildren(const StringLiteral* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE const Expr* clangExt_ParenExpr_getSubExpr(const ParenExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_ParenExpr_getBeginLoc(const ParenExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_ParenExpr_getEndLoc(const ParenExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_ParenExpr_getLParen(const ParenExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_ParenExpr_getRParen(const ParenExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_ParenExpr_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_ParenExpr_getNumChildren(const ParenExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_ParenExpr_getChildren(const ParenExpr* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE UnaryOperator::Opcode clangExt_UnaryOperator_getOpcode(const UnaryOperator* e);
CINDEX_LINKAGE const Expr* clangExt_UnaryOperator_getSubExpr(const UnaryOperator* e);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryOperator_getOperatorLoc(const UnaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_UnaryOperator_canOverflow(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isFPContractableWithinStatement(const UnaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isFEnvAccessOn(const UnaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isPostfixStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isPrefixStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isPrefix(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isPostfix(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isIncrementOpStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isIncrementOp(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isDecrementOpStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isDecrementOp(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isIncrementDecrementOpStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isIncrementDecrementOp(const UnaryOperator* e);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isArithmeticOpStatic(UnaryOperator::Opcode Op);
CINDEX_LINKAGE bool clangExt_UnaryOperator_isArithmeticOp(const UnaryOperator* e);
CINDEX_LINKAGE CXString clangExt_UnaryOperator_getOpcodeStr(UnaryOperator::Opcode Op);
CINDEX_LINKAGE UnaryOperator::Opcode clangExt_UnaryOperator_getOverloadedOpcode(OverloadedOperatorKind OO, bool Postfix);
CINDEX_LINKAGE OverloadedOperatorKind clangExt_UnaryOperator_getOverloadedOperator(UnaryOperator::Opcode Opc);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryOperator_getBeginLoc(const UnaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryOperator_getEndLoc(const UnaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryOperator_getExprLoc(const UnaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_UnaryOperator_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_UnaryOperator_getNumChildren(const UnaryOperator* e);
CINDEX_LINKAGE const Stmt* clangExt_UnaryOperator_getChildren(const UnaryOperator* e, unsigned i);
CINDEX_LINKAGE bool clangExt_UnaryOperator_hasStoredFPFeatures(const UnaryOperator* e);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_UnaryOperator_getStoredFPFeatures(const UnaryOperator* e);
CINDEX_LINKAGE FPOptions::storage_type clangExt_UnaryOperator_getFPFeaturesInEffect(const UnaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_UnaryOperator_getFPOptionsOverride(const UnaryOperator* e);
//=======================================================================================================================
CINDEX_LINKAGE UnaryExprOrTypeTrait clangExt_UnaryExprOrTypeTraitExpr_getKind(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE bool clangExt_UnaryExprOrTypeTraitExpr_isArgumentType(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE const CXQualType clangExt_UnaryExprOrTypeTraitExpr_getArgumentType(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_UnaryExprOrTypeTraitExpr_getArgumentTypeInfo(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE const Expr* clangExt_UnaryExprOrTypeTraitExpr_getArgumentExpr(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE const CXQualType clangExt_UnaryExprOrTypeTraitExpr_getTypeOfArgument(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getOperatorLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getRParenLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getBeginLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_UnaryExprOrTypeTraitExpr_getEndLoc(const UnaryExprOrTypeTraitExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_UnaryExprOrTypeTraitExpr_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_UnaryExprOrTypeTraitExpr_getNumChildren(const UnaryExprOrTypeTraitExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_UnaryExprOrTypeTraitExpr_getChildren(const UnaryExprOrTypeTraitExpr* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE CastKind clangExt_CastExpr_getCastKind(const CastExpr* e);
CINDEX_LINKAGE const char* clangExt_CastExpr_CastKindName(CastKind CK);
CINDEX_LINKAGE const char* clangExt_CastExpr_getCastKindName(const CastExpr* e);
CINDEX_LINKAGE const Expr* clangExt_CastExpr_getSubExpr(const CastExpr* e);
CINDEX_LINKAGE const Expr* clangExt_CastExpr_getSubExprAsWritten(const CastExpr* e);
CINDEX_LINKAGE NamedDecl* clangExt_CastExpr_getConversionFunction(const CastExpr* e);
CINDEX_LINKAGE bool clangExt_CastExpr_path_empty(const CastExpr* e);
CINDEX_LINKAGE unsigned clangExt_CastExpr_path_size(const CastExpr* e);
CINDEX_LINKAGE const CXXBaseSpecifier* clangExt_CastExpr_getPath(const CastExpr* e, unsigned i);
CINDEX_LINKAGE const FieldDecl* clangExt_CastExpr_getTargetUnionField(const CastExpr* e);
CINDEX_LINKAGE bool clangExt_CastExpr_hasStoredFPFeatures(const CastExpr* e);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_CastExpr_getStoredFPFeatures(const CastExpr* e);
CINDEX_LINKAGE FPOptions::storage_type clangExt_CastExpr_getFPFeaturesInEffect(const CastExpr* e, const LangOptions* LO);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_CastExpr_getFPFeatures(const CastExpr* e);
CINDEX_LINKAGE const FieldDecl* clangExt_CastExpr_getTargetFieldForToUnionCast(const CXQualType unionType, const CXQualType opType);
CINDEX_LINKAGE const FieldDecl* clangExt_CastExpr_getTargetFieldForToUnionCastRecordDecl(const RecordDecl* RD, const CXQualType opType);
CINDEX_LINKAGE bool clangExt_CastExpr_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_CastExpr_getNumChildren(const CastExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_CastExpr_getChildren(const CastExpr* e, unsigned i);
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_ImplicitCastExpr_isPartOfExplicitCast(const ImplicitCastExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_ImplicitCastExpr_getBeginLoc(const ImplicitCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_ImplicitCastExpr_getEndLoc(const ImplicitCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_ImplicitCastExpr_classof(const Stmt* T);
//=======================================================================================================================
CINDEX_LINKAGE const TypeSourceInfo* clangExt_ExplicitCastExpr_getTypeInfoAsWritten(const ExplicitCastExpr* e);
CINDEX_LINKAGE const CXQualType clangExt_ExplicitCastExpr_getTypeAsWritten(const ExplicitCastExpr* e);
CINDEX_LINKAGE bool clangExt_ExplicitCastExpr_classof(const Stmt* T);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_CStyleCastExpr_getLParenLoc(const CStyleCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CStyleCastExpr_getRParenLoc(const CStyleCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CStyleCastExpr_getBeginLoc(const CStyleCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CStyleCastExpr_getEndLoc(const CStyleCastExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_CStyleCastExpr_classof(const Stmt* T);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_BinaryOperator_getExprLoc(const BinaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_BinaryOperator_getOperatorLoc(const BinaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE BinaryOperator::Opcode clangExt_BinaryOperator_getOpcode(const BinaryOperator* e);
CINDEX_LINKAGE const Expr* clangExt_BinaryOperator_getLHS(const BinaryOperator* e);
CINDEX_LINKAGE const Expr* clangExt_BinaryOperator_getRHS(const BinaryOperator* e);
CINDEX_LINKAGE CXSourceLocation clangExt_BinaryOperator_getBeginLoc(const BinaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_BinaryOperator_getEndLoc(const BinaryOperator* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXString clangExt_BinaryOperator_getOpcodeStrStatic(BinaryOperator::Opcode Op);
CINDEX_LINKAGE CXString clangExt_BinaryOperator_getOpcodeStr(const BinaryOperator* e);
CINDEX_LINKAGE BinaryOperator::Opcode clangExt_BinaryOperator_getOverloadedOpcode(OverloadedOperatorKind OO);
CINDEX_LINKAGE OverloadedOperatorKind clangExt_BinaryOperator_getOverloadedOperator(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isPtrMemOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isPtrMemOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isMultiplicativeOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isMultiplicativeOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isAdditiveOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isAdditiveOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isShiftOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isShiftOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isBitwiseOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isBitwiseOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isRelationalOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isRelationalOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isEqualityOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isEqualityOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isComparisonOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isComparisonOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isCommaOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isCommaOp(const BinaryOperator* e);
CINDEX_LINKAGE BinaryOperator::Opcode clangExt_BinaryOperator_negateComparisonOp(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE BinaryOperator::Opcode clangExt_BinaryOperator_reverseComparisonOp(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isLogicalOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isLogicalOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isAssignmentOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isAssignmentOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isCompoundAssignmentOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isCompoundAssignmentOp(const BinaryOperator* e);
CINDEX_LINKAGE BinaryOperator::Opcode clangExt_BinaryOperator_getOpForCompoundAssignment(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isShiftAssignOpStatic(BinaryOperator::Opcode Opc);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isShiftAssignOp(const BinaryOperator* e);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isNullPointerArithmeticExtension(const ASTContext* Ctx, BinaryOperator::Opcode Opc, Expr* LHS, Expr* RHS);
CINDEX_LINKAGE bool clangExt_BinaryOperator_classof(const Stmt* S);
CINDEX_LINKAGE unsigned clangExt_BinaryOperator_getNumChildren(const BinaryOperator* e);
CINDEX_LINKAGE const Stmt* clangExt_BinaryOperator_getChildren(const BinaryOperator* e, unsigned i);
CINDEX_LINKAGE bool clangExt_BinaryOperator_hasStoredFPFeatures(const BinaryOperator* e);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_BinaryOperator_getStoredFPFeatures(const BinaryOperator* e);
CINDEX_LINKAGE FPOptions::storage_type clangExt_BinaryOperator_getFPFeaturesInEffect(const BinaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE FPOptionsOverride::storage_type clangExt_BinaryOperator_getFPFeatures(const BinaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isFPContractableWithinStatement(const BinaryOperator* e, const LangOptions* LO);
CINDEX_LINKAGE bool clangExt_BinaryOperator_isFEnvAccessOn(const BinaryOperator* e, const LangOptions* LO);
//=======================================================================================================================
CINDEX_LINKAGE unsigned clangExt_InitListExpr_getNumInits(const InitListExpr* e);
CINDEX_LINKAGE const Expr* clangExt_InitListExpr_getInit(const InitListExpr* e, unsigned Init);
CINDEX_LINKAGE const Expr* clangExt_InitListExpr_getArrayFiller(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_hasArrayFiller(const InitListExpr* e);
CINDEX_LINKAGE const FieldDecl* clangExt_InitListExpr_getInitializedFieldInUnion(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_isExplicit(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_isStringLiteralInit(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_isTransparent(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_isIdiomaticZeroInitializer(const InitListExpr* e, const LangOptions* LangOpts);
CINDEX_LINKAGE CXSourceLocation clangExt_InitListExpr_getLBraceLoc(const InitListExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_InitListExpr_getRBraceLoc(const InitListExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_InitListExpr_isSemanticForm(const InitListExpr* e);
CINDEX_LINKAGE const InitListExpr* clangExt_InitListExpr_getSemanticForm(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_isSyntacticForm(const InitListExpr* e);
CINDEX_LINKAGE const InitListExpr* clangExt_InitListExpr_getSyntacticForm(const InitListExpr* e);
CINDEX_LINKAGE bool clangExt_InitListExpr_hadArrayRangeDesignator(const InitListExpr* e);
CINDEX_LINKAGE CXSourceLocation clangExt_InitListExpr_getBeginLoc(const InitListExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_InitListExpr_getEndLoc(const InitListExpr* e, const ASTContext* Ctx);
CINDEX_LINKAGE bool clangExt_InitListExpr_classof(const Stmt* T);
CINDEX_LINKAGE unsigned clangExt_InitListExpr_getNumChildren(const InitListExpr* e);
CINDEX_LINKAGE const Stmt* clangExt_InitListExpr_getChildren(const InitListExpr* e, unsigned i);

//=======================================================================================================================
LLVM_CLANG_C_EXTERN_C_END

#endif