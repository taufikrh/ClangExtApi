unit LibClang.Ext.AST.DeclCXXU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.DeclBaseH,
  LibClang.Ext.AST.DeclH,
  LibClang.Ext.AST.DeclCXXH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.DeclFriendH,
  LibClang.Ext.AST.DeclTemplateH,
  LibClang.Ext.Basic.LambdaH,
  LibClang.Ext.AST.LambdaCaptureH,
  LibClang.Ext.Basic.LangOptionsH,
  LibClang.Ext.Basic.OperatorKindsH,
  LibClang.Ext.AST.APValueH;
                        
{$region 'AccessSpecDecl'}
function clangExt_AccessSpecDecl_getAccessSpecifierLoc(const A: AccessSpecDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_AccessSpecDecl_getColonLoc(const A: AccessSpecDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_AccessSpecDecl_getSourceRange(const A: AccessSpecDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_AccessSpecDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_AccessSpecDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;   
{$endregion 'AccessSpecDecl'}

{$region 'CXXBaseSpecifier'}
function clangExt_CXXBaseSpecifier_getSourceRange(const D: CXXBaseSpecifier; const ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getBeginLoc(const D: CXXBaseSpecifier; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getEndLoc(const D: CXXBaseSpecifier; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getBaseTypeLoc(const D: CXXBaseSpecifier; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_isVirtual(const D: CXXBaseSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_isBaseOfClass(const D: CXXBaseSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_isPackExpansion(const D: CXXBaseSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getInheritConstructors(const D: CXXBaseSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getEllipsisLoc(const D: CXXBaseSpecifier; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getAccessSpecifier(const D: CXXBaseSpecifier): AccessSpecifier; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getAccessSpecifierAsWritten(const D: CXXBaseSpecifier): AccessSpecifier; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getType(const D: CXXBaseSpecifier): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXXBaseSpecifier_getTypeSourceInfo(const D: CXXBaseSpecifier): TypeSourceInfo; cdecl; external LibClang_dll;
{$endregion 'CXXBaseSpecifier'}

{$region 'CXXRecordDecl'}
function clangExt_CXXRecordDecl_getCanonicalDecl(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getPreviousDecl(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMostRecentDecl(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMostRecentNonInjectedDecl(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getDefinition(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasDefinition(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isDynamicClass(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_mayBeDynamicClass(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_mayBeNonDynamicClass(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isParsingBaseSpecifiers(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getODRHash(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getNumBases(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getBases(const D: CXXRecordDecl; i: Cardinal): CXXBaseSpecifier; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getNumVBases(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getVBases(const D: CXXRecordDecl; i: Cardinal): CXXBaseSpecifier; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasAnyDependentBases(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getNumMethods(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMethods(const D: CXXRecordDecl; i: Cardinal): CXXMethodDecl; cdecl; external LibClang_dll;

function clangExt_CXXRecordDecl_getNumCtors(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getCtors(const D: CXXRecordDecl; i: Cardinal): CXXConstructorDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getNumFriends(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getFriends(const D: CXXRecordDecl; i: Cardinal): FriendDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasFriends(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_defaultedCopyConstructorIsDeleted(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_defaultedMoveConstructorIsDeleted(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_defaultedDestructorIsDeleted(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasSimpleCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasSimpleMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasSimpleCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasSimpleMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasSimpleDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserProvidedDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsOverloadResolutionForCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_implicitCopyConstructorHasConstParam(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasCopyConstructorWithConstParam(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredMoveOperation(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsOverloadResolutionForMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsOverloadResolutionForCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_implicitCopyAssignmentHasConstParam(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasCopyAssignmentWithConstParam(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsOverloadResolutionForMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUserDeclaredDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsImplicitDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_needsOverloadResolutionForDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isLambda(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isGenericLambda(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_lambdaIsDefaultConstructibleAndAssignable(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaCallOperator(const D: CXXRecordDecl): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getDependentLambdaCallOperator(const D: CXXRecordDecl): FunctionTemplateDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaStaticInvoker(const D: CXXRecordDecl): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getGenericLambdaTemplateParameterList(const D: CXXRecordDecl): TemplateParameterList; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getNumLambdaExplicitTemplateParameters(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaExplicitTemplateParameters(const D: CXXRecordDecl; i: Cardinal): NamedDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaCaptureDefault(const D: CXXRecordDecl): LambdaCaptureDefault; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getCaptures(const D: CXXRecordDecl; i: Cardinal): LambdaCapture; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_capture_size(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isAggregate(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasInClassInitializer(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasUninitializedReferenceMember(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isPOD(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isCLike(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isEmpty(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasInitMethod(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasPrivateFields(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasProtectedFields(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasDirectFields(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isPolymorphic(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isAbstract(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isStandardLayout(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isCXX11StandardLayout(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasMutableFields(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasVariantMembers(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasConstexprNonCopyMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_defaultedDefaultConstructorIsConstexpr(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasConstexprDefaultConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialCopyConstructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialCopyConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialCopyConstructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialMoveConstructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialMoveConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialMoveConstructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialCopyAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialMoveAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_defaultedDestructorIsConstexpr(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasConstexprDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasTrivialDestructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonTrivialDestructorForCall(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_allowConstDefaultInit(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasIrrelevantDestructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasNonLiteralTypeFieldsOrBases(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasInheritedConstructor(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasInheritedAssignment(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isTriviallyCopyable(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isTrivial(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isLiteral(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isStructural(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getInstantiatedFromMemberClass(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMemberSpecializationInfo(const D: CXXRecordDecl): MemberSpecializationInfo; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getDescribedClassTemplate(const D: CXXRecordDecl): ClassTemplateDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getTemplateSpecializationKind(const D: CXXRecordDecl): TemplateSpecializationKind; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getTemplateInstantiationPattern(const D: CXXRecordDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getDestructor(const D: CXXRecordDecl): CXXDestructorDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isAnyDestructorNoReturn(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isLocalClass(const D: CXXRecordDecl): FunctionDecl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isCurrentInstantiation(const D: CXXRecordDecl; const CurContext: DeclContext): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isDerivedFrom(const D: CXXRecordDecl; const Base: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isVirtuallyDerivedFrom(const D: CXXRecordDecl; const Base: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isProvablyNotDerivedFrom(const D: CXXRecordDecl; const Base: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_mayBeAbstract(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isEffectivelyFinal(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaManglingNumber(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_hasKnownLambdaInternalLinkage(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaContextDecl(const D: CXXRecordDecl): Decl; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getDeviceLambdaManglingNumber(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMSInheritanceModel(const D: CXXRecordDecl): MSInheritanceModel; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_calculateInheritanceModel(const D: CXXRecordDecl): MSInheritanceModel; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_nullFieldOffsetIsZero(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getMSVtorDispMode(const D: CXXRecordDecl): MSVtorDispMode; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isDependentLambda(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isNeverDependentLambda(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaDependencyKind(const D: CXXRecordDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_getLambdaTypeInfo(const D: CXXRecordDecl): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_isInterfaceLike(const D: CXXRecordDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXRecordDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'CXXRecordDecl'}
                                                                                    
{$region 'ExplicitSpecifier'}
function clangExt_ExplicitSpecifier_getKind(const E: ExplicitSpecifier): ExplicitSpecKind; cdecl; external LibClang_dll;
function clangExt_ExplicitSpecifier_getExpr(const E: ExplicitSpecifier): Expr; cdecl; external LibClang_dll;
function clangExt_ExplicitSpecifier_isSpecified(const E: ExplicitSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_ExplicitSpecifier_isEquivalent(const E: ExplicitSpecifier; const Other: ExplicitSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_ExplicitSpecifier_isExplicit(const E: ExplicitSpecifier): Boolean; cdecl; external LibClang_dll;
function clangExt_ExplicitSpecifier_isInvalid(const E: ExplicitSpecifier): Boolean; cdecl; external LibClang_dll;
//function clangExt_ExplicitSpecifier_getFromDecl(const F: FunctionDecl): ExplicitSpecifier; cdecl; external LibClang_dll;
//function clangExt_ExplicitSpecifier_Invalid(): ExplicitSpecifier; cdecl; external LibClang_dll; 
{$endregion 'ExplicitSpecifier'}

{$region 'CXXMethodDecl'}
function clangExt_CXXMethodDecl_isStatic(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isInstance(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isStaticOverloadedOperator(OOK: OverloadedOperatorKind): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isConst(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isVolatile(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isVirtual(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getDevirtualizedMethod(const M: CXXMethodDecl; const Base: Expr; IsAppleKext: Boolean): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isCopyAssignmentOperator(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isMoveAssignmentOperator(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getCanonicalDecl(const M: CXXMethodDecl): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getMostRecentDecl(const M: CXXMethodDecl): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_size_overridden_methods(const M: CXXMethodDecl): Cardinal; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_overridden_methods(const M: CXXMethodDecl; i: Cardinal): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getParent(const M: CXXMethodDecl): CXXRecordDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getThisType(const M: CXXMethodDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getThisObjectType(const M: CXXMethodDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getThisTypeProtoType(const FPT: FunctionProtoType; const aDecl: CXXRecordDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getThisObjectProtoType(const FPT: FunctionProtoType; const aDecl: CXXRecordDecl): CXQualType; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getMethodQualifiers(const M: CXXMethodDecl): CXQualifiers; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getRefQualifier(const M: CXXMethodDecl): RefQualifierKind; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_hasInlineBody(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_isLambdaStaticInvoker(const M: CXXMethodDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getCorrespondingMethodInClass(const M: CXXMethodDecl; const RD: CXXRecordDecl; MayBeBase: Boolean = False): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_getCorrespondingMethodDeclaredInClass(const M: CXXMethodDecl; const RD: CXXRecordDecl; MayBeBase: Boolean = False): CXXMethodDecl; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_CXXMethodDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
{$endregion 'CXXMethodDecl'}

{$region 'LinkageSpecDecl'}
function clangExt_LinkageSpecDecl_getLanguage(const D: LinkageSpecDecl): CX_LinkageSpecDecl_LanguageIDs; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_hasBraces(const D: LinkageSpecDecl): Boolean; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_getExternLoc(const D: LinkageSpecDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_getRBraceLoc(const D: LinkageSpecDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_getEndLoc(const D: LinkageSpecDecl): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_getSourceRange(const D: LinkageSpecDecl): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_castToDeclContext(const D: LinkageSpecDecl): DeclContext; cdecl; external LibClang_dll;
function clangExt_LinkageSpecDecl_castFromDeclContext(const DC: DeclContext): LinkageSpecDecl; cdecl; external LibClang_dll;
{$endregion 'LinkageSpecDecl'}
                               
{$region 'MSGuidDecl'}
function clangExt_MSGuidDecl_printName(const D: MSGuidDecl): CXString; cdecl; external LibClang_dll;
function clangExt_MSGuidDecl_getParts(const D: MSGuidDecl): MSGuidDeclParts; cdecl; external LibClang_dll;
function clangExt_MSGuidDecl_getAsAPValue(const D: MSGuidDecl): APValue; cdecl; external LibClang_dll;
function clangExt_MSGuidDecl_classof(const D: Decl): Boolean; cdecl; external LibClang_dll;
function clangExt_MSGuidDecl_classofKind(K: CX_DeclKind): Boolean; cdecl; external LibClang_dll;   
{$endregion 'MSGuidDecl'}


implementation

end.

