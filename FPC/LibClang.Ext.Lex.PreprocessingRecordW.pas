unit LibClang.Ext.Lex.PreprocessingRecordW;

{$mode ObjFPC}{$H+}
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  LibClang.Index,
  LibClang.Helper,
  LibClang.Ext.Lex.PreprocessingRecordH,
  LibClang.Ext.AST.ASTContextH,
  LibClang.Ext.Basic.IdentifierTableH,
  LibClang.Ext.Lex.PreprocessingRecordU
  ;

type

  { TPreprocessedEntityW }

  TPreprocessedEntityW = object
    E: PreprocessedEntity;
  public
    class function Create(const entity: PreprocessedEntity; out PreprocessedE: TPreprocessedEntityW): Boolean; static;
    function IsNull: Boolean;
    function getKind: PreprocessedEntityKind;
    function getSourceRange(const Ctx: ASTContext): CXSourceRange;
    function isInvalid: Boolean;
  end;

  { TPreprocessingDirectiveW }

  TPreprocessingDirectiveW = object(TPreprocessedEntityW)
    class function Create(const entity: PreprocessingDirective; out PreprocessingDir: TPreprocessingDirectiveW): Boolean; static;
    class function classof(const PE: TPreprocessedEntityW): Boolean; static;
  end;

  { TInclusionDirectiveW }

  TInclusionDirectiveW = object(TPreprocessingDirectiveW)   
    class function Create(const entity: InclusionDirective; out InclusionDir: TInclusionDirectiveW): Boolean; static;
    function getKind: InclusionDirectiveKind;
    function getFileName: string;
    function wasInQuotes: Boolean;
    function importedModule: Boolean;
    //function getFile: FileEntry;
    class function classof(const PE: TPreprocessedEntityW): Boolean; static;
  end;

  { TMacroDefinitionRecordW }

  TMacroDefinitionRecordW = object(TPreprocessingDirectiveW)
    class function Create(const entity: MacroDefinitionRecord; out MacroDefinitionRec: TMacroDefinitionRecordW): Boolean; static;
    function getName: IdentifierInfo;
    function getLocation(const Ctx: ASTContext): CXSourceLocation;
    class function classof(const PE: TPreprocessedEntityW): Boolean; static;
  end;

  { TMacroExpansionW }

  TMacroExpansionW = object(TPreprocessedEntityW)
    class function Create(const entity: MacroExpansion; out MacroExp: TMacroExpansionW): Boolean; static;
    function isBuiltinMacro: Boolean;
    function getName: IdentifierInfo;
    function getDefinition: TMacroDefinitionRecordW;
    class function classof(const PE: TPreprocessedEntityW): Boolean; static;
  end;

  TPreprocessingRecordVisitorMethod = function (const e: PreprocessedEntity; args: TCXClientDataArray): Boolean of object;
  TPreprocessingRecordVisitorProc = function (const e: PreprocessedEntity; args: TCXClientDataArray): Boolean;

  { PreprocessingRecordHelper }

  PreprocessingRecordHelper = type helper for PreprocessingRecord
    function getTotalMemory: SIZE_T;
    function getPreprocessedEntitiesAll(visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean;
    function getPreprocessedEntitiesLocal(visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean;
    function getPreprocessedEntitiesInRange(R: CXSourceRange; visitor: TPreprocessingRecordVisitorMethod; args: TCXClientDataArray): Boolean;
    function getPreprocessedEntitiesInRange(R: CXSourceRange; visitor: TPreprocessingRecordVisitorProc; args: TCXClientDataArray): Boolean;
  end;

  { PreprocessedEntityHelper }

  PreprocessedEntityHelper = type helper for PreprocessedEntity
    function Wrap(out T: TPreprocessedEntityW): Boolean;
  end;

  { PreprocessingDirectiveHelper }

  PreprocessingDirectiveHelper = type helper for PreprocessingDirective
    function Wrap(out T: TPreprocessingDirectiveW): Boolean;
  end;

  { InclusionDirectiveHelper }

  InclusionDirectiveHelper = type helper for InclusionDirective
    function Wrap(out T: TInclusionDirectiveW): Boolean;
  end;

  { MacroDefinitionRecordHelper }

  MacroDefinitionRecordHelper = type helper for MacroDefinitionRecord
    function Wrap(out T: TMacroDefinitionRecordW): Boolean;
  end;

  { MacroExpansionHelper }

  MacroExpansionHelper = type helper for MacroExpansion
    function Wrap(out T: TMacroExpansionW): Boolean;
  end;

implementation

{ PreprocessedEntityHelper }

function PreprocessedEntityHelper.Wrap(out T: TPreprocessedEntityW): Boolean;
begin
  Result := TPreprocessedEntityW.Create(Self, T);
end;

{ PreprocessingDirectiveHelper }

function PreprocessingDirectiveHelper.Wrap(out T: TPreprocessingDirectiveW
  ): Boolean;
begin
  Result := TPreprocessingDirectiveW.Create(Self, T);
end;

{ InclusionDirectiveHelper }

function InclusionDirectiveHelper.Wrap(out T: TInclusionDirectiveW): Boolean;
begin
  Result := TInclusionDirectiveW.Create(Self, T);
end;

{ MacroDefinitionRecordHelper }

function MacroDefinitionRecordHelper.Wrap(out T: TMacroDefinitionRecordW
  ): Boolean;
begin
  Result := TMacroDefinitionRecordW.Create(Self, T);
end;

{ MacroExpansionHelper }

function MacroExpansionHelper.Wrap(out T: TMacroExpansionW): Boolean;
begin
  Result := TMacroExpansionW.Create(Self, T);
end;

{$region 'TPreprocessedEntityW'}

class function TPreprocessedEntityW.Create(const entity: PreprocessedEntity;
  out PreprocessedE: TPreprocessedEntityW): Boolean;
begin
  Result := False;
  PreprocessedE := Default(TPreprocessedEntityW);
  if not Assigned(entity) then
    Exit;
  PreprocessedE.E := entity;
  Result := True;
end;

function TPreprocessedEntityW.IsNull: Boolean;
begin
  Result := not Assigned(E);
end;

function TPreprocessedEntityW.getKind: PreprocessedEntityKind;
begin
  Result := clangExt_PreprocessedEntity_getKind(E);
end;

function TPreprocessedEntityW.getSourceRange(const Ctx: ASTContext
  ): CXSourceRange;
begin
  Result := clangExt_PreprocessedEntity_getSourceRange(E, Ctx);
end;

function TPreprocessedEntityW.isInvalid: Boolean;
begin
  Result := clangExt_PreprocessedEntity_isInvalid(E);
end;
      
{$endregion 'TPreprocessedEntityW'}

{$region 'TPreprocessingDirectiveW'}

class function TPreprocessingDirectiveW.Create(
  const entity: PreprocessingDirective; out
  PreprocessingDir: TPreprocessingDirectiveW): Boolean;
begin
  Result := False;
  PreprocessingDir := Default(TPreprocessingDirectiveW);
  if (not Assigned(entity)) or (not clangExt_PreprocessingDirective_classof(entity)) then
    Exit;
  PreprocessingDir.E := entity;
  Result := True;
end;

class function TPreprocessingDirectiveW.classof(const PE: TPreprocessedEntityW
  ): Boolean;
begin
  Result := clangExt_PreprocessingDirective_classof(PE.E);
end;

{$endregion 'TPreprocessingDirectiveW'}

{$region 'TInclusionDirectiveW'}

class function TInclusionDirectiveW.Create(const entity: InclusionDirective;
  out InclusionDir: TInclusionDirectiveW): Boolean;
begin
  Result := False;
  InclusionDir := Default(TInclusionDirectiveW);
  if (not Assigned(entity)) or (not clangExt_InclusionDirective_classof(entity)) then
    Exit;
  InclusionDir.E := entity;
  Result := True;
end;

function TInclusionDirectiveW.getKind: InclusionDirectiveKind;
begin
  Result := clangExt_InclusionDirective_getKind(E);
end;

function TInclusionDirectiveW.getFileName: string;
begin
  Result := clangExt_InclusionDirective_getFileName(E).ToString;
end;

function TInclusionDirectiveW.wasInQuotes: Boolean;
begin
  Result := clangExt_InclusionDirective_wasInQuotes(E);
end;

function TInclusionDirectiveW.importedModule: Boolean;
begin
  Result := clangExt_InclusionDirective_importedModule(E);
end;

class function TInclusionDirectiveW.classof(const PE: TPreprocessedEntityW
  ): Boolean;
begin
  Result := clangExt_InclusionDirective_classof(PE.E);
end;

{$endregion 'TInclusionDirectiveW'}

{$region 'TMacroDefinitionRecordW'}

class function TMacroDefinitionRecordW.Create(
  const entity: MacroDefinitionRecord; out
  MacroDefinitionRec: TMacroDefinitionRecordW): Boolean;
begin
  Result := False;
  MacroDefinitionRec := Default(TMacroDefinitionRecordW);
  if (not Assigned(entity)) or (not clangExt_MacroDefinitionRecord_classof(entity)) then
    Exit;
  MacroDefinitionRec.E := entity;
  Result := True;
end;

function TMacroDefinitionRecordW.getName: IdentifierInfo;
begin
  Result := clangExt_MacroDefinitionRecord_getName(E);
end;

function TMacroDefinitionRecordW.getLocation(const Ctx: ASTContext
  ): CXSourceLocation;
begin
  Result := clangExt_MacroDefinitionRecord_getLocation(E, Ctx);
end;

class function TMacroDefinitionRecordW.classof(const PE: TPreprocessedEntityW
  ): Boolean;
begin
  Result := clangExt_MacroDefinitionRecord_classof(PE.E);
end;

{$endregion 'TMacroDefinitionRecordW'}

{$region 'TMacroExpansionW'}

class function TMacroExpansionW.Create(const entity: MacroExpansion; out
  MacroExp: TMacroExpansionW): Boolean;
begin
  Result := False;
  MacroExp := Default(TMacroExpansionW);
  if (not Assigned(entity)) or (not clangExt_MacroExpansion_classof(entity)) then
    Exit;
  MacroExp.E := entity;
  Result := True;
end;

function TMacroExpansionW.isBuiltinMacro: Boolean;
begin
  Result := clangExt_MacroExpansion_isBuiltinMacro(E);
end;

function TMacroExpansionW.getName: IdentifierInfo;
begin
  Result := clangExt_MacroExpansion_getName(E);
end;

function TMacroExpansionW.getDefinition: TMacroDefinitionRecordW;
begin
  TMacroDefinitionRecordW.Create(clangExt_MacroExpansion_getDefinition(E), Result);
end;

class function TMacroExpansionW.classof(const PE: TPreprocessedEntityW
  ): Boolean;
begin
  Result := clangExt_MacroExpansion_classof(PE.E);
end;
     
{$endregion 'TMacroExpansionW'}

{$region 'PreprocessingRecordHelper'}

function PreprocessingRecordHelper.getTotalMemory: SIZE_T;
begin
  Result := clangExt_PreprocessingRecord_getTotalMemory(Self);
end;

function PreprocessingRecordHelper.getPreprocessedEntitiesAll(
  visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean;
begin
  Result := clangExt_PreprocessingRecord_getPreprocessedEntitiesAll(Self, visitor, client_data);
end;

function PreprocessingRecordHelper.getPreprocessedEntitiesLocal(
  visitor: PreprocessingRecordVisitor; client_data: CXClientData): Boolean;
begin
  Result := clangExt_PreprocessingRecord_getPreprocessedEntitiesLocal(Self, visitor, client_data);
end;

type
  TInternal_PreprocessingRecordVisitor_Event = record
    eMethod: TPreprocessingRecordVisitorMethod;
    eProc: TPreprocessingRecordVisitorProc;
    args: TCXClientDataArray;
  end;
  PInternal_PreprocessingRecordVisitor_Event = ^TInternal_PreprocessingRecordVisitor_Event;

function _Internal_PreprocessingRecordVisitor(const e: PreprocessedEntity; client_data: CXClientData): Boolean; cdecl;
var
  p: PInternal_PreprocessingRecordVisitor_Event absolute client_data;
begin
  if Assigned(p^.eMethod) then
    Result := p^.eMethod(e, p^.args)
  else
    Result := p^.eProc(e, p^.args);
end;

function PreprocessingRecordHelper.getPreprocessedEntitiesInRange(
  R: CXSourceRange; visitor: TPreprocessingRecordVisitorMethod;
  args: TCXClientDataArray): Boolean;
var
  e: TInternal_PreprocessingRecordVisitor_Event;
begin
  e.eMethod := visitor;
  e.eProc := nil;
  e.args := args;

  Result := clangExt_PreprocessingRecord_getPreprocessedEntitiesInRange(Self, R, @_Internal_PreprocessingRecordVisitor, @e);
end;

function PreprocessingRecordHelper.getPreprocessedEntitiesInRange(
  R: CXSourceRange; visitor: TPreprocessingRecordVisitorProc;
  args: TCXClientDataArray): Boolean;
var
  e: TInternal_PreprocessingRecordVisitor_Event;
begin
  e.eMethod := nil;
  e.eProc := visitor;
  e.args := args;

  Result := clangExt_PreprocessingRecord_getPreprocessedEntitiesInRange(Self, R, @_Internal_PreprocessingRecordVisitor, @e);
end;
     
{$endregion 'PreprocessingRecordHelper'}

end.

