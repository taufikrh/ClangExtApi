unit LibClang.Ext.Lex.PreprocessingRecordU;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base,
  LibClang.CXString,
  LibClang.Index,
  LibClang.Ext.Lex.PreprocessingRecordH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.IdentifierTableH;

//=======================================================================================================================
function clangExt_PreprocessedEntity_getKind(const e: PreprocessedEntity): PreprocessedEntityKind; cdecl; external LibClang_dll;
function clangExt_PreprocessedEntity_getSourceRange(const e: PreprocessedEntity; const Ctx: ASTContext): CXSourceRange; cdecl; external LibClang_dll;
function clangExt_PreprocessedEntity_isInvalid(const e: PreprocessedEntity): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================    
function clangExt_PreprocessingDirective_classof(const PE: PreprocessedEntity): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_MacroDefinitionRecord_getName(const m: MacroDefinitionRecord): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_MacroDefinitionRecord_getLocation(const m: MacroDefinitionRecord; const Ctx: ASTContext): CXSourceLocation; cdecl; external LibClang_dll;
function clangExt_MacroDefinitionRecord_classof(const PE: PreprocessedEntity): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_MacroExpansion_isBuiltinMacro(const m: MacroExpansion): Boolean; cdecl; external LibClang_dll;
function clangExt_MacroExpansion_getName(const m: MacroExpansion): IdentifierInfo; cdecl; external LibClang_dll;
function clangExt_MacroExpansion_getDefinition(const m: MacroExpansion): MacroDefinitionRecord; cdecl; external LibClang_dll;
function clangExt_MacroExpansion_classof(const PE: PreprocessedEntity): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================
function clangExt_InclusionDirective_getKind(const i: InclusionDirective): InclusionDirectiveKind; cdecl; external LibClang_dll;
function clangExt_InclusionDirective_getFileName(const i: InclusionDirective): CXString; cdecl; external LibClang_dll;
function clangExt_InclusionDirective_wasInQuotes(const i: InclusionDirective): Boolean; cdecl; external LibClang_dll;
function clangExt_InclusionDirective_importedModule(const i: InclusionDirective): Boolean; cdecl; external LibClang_dll;
//function clangExt_InclusionDirective_getFile(const i: InclusionDirective): FileEntry; cdecl; external LibClang_dll;
function clangExt_InclusionDirective_classof(const PE: PreprocessedEntity): Boolean; cdecl; external LibClang_dll;
//=======================================================================================================================
type
  PreprocessingRecordVisitor = function (const e: PreprocessedEntity; client_data: CXClientData): Boolean; cdecl;

function clangExt_PreprocessingRecord_getTotalMemory(const p: PreprocessingRecord): SIZE_T; cdecl; external LibClang_dll;
function clangExt_PreprocessingRecord_getPreprocessedEntitiesAll(const p: PreprocessingRecord; visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean; cdecl; external LibClang_dll;
function clangExt_PreprocessingRecord_getPreprocessedEntitiesLocal(const p: PreprocessingRecord; visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean; cdecl; external LibClang_dll;
function clangExt_PreprocessingRecord_getPreprocessedEntitiesInRange(const p: PreprocessingRecord; R: CXSourceRange; visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean; cdecl; external LibClang_dll;

implementation

end.

