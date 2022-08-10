AccessSpec                         = 0;
Block                              = 1;
Captured                           = 2;
ClassScopeFunctionSpecialization   = 3;
Empty                              = 4;
Export_                             = 5;
ExternCContext                     = 6;
FileScopeAsm                       = 7;
Friend                             = 8;
FriendTemplate                     = 9;
Import                             = 10;
LifetimeExtendedTemporary          = 11;
LinkageSpec                        = 12;
Using                              = 13;
UsingEnum                          = 14;
Label_                              = 15;
Namespace                          = 16;
NamespaceAlias                     = 17;
ObjCCompatibleAlias                = 18;
ObjCCategory_                       = 19;
ObjCCategoryImpl                   = 20;
ObjCImplementation                 = 21;
ObjCInterface                      = 22;
ObjCProtocol_                       = 23;
ObjCMethod                         = 24;
ObjCProperty                       = 25;
BuiltinTemplate                    = 26;
Concept                            = 27;
ClassTemplate                      = 28;
FunctionTemplate                   = 29;
TypeAliasTemplate                  = 30;
VarTemplate                        = 31;
TemplateTemplateParm               = 32;
Enum                               = 33;
Record_                             = 34;
CXXRecord                          = 35;
ClassTemplateSpecialization        = 36;
ClassTemplatePartialSpecialization = 37;
TemplateTypeParm                   = 38;
ObjCTypeParam                      = 39;
TypeAlias                          = 40;
Typedef                            = 41;
UnresolvedUsingTypename            = 42;
UnresolvedUsingIfExists            = 43;
UsingDirective                     = 44;
UsingPack                          = 45;
UsingShadow                        = 46;
ConstructorUsingShadow             = 47;
Binding                            = 48;
Field                              = 49;
ObjCAtDefsField                    = 50;
ObjCIvar                           = 51;
Function_                           = 52;
CXXDeductionGuide                  = 53;
CXXMethod                          = 54;
CXXConstructor                     = 55;
CXXConversion                      = 56;
CXXDestructor                      = 57;
MSProperty                         = 58;
NonTypeTemplateParm                = 59;
Var_                                = 60;
Decomposition                      = 61;
ImplicitParam                      = 62;
OMPCapturedExpr                    = 63;
ParmVar                            = 64;
VarTemplateSpecialization          = 65;
VarTemplatePartialSpecialization   = 66;
EnumConstant                       = 67;
IndirectField                      = 68;
MSGuid                             = 69;
OMPDeclareMapper                   = 70;
OMPDeclareReduction                = 71;
TemplateParamObject                = 72;
UnnamedGlobalConstant              = 73;
UnresolvedUsingValue               = 74;
OMPAllocate                        = 75;
OMPRequires                        = 76;
OMPThreadPrivate                   = 77;
ObjCPropertyImpl                   = 78;
PragmaComment                      = 79;
PragmaDetectMismatch               = 80;
RequiresExprBody                   = 81;
StaticAssert                       = 82;
TranslationUnit                    = 83;

firstBaseUsing                   = Using; // 13
lastBaseUsing                    = UsingEnum; // 14

firstObjCImpl                    = ObjCCategoryImpl; // 20
lastObjCImpl                     = ObjCImplementation; // 21

firstObjCContainer               = ObjCCategory_; // 19
lastObjCContainer                = ObjCProtocol_; // 23

firstRedeclarableTemplate        = ClassTemplate; // 28
lastRedeclarableTemplate         = VarTemplate; // 31

firstTemplate                    = BuiltinTemplate; // 26
lastTemplate                     = TemplateTemplateParm; // 32

firstClassTemplateSpecialization = ClassTemplateSpecialization; // 36
lastClassTemplateSpecialization  = ClassTemplatePartialSpecialization; // 37

firstCXXRecord                   = CXXRecord; // 35
lastCXXRecord                    = ClassTemplatePartialSpecialization; // 37

firstRecord                      = Record_; // 34
lastRecord                       = ClassTemplatePartialSpecialization; // 37

firstTag                         = Enum; // 33
lastTag                          = ClassTemplatePartialSpecialization; // 37

firstTypedefName                 = ObjCTypeParam; // 39
lastTypedefName                  = Typedef; // 41

firstType                        = Enum; // 33
lastType                         = UnresolvedUsingTypename; // 42

firstUsingShadow                 = UsingShadow; // 46
lastUsingShadow                  = ConstructorUsingShadow; // 47

firstField                       = Field; // 49
lastField                        = ObjCIvar; // 51

firstCXXMethod                   = CXXMethod; // 54
lastCXXMethod                    = CXXDestructor; // 57

firstFunction                    = Function_; // 52
lastFunction                     = CXXDestructor; // 57

firstVarTemplateSpecialization   = VarTemplateSpecialization; // 65
lastVarTemplateSpecialization    = VarTemplatePartialSpecialization; // 66

firstVar                         = Var_; // 60
lastVar                          = VarTemplatePartialSpecialization; // 66

firstDeclarator                  = Field; // 49
lastDeclarator                   = VarTemplatePartialSpecialization; // 66

firstValue                       = Binding; // 48
lastValue                        = UnresolvedUsingValue; // 74

firstNamed                       = Using; // 13
lastNamed                        = UnresolvedUsingValue; // 74

firstDecl                        = AccessSpec; // 0
lastDecl                         = TranslationUnit; // 83
