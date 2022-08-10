unit LibClang.Ext.AST.AttrU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,  
  LibClang.Index,
  LibClang.Ext.AST.ExprH,
  LibClang.Ext.AST.AttrH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Basic.SpecifiersH,
  LibClang.Ext.AST.TypeH,
  LibClang.Ext.AST.DeclCXXH
  ;
              
{$region 'AttributeCommonInfo'}
function clangExt_AttributeCommonInfo_Kind_getLast(): Integer; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_Kind_getName(i: CX_AttributeCommonInfoKind): CXString; cdecl; external LibClang_dll;
//
function clangExt_AttributeCommonInfo_getParsedKind(const A: AttributeCommonInfo): CX_AttributeCommonInfoKind; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getSyntax(const A: AttributeCommonInfo): CX_AttributeCommonInfoSyntax; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getAttrName(const A: AttributeCommonInfo): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getLoc(const A: AttributeCommonInfo; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getRange(const A: AttributeCommonInfo; const ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_hasScope(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getScopeName(const A: AttributeCommonInfo): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getScopeLoc(const A: AttributeCommonInfo; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getNormalizedFullName(const A: AttributeCommonInfo): CXString; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isDeclspecAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isMicrosoftAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isGNUScope(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isAlignasAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isCXX11Attribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isC2xAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isStandardAttributeSyntax(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isKeywordAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_isContextSensitiveKeywordAttribute(const A: AttributeCommonInfo): Boolean; cdecl; external LibClang_dll;
function clangExt_AttributeCommonInfo_getAttributeSpellingListIndex(const A: AttributeCommonInfo): Cardinal; cdecl; external LibClang_dll;
{$endregion 'AttributeCommonInfo'}
    
{$region 'CX_AttrKind'}
function clangExt_Attr_Kind_getFirstAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastAttr(): Integer; cdecl; external LibClang_dll; 
function clangExt_Attr_Kind_getFirstTypeAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastTypeAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstStmtAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastStmtAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstDeclOrStmtAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastDeclOrStmtAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstInheritableAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastInheritableAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstDeclOrTypeAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastDeclOrTypeAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstInheritableParamAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastInheritableParamAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getFirstParameterABIAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getLastParameterABIAttr(): Integer; cdecl; external LibClang_dll;
function clangExt_Attr_Kind_getName(i: CX_AttrKind): CXString; cdecl; external LibClang_dll;
{$endregion 'CX_AttrKind'}
                     
{$region 'Attr'}
function clangExt_Attr_getKind(const A: Attr): CX_AttrKind; cdecl; external LibClang_dll;
function clangExt_Attr_getSpellingListIndex(const A: Attr): Cardinal; cdecl; external LibClang_dll;
function clangExt_Attr_getSpelling(const A: Attr): PChar; cdecl; external LibClang_dll;
function clangExt_Attr_getLocation(const A: Attr; const ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_Attr_isInherited(const A: Attr): Boolean; cdecl; external LibClang_dll;
function clangExt_Attr_isImplicit(const A: Attr): Boolean; cdecl; external LibClang_dll;
function clangExt_Attr_isPackExpansion(const A: Attr): Boolean; cdecl; external LibClang_dll;
function clangExt_Attr_isLateParsed(const A: Attr): Boolean; cdecl; external LibClang_dll;
function clangExt_Attr_printPretty(const A: Attr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
{$endregion 'Attr'}

{$region 'TypeAttr'}
function clangExt_TypeAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'TypeAttr'}

{$region 'StmtAttr'}
function clangExt_StmtAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'StmtAttr'}

{$region 'InheritableAttr'}
function clangExt_InheritableAttr_shouldInheritEvenIfAlreadyPresent(const A: InheritableAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_InheritableAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'InheritableAttr'}

{$region 'DeclOrStmtAttr'}
function clangExt_DeclOrStmtAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'DeclOrStmtAttr'}

{$region 'InheritableParamAttr'}
function clangExt_InheritableParamAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'InheritableParamAttr'}

{$region 'ParameterABIAttr'}
function clangExt_ParameterABIAttr_getABI(const A: ParameterABIAttr): ParameterABI; cdecl; external LibClang_dll;
function clangExt_ParameterABIAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'ParameterABIAttr'}
                           
{$region 'AlignedAttr'}
function clangExt_AlignedAttr_printPretty(const A: AlignedAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_getSpelling(const A: AlignedAttr): PChar; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_getSemanticSpelling(const A: AlignedAttr): AlignedAttr_Spelling; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isGNU(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isC11(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isAlignas(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isDeclspec(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isAlignmentDependent(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isAlignmentErrorDependent(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_getAlignment(const A: AlignedAttr; const Ctx: ASTContext): Cardinal; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_isAlignmentExpr(const A: AlignedAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_getAlignmentExpr(const A: AlignedAttr): Expr; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_getAlignmentType(const A: AlignedAttr): TypeSourceInfo; cdecl; external LibClang_dll;
function clangExt_AlignedAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'AlignedAttr'}

{$region 'AnnotateAttr'}
function clangExt_AnnotateAttr_printPretty(const A: AnnotateAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_getSpelling(const A: AnnotateAttr): PChar; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_getAnnotation(const A: AnnotateAttr): CXString; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_getAnnotationLength(const A: AnnotateAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_args_size(const A: AnnotateAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_arg(const A: AnnotateAttr; i: Cardinal): Expr; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_delayedArgs_size(const A: AnnotateAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_delayedArg(const A: AnnotateAttr; i: Cardinal): Expr; cdecl; external LibClang_dll;
function clangExt_AnnotateAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'AnnotateAttr'}
                            
{$region 'DLLExportAttr'}
function clangExt_DLLExportAttr_printPretty(const A: DLLExportAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_DLLExportAttr_getSpelling(const A: DLLExportAttr): PChar; cdecl; external LibClang_dll;
function clangExt_DLLExportAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'DLLExportAttr'}
                           
{$region 'DLLImportAttr'}
function clangExt_DLLImportAttr_printPretty(const A: DLLImportAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_DLLImportAttr_getSpelling(const A: DLLImportAttr): PChar; cdecl; external LibClang_dll;
function clangExt_DLLImportAttr_wasPropagatedToBaseTemplate(const A: DLLImportAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_DLLImportAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'DLLImportAttr'}

{$region 'ExternalSourceSymbolAttr'}
function clangExt_ExternalSourceSymbolAttr_printPretty(const A: ExternalSourceSymbolAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getSpelling(const A: ExternalSourceSymbolAttr): PChar; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getLanguage(const A: ExternalSourceSymbolAttr): CXString; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getLanguageLength(const A: ExternalSourceSymbolAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getDefinedIn(const A: ExternalSourceSymbolAttr): CXString; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getDefinedInLength(const A: ExternalSourceSymbolAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_getGeneratedDeclaration(const A: ExternalSourceSymbolAttr): Boolean; cdecl; external LibClang_dll;
function clangExt_ExternalSourceSymbolAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'ExternalSourceSymbolAttr'}
                     
{$region 'MSNoVTableAttr'}
function clangExt_MSNoVTableAttr_printPretty(const A: MSNoVTableAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_MSNoVTableAttr_getSpelling(const A: MSNoVTableAttr): PChar; cdecl; external LibClang_dll;
function clangExt_MSNoVTableAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'MSNoVTableAttr'}
                            
{$region 'MaxFieldAlignmentAttr'}
function clangExt_MaxFieldAlignmentAttr_printPretty(const A: MaxFieldAlignmentAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_MaxFieldAlignmentAttr_getSpelling(const A: MaxFieldAlignmentAttr): PChar; cdecl; external LibClang_dll;
function clangExt_MaxFieldAlignmentAttr_getAlignment(const A: MaxFieldAlignmentAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_MaxFieldAlignmentAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'MaxFieldAlignmentAttr'}
                        
{$region 'MaxFieldAlignmentAttr'}
function clangExt_SelectAnyAttr_printPretty(const A: SelectAnyAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_SelectAnyAttr_getSpelling(const A: SelectAnyAttr): PChar; cdecl; external LibClang_dll;
function clangExt_SelectAnyAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;  
{$endregion 'MaxFieldAlignmentAttr'}
                            
{$region 'MSNoVTableAttr'}
function clangExt_StdCallAttr_printPretty(const A: StdCallAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_StdCallAttr_getSpelling(const A: StdCallAttr): PChar; cdecl; external LibClang_dll;
function clangExt_StdCallAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;
{$endregion 'MSNoVTableAttr'}

{$region 'UuidAttr'}
function clangExt_UuidAttr_printPretty(const A: UuidAttr; Policy: CXPrintingPolicy): CXString; cdecl; external LibClang_dll;
function clangExt_UuidAttr_getSpelling(const A: UuidAttr): PChar; cdecl; external LibClang_dll;
function clangExt_UuidAttr_getGuid(const A: UuidAttr): CXString; cdecl; external LibClang_dll;
function clangExt_UuidAttr_getGuidLength(const A: UuidAttr): Cardinal; cdecl; external LibClang_dll;
function clangExt_UuidAttr_getGuidDecl(const A: UuidAttr): MSGuidDecl; cdecl; external LibClang_dll;
function clangExt_UuidAttr_classof(const A: Attr): Boolean; cdecl; external LibClang_dll;      
{$endregion 'UuidAttr'}


implementation

end.

