#include "Clang_Ext_AST_DeclCXX.h"
#include "CXCursor.h"
#include "CXSourceLocation.h"
#include "CXString.h"
#include "CXType.h"

//=======================================================================================================================
CXSourceLocation clangExt_AccessSpecDecl_getAccessSpecifierLoc(const AccessSpecDecl* A) {
    return cxloc::translateSourceLocation(A->getASTContext(), A->getAccessSpecifierLoc());
}
CXSourceLocation clangExt_AccessSpecDecl_getColonLoc(const AccessSpecDecl* A) {
    return cxloc::translateSourceLocation(A->getASTContext(), A->getColonLoc());
}
CXSourceRange clangExt_AccessSpecDecl_getSourceRange(const AccessSpecDecl* A) {
    return cxloc::translateSourceRange(A->getASTContext(), A->getSourceRange());
}
bool clangExt_AccessSpecDecl_classof(const Decl* D) {
    return AccessSpecDecl::classof(D);
}
bool clangExt_AccessSpecDecl_classofKind(Decl::Kind K) {
    return AccessSpecDecl::classofKind(K);
}
//=======================================================================================================================
CXSourceRange clangExt_CXXBaseSpecifier_getSourceRange(const CXXBaseSpecifier* D, const ASTContext* ctx) {
    return cxloc::translateSourceRange(const_cast<ASTContext&>(*ctx), D->getSourceRange());
}
CXSourceLocation clangExt_CXXBaseSpecifier_getBeginLoc(const CXXBaseSpecifier* D, const ASTContext* ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), D->getBeginLoc());
}
CXSourceLocation clangExt_CXXBaseSpecifier_getEndLoc(const CXXBaseSpecifier* D, const ASTContext* ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), D->getEndLoc());
}
CXSourceLocation clangExt_CXXBaseSpecifier_getBaseTypeLoc(const CXXBaseSpecifier* D, const ASTContext* ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), D->getBaseTypeLoc());
}
bool clangExt_CXXBaseSpecifier_isVirtual(const CXXBaseSpecifier* D) {
    return D->isVirtual();
}
bool clangExt_CXXBaseSpecifier_isBaseOfClass(const CXXBaseSpecifier* D) {
    return D->isBaseOfClass();
}
bool clangExt_CXXBaseSpecifier_isPackExpansion(const CXXBaseSpecifier* D) {
    return D->isPackExpansion();
}
bool clangExt_CXXBaseSpecifier_getInheritConstructors(const CXXBaseSpecifier* D) {
    return D->getInheritConstructors();
}
CXSourceLocation clangExt_CXXBaseSpecifier_getEllipsisLoc(const CXXBaseSpecifier* D, const ASTContext* ctx) {
    return cxloc::translateSourceLocation(const_cast<ASTContext&>(*ctx), D->getEllipsisLoc());
}
AccessSpecifier clangExt_CXXBaseSpecifier_getAccessSpecifier(const CXXBaseSpecifier* D) {
    return D->getAccessSpecifier();
}
AccessSpecifier clangExt_CXXBaseSpecifier_getAccessSpecifierAsWritten(const CXXBaseSpecifier* D) {
    return D->getAccessSpecifierAsWritten();
}
const CXQualType clangExt_CXXBaseSpecifier_getType(const CXXBaseSpecifier* D) {
    return D->getType().getAsOpaquePtr();
}
const TypeSourceInfo* clangExt_CXXBaseSpecifier_getTypeSourceInfo(const CXXBaseSpecifier* D) {
    return D->getTypeSourceInfo();
}
//=======================================================================================================================
const CXXRecordDecl* clangExt_CXXRecordDecl_getCanonicalDecl(const CXXRecordDecl* D) {
    return D->getCanonicalDecl();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getPreviousDecl(const CXXRecordDecl* D) {
    return D->getPreviousDecl();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getMostRecentDecl(const CXXRecordDecl* D) {
    return D->getMostRecentDecl();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getMostRecentNonInjectedDecl(const CXXRecordDecl* D) {
    return D->getMostRecentNonInjectedDecl();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getDefinition(const CXXRecordDecl* D) {
    return D->getDefinition();
}
bool clangExt_CXXRecordDecl_hasDefinition(const CXXRecordDecl* D) {
    return D->hasDefinition();
}
bool clangExt_CXXRecordDecl_isDynamicClass(const CXXRecordDecl* D) {
    return D->isDynamicClass();
}
bool clangExt_CXXRecordDecl_mayBeDynamicClass(const CXXRecordDecl* D) {
    return D->mayBeDynamicClass();
}
bool clangExt_CXXRecordDecl_mayBeNonDynamicClass(const CXXRecordDecl* D) {
    return D->mayBeNonDynamicClass();
}
bool clangExt_CXXRecordDecl_isParsingBaseSpecifiers(const CXXRecordDecl* D) {
    return D->isParsingBaseSpecifiers();
}
unsigned clangExt_CXXRecordDecl_getODRHash(const CXXRecordDecl* D) {
    return D->getODRHash();
}
unsigned clangExt_CXXRecordDecl_getNumBases(const CXXRecordDecl* D) {
    return D->getNumBases();
}
const CXXBaseSpecifier* clangExt_CXXRecordDecl_getBases(const CXXRecordDecl* D, unsigned i) {
    if (i < D->getNumBases()) {
        SmallVector<const CXXBaseSpecifier*, 4> bases = { D->bases_begin(), D->bases_end() };
        return bases[i];
    }
    return nullptr;
}
unsigned clangExt_CXXRecordDecl_getNumVBases(const CXXRecordDecl* D) {
    return D->getNumVBases();
}
const CXXBaseSpecifier* clangExt_CXXRecordDecl_getVBases(const CXXRecordDecl* D, unsigned i) {
    if (i < D->getNumVBases()) {
        SmallVector<const CXXBaseSpecifier*, 4> bases = { D->vbases_begin(), D->vbases_end() };
        return bases[i];
    }
    return nullptr;
}
bool clangExt_CXXRecordDecl_hasAnyDependentBases(const CXXRecordDecl* D) {
    return D->hasAnyDependentBases();
}
unsigned clangExt_CXXRecordDecl_getNumMethods(const CXXRecordDecl* D) {
    SmallVector<const CXXMethodDecl*, 4> methods = { D->method_begin(), D->method_end() };
    return methods.size();
}
const CXXMethodDecl* clangExt_CXXRecordDecl_getMethods(const CXXRecordDecl* D, unsigned i) {
    SmallVector<const CXXMethodDecl*, 4> methods = { D->method_begin(), D->method_end() };
    if (i < methods.size())
        return methods[i];
    else
        return nullptr;
}
unsigned clangExt_CXXRecordDecl_getNumCtors(const CXXRecordDecl* D) {
    SmallVector<const CXXConstructorDecl*, 4> ctors = { D->ctor_begin(), D->ctor_end() };
    return ctors.size();
}
const CXXConstructorDecl* clangExt_CXXRecordDecl_getCtors(const CXXRecordDecl* D, unsigned i) {
    SmallVector<const CXXConstructorDecl*, 4> ctors = { D->ctor_begin(), D->ctor_end() };
    if (i < ctors.size())
        return ctors[i];
    else
        return nullptr;
}
unsigned clangExt_CXXRecordDecl_getNumFriends(const CXXRecordDecl* D) {
    SmallVector<const FriendDecl*, 4> friends = { D->friend_begin(), D->friend_end() };
    return friends.size();
}
const FriendDecl* clangExt_CXXRecordDecl_getFriends(const CXXRecordDecl* D, unsigned i) {
    SmallVector<const FriendDecl*, 4> friends = { D->friend_begin(), D->friend_end() };
    if (i < friends.size())
        return friends[i];
    else
        return nullptr;
}
bool clangExt_CXXRecordDecl_hasFriends(const CXXRecordDecl* D) {
    return D->hasFriends();
}
bool clangExt_CXXRecordDecl_defaultedCopyConstructorIsDeleted(const CXXRecordDecl* D) {
    return D->defaultedCopyConstructorIsDeleted();
}
bool clangExt_CXXRecordDecl_defaultedMoveConstructorIsDeleted(const CXXRecordDecl* D) {
    return D->defaultedMoveConstructorIsDeleted();
}
bool clangExt_CXXRecordDecl_defaultedDestructorIsDeleted(const CXXRecordDecl* D) {
    return D->defaultedDestructorIsDeleted();
}
bool clangExt_CXXRecordDecl_hasSimpleCopyConstructor(const CXXRecordDecl* D) {
    return D->hasSimpleCopyConstructor();
}
bool clangExt_CXXRecordDecl_hasSimpleMoveConstructor(const CXXRecordDecl* D) {
    return D->hasSimpleMoveConstructor();
}
bool clangExt_CXXRecordDecl_hasSimpleCopyAssignment(const CXXRecordDecl* D) {
    return D->hasSimpleCopyAssignment();
}
bool clangExt_CXXRecordDecl_hasSimpleMoveAssignment(const CXXRecordDecl* D) {
    return D->hasSimpleMoveAssignment();
}
bool clangExt_CXXRecordDecl_hasSimpleDestructor(const CXXRecordDecl* D) {
    return D->hasSimpleDestructor();
}
bool clangExt_CXXRecordDecl_hasDefaultConstructor(const CXXRecordDecl* D) {
    return D->hasDefaultConstructor();
}
bool clangExt_CXXRecordDecl_needsImplicitDefaultConstructor(const CXXRecordDecl* D) {
    return D->needsImplicitDefaultConstructor();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredConstructor(const CXXRecordDecl* D) {
    return D->hasUserDeclaredConstructor();
}
bool clangExt_CXXRecordDecl_hasUserProvidedDefaultConstructor(const CXXRecordDecl* D) {
    return D->hasUserProvidedDefaultConstructor();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredCopyConstructor(const CXXRecordDecl* D) {
    return D->hasUserDeclaredCopyConstructor();
}
bool clangExt_CXXRecordDecl_needsImplicitCopyConstructor(const CXXRecordDecl* D) {
    return D->needsImplicitCopyConstructor();
}
bool clangExt_CXXRecordDecl_needsOverloadResolutionForCopyConstructor(const CXXRecordDecl* D) {
    return D->needsOverloadResolutionForCopyConstructor();
}
bool clangExt_CXXRecordDecl_implicitCopyConstructorHasConstParam(const CXXRecordDecl* D) {
    return D->implicitCopyConstructorHasConstParam();
}
bool clangExt_CXXRecordDecl_hasCopyConstructorWithConstParam(const CXXRecordDecl* D) {
    return D->hasCopyConstructorWithConstParam();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredMoveOperation(const CXXRecordDecl* D) {
    return D->hasUserDeclaredMoveOperation();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredMoveConstructor(const CXXRecordDecl* D) {
    return D->hasUserDeclaredMoveConstructor();
}
bool clangExt_CXXRecordDecl_hasMoveConstructor(const CXXRecordDecl* D) {
    return D->hasMoveConstructor();
}
bool clangExt_CXXRecordDecl_needsImplicitMoveConstructor(const CXXRecordDecl* D) {
    return D->needsImplicitMoveConstructor();
}
bool clangExt_CXXRecordDecl_needsOverloadResolutionForMoveConstructor(const CXXRecordDecl* D) {
    return D->needsOverloadResolutionForMoveConstructor();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredCopyAssignment(const CXXRecordDecl* D) {
    return D->hasUserDeclaredCopyAssignment();
}
bool clangExt_CXXRecordDecl_needsImplicitCopyAssignment(const CXXRecordDecl* D) {
    return D->needsImplicitCopyAssignment();
}
bool clangExt_CXXRecordDecl_needsOverloadResolutionForCopyAssignment(const CXXRecordDecl* D) {
    return D->needsOverloadResolutionForCopyAssignment();
}
bool clangExt_CXXRecordDecl_implicitCopyAssignmentHasConstParam(const CXXRecordDecl* D) {
    return D->implicitCopyAssignmentHasConstParam();
}
bool clangExt_CXXRecordDecl_hasCopyAssignmentWithConstParam(const CXXRecordDecl* D) {
    return D->hasCopyAssignmentWithConstParam();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredMoveAssignment(const CXXRecordDecl* D) {
    return D->hasUserDeclaredMoveAssignment();
}
bool clangExt_CXXRecordDecl_hasMoveAssignment(const CXXRecordDecl* D) {
    return D->hasMoveAssignment();
}
bool clangExt_CXXRecordDecl_needsImplicitMoveAssignment(const CXXRecordDecl* D) {
    return D->needsImplicitMoveAssignment();
}
bool clangExt_CXXRecordDecl_needsOverloadResolutionForMoveAssignment(const CXXRecordDecl* D) {
    return D->needsOverloadResolutionForMoveAssignment();
}
bool clangExt_CXXRecordDecl_hasUserDeclaredDestructor(const CXXRecordDecl* D) {
    return D->hasUserDeclaredDestructor();
}
bool clangExt_CXXRecordDecl_needsImplicitDestructor(const CXXRecordDecl* D) {
    return D->needsImplicitDestructor();
}
bool clangExt_CXXRecordDecl_needsOverloadResolutionForDestructor(const CXXRecordDecl* D) {
    return D->needsOverloadResolutionForDestructor();
}
bool clangExt_CXXRecordDecl_isLambda(const CXXRecordDecl* D) {
    return D->isLambda();
}
bool clangExt_CXXRecordDecl_isGenericLambda(const CXXRecordDecl* D) {
    return D->isGenericLambda();
}
bool clangExt_CXXRecordDecl_lambdaIsDefaultConstructibleAndAssignable(const CXXRecordDecl* D) {
    return D->lambdaIsDefaultConstructibleAndAssignable();
}
const CXXMethodDecl* clangExt_CXXRecordDecl_getLambdaCallOperator(const CXXRecordDecl* D) {
    return D->getLambdaCallOperator();
}
const FunctionTemplateDecl* clangExt_CXXRecordDecl_getDependentLambdaCallOperator(const CXXRecordDecl* D) {
    return D->getDependentLambdaCallOperator();
}
const CXXMethodDecl* clangExt_CXXRecordDecl_getLambdaStaticInvoker(const CXXRecordDecl* D) {
    return D->getLambdaStaticInvoker();
}
const TemplateParameterList* clangExt_CXXRecordDecl_getGenericLambdaTemplateParameterList(const CXXRecordDecl* D) {
    return D->getGenericLambdaTemplateParameterList();
}
unsigned clangExt_CXXRecordDecl_getNumLambdaExplicitTemplateParameters(const CXXRecordDecl* D) {
    return D->getLambdaExplicitTemplateParameters().size();
}
const NamedDecl* clangExt_CXXRecordDecl_getLambdaExplicitTemplateParameters(const CXXRecordDecl* D, unsigned i) {
    if (i < D->getLambdaExplicitTemplateParameters().size())
        return D->getLambdaExplicitTemplateParameters()[i];
    else
        return nullptr;
}
LambdaCaptureDefault clangExt_CXXRecordDecl_getLambdaCaptureDefault(const CXXRecordDecl* D) {
    return D->getLambdaCaptureDefault();
}
const LambdaCapture* clangExt_CXXRecordDecl_getCaptures(const CXXRecordDecl* D, unsigned i) {
    if (i < D->capture_size()) {
        SmallVector<const LambdaCapture*, 4> captures = { D->captures_begin(), D->captures_end() };
        return captures[i];
    }
    else
        return nullptr;
}
unsigned clangExt_CXXRecordDecl_capture_size(const CXXRecordDecl* D) {
    return D->capture_size();
}
bool clangExt_CXXRecordDecl_isAggregate(const CXXRecordDecl* D) {
    return D->isAggregate();
}
bool clangExt_CXXRecordDecl_hasInClassInitializer(const CXXRecordDecl* D) {
    return D->hasInClassInitializer();
}
bool clangExt_CXXRecordDecl_hasUninitializedReferenceMember(const CXXRecordDecl* D) {
    return D->hasUninitializedReferenceMember();
}
bool clangExt_CXXRecordDecl_isPOD(const CXXRecordDecl* D) {
    return D->isPOD();
}
bool clangExt_CXXRecordDecl_isCLike(const CXXRecordDecl* D) {
    return D->isCLike();
}
bool clangExt_CXXRecordDecl_isEmpty(const CXXRecordDecl* D) {
    return D->isEmpty();
}
bool clangExt_CXXRecordDecl_hasInitMethod(const CXXRecordDecl* D) {
    return D->hasInitMethod();
}
bool clangExt_CXXRecordDecl_hasPrivateFields(const CXXRecordDecl* D) {
    return D->hasPrivateFields();
}
bool clangExt_CXXRecordDecl_hasProtectedFields(const CXXRecordDecl* D) {
    return D->hasProtectedFields();
}
bool clangExt_CXXRecordDecl_hasDirectFields(const CXXRecordDecl* D) {
    return D->hasDirectFields();
}
bool clangExt_CXXRecordDecl_isPolymorphic(const CXXRecordDecl* D) {
    return D->isPolymorphic();
}
bool clangExt_CXXRecordDecl_isAbstract(const CXXRecordDecl* D) {
    return D->isAbstract();
}
bool clangExt_CXXRecordDecl_isStandardLayout(const CXXRecordDecl* D) {
    return D->isStandardLayout();
}
bool clangExt_CXXRecordDecl_isCXX11StandardLayout(const CXXRecordDecl* D) {
    return D->isCXX11StandardLayout();
}
bool clangExt_CXXRecordDecl_hasMutableFields(const CXXRecordDecl* D) {
    return D->hasMutableFields();
}
bool clangExt_CXXRecordDecl_hasVariantMembers(const CXXRecordDecl* D) {
    return D->hasVariantMembers();
}
bool clangExt_CXXRecordDecl_hasTrivialDefaultConstructor(const CXXRecordDecl* D) {
    return D->hasTrivialDefaultConstructor();
}
bool clangExt_CXXRecordDecl_hasNonTrivialDefaultConstructor(const CXXRecordDecl* D) {
    return D->hasNonTrivialDefaultConstructor();
}
bool clangExt_CXXRecordDecl_hasConstexprNonCopyMoveConstructor(const CXXRecordDecl* D) {
    return D->hasConstexprNonCopyMoveConstructor();
}
bool clangExt_CXXRecordDecl_defaultedDefaultConstructorIsConstexpr(const CXXRecordDecl* D) {
    return D->defaultedDefaultConstructorIsConstexpr();
}
bool clangExt_CXXRecordDecl_hasConstexprDefaultConstructor(const CXXRecordDecl* D) {
    return D->hasConstexprDefaultConstructor();
}
bool clangExt_CXXRecordDecl_hasTrivialCopyConstructor(const CXXRecordDecl* D) {
    return D->hasTrivialCopyConstructor();
}
bool clangExt_CXXRecordDecl_hasTrivialCopyConstructorForCall(const CXXRecordDecl* D) {
    return D->hasTrivialCopyConstructorForCall();
}
bool clangExt_CXXRecordDecl_hasNonTrivialCopyConstructor(const CXXRecordDecl* D) {
    return D->hasNonTrivialCopyConstructor();
}
bool clangExt_CXXRecordDecl_hasNonTrivialCopyConstructorForCall(const CXXRecordDecl* D) {
    return D->hasNonTrivialCopyConstructorForCall();
}
bool clangExt_CXXRecordDecl_hasTrivialMoveConstructor(const CXXRecordDecl* D) {
    return D->hasTrivialMoveConstructor();
}
bool clangExt_CXXRecordDecl_hasTrivialMoveConstructorForCall(const CXXRecordDecl* D) {
    return D->hasTrivialMoveConstructorForCall();
}
bool clangExt_CXXRecordDecl_hasNonTrivialMoveConstructor(const CXXRecordDecl* D) {
    return D->hasNonTrivialMoveConstructor();
}
bool clangExt_CXXRecordDecl_hasNonTrivialMoveConstructorForCall(const CXXRecordDecl* D) {
    return D->hasNonTrivialMoveConstructorForCall();
}
bool clangExt_CXXRecordDecl_hasTrivialCopyAssignment(const CXXRecordDecl* D) {
    return D->hasTrivialCopyAssignment();
}
bool clangExt_CXXRecordDecl_hasNonTrivialCopyAssignment(const CXXRecordDecl* D) {
    return D->hasNonTrivialCopyAssignment();
}
bool clangExt_CXXRecordDecl_hasTrivialMoveAssignment(const CXXRecordDecl* D) {
    return D->hasTrivialMoveAssignment();
}
bool clangExt_CXXRecordDecl_hasNonTrivialMoveAssignment(const CXXRecordDecl* D) {
    return D->hasNonTrivialMoveAssignment();
}
bool clangExt_CXXRecordDecl_defaultedDestructorIsConstexpr(const CXXRecordDecl* D) {
    return D->defaultedDestructorIsConstexpr();
}
bool clangExt_CXXRecordDecl_hasConstexprDestructor(const CXXRecordDecl* D) {
    return D->hasConstexprDestructor();
}
//
bool clangExt_CXXRecordDecl_hasTrivialDestructor(const CXXRecordDecl* D) {
    return D->hasTrivialDestructor();
}
bool clangExt_CXXRecordDecl_hasTrivialDestructorForCall(const CXXRecordDecl* D) {
    return D->hasTrivialDestructorForCall();
}
bool clangExt_CXXRecordDecl_hasNonTrivialDestructor(const CXXRecordDecl* D) {
    return D->hasNonTrivialDestructor();
}
bool clangExt_CXXRecordDecl_hasNonTrivialDestructorForCall(const CXXRecordDecl* D) {
    return D->hasNonTrivialDestructorForCall();
}
bool clangExt_CXXRecordDecl_allowConstDefaultInit(const CXXRecordDecl* D) {
    return D->allowConstDefaultInit();
}
bool clangExt_CXXRecordDecl_hasIrrelevantDestructor(const CXXRecordDecl* D) {
    return D->hasIrrelevantDestructor();
}
bool clangExt_CXXRecordDecl_hasNonLiteralTypeFieldsOrBases(const CXXRecordDecl* D) {
    return D->hasNonLiteralTypeFieldsOrBases();
}
bool clangExt_CXXRecordDecl_hasInheritedConstructor(const CXXRecordDecl* D) {
    return D->hasInheritedConstructor();
}
bool clangExt_CXXRecordDecl_hasInheritedAssignment(const CXXRecordDecl* D) {
    return D->hasInheritedAssignment();
}
bool clangExt_CXXRecordDecl_isTriviallyCopyable(const CXXRecordDecl* D) {
    return D->isTriviallyCopyable();
}
bool clangExt_CXXRecordDecl_isTrivial(const CXXRecordDecl* D) {
    return D->isTrivial();
}
bool clangExt_CXXRecordDecl_isLiteral(const CXXRecordDecl* D) {
    return D->isLiteral();
}
bool clangExt_CXXRecordDecl_isStructural(const CXXRecordDecl* D) {
    return D->isStructural();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getInstantiatedFromMemberClass(const CXXRecordDecl* D) {
    return D->getInstantiatedFromMemberClass();
}
const MemberSpecializationInfo* clangExt_CXXRecordDecl_getMemberSpecializationInfo(const CXXRecordDecl* D) {
    return D->getMemberSpecializationInfo();
}
const ClassTemplateDecl* clangExt_CXXRecordDecl_getDescribedClassTemplate(const CXXRecordDecl* D) {
    return D->getDescribedClassTemplate();
}
TemplateSpecializationKind clangExt_CXXRecordDecl_getTemplateSpecializationKind(const CXXRecordDecl* D) {
    return D->getTemplateSpecializationKind();
}
const CXXRecordDecl* clangExt_CXXRecordDecl_getTemplateInstantiationPattern(const CXXRecordDecl* D) {
    return D->getTemplateInstantiationPattern();
}
const CXXDestructorDecl* clangExt_CXXRecordDecl_getDestructor(const CXXRecordDecl* D) {
    return D->getDestructor();
}
bool clangExt_CXXRecordDecl_isAnyDestructorNoReturn(const CXXRecordDecl* D) {
    return D->isAnyDestructorNoReturn();
}
const FunctionDecl* clangExt_CXXRecordDecl_isLocalClass(const CXXRecordDecl* D) {
    return D->isLocalClass();
}
bool clangExt_CXXRecordDecl_isCurrentInstantiation(const CXXRecordDecl* D, const DeclContext* CurContext) {
    return D->isCurrentInstantiation(CurContext);
}
bool clangExt_CXXRecordDecl_isDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base) {
    return D->isDerivedFrom(Base);
}
bool clangExt_CXXRecordDecl_isVirtuallyDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base) {
    return D->isVirtuallyDerivedFrom(Base);
}
bool clangExt_CXXRecordDecl_isProvablyNotDerivedFrom(const CXXRecordDecl* D, const CXXRecordDecl* Base) {
    return D->isProvablyNotDerivedFrom(Base);
}
bool clangExt_CXXRecordDecl_mayBeAbstract(const CXXRecordDecl* D) {
    return D->mayBeAbstract();
}
bool clangExt_CXXRecordDecl_isEffectivelyFinal(const CXXRecordDecl* D) {
    return D->isEffectivelyFinal();
}
unsigned clangExt_CXXRecordDecl_getLambdaManglingNumber(const CXXRecordDecl* D) {
    return D->getLambdaManglingNumber();
}
bool clangExt_CXXRecordDecl_hasKnownLambdaInternalLinkage(const CXXRecordDecl* D) {
    return D->hasKnownLambdaInternalLinkage();
}
const Decl* clangExt_CXXRecordDecl_getLambdaContextDecl(const CXXRecordDecl* D) {
    return D->getLambdaContextDecl();
}
unsigned clangExt_CXXRecordDecl_getDeviceLambdaManglingNumber(const CXXRecordDecl* D) {
    return D->getDeviceLambdaManglingNumber();
}
MSInheritanceModel clangExt_CXXRecordDecl_getMSInheritanceModel(const CXXRecordDecl* D) {
    return D->getMSInheritanceModel();
}
MSInheritanceModel clangExt_CXXRecordDecl_calculateInheritanceModel(const CXXRecordDecl* D) {
    return D->calculateInheritanceModel();
}
bool clangExt_CXXRecordDecl_nullFieldOffsetIsZero(const CXXRecordDecl* D) {
    return D->nullFieldOffsetIsZero();
}
MSVtorDispMode clangExt_CXXRecordDecl_getMSVtorDispMode(const CXXRecordDecl* D) {
    return D->getMSVtorDispMode();
}
bool clangExt_CXXRecordDecl_isDependentLambda(const CXXRecordDecl* D) {
    return D->isDependentLambda();
}
bool clangExt_CXXRecordDecl_isNeverDependentLambda(const CXXRecordDecl* D) {
    return D->isNeverDependentLambda();
}
unsigned clangExt_CXXRecordDecl_getLambdaDependencyKind(const CXXRecordDecl* D) {
    return D->getLambdaDependencyKind();
}
const TypeSourceInfo* clangExt_CXXRecordDecl_getLambdaTypeInfo(const CXXRecordDecl* D) {
    return D->getLambdaTypeInfo();
}
bool clangExt_CXXRecordDecl_isInterfaceLike(const CXXRecordDecl* D) {
    return D->isInterfaceLike();
}
bool clangExt_CXXRecordDecl_classof(const Decl* D) {
    return CXXRecordDecl::classof(D);
}
bool clangExt_CXXRecordDecl_classofKind(Decl::Kind K) {
    return CXXRecordDecl::classofKind(K);
}
//=======================================================================================================================
ExplicitSpecKind clangExt_ExplicitSpecifier_getKind(const ExplicitSpecifier* E) {
    return E->getKind();
}
const Expr* clangExt_ExplicitSpecifier_getExpr(const ExplicitSpecifier* E) {
    return E->getExpr();
}
bool clangExt_ExplicitSpecifier_isSpecified(const ExplicitSpecifier* E) {
    return E->isSpecified();
}
bool clangExt_ExplicitSpecifier_isEquivalent(const ExplicitSpecifier* E, const ExplicitSpecifier* Other) {
    return E->isEquivalent(const_cast<ExplicitSpecifier&>(*Other));
}
bool clangExt_ExplicitSpecifier_isExplicit(const ExplicitSpecifier* E) {
    return E->isExplicit();
}
bool clangExt_ExplicitSpecifier_isInvalid(const ExplicitSpecifier* E) {
    return E->isInvalid();
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
bool clangExt_CXXMethodDecl_isStatic(const CXXMethodDecl* M) {
    return M->isStatic();
}
bool clangExt_CXXMethodDecl_isInstance(const CXXMethodDecl* M) {
    return M->isInstance();
}
bool clangExt_CXXMethodDecl_isStaticOverloadedOperator(OverloadedOperatorKind OOK) {
    return CXXMethodDecl::isStaticOverloadedOperator(OOK);
}
bool clangExt_CXXMethodDecl_isConst(const CXXMethodDecl* M) {
    return M->isConst();
}
bool clangExt_CXXMethodDecl_isVolatile(const CXXMethodDecl* M) {
    return M->isVolatile();
}
bool clangExt_CXXMethodDecl_isVirtual(const CXXMethodDecl* M) {
    return M->isVirtual();
}
const CXXMethodDecl* clangExt_CXXMethodDecl_getDevirtualizedMethod(const CXXMethodDecl* M, const Expr* Base, bool IsAppleKext) {
    return M->getDevirtualizedMethod(Base, IsAppleKext);
}
bool clangExt_CXXMethodDecl_isCopyAssignmentOperator(const CXXMethodDecl* M) {
    return M->isCopyAssignmentOperator();
}
bool clangExt_CXXMethodDecl_isMoveAssignmentOperator(const CXXMethodDecl* M) {
    return M->isMoveAssignmentOperator();
}
const CXXMethodDecl* clangExt_CXXMethodDecl_getCanonicalDecl(const CXXMethodDecl* M) {
    return M->getCanonicalDecl();
}
const CXXMethodDecl* clangExt_CXXMethodDecl_getMostRecentDecl(const CXXMethodDecl* M) {
    return M->getMostRecentDecl();
}
unsigned clangExt_CXXMethodDecl_size_overridden_methods(const CXXMethodDecl* M) {
    return M->size_overridden_methods();
}
const CXXMethodDecl* clangExt_CXXMethodDecl_overridden_methods(const CXXMethodDecl* M, unsigned i) {
    if (i < M->size_overridden_methods()) {
        SmallVector<const CXXMethodDecl*, 4> overridden = { M->begin_overridden_methods(), M->end_overridden_methods() };
        return overridden[i];
    }
    else
        return nullptr;
}
const CXXRecordDecl* clangExt_CXXMethodDecl_getParent(const CXXMethodDecl* M) {
    return M->getParent();
}
const CXQualType clangExt_CXXMethodDecl_getThisType(const CXXMethodDecl* M) {
    return M->getThisType().getAsOpaquePtr();
}
const CXQualType clangExt_CXXMethodDecl_getThisObjectType(const CXXMethodDecl* M) {
    return M->getThisObjectType().getAsOpaquePtr();
}
const CXQualType clangExt_CXXMethodDecl_getThisTypeProtoType(const FunctionProtoType* FPT, const CXXRecordDecl* Decl) {
    return CXXMethodDecl::getThisType(FPT, Decl).getAsOpaquePtr();
}
const CXQualType clangExt_CXXMethodDecl_getThisObjectProtoType(const FunctionProtoType* FPT, const CXXRecordDecl* Decl) {
    return CXXMethodDecl::getThisObjectType(FPT, Decl).getAsOpaquePtr();
}
const CXQualifiers clangExt_CXXMethodDecl_getMethodQualifiers(const CXXMethodDecl* M) {
    return M->getMethodQualifiers().getAsOpaqueValue();
}
RefQualifierKind clangExt_CXXMethodDecl_getRefQualifier(const CXXMethodDecl* M) {
    return M->getRefQualifier();
}
bool clangExt_CXXMethodDecl_hasInlineBody(const CXXMethodDecl* M) {
    return M->hasInlineBody();
}
bool clangExt_CXXMethodDecl_isLambdaStaticInvoker(const CXXMethodDecl* M) {
    return M->isLambdaStaticInvoker();
}
const CXXMethodDecl* clangExt_CXXMethodDecl_getCorrespondingMethodInClass(const CXXMethodDecl* M, const CXXRecordDecl* RD, bool MayBeBase) {
    return M->getCorrespondingMethodInClass(RD, MayBeBase);
}
const CXXMethodDecl* clangExt_CXXMethodDecl_getCorrespondingMethodDeclaredInClass(const CXXMethodDecl* M, const CXXRecordDecl* RD, bool MayBeBase) {
    return M->getCorrespondingMethodDeclaredInClass(RD, MayBeBase);
}
bool clangExt_CXXMethodDecl_classof(const Decl* D) {
    return CXXMethodDecl::classof(D);
}
bool clangExt_CXXMethodDecl_classofKind(Decl::Kind K) {
    return CXXMethodDecl::classofKind(K);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
LinkageSpecDecl::LanguageIDs clangExt_LinkageSpecDecl_getLanguage(const LinkageSpecDecl* D) {
    return D->getLanguage();
}
bool clangExt_LinkageSpecDecl_hasBraces(const LinkageSpecDecl* D) {
    return D->hasBraces();
}
CXSourceLocation clangExt_LinkageSpecDecl_getExternLoc(const LinkageSpecDecl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getExternLoc());
}
CXSourceLocation clangExt_LinkageSpecDecl_getRBraceLoc(const LinkageSpecDecl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getRBraceLoc());
}
CXSourceLocation clangExt_LinkageSpecDecl_getEndLoc(const LinkageSpecDecl* D) {
    return cxloc::translateSourceLocation(D->getASTContext(), D->getEndLoc());
}
CXSourceRange clangExt_LinkageSpecDecl_getSourceRange(const LinkageSpecDecl* D) {
    return cxloc::translateSourceRange(D->getASTContext(), D->getSourceRange());
}
bool clangExt_LinkageSpecDecl_classof(const Decl* D) {
    return LinkageSpecDecl::classof(D);
}
bool clangExt_LinkageSpecDecl_classofKind(Decl::Kind K) {
    return LinkageSpecDecl::classofKind(K);
}
const DeclContext* clangExt_LinkageSpecDecl_castToDeclContext(const LinkageSpecDecl* D) {
    return LinkageSpecDecl::castToDeclContext(D);
}
const LinkageSpecDecl* clangExt_LinkageSpecDecl_castFromDeclContext(const DeclContext* DC) {
    return LinkageSpecDecl::castFromDeclContext(DC);
}
//=======================================================================================================================
//=======================================================================================================================
//=======================================================================================================================
CXString clangExt_MSGuidDecl_printName(const MSGuidDecl* D) {
    std::string info;
    llvm::raw_string_ostream infoOut(info);
    D->printName(infoOut);
    return cxstring::createDup(info.c_str());
}
MSGuidDecl::Parts clangExt_MSGuidDecl_getParts(const MSGuidDecl* D) {
    return D->getParts();
}
const APValue* clangExt_MSGuidDecl_getAsAPValue(const MSGuidDecl* D) {
    return new APValue(D->getAsAPValue());
}
bool clangExt_MSGuidDecl_classof(const Decl* D) {
    return MSGuidDecl::classof(D);
}
bool clangExt_MSGuidDecl_classofKind(Decl::Kind K) {
    return MSGuidDecl::classofKind(K);
}

