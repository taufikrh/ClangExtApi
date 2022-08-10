#ifndef LIB_CLANG_EXT_AST_DECL_CXX_H
#define LIB_CLANG_EXT_AST_DECL_CXX_H

#include <clang/AST/Decl.h>
#include <clang/AST/DeclFriend.h>
#include <clang/AST/DeclCXX.h>
#include <clang/AST/DeclObjC.h>
//#include <clang/AST/VTableBuilder.h>
#include <clang/Basic/Specifiers.h>
#include <clang-c/Index.h>
#include "Clang_Ext_Types.h"

using namespace clang;

LLVM_CLANG_C_EXTERN_C_BEGIN
//=======================================================================================================================
CINDEX_LINKAGE CXSourceLocation clangExt_AccessSpecDecl_getAccessSpecifierLoc(const AccessSpecDecl* A);
CINDEX_LINKAGE CXSourceLocation clangExt_AccessSpecDecl_getColonLoc(const AccessSpecDecl* A);
CINDEX_LINKAGE CXSourceRange clangExt_AccessSpecDecl_getSourceRange(const AccessSpecDecl* A);
CINDEX_LINKAGE bool clangExt_AccessSpecDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_AccessSpecDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE CXSourceRange clangExt_CXXBaseSpecifier_getSourceRange(const CXXBaseSpecifier* D, const ASTContext* ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CXXBaseSpecifier_getBeginLoc(const CXXBaseSpecifier* D, const ASTContext* ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CXXBaseSpecifier_getEndLoc(const CXXBaseSpecifier* D, const ASTContext* ctx);
CINDEX_LINKAGE CXSourceLocation clangExt_CXXBaseSpecifier_getBaseTypeLoc(const CXXBaseSpecifier* D, const ASTContext* ctx);
CINDEX_LINKAGE bool clangExt_CXXBaseSpecifier_isVirtual(const CXXBaseSpecifier* D);
CINDEX_LINKAGE bool clangExt_CXXBaseSpecifier_isBaseOfClass(const CXXBaseSpecifier* D);
CINDEX_LINKAGE bool clangExt_CXXBaseSpecifier_isPackExpansion(const CXXBaseSpecifier* D);
CINDEX_LINKAGE bool clangExt_CXXBaseSpecifier_getInheritConstructors(const CXXBaseSpecifier* D);
CINDEX_LINKAGE CXSourceLocation clangExt_CXXBaseSpecifier_getEllipsisLoc(const CXXBaseSpecifier* D, const ASTContext* ctx);
CINDEX_LINKAGE AccessSpecifier clangExt_CXXBaseSpecifier_getAccessSpecifier(const CXXBaseSpecifier* D);
CINDEX_LINKAGE AccessSpecifier clangExt_CXXBaseSpecifier_getAccessSpecifierAsWritten(const CXXBaseSpecifier* D);
CINDEX_LINKAGE const CXQualType clangExt_CXXBaseSpecifier_getType(const CXXBaseSpecifier* D);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_CXXBaseSpecifier_getTypeSourceInfo(const CXXBaseSpecifier* D);
//=======================================================================================================================
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getCanonicalDecl(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getPreviousDecl(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getMostRecentDecl(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getMostRecentNonInjectedDecl(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getDefinition(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasDefinition(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isDynamicClass(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_mayBeDynamicClass(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_mayBeNonDynamicClass(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isParsingBaseSpecifiers(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getODRHash(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumBases(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXBaseSpecifier* clangExt_CXXRecordDecl_getBases(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumVBases(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXBaseSpecifier* clangExt_CXXRecordDecl_getVBases(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasAnyDependentBases(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumMethods(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXRecordDecl_getMethods(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumCtors(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXConstructorDecl* clangExt_CXXRecordDecl_getCtors(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumFriends(const CXXRecordDecl* D);
CINDEX_LINKAGE const FriendDecl* clangExt_CXXRecordDecl_getFriends(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasFriends(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_defaultedCopyConstructorIsDeleted(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_defaultedMoveConstructorIsDeleted(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_defaultedDestructorIsDeleted(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasSimpleCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasSimpleMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasSimpleCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasSimpleMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasSimpleDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserProvidedDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsOverloadResolutionForCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_implicitCopyConstructorHasConstParam(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasCopyConstructorWithConstParam(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredMoveOperation(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsOverloadResolutionForMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsOverloadResolutionForCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_implicitCopyAssignmentHasConstParam(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasCopyAssignmentWithConstParam(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsOverloadResolutionForMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUserDeclaredDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsImplicitDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_needsOverloadResolutionForDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isLambda(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isGenericLambda(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_lambdaIsDefaultConstructibleAndAssignable(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXRecordDecl_getLambdaCallOperator(const CXXRecordDecl* D);
CINDEX_LINKAGE const FunctionTemplateDecl* clangExt_CXXRecordDecl_getDependentLambdaCallOperator(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXRecordDecl_getLambdaStaticInvoker(const CXXRecordDecl* D);
CINDEX_LINKAGE const TemplateParameterList* clangExt_CXXRecordDecl_getGenericLambdaTemplateParameterList(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getNumLambdaExplicitTemplateParameters(const CXXRecordDecl* D);
CINDEX_LINKAGE const NamedDecl* clangExt_CXXRecordDecl_getLambdaExplicitTemplateParameters(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE LambdaCaptureDefault clangExt_CXXRecordDecl_getLambdaCaptureDefault(const CXXRecordDecl* D);
CINDEX_LINKAGE const LambdaCapture* clangExt_CXXRecordDecl_getCaptures(const CXXRecordDecl* D, unsigned i);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_capture_size(const CXXRecordDecl* D);
// ignore conversion iterator
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isAggregate(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasInClassInitializer(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasUninitializedReferenceMember(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isPOD(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isCLike(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isEmpty(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasInitMethod(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasPrivateFields(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasProtectedFields(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasDirectFields(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isPolymorphic(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isAbstract(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isStandardLayout(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isCXX11StandardLayout(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasMutableFields(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasVariantMembers(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasConstexprNonCopyMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_defaultedDefaultConstructorIsConstexpr(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasConstexprDefaultConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialCopyConstructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialCopyConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialCopyConstructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialMoveConstructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialMoveConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialMoveConstructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialCopyAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialMoveAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_defaultedDestructorIsConstexpr(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasConstexprDestructor(const CXXRecordDecl* D);

CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasTrivialDestructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonTrivialDestructorForCall(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_allowConstDefaultInit(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasIrrelevantDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasNonLiteralTypeFieldsOrBases(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasInheritedConstructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasInheritedAssignment(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isTriviallyCopyable(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isTrivial(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isLiteral(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isStructural(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getInstantiatedFromMemberClass(const CXXRecordDecl* D);
CINDEX_LINKAGE const MemberSpecializationInfo* clangExt_CXXRecordDecl_getMemberSpecializationInfo(const CXXRecordDecl* D);
CINDEX_LINKAGE const ClassTemplateDecl* clangExt_CXXRecordDecl_getDescribedClassTemplate(const CXXRecordDecl* D);
CINDEX_LINKAGE TemplateSpecializationKind clangExt_CXXRecordDecl_getTemplateSpecializationKind(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXRecordDecl_getTemplateInstantiationPattern(const CXXRecordDecl* D);
CINDEX_LINKAGE const CXXDestructorDecl* clangExt_CXXRecordDecl_getDestructor(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isAnyDestructorNoReturn(const CXXRecordDecl* D);
CINDEX_LINKAGE const FunctionDecl* clangExt_CXXRecordDecl_isLocalClass(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isCurrentInstantiation(const CXXRecordDecl* D, const DeclContext* CurContext);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isVirtuallyDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isProvablyNotDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_mayBeAbstract(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isEffectivelyFinal(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getLambdaManglingNumber(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_hasKnownLambdaInternalLinkage(const CXXRecordDecl* D);
CINDEX_LINKAGE const Decl* clangExt_CXXRecordDecl_getLambdaContextDecl(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getDeviceLambdaManglingNumber(const CXXRecordDecl* D);
CINDEX_LINKAGE MSInheritanceModel clangExt_CXXRecordDecl_getMSInheritanceModel(const CXXRecordDecl* D);
CINDEX_LINKAGE MSInheritanceModel clangExt_CXXRecordDecl_calculateInheritanceModel(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_nullFieldOffsetIsZero(const CXXRecordDecl* D);
CINDEX_LINKAGE MSVtorDispMode clangExt_CXXRecordDecl_getMSVtorDispMode(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isDependentLambda(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isNeverDependentLambda(const CXXRecordDecl* D);
CINDEX_LINKAGE unsigned clangExt_CXXRecordDecl_getLambdaDependencyKind(const CXXRecordDecl* D);
CINDEX_LINKAGE const TypeSourceInfo* clangExt_CXXRecordDecl_getLambdaTypeInfo(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_isInterfaceLike(const CXXRecordDecl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_CXXRecordDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
CINDEX_LINKAGE ExplicitSpecKind clangExt_ExplicitSpecifier_getKind(const ExplicitSpecifier* E);
CINDEX_LINKAGE const Expr* clangExt_ExplicitSpecifier_getExpr(const ExplicitSpecifier* E);
CINDEX_LINKAGE bool clangExt_ExplicitSpecifier_isSpecified(const ExplicitSpecifier* E);
CINDEX_LINKAGE bool clangExt_ExplicitSpecifier_isEquivalent(const ExplicitSpecifier* E, const ExplicitSpecifier* Other);
CINDEX_LINKAGE bool clangExt_ExplicitSpecifier_isExplicit(const ExplicitSpecifier* E);
CINDEX_LINKAGE bool clangExt_ExplicitSpecifier_isInvalid(const ExplicitSpecifier* E);
//CINDEX_LINKAGE ExplicitSpecifier* clangExt_ExplicitSpecifier_getFromDecl(FunctionDecl* Function);
//CINDEX_LINKAGE const ExplicitSpecifier* clangExt_ExplicitSpecifier_Invalid();
//=======================================================================================================================
// CXXDeductionGuideDecl
//=======================================================================================================================
// RequiresExprBodyDecl
//=======================================================================================================================
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isStatic(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isInstance(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isStaticOverloadedOperator(OverloadedOperatorKind OOK);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isConst(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isVolatile(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isVirtual(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_getDevirtualizedMethod(const CXXMethodDecl* M, const Expr* Base, bool IsAppleKext);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isCopyAssignmentOperator(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isMoveAssignmentOperator(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_getCanonicalDecl(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_getMostRecentDecl(const CXXMethodDecl* M);
CINDEX_LINKAGE unsigned clangExt_CXXMethodDecl_size_overridden_methods(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_overridden_methods(const CXXMethodDecl* M, unsigned i);
CINDEX_LINKAGE const CXXRecordDecl* clangExt_CXXMethodDecl_getParent(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXQualType clangExt_CXXMethodDecl_getThisType(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXQualType clangExt_CXXMethodDecl_getThisObjectType(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXQualType clangExt_CXXMethodDecl_getThisTypeProtoType(const FunctionProtoType* FPT, const CXXRecordDecl* Decl);
CINDEX_LINKAGE const CXQualType clangExt_CXXMethodDecl_getThisObjectProtoType(const FunctionProtoType* FPT, const CXXRecordDecl* Decl);
CINDEX_LINKAGE const CXQualifiers clangExt_CXXMethodDecl_getMethodQualifiers(const CXXMethodDecl* M);
CINDEX_LINKAGE RefQualifierKind clangExt_CXXMethodDecl_getRefQualifier(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_hasInlineBody(const CXXMethodDecl* M);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_isLambdaStaticInvoker(const CXXMethodDecl* M);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_getCorrespondingMethodInClass(const CXXMethodDecl* M, const CXXRecordDecl* RD, bool MayBeBase = false);
CINDEX_LINKAGE const CXXMethodDecl* clangExt_CXXMethodDecl_getCorrespondingMethodDeclaredInClass(const CXXMethodDecl* M, const CXXRecordDecl* RD, bool MayBeBase = false);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_CXXMethodDecl_classofKind(Decl::Kind K);
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE LinkageSpecDecl::LanguageIDs clangExt_LinkageSpecDecl_getLanguage(const LinkageSpecDecl* D);
CINDEX_LINKAGE bool clangExt_LinkageSpecDecl_hasBraces(const LinkageSpecDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_LinkageSpecDecl_getExternLoc(const LinkageSpecDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_LinkageSpecDecl_getRBraceLoc(const LinkageSpecDecl* D);
CINDEX_LINKAGE CXSourceLocation clangExt_LinkageSpecDecl_getEndLoc(const LinkageSpecDecl* D);
CINDEX_LINKAGE CXSourceRange clangExt_LinkageSpecDecl_getSourceRange(const LinkageSpecDecl *D);
CINDEX_LINKAGE bool clangExt_LinkageSpecDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_LinkageSpecDecl_classofKind(Decl::Kind K);
CINDEX_LINKAGE const DeclContext* clangExt_LinkageSpecDecl_castToDeclContext(const LinkageSpecDecl* D);
CINDEX_LINKAGE const LinkageSpecDecl* clangExt_LinkageSpecDecl_castFromDeclContext(const DeclContext* DC);
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
//=======================================================================================================================
//=======================================================================================================================
CINDEX_LINKAGE CXString clangExt_MSGuidDecl_printName(const MSGuidDecl* D);
CINDEX_LINKAGE MSGuidDecl::Parts clangExt_MSGuidDecl_getParts(const MSGuidDecl* D);
CINDEX_LINKAGE const APValue* clangExt_MSGuidDecl_getAsAPValue(const MSGuidDecl* D);
CINDEX_LINKAGE bool clangExt_MSGuidDecl_classof(const Decl* D);
CINDEX_LINKAGE bool clangExt_MSGuidDecl_classofKind(Decl::Kind K);
//=======================================================================================================================

LLVM_CLANG_C_EXTERN_C_END

#endif