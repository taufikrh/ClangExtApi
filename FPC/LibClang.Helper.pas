unit LibClang.Helper;

{$mode ObjFPC}{$H+}  
{$modeswitch advancedrecords}
{$modeswitch typehelpers}

interface

uses
  SysUtils,
  LibClang.CXString, LibClang.CXErrorCode, LibClang.Index;

type
  TCXClientDataArray = array of CXClientData;
  TCXCursorArray = array of CXCursor;
  PCXCursorArray = ^TCXCursorArray;

  { LibCLang }

  LibCLang = record
  public
    // debug/test
    class procedure enableStackTraces; static;
    class procedure executeOnThread(
      fn: clang_threadRoutine (*fn)(void *);
      user_data: Pointer;
      stack_size: Cardinal
      ); static;
  public
    class function getClangVersionCXString: CXString; static;
    class function getClangVersion: string; static;
    class procedure toggleCrashRecovery(isEnabled: Boolean); static;
  end;

  { CXDiagnosticSetHelper }

  CXDiagnosticSetHelper = type helper for CXDiagnosticSet
    function getNumDiagnosticsInSet: Cardinal;
    function getDiagnosticInSet(Index: Cardinal): CXDiagnostic;
    class function loadDiagnostics(
      file_: string;
      error: PCXLoadDiag_Error = nil;
      errorString: PString = nil
    ): CXDiagnosticSet; static;
    procedure disposeDiagnosticSet;
  end;

  { CXErrorCodeHelper2 }

  CXErrorCodeHelper2 = type helper(CXErrorCodeHelper) for CXErrorCode
  public
    function ToInteger: Integer;
    function ErrorName: string;
  end;

  { CXIndexHelper }

  CXIndexHelper = type helper for CXIndex
  public
    class function Create(
      excludeDeclarationsFromPCH: Boolean = False;
      displayDiagnostics: Boolean = False): CXIndex; static;
    procedure disposeIndex;
  public
    procedure setGlobalOptions(options: CXGlobalOptFlags);
    function getGlobalOptions: CXGlobalOptFlags;
    procedure setInvocationEmissionPathOptionP(const Path: PChar);  
    procedure setInvocationEmissionPathOption(Path: string);
  public
    function createTranslationUnitFromSourceFile(
      const source_filename: string;
      clang_command_line_args: TStringArray;
      num_unsaved_files: Cardinal;
      unsaved_files: PCXUnsavedFile
      ): CXTranslationUnit;
    function createTranslationUnit(
      ast_filename: string
      ): CXTranslationUnit;
    function createTranslationUnit2(
      ast_filename: string;
      out out_TU: CXTranslationUnit
      ): CXErrorCode;
    function parseTranslationUnit(
      source_filename: string;
      command_line_args: TStringArray;
      const unsaved_files: PCXUnsavedFile = nil;
      num_unsaved_files: Cardinal = 0;
      options: CXTranslationUnit_Flags = CXTranslationUnit_Flags.CXTranslationUnit_None
      ): CXTranslationUnit;
    function parseTranslationUnit2(
      source_filename: string;
      command_line_args: TStringArray;
      const unsaved_files: PCXUnsavedFile;
      num_unsaved_files: Cardinal;
      options: CXTranslationUnit_Flags;
      out out_TU: CXTranslationUnit
      ): CXErrorCode;
    function parseTranslationUnit2FullArgv(
      source_filename: string;
      command_line_args: TStringArray;
      unsaved_files: PCXUnsavedFile;
      num_unsaved_files: Cardinal;
      options: CXTranslationUnit_Flags;
      out out_TU: CXTranslationUnit
      ): CXErrorCode;  
  public
    function IndexAction_create: CXIndexAction;
  end;

  { CXFileHelper }

  CXFileHelper = type helper for CXFile
    function getFileNameCXString: CXString;
    function getFileName: string;
    function getFileTime: time_t;
    function isEqual(const other: PCXFile): Boolean;
    function tryGetRealPathNameCXString: CXString;
    function tryGetRealPathName: string;
  public // custom
    function getLocation(tu: CXTranslationUnit; line: Cardinal; column: Cardinal): CXSourceLocation;
    function getLocationForOffset(tu: CXTranslationUnit; offset: Cardinal): CXSourceLocation;
  end;

  { CXTranslationUnit_Flags_Helper2 }

  CXTranslationUnit_Flags_Helper2 = type helper(CXTranslationUnit_Flags_Helper) for CXTranslationUnit_Flags
    class function defaultEditingTranslationUnitOptions: CXTranslationUnit_Flags; static;
    function Value: Cardinal;
  end;

  TCXInclusionVisitorEvent = procedure(
    const included_file: CXFile;
    const inclusion_stack: PCXSourceLocation;
    const include_len: Cardinal;
    const client_data: CXClientData;
    args: TCXClientDataArray
    ) of object;

  { CXTranslationUnitHelper }

  CXTranslationUnitHelper = type helper for CXTranslationUnit
  public
    function defaultSaveOptions: CXSaveTranslationUnit_Flags;
    function saveTranslationUnit(
      FileName: string;
      options: CXSaveTranslationUnit_Flags
      ): CXSaveError;
  public
    function suspendTranslationUnit: CXErrorCode;
    procedure disposeTranslationUnit;
  public
    function defaultReparseOptions: CXReparse_Flags;
    function reparseTranslationUnit(
      num_unsaved_files: Cardinal;
      unsaved_files: PCXUnsavedFile;
      options: CXReparse_Flags
      ): CXErrorCode;
  public
    function getCXTUResourceUsage: CXTUResourceUsage;
    function getTranslationUnitTargetInfo: CXTargetInfo;
  public
    function getTranslationUnitCursor: CXCursor;
    function getNumDiagnostics: Cardinal;   
    function getDiagnostic(Index: Cardinal): CXDiagnostic;
    procedure getInclusions(event: TCXInclusionVisitorEvent; const client_data: CXClientData; args: TCXClientDataArray = []);
    function isFileMultipleIncludeGuarded(file_: CXFile): Cardinal;  
    function getFile(filename: string): CXFile;
    function getFileP(const filename: PChar): CXFile; 
    function getFileContents(file_: CXFile; size: PCX_SIZE_T = nil): PByte;
    function getLocation(file_: CXFile; line: Cardinal; column: Cardinal): CXSourceLocation;
    function getLocationForOffset(file_: CXFile; offset: Cardinal): CXSourceLocation;
  public // token
    function getToken(Location: CXSourceLocation): CXToken;
    function getTokenSpellingCXString(token: CXToken): CXString;   
    function getTokenSpelling(token: CXToken): string;
    function getTokenLocation(token: CXToken): CXSourceLocation;
    function getTokenExtent(token: CXToken): CXSourceRange;
    procedure tokenize(Range: CXSourceRange; out Tokens: PCXToken; out NumTokens: Cardinal);
    procedure annotateTokens(Tokens: PCXToken; NumTokens: Cardinal; Cursors: PCXCursor);
    procedure disposeTokens(Tokens: PCXToken; NumTokens: Cardinal);
    function getSkippedRanges(file_: CXFile): PCXSourceRangeList;
    function getAllSkippedRanges: PCXSourceRangeList;
  public
    function getCursor(sl: CXSourceLocation): CXCursor;
    function getModuleForFile(file_: CXFile): CXModule;
  end;

  { CXTUResourceUsageHelper }

  CXTUResourceUsageHelper = record helper for CXTUResourceUsage
    procedure disposeCXTUResourceUsage;
  end;

  { CXTargetInfoHelper }

  CXTargetInfoHelper = type helper for CXTargetInfo
    procedure dispose;
    function getTripleCXString: CXString;   
    function getTriple: string;
    function getPointerWidth: Integer;
  end;

  { CXVisibilityKindHelper2 }

  CXVisibilityKindHelper2 = type helper(CXVisibilityKindHelper) for CXVisibilityKind
    function Value: Integer;
    function ToString: string;
  end;

  { CXAvailabilityKindHelper2 }

  CXAvailabilityKindHelper2 = type helper(CXAvailabilityKindHelper) for CXAvailabilityKind
    function Value: Integer;
    function ToString: string;
  end;

  { CXSourceLocationHelper }

  CXSourceLocationHelper = record helper for CXSourceLocation
    class function getNullLocation: CXSourceLocation; static;
  public
    function IsNullLocation: Boolean;
    function equalLocations(const other: PCXSourceLocation): Boolean;
    function isInSystemHeader: Boolean;
    function isFromMainFile: Boolean; 
    class function getRange(
      begin_: CXSourceLocation;
      end_: CXSourceLocation
      ): CXSourceRange; static;
    procedure getExpansionLocation(
      file_: PCXFile = nil;
      line: PCardinal = nil;
      column: PCardinal = nil;
      offset: PCardinal = nil
      );
    procedure getPresumedLocation(
      filename: PString;
      line: PCardinal = nil;
      column: PCardinal = nil
      );
    procedure getInstantiationLocation(
      file_: PCXFile = nil;
      line: PCardinal = nil;
      column: PCardinal = nil;
      offset: PCardinal = nil
      ); // deprecated
    procedure getSpellingLocation(
      file_: PCXFile = nil;
      line: PCardinal = nil;
      column: PCardinal = nil;
      offset: PCardinal = nil
      );
    procedure getFileLocation(
      file_: PCXFile = nil;
      line: PCardinal = nil;
      column: PCardinal = nil;
      offset: PCardinal = nil
      );
    function getCursor(tu: CXTranslationUnit): CXCursor;
    function getToken(tu: CXTranslationUnit): CXToken;
  end;

  { CXCursorKindHelper2 }

  CXCursorKindHelper2 = type helper(CXCursorKindHelper) for CXCursorKind
  public
    function isDeclaration: Boolean;
    function isReference: Boolean;
    function isExpression: Boolean;
    function isStatement: Boolean;
    function isAttribute: Boolean;
    function isInvalid: Boolean;
    function isTranslationUnit: Boolean;
    function isPreprocessing: Boolean;
    function isUnexposed: Boolean;
  public
    function ToString(aShowType: Boolean = True): string;
    function Value: Integer;
  public
    // debug/testing
    function getCursorKindSpellingCXString: CXString;  
    function getCursorKindSpelling: string;
  end;

  TCXCursorVisitorEventMethod = function(
    cursor: CXCursor;
    parent: CXCursor;
    args: TCXClientDataArray
    ): CXChildVisitResult of object;
  TCXCursorVisitorEventProc = function(
    cursor: CXCursor;
    parent: CXCursor;
    args: TCXClientDataArray
    ): CXChildVisitResult;

  TVarDeclStorage = type Integer;
  TVarDeclStorageHelper = type Helper for TVarDeclStorage
  public const
    Unknown = -1;
    NotAvailable = 0;
    Available = 1;
  end;

  { CXCursorHelper }

  CXCursorHelper = record helper for CXCursor
  public
    class function Create(const src: PCXCursor): PCXCursor; static;
    class function getNullCursor: CXCursor; static; 
  public
    function equalCursors(const other: PCXCursor): Boolean;
    function isNull: Boolean;     
    function hashCursor: Cardinal;         
    function getCursorKind: CXCursorKind;
  public
    function isInvalidDeclaration: Boolean; 
    function hasAttrs: Boolean;
    function getCursorLinkage: CXLinkageKind;
    function getCursorVisibility: CXVisibilityKind;
    function getCursorAvailability: CXAvailabilityKind;
    function getCursorPlatformAvailability(
      always_deprecated: PInteger = nil;
      deprecated_message: PCXString = nil;
      always_unavailable: PInteger = nil;
      unavailable_message: PCXString = nil;
      availability: PCXPlatformAvailability = nil;
      availability_size: Integer = 0
      ): Integer;
  public
    function getVarDeclInitializer: CXCursor;
    function hasVarDeclGlobalStorage: TVarDeclStorage;
    function hasVarDeclExternalStorage: TVarDeclStorage;  
  public
    function getCursorLanguage: CXLanguageKind;
    function getCursorTLSKind: CXTLSKind;
    function getTranslationUnit: CXTranslationUnit;
    function getCursorSemanticParent: CXCursor;
    function getCursorLexicalParent: CXCursor;
    procedure getOverriddenCursors(out overridden: PCXCursor; out num_overridden: Cardinal);
    class procedure disposeOverriddenCursors(overridden: PCXCursor); static;
  public
    function getIncludedFile: CXFile;
    function getCursorLocation: CXSourceLocation;
    function getCursorExtent: CXSourceRange;
  public
    function getCursorType: CXType;  
    function getTypedefDeclUnderlyingType: CXType; 
    function getEnumDeclIntegerType: CXType;
    function getEnumConstantDeclValue: Int64;
    function getEnumConstantDeclUnsignedValue: UInt64;
    function getFieldDeclBitWidth: Integer;
  public
    function getNumArguments: Integer;
    function getArgument(i: Cardinal): CXCursor; 
  public
    function getNumTemplateArguments: Integer;
    function getTemplateArgumentKind(i: Cardinal): CXTemplateArgumentKind;
    function getTemplateArgumentType(i: Cardinal): CXType;
    function getTemplateArgumentValue(i: Cardinal): Int64;
    function getTemplateArgumentUnsignedValue(i: Cardinal): UInt64; 
  public
    function isMacroFunctionLike: Boolean;
    function isMacroBuiltin: Boolean;
    function isFunctionInlined: Boolean; 
  public
    function getDeclObjCTypeEncodingCXString: CXString;     
    function getDeclObjCTypeEncoding: string; 
  public
    function getCursorResultType: CXType;
    function getCursorExceptionSpecificationType: CXCursor_ExceptionSpecificationKind;
    function getOffsetOfField: Int64;
    function isAnonymous: Boolean;
    function isAnonymousRecordDecl: Boolean;
    function isInlineNamespace: Boolean;
    function isBitField: Boolean;
    function isVirtualBase: Boolean;
    function getCXXAccessSpecifier: CX_CXXAccessSpecifier;
    function getStorageClass: CX_StorageClass;
    function getNumOverloadedDecls: Cardinal;
    function getOverloadedDecl(index: Cardinal): CXCursor;
  public
    function getIBOutletCollectionType: CXType;  
  public
    procedure visitChildren(event: TCXCursorVisitorEventMethod; args: TCXClientDataArray = []); overload;
    procedure visitChildren(event: TCXCursorVisitorEventProc; args: TCXClientDataArray = []); overload;
    //function visitChildrenWithBlock(block: CXCursorVisitorBlock): Cardinal;
  public
    function getCursorUSRCXString: CXString;   
    function getCursorUSR: string;
    function getCursorSpellingCXString: CXString;
    // Retrieve a name for the entity referenced by this cursor.
    function getCursorSpelling: string;
    function getSpellingNameRange(pieceIndex: Cardinal; options: Cardinal): CXSourceRange;
    function getCursorPrintingPolicy: CXPrintingPolicy;
    function getCursorPrettyPrintedCXString(Policy: CXPrintingPolicy): CXString;
    function getCursorPrettyPrinted(Policy: CXPrintingPolicy): string;
    function getCursorDisplayNameCXString: CXString; 
    function getCursorDisplayName: string;
    function getCursorReferenced: CXCursor;
    function getCursorDefinition: CXCursor;
    function isCursorDefinition: Boolean;
    function getCanonicalCursor: CXCursor;
    function getObjCSelectorIndex: Integer;
    function isDynamicCall: Boolean;
    function getReceiverType: CXType;
    function getObjCPropertyAttributes(reserved: Cardinal = 0): CXObjCPropertyAttrKind;
    function getObjCPropertyGetterNameCXString: CXString;
    function getObjCPropertyGetterName: string;
    function getObjCPropertySetterNameCXString: CXString;
    function getObjCPropertySetterName: string;
    function getObjCDeclQualifiers: CXObjCDeclQualifierKind;
    function isObjCOptional: Boolean;
    function isVariadic: Boolean;
    function isExternalSymbol(language: PString = nil; definedIn: PString = nil; isGenerated: PBoolean = nil): Boolean;
    function getCommentRange: CXSourceRange;
    function getRawCommentTextCXString: CXString;  
    function getRawCommentText: string;
    function getBriefCommentTextCXString: CXString;  
    function getBriefCommentText: string;
  public
    function getManglingCXString: CXString;   
    function getMangling: string;
    function getCXXManglings: PCXStringSet;
    function getObjCManglings: PCXStringSet;
  public // CXModule
    function getModule: CXModule;
  public
    function CXXConstructor_isConvertingConstructor: Boolean;
    function CXXConstructor_isCopyConstructor: Boolean;
    function CXXConstructor_isDefaultConstructor: Boolean;
    function CXXConstructor_isMoveConstructor: Boolean;
    function CXXField_isMutable: Boolean;
    // Determine if a C++ method is declared '= default'.
    function CXXMethod_isDefaulted: Boolean;
    function CXXMethod_isPureVirtual: Boolean;
    function CXXMethod_isStatic: Boolean;
    function CXXMethod_isVirtual: Boolean;
    function CXXRecord_isAbstract: Boolean;
    function EnumDecl_isScoped: Boolean;
    function CXXMethod_isConst: Boolean;
    function getTemplateCursorKind: CXCursorKind;
    function getSpecializedCursorTemplate: CXCursor;
    function getCursorReferenceNameRange(NameFlags: CXNameRefFlags; PieceIndex: Cardinal): CXSourceRange;
  public
    // debug/test
    // isCursorDefinition
    function getDefinitionSpellingAndExtent(
      out startBuf: PChar;    // not null
      out endBuf: PChar;      // not null
      out startLine: Cardinal;    // not null
      out startColumn: Cardinal;  // not null
      out endLine: Cardinal;      // not null
      out endColumn: Cardinal     // not null
      ): Boolean;
  public
    function getCursorCompletionString: CXCompletionString;
  public
    function Evaluate: CXEvalResult;
    function findReferencesInFile(file_: CXFile; const visitor: PCXCursorAndRangeVisitor): CXResult;
    function findReferencesInFileWithBlock(file_: CXFile; block: CXCursorAndRangeVisitorBlock): CXResult;
  private
    function _visitChild(cursor: CXCursor; {%H-}parent: CXCursor; args: TCXClientDataArray): CXChildVisitResult;
    function _visitChilds(cursor: CXCursor; {%H-}parent: CXCursor; args: TCXClientDataArray): CXChildVisitResult;
  public
    function FindChild(searchCursorKind: CXCursorKind; out cur: CXCursor): Boolean;
    function FindChilds(searchCursorKind: CXCursorKind; out cur: TCXCursorArray; max: Integer = 0; recursive: Boolean = False): Boolean;
  end;

  { CXPlatformAvailabilityHelper }

  CXPlatformAvailabilityHelper = record helper for CXPlatformAvailability
    class procedure disposeCXPlatformAvailability(availability: PCXPlatformAvailability); static;
  end;

  TCXFieldVisitorEvent = function(
    C: CXCursor;
    args: TCXClientDataArray
    ): CXVisitorResult of object;

  { CXTypeHelper }

  CXTypeHelper = record helper for CXType
    function equalTypes(const other: PCXType): Boolean;
    function getTypeSpellingCXString: CXString;
    function getTypeSpelling: string;
    function getCanonicalType: CXType;
    function isConstQualifiedType: Boolean;
    function isVolatileQualifiedType: Boolean;
    function isRestrictQualifiedType: Boolean;
    function getAddressSpace: Cardinal;
    function getTypedefNameCXString: CXString;    
    function getTypedefName: string;
    function getPointeeType: CXType;
    function getTypeDeclaration: CXCursor;
    function Type_getObjCEncodingCXString: CXString;   
    function Type_getObjCEncoding: string;
    function getFunctionTypeCallingConv: CXCallingConv;
    function getResultType: CXType;
    function getExceptionSpecificationType: CXCursor_ExceptionSpecificationKind;
    function getNumArgTypes: Integer;
    function getArgType(i: Cardinal): CXType;
    function isPODType: Boolean;
    function getElementType: CXType;
    function getNumElements: Int64;
    function getArrayElementType: CXType;
    function getArraySize: Int64;
    function Type_getNamedType: CXType;
    function Type_isTransparentTagTypedef: Boolean;
    function Type_getNullability: CXTypeNullabilityKind;
    function Type_getAlignOf: Int64;
    function Type_getClassType: CXType;
    function Type_getSizeOf: Int64;
    function Type_getOffsetOf(S: PChar): Int64;
    function Type_getModifiedType: CXType;
    function Type_getValueType: CXType;
    function Type_getNumTemplateArguments: Integer;
    function Type_getTemplateArgumentAsType(i: Cardinal): CXType;
    function Type_getCXXRefQualifier: CXRefQualifierKind;
    function Type_visitFields(visitor: TCXFieldVisitorEvent; args: TCXClientDataArray = []): Cardinal;
  end;

  { CXTypeKindHelper2 }

  CXTypeKindHelper2 = type helper(CXTypeKindHelper) for CXTypeKind
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
    function getTypeKindSpellingCXString: CXString;
    function getTypeKindSpelling: string;
  public
    function IsInvalid: Boolean;    
    function IsUnexposed: Boolean;
    function IsBuiltinType: Boolean;
  end;

  { CXSourceRangeHelper }

  CXSourceRangeHelper = type helper for CXSourceRange
    class function getNullRange: CXSourceRange; static;
    function equalRanges(const other: PCXSourceRange): Boolean;
    function isNull: Boolean;
    function getRangeStart: CXSourceLocation;  
    function getRangeEnd: CXSourceLocation;
  public
    procedure tokenize(tu: CXTranslationUnit; out Tokens: PCXToken; out NumTokens: Cardinal);
    class function CreateRange(
      begin_: CXSourceLocation;
      end_: CXSourceLocation
      ): CXSourceRange; static;
  end;

  { CXDiagnosticHelper }

  CXDiagnosticHelper = type helper for CXDiagnostic
  public
    function getChildDiagnostics: CXDiagnosticSet;
    procedure disposeDiagnostic;
    function formatDiagnosticCXString(Option: CXDiagnosticDisplayOptions): CXString;
    function formatDiagnostic(Option: CXDiagnosticDisplayOptions): string; 
    function getDiagnosticSeverity: CXDiagnosticSeverity;
    function getDiagnosticLocation: CXSourceLocation;
    function getDiagnosticSpellingCXString: CXString;
    function getDiagnosticSpelling: string;
    function getDiagnosticOptionCXString(Disable: PString = nil): CXString;    
    function getDiagnosticOption(Disable: PString = nil): string;
    function getDiagnosticCategory: Cardinal;
    function getDiagnosticCategoryTextCXString: CXString;    
    function getDiagnosticCategoryText: string;
    function getDiagnosticNumRanges: Cardinal;
    function getDiagnosticRange(Range: Cardinal): CXSourceRange;
    function getDiagnosticNumFixIts: Cardinal;
    function getDiagnosticFixItCXString(FixIt: Cardinal; ReplacementRange: PCXSourceRange): CXString;   
    function getDiagnosticFixIt(FixIt: Cardinal; ReplacementRange: PCXSourceRange): string;
  end;

  { CXDiagnosticDisplayOptionsHelper2 }

  CXDiagnosticDisplayOptionsHelper2 = type helper(CXDiagnosticDisplayOptionsHelper) for CXDiagnosticDisplayOptions
    class function defaultDiagnosticDisplayOptions: CXDiagnosticDisplayOptions; static;
  end;

  { CXTokenKindHelper2 }

  CXTokenKindHelper2 = type helper(CXTokenKindHelper) for CXTokenKind
  public const
    CXToken_Invalid = -1;
  public
    function Value: Integer;    
    function ToString(aShowKind: Boolean = True): string;
  end;

  { CXTokenHelper }

  (* CXToken layout:
  *   int_data[0]: a CXTokenKind
  *   int_data[1]: starting token location
  *   int_data[2]: token length
  *   int_data[3]: reserved
  *   ptr_data: for identifiers and keywords, an IdentifierInfo*.
  *   otherwise unused.
  *)

  CXTokenHelper = type helper for CXToken
    function getTokenKind: CXTokenKind;
    function getTokenSpellingCXString(tu: CXTranslationUnit): CXString;
    function getTokenSpelling(tu: CXTranslationUnit): string;
    function getTokenLocation(tu: CXTranslationUnit): CXSourceLocation;
    function getTokenExtent(tu: CXTranslationUnit): CXSourceRange;
  end;

  { CXEvalResultHelper }

  CXEvalResultHelper = type helper for CXEvalResult
    function getKind: CXEvalResultKind;
    function getAsInt: Integer;
    function getAsLongLong: Int64;
    function isUnsignedInt: Boolean;
    function getAsUnsigned: UInt64;
    function getAsDouble: Double;
    function getAsStrP: PChar;
    function getAsStr: string;
    procedure dispose;
  end;

  { CXRemappingHelper }

  CXRemappingHelper = type helper for CXRemapping
    class function getRemappingsP(const path: PChar): CXRemapping; static;     
    class function getRemappings(path: string): CXRemapping; static;
    class function getRemappingsFromFileList(filePaths: TStringArray): CXRemapping; static;
  public
    function getNumFiles: Cardinal;
    procedure getFilenames(index: Cardinal; original: PCXString = nil; transformed: PCXString = nil);
    procedure dispose;
  end;

  { CXIndexActionHelper }

  CXIndexActionHelper = type helper for CXIndexAction
    class function create(CIdx: CXIndex): CXIndexAction; static;
    procedure dispose;
    function indexSourceFile(
      client_data: CXClientData;
      index_callbacks: PIndexerCallbacks;
      index_callbacks_size: Cardinal;
      index_options: CXIndexOptFlags;
      source_filename: string;
      command_line_args: TStringArray;
      unsaved_files: PCXUnsavedFile;
      num_unsaved_files: Cardinal;     
      out_TU: PCXTranslationUnit;
      TU_options: CXTranslationUnit_Flags
      ): CXErrorCode;
    function indexTranslationUnit(
      client_data: CXClientData;
      index_callbacks: PIndexerCallbacks;
      index_callbacks_size: Cardinal;
      index_options: CXIndexOptFlags;
      TU: CXTranslationUnit
      ): Integer;
  end;

  { CXTUResourceUsageKindHelper2 }

  CXTUResourceUsageKindHelper2 = type helper(CXTUResourceUsageKindHelper) for CXTUResourceUsageKind
  public
    function getTUResourceUsageNameP: PChar; 
    function getTUResourceUsageName: string;
  end;

  { CXRefQualifierKindHelper2 }

  CXRefQualifierKindHelper2 = type helper(CXRefQualifierKindHelper) for CXRefQualifierKind
    function Value: Integer;
    function ToString: string;
  end;

  { CXLinkageKindHelper2 }

  CXLinkageKindHelper2 = type helper(CXLinkageKindHelper) for CXLinkageKind
    function Value: Integer;
    function ToString: string;
  end;

  { CXModuleHelper }

  CXModuleHelper = type helper for CXModule
    function getASTFile: CXFile;
    function getParent: CXModule;
    function getNameCXString: CXString;      
    function getName: string;
    function getFullNameCXString: CXString;   
    function getFullName: string;
    function isSystem: Boolean;
    function getNumTopLevelHeaders(tu: CXTranslationUnit): Cardinal;
    function getTopLevelHeader(tu: CXTranslationUnit; Index: Cardinal): CXFile;
  end;

  { CXIdxEntityKindHelper2 }

  CXIdxEntityKindHelper2 = type helper(CXIdxEntityKindHelper) for CXIdxEntityKind
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
    function isEntityObjCContainerKind: Boolean;
  end;

  { CXIdxEntityCXXTemplateKindHelper2 }

  CXIdxEntityCXXTemplateKindHelper2 = type helper(CXIdxEntityCXXTemplateKindHelper) for CXIdxEntityCXXTemplateKind
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

  { CXIdxDeclInfoHelper }

  CXIdxDeclInfoHelper = record helper for CXIdxDeclInfo
    function getObjCContainerDeclInfo: PCXIdxObjCContainerDeclInfo;
    function getCXXClassDeclInfo: PCXIdxCXXClassDeclInfo;
  end;

  { CXIdxLocHelper }

  CXIdxLocHelper = record helper for CXIdxLoc
    procedure getFileLocation(
      indexFile: PCXIdxClientFile;
      file_: PCXFile = nil;
      line: PCardinal = nil;
      column: PCardinal = nil;
      offset: PCardinal = nil
      );
  end;

  { CXIdxEntityRefKindHelper2 }

  CXIdxEntityRefKindHelper2 = type helper(CXIdxEntityRefKindHelper) for CXIdxEntityRefKind
    function Value: Integer;
    function ToString(aShowKind: Boolean = True): string;
  end;

  { CXCallingConvHelper2 }

  CXCallingConvHelper2 = type helper(CXCallingConvHelper) for CXCallingConv
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  { CXTypeNullabilityKindHelper2 }

  CXTypeNullabilityKindHelper2 = type helper(CXTypeNullabilityKindHelper) for CXTypeNullabilityKind
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  { CXCursor_ExceptionSpecificationKindHelper2 }

  CXCursor_ExceptionSpecificationKindHelper2 = type helper(CXCursor_ExceptionSpecificationKindHelper) for CXCursor_ExceptionSpecificationKind
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;
  
  { CXSourceRangeListHelper }

  CXSourceRangeListHelper = record helper for CXSourceRangeList
    class procedure disposeSourceRangeList(ranges: PCXSourceRangeList); static;
  end;

  { CXDiagnosticSeverityHelper2 }

  CXDiagnosticSeverityHelper2 = type helper(CXDiagnosticSeverityHelper) for CXDiagnosticSeverity
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  { CXIdxAttrKindHelper2 }

  CXIdxAttrKindHelper2 = type helper(CXIdxAttrKindHelper) for CXIdxAttrKind
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  { CX_StorageClassHelper2 }

  CX_StorageClassHelper2 = type helper(CX_StorageClassHelper) for CX_StorageClass
    function Value: Integer;
    function ToString(aShowType: Boolean = True): string;
  end;

  { CXPrintingPolicyHelper }

  CXPrintingPolicyHelper = type helper for CXPrintingPolicy
    function getProperty(Property_: CXPrintingPolicyProperty): Cardinal;
    procedure setProperty(Property_: CXPrintingPolicyProperty; Value: Cardinal);
    procedure dispose;
  end;

implementation

{ CXPrintingPolicyHelper }

function CXPrintingPolicyHelper.getProperty(Property_: CXPrintingPolicyProperty
  ): Cardinal;
begin
  Result := clang_PrintingPolicy_getProperty(Self, Property_);
end;

procedure CXPrintingPolicyHelper.setProperty(
  Property_: CXPrintingPolicyProperty; Value: Cardinal);
begin
  clang_PrintingPolicy_setProperty(Self, Property_, Value);
end;

procedure CXPrintingPolicyHelper.dispose;
begin
  clang_PrintingPolicy_dispose(Self);
  Self := nil;
end;

{ CXAvailabilityKindHelper2 }

function CXAvailabilityKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXAvailabilityKindHelper2.ToString: string;
begin
  case Self of
    CXAvailability_Available: Result := 'Available';
    CXAvailability_Deprecated: Result := 'Deprecated';
    CXAvailability_NotAvailable: Result := 'NotAvailable';
    CXAvailability_NotAccessible: Result := 'NotAccessible'; 
  else
    Result := 'Unknow';
  end;
end;

{ CXVisibilityKindHelper2 }

function CXVisibilityKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXVisibilityKindHelper2.ToString: string;
begin
  case Self of
    CXVisibility_Invalid: Result := 'Invalid';
    CXVisibility_Hidden: Result := 'Hidden';
    CXVisibility_Protected: Result := 'Protected';
    CXVisibility_Default: Result := 'Default';
  else
    Result := 'Unknow';
  end;
end;

{ CX_StorageClassHelper2 }

function CX_StorageClassHelper2.Value: Integer;
begin
  Result := Self;
end;

function CX_StorageClassHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CX_SC_Invalid: Result := 'Invalid';
    CX_SC_None: Result := 'None';
    CX_SC_Extern: Result := 'Extern';
    CX_SC_Static: Result := 'Static';
    CX_SC_PrivateExtern: Result := 'PrivateExtern';
    CX_SC_OpenCLWorkGroupLocal: Result := 'OpenCLWorkGroupLocal';
    CX_SC_Auto: Result := 'Auto';
    CX_SC_Register: Result := 'Register';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXIdxAttrKindHelper2 }

function CXIdxAttrKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXIdxAttrKindHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CXIdxAttr_Unexposed: Result := 'Unexposed';
    CXIdxAttr_IBAction: Result := 'IBAction';
    CXIdxAttr_IBOutlet: Result := 'IBOutlet';
    CXIdxAttr_IBOutletCollection: Result := 'IBOutletCollection';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXDiagnosticSeverityHelper2 }

function CXDiagnosticSeverityHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXDiagnosticSeverityHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CXDiagnostic_Ignored: Result := 'Ignored';
    CXDiagnostic_Note: Result := 'Note';
    CXDiagnostic_Warning: Result := 'Warning';
    CXDiagnostic_Error: Result := 'Error';
    CXDiagnostic_Fatal: Result := 'Fatal';
  else
    Result := 'Unknow';
  end;    
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXSourceRangeListHelper }

class procedure CXSourceRangeListHelper.disposeSourceRangeList(
  ranges: PCXSourceRangeList);
begin
  clang_disposeSourceRangeList(ranges);
end;

{ CXCursor_ExceptionSpecificationKindHelper2 }

function CXCursor_ExceptionSpecificationKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXCursor_ExceptionSpecificationKindHelper2.ToString(aShowType: Boolean
  ): string;
begin
  case self of
    CXCursor_ExceptionSpecificationKind_Invalid: Result := 'Invalid';
    CXCursor_ExceptionSpecificationKind_None: Result := 'None';
    CXCursor_ExceptionSpecificationKind_DynamicNone: Result := 'DynamicNone';
    CXCursor_ExceptionSpecificationKind_Dynamic: Result := 'Dynamic';
    CXCursor_ExceptionSpecificationKind_MSAny: Result := 'MSAny';
    CXCursor_ExceptionSpecificationKind_BasicNoexcept: Result := 'BasicNoexcept';
    CXCursor_ExceptionSpecificationKind_ComputedNoexcept: Result := 'ComputedNoexcept';
    CXCursor_ExceptionSpecificationKind_Unevaluated: Result := 'Unevaluated';
    CXCursor_ExceptionSpecificationKind_Uninstantiated: Result := 'Uninstantiated';
    CXCursor_ExceptionSpecificationKind_Unparsed: Result := 'Unparsed';
    CXCursor_ExceptionSpecificationKind_NoThrow: Result := 'NoThrow';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXTypeNullabilityKindHelper2 }

function CXTypeNullabilityKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXTypeNullabilityKindHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CXTypeNullability_NonNull: Result := 'NonNull';
    CXTypeNullability_Nullable: Result := 'Nullable';
    CXTypeNullability_Unspecified: Result := 'Unspecified';
    CXTypeNullability_Invalid: Result := 'Invalid';
    CXTypeNullability_NullableResult: Result := 'NullableResult';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXCallingConvHelper2 }

function CXCallingConvHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXCallingConvHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CXCallingConv_Default: Result := 'Default';
    CXCallingConv_C: Result := 'C';
    CXCallingConv_X86StdCall: Result := 'X86StdCall';
    CXCallingConv_X86FastCall: Result := 'X86FastCall';
    CXCallingConv_X86ThisCall: Result := 'X86ThisCall';
    CXCallingConv_X86Pascal: Result := 'X86Pascal';
    CXCallingConv_AAPCS: Result := 'AAPCS';
    CXCallingConv_AAPCS_VFP: Result := 'AAPCS_VFP';
    CXCallingConv_X86RegCall: Result := 'X86RegCall';
    CXCallingConv_IntelOclBicc: Result := 'IntelOclBicc';
    CXCallingConv_Win64: Result := 'Win64';
    //CXCallingConv_X86_64Win64 = CXCallingConv_Win64;
    CXCallingConv_X86_64SysV: Result := 'X86_64SysV';
    CXCallingConv_X86VectorCall: Result := 'X86VectorCall';
    CXCallingConv_Swift: Result := 'Swift';
    CXCallingConv_PreserveMost: Result := 'PreserveMost';
    CXCallingConv_PreserveAll: Result := 'PreserveAll';
    CXCallingConv_AArch64VectorCall: Result := 'AArch64VectorCall';
    CXCallingConv_SwiftAsync: Result := 'SwiftAsync';

    CXCallingConv_Invalid: Result := 'Invalid';
    CXCallingConv_Unexposed: Result := 'Unexposed';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXIdxEntityRefKindHelper2 }

function CXIdxEntityRefKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXIdxEntityRefKindHelper2.ToString(aShowKind: Boolean): string;
begin
  case Self of
    CXIdxEntityRef_Direct: Result := 'Direct';
    CXIdxEntityRef_Implicit: Result := 'Implicit';
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXIdxLocHelper }

procedure CXIdxLocHelper.getFileLocation(indexFile: PCXIdxClientFile;
  file_: PCXFile; line: PCardinal; column: PCardinal; offset: PCardinal);
begin
  clang_indexLoc_getFileLocation(Self, indexFile, file_, line, column, offset);
end;

{ CXIdxDeclInfoHelper }

function CXIdxDeclInfoHelper.getObjCContainerDeclInfo: PCXIdxObjCContainerDeclInfo;
begin
  Result := clang_index_getObjCContainerDeclInfo(@Self);
end;

function CXIdxDeclInfoHelper.getCXXClassDeclInfo: PCXIdxCXXClassDeclInfo;
begin
  Result := clang_index_getCXXClassDeclInfo(@Self);
end;

{ CXIdxEntityCXXTemplateKindHelper2 }

function CXIdxEntityCXXTemplateKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXIdxEntityCXXTemplateKindHelper2.ToString(aShowKind: Boolean): string;
begin
  case Self of
    CXIdxEntity_NonTemplate: Result := 'NonTemplate';
    CXIdxEntity_Template: Result := 'Template';
    CXIdxEntity_TemplatePartialSpecialization: Result := 'TemplatePartialSpecialization';
    CXIdxEntity_TemplateSpecialization: Result := 'TemplateSpecialization';
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXIdxEntityKindHelper2 }

function CXIdxEntityKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXIdxEntityKindHelper2.ToString(aShowKind: Boolean): string;
begin
  case self of
    CXIdxEntity_Unexposed: Result := 'Unexposed';
    CXIdxEntity_Typedef: Result := 'Typedef';
    CXIdxEntity_Function: Result := 'Function';
    CXIdxEntity_Variable: Result := 'Variable';
    CXIdxEntity_Field: Result := 'Field';
    CXIdxEntity_EnumConstant: Result := 'EnumConstant';

    CXIdxEntity_ObjCClass: Result := 'ObjCClass';
    CXIdxEntity_ObjCProtocol: Result := 'ObjCProtocol';
    CXIdxEntity_ObjCCategory: Result := 'ObjCCategory';

    CXIdxEntity_ObjCInstanceMethod: Result := 'ObjCInstanceMethod';
    CXIdxEntity_ObjCClassMethod: Result := 'ObjCClassMethod';
    CXIdxEntity_ObjCProperty: Result := 'ObjCProperty';
    CXIdxEntity_ObjCIvar: Result := 'ObjCIvar';

    CXIdxEntity_Enum: Result := 'Enum';
    CXIdxEntity_Struct: Result := 'Struct';
    CXIdxEntity_Union: Result := 'Union';

    CXIdxEntity_CXXClass: Result := 'CXXClass';
    CXIdxEntity_CXXNamespace: Result := 'CXXNamespace';
    CXIdxEntity_CXXNamespaceAlias: Result := 'CXXNamespaceAlias';
    CXIdxEntity_CXXStaticVariable: Result := 'CXXStaticVariable';
    CXIdxEntity_CXXStaticMethod: Result := 'CXXStaticMethod';
    CXIdxEntity_CXXInstanceMethod: Result := 'CXXInstanceMethod';
    CXIdxEntity_CXXConstructor: Result := 'CXXConstructor';
    CXIdxEntity_CXXDestructor: Result := 'CXXDestructor';
    CXIdxEntity_CXXConversionFunction: Result := 'CXXConversionFunction';
    CXIdxEntity_CXXTypeAlias: Result := 'CXXTypeAlias';
    CXIdxEntity_CXXInterface: Result := 'CXXInterface';
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function CXIdxEntityKindHelper2.isEntityObjCContainerKind: Boolean;
begin
  Result := clang_index_isEntityObjCContainerKind(Self) <> 0;
end;

{ CXDiagnosticSetHelper }

function CXDiagnosticSetHelper.getNumDiagnosticsInSet: Cardinal;
begin
  Result := clang_getNumDiagnosticsInSet(Self);
end;

function CXDiagnosticSetHelper.getDiagnosticInSet(Index: Cardinal): CXDiagnostic;
begin
  Result := clang_getDiagnosticInSet(Self, Index);
end;

class function CXDiagnosticSetHelper.loadDiagnostics(file_: string;
  error: PCXLoadDiag_Error; errorString: PString): CXDiagnosticSet;
var
  cs: CXString;
  pCs: PCXString;
begin
  if Assigned(errorString) then
    pCs := @cs
  else
    pCs := nil;
  Result := clang_loadDiagnostics(PChar(file_), error, pCs);
  if Assigned(errorString) then
    errorString^ := cs.ToString;
end;

procedure CXDiagnosticSetHelper.disposeDiagnosticSet;
begin
  clang_disposeDiagnosticSet(Self);
end;

{ CXModuleHelper }

function CXModuleHelper.getASTFile: CXFile;
begin
  Result := clang_Module_getASTFile(Self);
end;

function CXModuleHelper.getParent: CXModule;
begin
  Result := clang_Module_getParent(Self);
end;

function CXModuleHelper.getNameCXString: CXString;
begin
  Result := clang_Module_getName(Self);
end;

function CXModuleHelper.getName: string;
begin
  Result := clang_Module_getName(Self).ToString;
end;

function CXModuleHelper.getFullNameCXString: CXString;
begin
  Result := clang_Module_getFullName(Self);
end;

function CXModuleHelper.getFullName: string;
begin
  Result := clang_Module_getFullName(Self).ToString;
end;

function CXModuleHelper.isSystem: Boolean;
begin
  Result := clang_Module_isSystem(Self) <> 0;
end;

function CXModuleHelper.getNumTopLevelHeaders(tu: CXTranslationUnit): Cardinal;
begin
  Result := clang_Module_getNumTopLevelHeaders(tu, Self);
end;

function CXModuleHelper.getTopLevelHeader(tu: CXTranslationUnit; Index: Cardinal
  ): CXFile;
begin
  Result := clang_Module_getTopLevelHeader(tu, Self, Index);
end;

{ CXLinkageKindHelper2 }

function CXLinkageKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXLinkageKindHelper2.ToString: string;
begin
  case Self of
    CXLinkage_Invalid: Result := 'Invalid';
    CXLinkage_NoLinkage: Result := 'NoLinkage';
    CXLinkage_UniqueExternal: Result := 'UniqueExternal';
    CXLinkage_External: Result := 'External';
  else
    Result := 'Unknow';
  end;
  Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXRefQualifierKindHelper2 }

function CXRefQualifierKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXRefQualifierKindHelper2.ToString: string;
begin
  case Self of
    CXRefQualifier_None: Result := 'None';
    CXRefQualifier_LValue: Result := 'LValue';
    CXRefQualifier_RValue: Result := 'RValue';
  else
    Result := 'Unknow';
  end;
  Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXErrorCodeHelper2 }

function CXErrorCodeHelper2.ToInteger: Integer;
begin
  Result := Self;
end;

function CXErrorCodeHelper2.ErrorName: string;
begin
  case Self of
    CXErrorCode.CXError_Success: Result := 'Success';   
    CXErrorCode.CXError_Failure: Result := 'Failure';
    CXErrorCode.CXError_Crashed: Result := 'Crashed';
    CXErrorCode.CXError_InvalidArguments: Result := 'InvalidArguments';
    CXErrorCode.CXError_ASTReadError: Result := 'ASTReadError';
  else
    Result := 'Unknown';
  end;
end;

{ CXTUResourceUsageKindHelper2 }

function CXTUResourceUsageKindHelper2.getTUResourceUsageNameP: PChar;
begin
  Result := clang_getTUResourceUsageName(Self);
end;

function CXTUResourceUsageKindHelper2.getTUResourceUsageName: string;
var
  p: PChar;
begin
  p := clang_getTUResourceUsageName(Self);
  if Assigned(p) then
    Result := StrPas(p)
  else
    Result := EmptyStr;
end;

{ CXTranslationUnit_Flags_Helper2 }

class function CXTranslationUnit_Flags_Helper2.defaultEditingTranslationUnitOptions: CXTranslationUnit_Flags;
begin
  Result := clang_defaultEditingTranslationUnitOptions;
end;

function CXTranslationUnit_Flags_Helper2.Value: Cardinal;
begin
  Result := Self;
end;

{ LibCLang }

class procedure LibCLang.enableStackTraces;
begin
  clang_enableStackTraces;
end;

class procedure LibCLang.executeOnThread(fn: clang_threadRoutine;
  user_data: Pointer; stack_size: Cardinal);
begin
  clang_executeOnThread(fn, user_data, stack_size);
end;

class function LibCLang.getClangVersionCXString: CXString;
begin
  Result := clang_getClangVersion;
end;

class function LibCLang.getClangVersion: string;
begin
  Result := clang_getClangVersion.ToString;
end;

class procedure LibCLang.toggleCrashRecovery(isEnabled: Boolean);
begin
  clang_toggleCrashRecovery(isEnabled.ToInteger);
end;

{ CXTokenKindHelper2 }

function CXTokenKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXTokenKindHelper2.ToString(aShowKind: Boolean): string;
begin
  case Self of                              
    CXToken_Invalid: Result := 'Invalid';
    CXToken_Punctuation: Result := 'Punctuation';
    CXToken_Keyword: Result := 'Keyword';
    CXToken_Identifier: Result := 'Identifier';
    CXToken_Literal: Result := 'Literal';
    CXToken_Comment: Result := 'Comment';
  else
    Result := 'Unknow';
  end;
  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

{ CXTokenHelper }

function CXTokenHelper.getTokenKind: CXTokenKind;
begin
  Result := clang_getTokenKind(Self);
end;

function CXTokenHelper.getTokenSpellingCXString(tu: CXTranslationUnit
  ): CXString;
begin
  Result := tu.getTokenSpellingCXString(Self);
end;

function CXTokenHelper.getTokenSpelling(tu: CXTranslationUnit): string;
begin
  Result := tu.getTokenSpelling(Self);
end;

function CXTokenHelper.getTokenLocation(tu: CXTranslationUnit
  ): CXSourceLocation;
begin
  Result := tu.getTokenLocation(Self);
end;

function CXTokenHelper.getTokenExtent(tu: CXTranslationUnit): CXSourceRange;
begin
  Result := tu.getTokenExtent(Self);
end;

{ CXSourceRangeHelper }

class function CXSourceRangeHelper.getNullRange: CXSourceRange;
begin
  Result := clang_getNullRange;
end;

function CXSourceRangeHelper.equalRanges(const other: PCXSourceRange): Boolean;
begin
  Result := clang_equalRanges(Self, other^) <> 0;
end;

function CXSourceRangeHelper.isNull: Boolean;
begin
  Result := clang_Range_isNull(Self) <> 0;
end;

function CXSourceRangeHelper.getRangeStart: CXSourceLocation;
begin
  Result := clang_getRangeStart(Self);
end;

function CXSourceRangeHelper.getRangeEnd: CXSourceLocation;
begin
  Result := clang_getRangeEnd(Self);
end;

procedure CXSourceRangeHelper.tokenize(tu: CXTranslationUnit; out
  Tokens: PCXToken; out NumTokens: Cardinal);
begin
  tu.tokenize(Self, Tokens, NumTokens);
end;

class function CXSourceRangeHelper.CreateRange(begin_: CXSourceLocation;
  end_: CXSourceLocation): CXSourceRange;
begin
  Result := clang_getRange(begin_, end_);
end;

{ CXIndexHelper }

class function CXIndexHelper.Create(excludeDeclarationsFromPCH: Boolean;
  displayDiagnostics: Boolean): CXIndex;
begin
  Result := clang_createIndex(excludeDeclarationsFromPCH.ToInteger, displayDiagnostics.ToInteger);
end;

procedure CXIndexHelper.disposeIndex;
begin
  clang_disposeIndex(Self);
end;

procedure CXIndexHelper.setGlobalOptions(options: CXGlobalOptFlags);
begin
  clang_CXIndex_setGlobalOptions(Self, options);
end;

function CXIndexHelper.getGlobalOptions: CXGlobalOptFlags;
begin
  Result := clang_CXIndex_getGlobalOptions(Self);
end;

procedure CXIndexHelper.setInvocationEmissionPathOptionP(const Path: PChar);
begin
  clang_CXIndex_setInvocationEmissionPathOption(Self, Path);
end;

procedure CXIndexHelper.setInvocationEmissionPathOption(Path: string);
begin
  clang_CXIndex_setInvocationEmissionPathOption(Self, PChar(Path));
end;

function CXIndexHelper.createTranslationUnitFromSourceFile(
  const source_filename: string; clang_command_line_args: TStringArray;
  num_unsaved_files: Cardinal; unsaved_files: PCXUnsavedFile): CXTranslationUnit;
var
  pArgs: array of PChar;
  argsLength, i: Integer;
  ppArgs: PPChar;
  pFileName: PChar;
begin
  argsLength := Length(clang_command_line_args);
  if argsLength > 0  then
  begin
    SetLength(pArgs{%H-}, argsLength);
    for i := 0 to argsLength - 1 do
      pArgs[i] := PChar(clang_command_line_args[i]);
    ppArgs := PPChar(@pArgs[0]);
  end
  else
    ppArgs := nil;

  if not source_filename.IsEmpty then
    pFileName := PChar(source_filename)
  else
    pFileName := nil;

  Result := clang_createTranslationUnitFromSourceFile(
    Self,
    pFileName,
    argsLength,
    ppArgs,
    num_unsaved_files,
    unsaved_files
    );
end;

function CXIndexHelper.createTranslationUnit(ast_filename: string
  ): CXTranslationUnit;
begin
  Result := clang_createTranslationUnit(Self, PChar(ast_filename));
end;

function CXIndexHelper.createTranslationUnit2(ast_filename: string; out
  out_TU: CXTranslationUnit): CXErrorCode;
begin
  Result := clang_createTranslationUnit2(Self, PChar(ast_filename), out_TU);
end;

function CXIndexHelper.parseTranslationUnit(source_filename: string;
  command_line_args: TStringArray; const unsaved_files: PCXUnsavedFile;
  num_unsaved_files: Cardinal; options: CXTranslationUnit_Flags): CXTranslationUnit;
var
  pArgs: array of PChar;
  argsLength, i: Integer;
  ppArgs: PPChar;
  pFileName: PChar;
begin
  argsLength := Length(command_line_args);
  if argsLength > 0  then
  begin
    SetLength(pArgs{%H-}, argsLength);
    for i := 0 to argsLength - 1 do
      pArgs[i] := PChar(command_line_args[i]);
    ppArgs := PPChar(@pArgs[0]);
  end
  else
    ppArgs := nil;

  if not source_filename.IsEmpty then
    pFileName := PChar(source_filename)
  else
    pFileName := nil;

  Result := clang_parseTranslationUnit(
    Self,
    pFileName,
    ppArgs,
    argsLength,
    unsaved_files,
    num_unsaved_files,
    options
    );
end;

function CXIndexHelper.parseTranslationUnit2(source_filename: string;
  command_line_args: TStringArray; const unsaved_files: PCXUnsavedFile;
  num_unsaved_files: Cardinal; options: CXTranslationUnit_Flags; out
  out_TU: CXTranslationUnit): CXErrorCode;
var
  pArgs: array of PChar;
  argsLength, i: Integer;
  ppArgs: PPChar;
  pFileName: PChar;
begin
  argsLength := Length(command_line_args);
  if argsLength > 0  then
  begin
    SetLength(pArgs{%H-}, argsLength);
    for i := 0 to argsLength - 1 do
      pArgs[i] := PChar(command_line_args[i]);
    ppArgs := PPChar(@pArgs[0]);
  end
  else
    ppArgs := nil;

  if not source_filename.IsEmpty then
    pFileName := PChar(source_filename)
  else
    pFileName := nil;

  Result := clang_parseTranslationUnit2(
    Self,
    pFileName,
    ppArgs,
    argsLength,
    unsaved_files,
    num_unsaved_files,
    options,
    out_TU
    );
end;

function CXIndexHelper.parseTranslationUnit2FullArgv(source_filename: string;
  command_line_args: TStringArray; unsaved_files: PCXUnsavedFile;
  num_unsaved_files: Cardinal; options: CXTranslationUnit_Flags; out
  out_TU: CXTranslationUnit): CXErrorCode;
var
  pArgs: array of PChar;
  argsLength, i: Integer;
  ppArgs: PPChar;
  pFileName: PChar;
begin
  argsLength := Length(command_line_args);
  if argsLength > 0  then
  begin
    SetLength(pArgs{%H-}, argsLength);
    for i := 0 to argsLength - 1 do
      pArgs[i] := PChar(command_line_args[i]);
    ppArgs := PPChar(@pArgs[0]);
  end
  else
    ppArgs := nil;

  if not source_filename.IsEmpty then
    pFileName := PChar(source_filename)
  else
    pFileName := nil;

  Result := clang_parseTranslationUnit2FullArgv(
    Self,
    pFileName,
    ppArgs,
    argsLength,
    unsaved_files,
    num_unsaved_files,
    options,
    out_TU
    );
end;

function CXIndexHelper.IndexAction_create: CXIndexAction;
begin
  Result := clang_IndexAction_create(Self);
end;

{ CXFileHelper }

function CXFileHelper.getFileNameCXString: CXString;
begin
  Result := clang_getFileName(Self);
end;

function CXFileHelper.getFileName: string;
begin
  Result := clang_getFileName(Self).ToString;
end;

function CXFileHelper.getFileTime: time_t;
begin
  Result := clang_getFileTime(Self);
end;

function CXFileHelper.isEqual(const other: PCXFile): Boolean;
begin
  Result := clang_File_isEqual(Self, other^) <> 0;
end;

function CXFileHelper.tryGetRealPathNameCXString: CXString;
begin
  Result := clang_File_tryGetRealPathName(Self);
end;

function CXFileHelper.tryGetRealPathName: string;
begin
  Result := clang_File_tryGetRealPathName(Self).ToString;
end;

function CXFileHelper.getLocation(tu: CXTranslationUnit; line: Cardinal;
  column: Cardinal): CXSourceLocation;
begin
  Result := tu.getLocation(Self, line, column);
end;

function CXFileHelper.getLocationForOffset(tu: CXTranslationUnit; offset: Cardinal
  ): CXSourceLocation;
begin
  Result := tu.getLocationForOffset(Self, offset);
end;

{ CXTranslationUnitHelper }

function CXTranslationUnitHelper.defaultSaveOptions: CXSaveTranslationUnit_Flags;
begin
  Result := clang_defaultSaveOptions(Self);
end;

function CXTranslationUnitHelper.saveTranslationUnit(FileName: string;
  options: CXSaveTranslationUnit_Flags): CXSaveError;
begin
  Result := clang_saveTranslationUnit(Self, PChar(FileName), options);
end;

function CXTranslationUnitHelper.suspendTranslationUnit: CXErrorCode;
begin
  Result := clang_suspendTranslationUnit(Self);
end;

procedure CXTranslationUnitHelper.disposeTranslationUnit;
begin
  clang_disposeTranslationUnit(Self);
end;

function CXTranslationUnitHelper.defaultReparseOptions: CXReparse_Flags;
begin
  Result := clang_defaultReparseOptions(Self);
end;

function CXTranslationUnitHelper.reparseTranslationUnit(
  num_unsaved_files: Cardinal; unsaved_files: PCXUnsavedFile;
  options: CXReparse_Flags): CXErrorCode;
begin
  Result := clang_reparseTranslationUnit(Self, num_unsaved_files, unsaved_files, options);
end;

function CXTranslationUnitHelper.getCXTUResourceUsage: CXTUResourceUsage;
begin
  Result := clang_getCXTUResourceUsage(Self);
end;

function CXTranslationUnitHelper.getTranslationUnitTargetInfo: CXTargetInfo;
begin
  Result := clang_getTranslationUnitTargetInfo(Self);
end;

function CXTranslationUnitHelper.getTranslationUnitCursor: CXCursor;
begin
  Result := clang_getTranslationUnitCursor(Self);
end;

function CXTranslationUnitHelper.getNumDiagnostics: Cardinal;
begin
  Result := clang_getNumDiagnostics(Self);
end;

function CXTranslationUnitHelper.getDiagnostic(Index: Cardinal): CXDiagnostic;
begin
  Result := clang_getDiagnostic(Self, Index);
end;

type
  TInternal_CXInclusionVisitor_Event = record
    event: TCXInclusionVisitorEvent;
    client_data: CXClientData;
    args: TCXClientDataArray;
  end;
  PInternal_CXInclusionVisitor_Event = ^TInternal_CXInclusionVisitor_Event;

procedure _Internal_CXInclusionVisitor(
  included_file: CXFile;
  inclusion_stack: PCXSourceLocation;
  include_len: Cardinal;
  client_data: CXClientData
  ); cdecl;
var
  e: PInternal_CXInclusionVisitor_Event absolute client_data;
begin
  e^.event(included_file, inclusion_stack, include_len, e^.client_data, e^.args);
end;

procedure CXTranslationUnitHelper.getInclusions(
  event: TCXInclusionVisitorEvent; const client_data: CXClientData;
  args: TCXClientDataArray);
var
  e: TInternal_CXInclusionVisitor_Event;
begin
  e.client_data := client_data;
  e.event := event;
  e.args := args;
  clang_getInclusions(Self, @_Internal_CXInclusionVisitor, @e);
end;

function CXTranslationUnitHelper.isFileMultipleIncludeGuarded(file_: CXFile): Cardinal;
begin
  Result := clang_isFileMultipleIncludeGuarded(Self, file_);
end;

function CXTranslationUnitHelper.getFile(filename: string): CXFile;
begin
  Result := clang_getFile(Self, PChar(filename));
end;

function CXTranslationUnitHelper.getFileP(const filename: PChar): CXFile;
begin
  Result := clang_getFile(Self, filename);
end;

function CXTranslationUnitHelper.getFileContents(file_: CXFile; size: PCX_SIZE_T
  ): PByte;
begin
  Result := PByte(clang_getFileContents(Self, file_, size));
end;

function CXTranslationUnitHelper.getLocation(file_: CXFile; line: Cardinal;
  column: Cardinal): CXSourceLocation;
begin
  Result := clang_getLocation(Self, file_, line, column);
end;

function CXTranslationUnitHelper.getLocationForOffset(file_: CXFile;
  offset: Cardinal): CXSourceLocation;
begin
  Result := clang_getLocationForOffset(Self, file_, offset);
end;

function CXTranslationUnitHelper.getToken(Location: CXSourceLocation): CXToken;
begin
  Result := clang_getToken(Self, Location);
end;

function CXTranslationUnitHelper.getTokenSpellingCXString(token: CXToken
  ): CXString;
begin
  Result := clang_getTokenSpelling(Self, token);
end;

function CXTranslationUnitHelper.getTokenSpelling(token: CXToken): string;
begin
  Result := clang_getTokenSpelling(Self, token).ToString;
end;

function CXTranslationUnitHelper.getTokenLocation(token: CXToken
  ): CXSourceLocation;
begin
  Result := clang_getTokenLocation(Self, token);
end;

function CXTranslationUnitHelper.getTokenExtent(token: CXToken): CXSourceRange;
begin
  Result := clang_getTokenExtent(Self, token);
end;

procedure CXTranslationUnitHelper.tokenize(Range: CXSourceRange; out
  Tokens: PCXToken; out NumTokens: Cardinal);
begin
  clang_tokenize(Self, Range, @Tokens, @NumTokens);
end;

procedure CXTranslationUnitHelper.annotateTokens(Tokens: PCXToken;
  NumTokens: Cardinal; Cursors: PCXCursor);
begin
  clang_annotateTokens(Self, Tokens, NumTokens, Cursors);
end;

procedure CXTranslationUnitHelper.disposeTokens(Tokens: PCXToken;
  NumTokens: Cardinal);
begin
  clang_disposeTokens(Self, Tokens, NumTokens);
end;

function CXTranslationUnitHelper.getSkippedRanges(file_: CXFile
  ): PCXSourceRangeList;
begin
  Result := clang_getSkippedRanges(Self, file_);
end;

function CXTranslationUnitHelper.getAllSkippedRanges: PCXSourceRangeList;
begin
  Result := clang_getAllSkippedRanges(Self);
end;

function CXTranslationUnitHelper.getCursor(sl: CXSourceLocation): CXCursor;
begin
  Result := clang_getCursor(Self, sl);
end;

function CXTranslationUnitHelper.getModuleForFile(file_: CXFile): CXModule;
begin
  Result := clang_getModuleForFile(Self, file_);
end;

{ CXTUResourceUsageHelper }

procedure CXTUResourceUsageHelper.disposeCXTUResourceUsage;
begin
  clang_disposeCXTUResourceUsage(Self);
end;

{ CXTargetInfoHelper }

procedure CXTargetInfoHelper.dispose;
begin
  clang_TargetInfo_dispose(Self);
end;

function CXTargetInfoHelper.getTripleCXString: CXString;
begin
  Result := clang_TargetInfo_getTriple(Self);
end;

function CXTargetInfoHelper.getTriple: string;
begin
  Result := clang_TargetInfo_getTriple(Self).ToString;
end;

function CXTargetInfoHelper.getPointerWidth: Integer;
begin
  Result := clang_TargetInfo_getPointerWidth(Self);
end;

{ CXSourceLocationHelper }

class function CXSourceLocationHelper.getNullLocation: CXSourceLocation;
begin
  Result := clang_getNullLocation;
end;

function CXSourceLocationHelper.IsNullLocation: Boolean;
begin
  Result := clang_equalLocations(Self, CXSourceLocation.getNullLocation) <> 0;
end;

function CXSourceLocationHelper.equalLocations(const other: PCXSourceLocation
  ): Boolean;
begin
  Result := clang_equalLocations(Self, other^) <> 0;
end;

function CXSourceLocationHelper.isInSystemHeader: Boolean;
begin
  Result := clang_Location_isInSystemHeader(Self) <> 0;
end;

function CXSourceLocationHelper.isFromMainFile: Boolean;
begin
  Result := clang_Location_isFromMainFile(Self) <> 0;
end;

class function CXSourceLocationHelper.getRange(begin_: CXSourceLocation;
  end_: CXSourceLocation): CXSourceRange;
begin
  Result := clang_getRange(begin_, end_);
end;

procedure CXSourceLocationHelper.getExpansionLocation(file_: PCXFile;
  line: PCardinal; column: PCardinal; offset: PCardinal);
begin
  clang_getExpansionLocation(Self, file_, line, column, offset);
end;

procedure CXSourceLocationHelper.getPresumedLocation(filename: PString;
  line: PCardinal; column: PCardinal);
var
  f: CXString;
  pF: PCXString;
begin
  if Assigned(filename) then
  begin
    f := Default(CXString);
    pF := @f;
  end;
  clang_getPresumedLocation(Self, pF, line, column);
  if Assigned(filename) then
    filename^ := f.ToString;
end;

procedure CXSourceLocationHelper.getInstantiationLocation(file_: PCXFile;
  line: PCardinal; column: PCardinal; offset: PCardinal);
begin
  clang_getInstantiationLocation(Self, file_, line, column, offset);
end;

procedure CXSourceLocationHelper.getSpellingLocation(file_: PCXFile;
  line: PCardinal; column: PCardinal; offset: PCardinal);
begin
  clang_getSpellingLocation(Self, file_, line, column, offset);
end;

procedure CXSourceLocationHelper.getFileLocation(file_: PCXFile; line: PCardinal;
  column: PCardinal; offset: PCardinal);
begin
  clang_getFileLocation(Self, file_, line, column, offset);
end;

function CXSourceLocationHelper.getCursor(tu: CXTranslationUnit): CXCursor;
begin
  Result := tu.getCursor(Self);
end;

function CXSourceLocationHelper.getToken(tu: CXTranslationUnit): CXToken;
begin
  Result := tu.getToken(Self);
end;

{$region 'CXCursorHelper'}

{ CXCursorHelper }

class function CXCursorHelper.Create(const src: PCXCursor): PCXCursor;
begin
  new(Result);
  //Move(src^, Result^, SizeOf(CXCursor));
  Result^ := src^;
end;

class function CXCursorHelper.getNullCursor: CXCursor;
begin
  Result := clang_getNullCursor;
end;

function CXCursorHelper.isNull: Boolean;
begin
  Result := clang_Cursor_isNull(Self) <> 0;
end;

function CXCursorHelper.equalCursors(const other: PCXCursor): Boolean;
begin
  Result := clang_equalCursors(Self, other^) <> 0;
end;

function CXCursorHelper.hashCursor: Cardinal;
begin
  Result := clang_hashCursor(Self);
end;

function CXCursorHelper.getCursorKind: CXCursorKind;
begin
  Result := clang_getCursorKind(Self);
end;

function CXCursorHelper.isInvalidDeclaration: Boolean;
begin
  Result := clang_isInvalidDeclaration(Self) <> 0;
end;

function CXCursorHelper.hasAttrs: Boolean;
begin
  Result := clang_Cursor_hasAttrs(Self) <> 0;
end;

function CXCursorHelper.getCursorLinkage: CXLinkageKind;
begin
  Result := clang_getCursorLinkage(Self);
end;

function CXCursorHelper.getCursorVisibility: CXVisibilityKind;
begin
  Result := clang_getCursorVisibility(Self);
end;

function CXCursorHelper.getCursorAvailability: CXAvailabilityKind;
begin
  Result := clang_getCursorAvailability(Self);
end;

function CXCursorHelper.getCursorPlatformAvailability(
  always_deprecated: PInteger; deprecated_message: PCXString;
  always_unavailable: PInteger; unavailable_message: PCXString;
  availability: PCXPlatformAvailability; availability_size: Integer): Integer;
begin
  Result := clang_getCursorPlatformAvailability(
    Self,
    always_deprecated,
    deprecated_message,
    always_unavailable,
    unavailable_message,
    availability,
    availability_size
    );
end;

function CXCursorHelper.getVarDeclInitializer: CXCursor;
begin
  Result := clang_Cursor_getVarDeclInitializer(Self);
end;

function CXCursorHelper.hasVarDeclGlobalStorage: TVarDeclStorage;
begin
  Result := clang_Cursor_hasVarDeclGlobalStorage(Self);
end;

function CXCursorHelper.hasVarDeclExternalStorage: TVarDeclStorage;
begin
  Result := clang_Cursor_hasVarDeclExternalStorage(Self);
end;

function CXCursorHelper.getCursorLanguage: CXLanguageKind;
begin
  Result := clang_getCursorLanguage(Self);
end;

function CXCursorHelper.getCursorTLSKind: CXTLSKind;
begin
  Result := clang_getCursorTLSKind(Self);
end;

function CXCursorHelper.getTranslationUnit: CXTranslationUnit;
begin
  Result := clang_Cursor_getTranslationUnit(Self);
end;

function CXCursorHelper.getCursorSemanticParent: CXCursor;
begin
  Result := clang_getCursorSemanticParent(Self);
end;

function CXCursorHelper.getCursorLexicalParent: CXCursor;
begin
  Result := clang_getCursorLexicalParent(Self);
end;

procedure CXCursorHelper.getOverriddenCursors(out overridden: PCXCursor; out
  num_overridden: Cardinal);
begin
  clang_getOverriddenCursors(Self, overridden, num_overridden);
end;

class procedure CXCursorHelper.disposeOverriddenCursors(overridden: PCXCursor);
begin
  clang_disposeOverriddenCursors(overridden);
end;

function CXCursorHelper.getIncludedFile: CXFile;
begin
  Result := clang_getIncludedFile(Self);
end;

function CXCursorHelper.getCursorLocation: CXSourceLocation;
begin
  Result := clang_getCursorLocation(Self);
end;

function CXCursorHelper.getCursorExtent: CXSourceRange;
begin
  Result := clang_getCursorExtent(Self);
end;

function CXCursorHelper.getCursorType: CXType;
begin
  Result := clang_getCursorType(Self);
end;

function CXCursorHelper.getTypedefDeclUnderlyingType: CXType;
begin
  Result := clang_getTypedefDeclUnderlyingType(Self);
end;

function CXCursorHelper.getEnumDeclIntegerType: CXType;
begin
  Result := clang_getEnumDeclIntegerType(Self);
end;

function CXCursorHelper.getEnumConstantDeclValue: Int64;
begin
  Result := clang_getEnumConstantDeclValue(Self);
end;

function CXCursorHelper.getEnumConstantDeclUnsignedValue: UInt64;
begin
  Result := clang_getEnumConstantDeclUnsignedValue(Self);
end;

function CXCursorHelper.getFieldDeclBitWidth: Integer;
begin
  Result := clang_getFieldDeclBitWidth(Self);
end;

function CXCursorHelper.getNumArguments: Integer;
begin
  Result := clang_Cursor_getNumArguments(Self);
end;

function CXCursorHelper.getArgument(i: Cardinal): CXCursor;
begin
  Result := clang_Cursor_getArgument(Self, i);
end;

function CXCursorHelper.getNumTemplateArguments: Integer;
begin
  Result := clang_Cursor_getNumTemplateArguments(Self);
end;

function CXCursorHelper.getTemplateArgumentKind(i: Cardinal
  ): CXTemplateArgumentKind;
begin
  Result := clang_Cursor_getTemplateArgumentKind(Self, i);
end;

function CXCursorHelper.getTemplateArgumentType(i: Cardinal): CXType;
begin
  Result := clang_Cursor_getTemplateArgumentType(Self, i);
end;

function CXCursorHelper.getTemplateArgumentValue(i: Cardinal): Int64;
begin
  Result := clang_Cursor_getTemplateArgumentValue(Self, i);
end;

function CXCursorHelper.getTemplateArgumentUnsignedValue(i: Cardinal): UInt64;
begin
  Result := clang_Cursor_getTemplateArgumentUnsignedValue(Self, i);
end;

function CXCursorHelper.isMacroFunctionLike: Boolean;
begin
  Result := clang_Cursor_isMacroFunctionLike(Self) <> 0;
end;

function CXCursorHelper.isMacroBuiltin: Boolean;
begin
  Result := clang_Cursor_isMacroBuiltin(Self) <> 0;
end;

function CXCursorHelper.isFunctionInlined: Boolean;
begin
  Result := clang_Cursor_isFunctionInlined(Self) <> 0;
end;

function CXCursorHelper.getDeclObjCTypeEncodingCXString: CXString;
begin
  Result := clang_getDeclObjCTypeEncoding(Self);
end;

function CXCursorHelper.getDeclObjCTypeEncoding: string;
begin
  Result := clang_getDeclObjCTypeEncoding(Self).ToString;
end;

function CXCursorHelper.getCursorResultType: CXType;
begin
  Result := clang_getCursorResultType(Self);
end;

function CXCursorHelper.getCursorExceptionSpecificationType: CXCursor_ExceptionSpecificationKind;
begin
  Result := clang_getCursorExceptionSpecificationType(Self);
end;

function CXCursorHelper.getOffsetOfField: Int64;
begin
  Result := clang_Cursor_getOffsetOfField(Self);
end;

function CXCursorHelper.isAnonymous: Boolean;
begin
  Result := clang_Cursor_isAnonymous(Self) <> 0;
end;

function CXCursorHelper.isAnonymousRecordDecl: Boolean;
begin
  Result := clang_Cursor_isAnonymousRecordDecl(Self) <> 0;
end;

function CXCursorHelper.isInlineNamespace: Boolean;
begin
  Result := clang_Cursor_isInlineNamespace(Self) <> 0;
end;

function CXCursorHelper.isBitField: Boolean;
begin
  Result := clang_Cursor_isBitField(Self) <> 0;
end;

function CXCursorHelper.isVirtualBase: Boolean;
begin
  Result := clang_isVirtualBase(Self) <> 0;
end;

function CXCursorHelper.getCXXAccessSpecifier: CX_CXXAccessSpecifier;
begin
  Result := clang_getCXXAccessSpecifier(Self);
end;

function CXCursorHelper.getStorageClass: CX_StorageClass;
begin
  Result := clang_Cursor_getStorageClass(Self);
end;

function CXCursorHelper.getNumOverloadedDecls: Cardinal;
begin
  Result := clang_getNumOverloadedDecls(Self);
end;

function CXCursorHelper.getOverloadedDecl(index: Cardinal): CXCursor;
begin
  Result := clang_getOverloadedDecl(Self, index);
end;

function CXCursorHelper.getIBOutletCollectionType: CXType;
begin
  Result := clang_getIBOutletCollectionType(Self);
end;

type
  TInternal_CXCursorVisitor_Event = record
    eMethod: TCXCursorVisitorEventMethod; 
    eProc: TCXCursorVisitorEventProc;
    args: TCXClientDataArray;
  end;
  PInternal_CXCursorVisitor_Event = ^TInternal_CXCursorVisitor_Event;

function _Internal_CXCursorVisitor(
  cursor: CXCursor;
  parent: CXCursor;
  client_data: CXClientData
  ): CXChildVisitResult; cdecl;
var
  e: PInternal_CXCursorVisitor_Event absolute client_data;
begin
  if Assigned(e^.eMethod) then
    Result := e^.eMethod(cursor, parent, e^.args)
  else
    Result := e^.eProc(cursor, parent, e^.args);
end;

procedure CXCursorHelper.visitChildren(event: TCXCursorVisitorEventMethod;
  args: TCXClientDataArray);
var
  e: TInternal_CXCursorVisitor_Event;
begin
  e.eMethod := event;   
  e.eProc := nil;
  e.args := args;
  clang_visitChildren(Self, @_Internal_CXCursorVisitor, @e);
end;

procedure CXCursorHelper.visitChildren(event: TCXCursorVisitorEventProc;
  args: TCXClientDataArray);
var
  e: TInternal_CXCursorVisitor_Event;
begin
  e.eMethod := nil;
  e.eProc := event;
  e.args := args;
  clang_visitChildren(Self, @_Internal_CXCursorVisitor, @e);
end;

function CXCursorHelper.getCursorUSRCXString: CXString;
begin
  Result := clang_getCursorUSR(Self);
end;

function CXCursorHelper.getCursorUSR: string;
begin
  Result := clang_getCursorUSR(Self).ToString;
end;

function CXCursorHelper.getCursorSpellingCXString: CXString;
begin
   Result := clang_getCursorSpelling(Self);
end;

function CXCursorHelper.getCursorSpelling: string;
begin
  Result := clang_getCursorSpelling(Self).ToString;
end;

function CXCursorHelper.getSpellingNameRange(pieceIndex: Cardinal; options: Cardinal
  ): CXSourceRange;
begin
  Result := clang_Cursor_getSpellingNameRange(Self, pieceIndex, options);
end;

function CXCursorHelper.getCursorPrintingPolicy: CXPrintingPolicy;
begin
  Result := clang_getCursorPrintingPolicy(Self);
end;

function CXCursorHelper.getCursorPrettyPrintedCXString(Policy: CXPrintingPolicy
  ): CXString;
begin
  Result := clang_getCursorPrettyPrinted(Self, Policy);
end;

function CXCursorHelper.getCursorPrettyPrinted(Policy: CXPrintingPolicy
  ): string;
begin
  Result := clang_getCursorPrettyPrinted(Self, Policy).ToString;
end;

function CXCursorHelper.getCursorDisplayNameCXString: CXString;
begin
  Result := clang_getCursorDisplayName(Self);
end;

function CXCursorHelper.getCursorDisplayName: string;
begin
  Result := clang_getCursorDisplayName(Self).ToString;
end;

function CXCursorHelper.getCursorReferenced: CXCursor;
begin
  Result := clang_getCursorReferenced(Self);
end;

function CXCursorHelper.getCursorDefinition: CXCursor;
begin
  Result := clang_getCursorDefinition(Self);
end;

function CXCursorHelper.isCursorDefinition: Boolean;
begin
  Result := clang_isCursorDefinition(Self) <> 0;
end;

function CXCursorHelper.getCanonicalCursor: CXCursor;
begin
  Result := clang_getCanonicalCursor(Self);
end;

function CXCursorHelper.getObjCSelectorIndex: Integer;
begin
  Result := clang_Cursor_getObjCSelectorIndex(Self);
end;

function CXCursorHelper.isDynamicCall: Boolean;
begin
  Result := clang_Cursor_isDynamicCall(Self) <> 0;
end;

function CXCursorHelper.getReceiverType: CXType;
begin
  Result := clang_Cursor_getReceiverType(Self);
end;

function CXCursorHelper.getObjCPropertyAttributes(reserved: Cardinal
  ): CXObjCPropertyAttrKind;
begin
  Result := clang_Cursor_getObjCPropertyAttributes(Self, reserved);
end;

function CXCursorHelper.getObjCPropertyGetterNameCXString: CXString;
begin
  Result := clang_Cursor_getObjCPropertyGetterName(Self);
end;

function CXCursorHelper.getObjCPropertyGetterName: string;
begin
  Result := clang_Cursor_getObjCPropertyGetterName(Self).ToString;
end;

function CXCursorHelper.getObjCPropertySetterNameCXString: CXString;
begin
  Result := clang_Cursor_getObjCPropertySetterName(Self);
end;

function CXCursorHelper.getObjCPropertySetterName: string;
begin
  Result := clang_Cursor_getObjCPropertySetterName(Self).ToString;
end;

function CXCursorHelper.getObjCDeclQualifiers: CXObjCDeclQualifierKind;
begin
  Result := clang_Cursor_getObjCDeclQualifiers(Self);
end;

function CXCursorHelper.isObjCOptional: Boolean;
begin
  Result := clang_Cursor_isObjCOptional(Self) <> 0;
end;

function CXCursorHelper.isVariadic: Boolean;
begin
  Result := clang_Cursor_isVariadic(Self) <> 0;
end;

function CXCursorHelper.isExternalSymbol(language: PString; definedIn: PString;
  isGenerated: PBoolean): Boolean;
var
  _language, _definedIn: CXString;   
  _languageP, _definedInP: PCXString;
  _isGenerated: Cardinal;
begin
  if Assigned(language) then
    _languageP := @_language
  else
    _languageP := nil;   
  if Assigned(definedIn) then
    _definedInP := @_definedIn
  else
    _definedInP := nil;
  Result := clang_Cursor_isExternalSymbol(Self, _languageP, _definedInP, @_isGenerated) <> 0;

  if (Result) then
  begin
    if Assigned(language) then
      language^ := _language.ToString;    
    if Assigned(definedIn) then
      definedIn^ := _definedIn.ToString;      
    if Assigned(isGenerated) then
      isGenerated^ := _isGenerated <> 0;
  end;
end;

function CXCursorHelper.getCommentRange: CXSourceRange;
begin
  Result := clang_Cursor_getCommentRange(Self);
end;

function CXCursorHelper.getRawCommentTextCXString: CXString;
begin
  Result := clang_Cursor_getRawCommentText(Self);
end;

function CXCursorHelper.getRawCommentText: string;
begin
  Result := clang_Cursor_getRawCommentText(Self).ToString;
end;

function CXCursorHelper.getBriefCommentTextCXString: CXString;
begin
  Result := clang_Cursor_getBriefCommentText(Self);
end;

function CXCursorHelper.getBriefCommentText: string;
begin
  Result := clang_Cursor_getBriefCommentText(Self).ToString;
end;

function CXCursorHelper.getManglingCXString: CXString;
begin
  Result := clang_Cursor_getMangling(Self);
end;

function CXCursorHelper.getMangling: string;
begin
  Result := clang_Cursor_getMangling(Self).ToString;
end;

function CXCursorHelper.getCXXManglings: PCXStringSet;
begin
  Result := clang_Cursor_getCXXManglings(Self);
end;

function CXCursorHelper.getObjCManglings: PCXStringSet;
begin
  Result := clang_Cursor_getObjCManglings(Self);
end;

function CXCursorHelper.getModule: CXModule;
begin
  Result := clang_Cursor_getModule(Self);
end;

function CXCursorHelper.CXXConstructor_isConvertingConstructor: Boolean;
begin
  Result := clang_CXXConstructor_isConvertingConstructor(Self) <> 0;
end;

function CXCursorHelper.CXXConstructor_isCopyConstructor: Boolean;
begin
  Result := clang_CXXConstructor_isCopyConstructor(Self) <> 0;
end;

function CXCursorHelper.CXXConstructor_isDefaultConstructor: Boolean;
begin
  Result := clang_CXXConstructor_isDefaultConstructor(Self) <> 0;
end;

function CXCursorHelper.CXXConstructor_isMoveConstructor: Boolean;
begin
  Result := clang_CXXConstructor_isMoveConstructor(Self) <> 0;
end;

function CXCursorHelper.CXXField_isMutable: Boolean;
begin
  Result := clang_CXXField_isMutable(Self) <> 0;
end;

function CXCursorHelper.CXXMethod_isDefaulted: Boolean;
begin
  Result := clang_CXXMethod_isDefaulted(Self) <> 0;
end;

function CXCursorHelper.CXXMethod_isPureVirtual: Boolean;
begin
  Result := clang_CXXMethod_isPureVirtual(Self) <> 0;
end;

function CXCursorHelper.CXXMethod_isStatic: Boolean;
begin
  Result := clang_CXXMethod_isStatic(Self) <> 0;
end;

function CXCursorHelper.CXXMethod_isVirtual: Boolean;
begin
  Result := clang_CXXMethod_isVirtual(Self) <> 0;
end;

function CXCursorHelper.CXXRecord_isAbstract: Boolean;
begin
  Result := clang_CXXRecord_isAbstract(Self) <> 0;
end;

function CXCursorHelper.EnumDecl_isScoped: Boolean;
begin
  Result := clang_EnumDecl_isScoped(Self) <> 0;
end;

function CXCursorHelper.CXXMethod_isConst: Boolean;
begin
  Result := clang_CXXMethod_isConst(Self) <> 0;
end;

function CXCursorHelper.getTemplateCursorKind: CXCursorKind;
begin
  Result := clang_getTemplateCursorKind(Self);
end;

function CXCursorHelper.getSpecializedCursorTemplate: CXCursor;
begin
  Result := clang_getSpecializedCursorTemplate(Self);
end;

function CXCursorHelper.getCursorReferenceNameRange(NameFlags: CXNameRefFlags;
  PieceIndex: Cardinal): CXSourceRange;
begin
  Result := clang_getCursorReferenceNameRange(Self, NameFlags, PieceIndex);
end;

function CXCursorHelper.getDefinitionSpellingAndExtent(out startBuf: PChar; out
  endBuf: PChar; out startLine: Cardinal; out startColumn: Cardinal; out endLine: Cardinal;
  out endColumn: Cardinal): Boolean;
begin
  Result := Self.isCursorDefinition;
  if Result then
    clang_getDefinitionSpellingAndExtent(Self, @startBuf, @endBuf, startLine, startColumn, endLine, endColumn);
end;

function CXCursorHelper.getCursorCompletionString: CXCompletionString;
begin
  Result := clang_getCursorCompletionString(Self);
end;

function CXCursorHelper.Evaluate: CXEvalResult;
begin
  Result := clang_Cursor_Evaluate(Self);
end;

function CXCursorHelper.findReferencesInFile(file_: CXFile;
  const visitor: PCXCursorAndRangeVisitor): CXResult;
begin
  Result := clang_findReferencesInFile(Self, file_, visitor^);
end;

function CXCursorHelper.findReferencesInFileWithBlock(file_: CXFile;
  block: CXCursorAndRangeVisitorBlock): CXResult;
begin
  Result := clang_findReferencesInFileWithBlock(Self, file_, block);
end;

function CXCursorHelper._visitChild(cursor: CXCursor; parent: CXCursor;
  args: TCXClientDataArray): CXChildVisitResult;
var
  cursorKind: PCXCursorKind;
  ret: PBoolean;
  cur: PCXCursor;
begin
  cursorKind := PCXCursorKind(args[0]);   
  cur := PCXCursor(args[1]);
  ret := PBoolean(args[2]);
  if cursor.getCursorKind = cursorKind^ then
  begin
    ret^ := True;
    cur^ := cursor;
    Result := CXChildVisitResult.CXChildVisit_Break;
    Exit;
  end;
  Result := CXChildVisitResult.CXChildVisit_Continue;
end;

function CXCursorHelper.FindChild(searchCursorKind: CXCursorKind; out
  cur: CXCursor): Boolean;
begin
  Result := False;
  Self.visitChildren(@_visitChild, [@searchCursorKind, @cur, @Result]);
end;
      
function CXCursorHelper._visitChilds(cursor: CXCursor; parent: CXCursor;
  args: TCXClientDataArray): CXChildVisitResult;
var
  cursorKind: PCXCursorKind;
  ret, recursive: PBoolean;
  curs: PCXCursorArray;
  max: PInteger;
  i: Integer;
begin
  cursorKind := PCXCursorKind(args[0]);
  curs := PCXCursorArray(args[1]);
  max := PInteger(args[2]);
  recursive := PBoolean(args[3]);
  ret := PBoolean(args[4]);
  if (cursor.getCursorKind = cursorKind^) or (cursorKind^ < 0) then
  begin
    ret^ := True;
    i := Length(curs^);
    SetLength(curs^, i + 1);
    curs^[i] := cursor;
    if (max^ > 0) and (max^ = i) then
    begin
      Result := CXChildVisitResult.CXChildVisit_Break;  
      Exit;
    end;
  end;
  if recursive^ then
    Result := CXChildVisitResult.CXChildVisit_Recurse
  else
    Result := CXChildVisitResult.CXChildVisit_Continue;
end;

function CXCursorHelper.FindChilds(searchCursorKind: CXCursorKind; out
  cur: TCXCursorArray; max: Integer; recursive: Boolean): Boolean;
begin
  Result := False;
  cur := [];
  Self.visitChildren(@_visitChilds, [@searchCursorKind, @cur, @max, @recursive, @Result]);
end;

{$endregion 'CXCursorHelper'}

{ CXPlatformAvailabilityHelper }

class procedure CXPlatformAvailabilityHelper.disposeCXPlatformAvailability(
  availability: PCXPlatformAvailability);
begin
  clang_disposeCXPlatformAvailability(availability);
end;

{$region 'CXCursorKindHelper2'}

{ CXCursorKindHelper2 }

function CXCursorKindHelper2.isDeclaration: Boolean;
begin
  Result := clang_isDeclaration(Self) <> 0;
end;

function CXCursorKindHelper2.isReference: Boolean;
begin
  Result := clang_isReference(Self) <> 0;
end;

function CXCursorKindHelper2.isExpression: Boolean;
begin
  Result := clang_isExpression(Self) <> 0;
end;

function CXCursorKindHelper2.isStatement: Boolean;
begin
  Result := clang_isStatement(Self) <> 0;
end;

function CXCursorKindHelper2.isAttribute: Boolean;
begin
  Result := clang_isAttribute(Self) <> 0;
end;

function CXCursorKindHelper2.isInvalid: Boolean;
begin
  Result := clang_isInvalid(Self) <> 0;
end;

function CXCursorKindHelper2.isTranslationUnit: Boolean;
begin
  Result := clang_isTranslationUnit(Self) <> 0;
end;

function CXCursorKindHelper2.isPreprocessing: Boolean;
begin
  Result := clang_isPreprocessing(Self) <> 0;
end;

function CXCursorKindHelper2.isUnexposed: Boolean;
begin
  Result := clang_isUnexposed(Self) <> 0;
end;

function CXCursorKindHelper2.ToString(aShowType: Boolean): string;
begin
  case Self of
    CXCursor_UnexposedDecl: Result := 'UnexposedDecl';
    CXCursor_StructDecl: Result := 'StructDecl';
    CXCursor_UnionDecl: Result := 'UnionDecl';
    CXCursor_ClassDecl: Result := 'ClassDecl';
    CXCursor_EnumDecl: Result := 'EnumDecl';
    CXCursor_FieldDecl: Result := 'FieldDecl';
    CXCursor_EnumConstantDecl: Result := 'EnumConstantDecl';
    CXCursor_FunctionDecl: Result := 'FunctionDecl';
    CXCursor_VarDecl: Result := 'VarDecl';
    CXCursor_ParmDecl: Result := 'ParmDecl';
    CXCursor_ObjCInterfaceDecl: Result := 'ObjCInterfaceDecl';
    CXCursor_ObjCCategoryDecl: Result := 'ObjCCategoryDecl';
    CXCursor_ObjCProtocolDecl: Result := 'ObjCProtocolDecl';
    CXCursor_ObjCPropertyDecl: Result := 'ObjCPropertyDecl';
    CXCursor_ObjCIvarDecl: Result := 'ObjCIvarDecl';
    CXCursor_ObjCInstanceMethodDecl: Result := 'ObjCInstanceMethodDecl';
    CXCursor_ObjCClassMethodDecl: Result := 'ObjCClassMethodDecl';
    CXCursor_ObjCImplementationDecl: Result := 'ObjCImplementationDecl';
    CXCursor_ObjCCategoryImplDecl: Result := 'ObjCCategoryImplDecl';
    CXCursor_TypedefDecl: Result := 'TypedefDecl';
    CXCursor_CXXMethod: Result := 'CXXMethod';
    CXCursor_Namespace: Result := 'Namespace';
    CXCursor_LinkageSpec: Result := 'LinkageSpec';
    CXCursor_Constructor: Result := 'Constructor';
    CXCursor_Destructor: Result := 'Destructor';
    CXCursor_ConversionFunction: Result := 'ConversionFunction';
    CXCursor_TemplateTypeParameter: Result := 'TemplateTypeParameter';
    CXCursor_NonTypeTemplateParameter: Result := 'NonTypeTemplateParameter';
    CXCursor_TemplateTemplateParameter: Result := 'TemplateTemplateParameter';
    CXCursor_FunctionTemplate: Result := 'FunctionTemplate';
    CXCursor_ClassTemplate: Result := 'ClassTemplate';
    CXCursor_ClassTemplatePartialSpecialization: Result := 'ClassTemplatePartialSpecialization';
    CXCursor_NamespaceAlias: Result := 'NamespaceAlias';
    CXCursor_UsingDirective: Result := 'UsingDirective';
    CXCursor_UsingDeclaration: Result := 'UsingDeclaration';
    CXCursor_TypeAliasDecl: Result := 'TypeAliasDecl';
    CXCursor_ObjCSynthesizeDecl: Result := 'ObjCSynthesizeDecl';
    CXCursor_ObjCDynamicDecl: Result := 'ObjCDynamicDecl';
    CXCursor_CXXAccessSpecifier: Result := 'CXXAccessSpecifier';
    //CXCursor_FirstDecl = CXCursor_UnexposedDecl;
    //CXCursor_LastDecl = CXCursor_CXXAccessSpecifier;

    //CXCursor_FirstRef: Result := '';
    CXCursor_ObjCSuperClassRef: Result := 'ObjCSuperClassRef';
    CXCursor_ObjCProtocolRef: Result := 'ObjCProtocolRef';
    CXCursor_ObjCClassRef: Result := 'ObjCClassRef';
    CXCursor_TypeRef: Result := 'TypeRef';
    CXCursor_CXXBaseSpecifier: Result := 'CXXBaseSpecifier';
    CXCursor_TemplateRef: Result := 'TemplateRef';
    CXCursor_NamespaceRef: Result := 'NamespaceRef';
    CXCursor_MemberRef: Result := 'MemberRef';
    CXCursor_LabelRef: Result := 'LabelRef';
    CXCursor_OverloadedDeclRef: Result := 'OverloadedDeclRef';
    CXCursor_VariableRef: Result := 'VariableRef';

    //CXCursor_FirstInvalid: Result := '';
    CXCursor_InvalidFile: Result := 'InvalidFile';
    CXCursor_NoDeclFound: Result := 'NoDeclFound';
    CXCursor_NotImplemented: Result := 'NotImplemented';
    CXCursor_InvalidCode: Result := 'InvalidCode';
    //CXCursor_LastInvalid: Result := '';

    //CXCursor_FirstExpr = 100;

    CXCursor_UnexposedExpr: Result := 'UnexposedExpr';
    CXCursor_DeclRefExpr: Result := 'DeclRefExpr';
    CXCursor_MemberRefExpr: Result := 'MemberRefExpr';
    CXCursor_CallExpr: Result := 'CallExpr';
    CXCursor_ObjCMessageExpr: Result := 'ObjCMessageExpr';
    CXCursor_BlockExpr: Result := 'BlockExpr';
    CXCursor_IntegerLiteral: Result := 'IntegerLiteral';
    CXCursor_FloatingLiteral: Result := 'FloatingLiteral';
    CXCursor_ImaginaryLiteral: Result := 'ImaginaryLiteral';
    CXCursor_StringLiteral: Result := 'StringLiteral';
    CXCursor_CharacterLiteral: Result := 'CharacterLiteral';
    CXCursor_ParenExpr: Result := 'ParenExpr';
    CXCursor_UnaryOperator: Result := 'UnaryOperator';
    CXCursor_ArraySubscriptExpr: Result := 'ArraySubscriptExpr';
    CXCursor_BinaryOperator: Result := 'BinaryOperator';
    CXCursor_CompoundAssignOperator: Result := 'CompoundAssignOperator';
    CXCursor_ConditionalOperator: Result := 'ConditionalOperator';
    CXCursor_CStyleCastExpr: Result := 'CStyleCastExpr';
    CXCursor_CompoundLiteralExpr: Result := 'CompoundLiteralExpr';
    CXCursor_InitListExpr: Result := 'InitListExpr';
    CXCursor_AddrLabelExpr: Result := 'AddrLabelExpr';
    CXCursor_StmtExpr: Result := 'StmtExpr';
    CXCursor_GenericSelectionExpr: Result := 'GenericSelectionExpr';
    CXCursor_GNUNullExpr: Result := 'GNUNullExpr';
    CXCursor_CXXStaticCastExpr: Result := 'CXXStaticCastExpr';
    CXCursor_CXXDynamicCastExpr: Result := 'CXXDynamicCastExpr';
    CXCursor_CXXReinterpretCastExpr: Result := 'CXXReinterpretCastExpr';
    CXCursor_CXXConstCastExpr: Result := 'CXXConstCastExpr';
    CXCursor_CXXFunctionalCastExpr: Result := 'CXXFunctionalCastExpr';
    CXCursor_CXXTypeidExpr: Result := 'CXXTypeidExpr';
    CXCursor_CXXBoolLiteralExpr: Result := 'CXXBoolLiteralExpr';
    CXCursor_CXXNullPtrLiteralExpr: Result := 'CXXNullPtrLiteralExpr';
    CXCursor_CXXThisExpr: Result := 'CXXThisExpr';
    CXCursor_CXXThrowExpr: Result := 'CXXThrowExpr';
    CXCursor_CXXNewExpr: Result := 'CXXNewExpr';
    CXCursor_CXXDeleteExpr: Result := 'CXXDeleteExpr';
    CXCursor_UnaryExpr: Result := 'UnaryExpr';
    CXCursor_ObjCStringLiteral: Result := 'ObjCStringLiteral';
    CXCursor_ObjCEncodeExpr: Result := 'ObjCEncodeExpr';
    CXCursor_ObjCSelectorExpr: Result := 'ObjCSelectorExpr';
    CXCursor_ObjCProtocolExpr: Result := 'ObjCProtocolExpr';
    CXCursor_ObjCBridgedCastExpr: Result := 'ObjCBridgedCastExpr';
    CXCursor_PackExpansionExpr: Result := 'PackExpansionExpr';
    CXCursor_SizeOfPackExpr: Result := 'SizeOfPackExpr';
    CXCursor_LambdaExpr: Result := 'LambdaExpr';
    CXCursor_ObjCBoolLiteralExpr: Result := 'ObjCBoolLiteralExpr';
    CXCursor_ObjCSelfExpr: Result := 'ObjCSelfExpr';
    CXCursor_OMPArraySectionExpr: Result := 'OMPArraySectionExpr';
    CXCursor_ObjCAvailabilityCheckExpr: Result := 'ObjCAvailabilityCheckExpr';
    CXCursor_FixedPointLiteral: Result := 'FixedPointLiteral';
    CXCursor_OMPArrayShapingExpr: Result := 'OMPArrayShapingExpr';
    CXCursor_OMPIteratorExpr: Result := 'OMPIteratorExpr';
    CXCursor_CXXAddrspaceCastExpr: Result := 'CXXAddrspaceCastExpr';

    //CXCursor_FirstStmt = 200;
    CXCursor_UnexposedStmt: Result := 'UnexposedStmt';
    CXCursor_LabelStmt: Result := 'LabelStmt';
    CXCursor_CompoundStmt: Result := 'CompoundStmt';
    CXCursor_CaseStmt: Result := 'CaseStmt';
    CXCursor_DefaultStmt: Result := 'DefaultStmt';
    CXCursor_IfStmt: Result := 'IfStmt';
    CXCursor_SwitchStmt: Result := 'SwitchStmt';
    CXCursor_WhileStmt: Result := 'WhileStmt';
    CXCursor_DoStmt: Result := 'DoStmt';
    CXCursor_ForStmt: Result := 'ForStmt';
    CXCursor_GotoStmt: Result := 'GotoStmt';
    CXCursor_IndirectGotoStmt: Result := 'IndirectGotoStmt';
    CXCursor_ContinueStmt: Result := 'ContinueStmt';
    CXCursor_BreakStmt: Result := 'BreakStmt';
    CXCursor_ReturnStmt: Result := 'ReturnStmt';
    CXCursor_GCCAsmStmt: Result := 'GCCAsmStmt';
    //CXCursor_AsmStmt = CXCursor_GCCAsmStmt;

    CXCursor_ObjCAtTryStmt: Result := 'ObjCAtTryStmt';
    CXCursor_ObjCAtCatchStmt: Result := 'ObjCAtCatchStmt';
    CXCursor_ObjCAtFinallyStmt: Result := 'ObjCAtFinallyStmt';
    CXCursor_ObjCAtThrowStmt: Result := 'ObjCAtThrowStmt';
    CXCursor_ObjCAtSynchronizedStmt: Result := 'ObjCAtSynchronizedStmt';
    CXCursor_ObjCAutoreleasePoolStmt: Result := 'ObjCAutoreleasePoolStmt';
    CXCursor_ObjCForCollectionStmt: Result := 'ObjCForCollectionStmt';
    CXCursor_CXXCatchStmt: Result := 'CXXCatchStmt';
    CXCursor_CXXTryStmt: Result := 'CXXTryStmt';
    CXCursor_CXXForRangeStmt: Result := 'CXXForRangeStmt';
    CXCursor_SEHTryStmt: Result := 'SEHTryStmt';
    CXCursor_SEHExceptStmt: Result := 'SEHExceptStmt';
    CXCursor_SEHFinallyStmt: Result := 'SEHFinallyStmt';
    CXCursor_MSAsmStmt: Result := 'MSAsmStmt';
    CXCursor_NullStmt: Result := 'NullStmt';
    CXCursor_DeclStmt: Result := 'DeclStmt';
    CXCursor_OMPParallelDirective: Result := 'OMPParallelDirective';
    CXCursor_OMPSimdDirective: Result := 'OMPSimdDirective';
    CXCursor_OMPForDirective: Result := 'OMPForDirective';
    CXCursor_OMPSectionsDirective: Result := 'OMPSectionsDirective';
    CXCursor_OMPSectionDirective: Result := 'OMPSectionDirective';
    CXCursor_OMPSingleDirective: Result := 'OMPSingleDirective';
    CXCursor_OMPParallelForDirective: Result := 'OMPParallelForDirective';
    CXCursor_OMPParallelSectionsDirective: Result := 'OMPParallelSectionsDirective';
    CXCursor_OMPTaskDirective: Result := 'OMPTaskDirective';
    CXCursor_OMPMasterDirective: Result := 'OMPMasterDirective';
    CXCursor_OMPCriticalDirective: Result := 'OMPCriticalDirective';
    CXCursor_OMPTaskyieldDirective: Result := 'OMPTaskyieldDirective';
    CXCursor_OMPBarrierDirective: Result := 'OMPBarrierDirective';
    CXCursor_OMPTaskwaitDirective: Result := 'OMPTaskwaitDirective';
    CXCursor_OMPFlushDirective: Result := 'OMPFlushDirective';
    CXCursor_SEHLeaveStmt: Result := 'SEHLeaveStmt';
    CXCursor_OMPOrderedDirective: Result := 'OMPOrderedDirective';
    CXCursor_OMPAtomicDirective: Result := 'OMPAtomicDirective';
    CXCursor_OMPForSimdDirective: Result := 'OMPForSimdDirective';
    CXCursor_OMPParallelForSimdDirective: Result := 'OMPParallelForSimdDirective';
    CXCursor_OMPTargetDirective: Result := 'OMPTargetDirective';
    CXCursor_OMPTeamsDirective: Result := 'OMPTeamsDirective';
    CXCursor_OMPTaskgroupDirective: Result := 'OMPTaskgroupDirective';
    CXCursor_OMPCancellationPointDirective: Result := 'OMPCancellationPointDirective';
    CXCursor_OMPCancelDirective: Result := 'OMPCancelDirective';
    CXCursor_OMPTargetDataDirective: Result := 'OMPTargetDataDirective';
    CXCursor_OMPTaskLoopDirective: Result := 'OMPTaskLoopDirective';
    CXCursor_OMPTaskLoopSimdDirective: Result := 'OMPTaskLoopSimdDirective';
    CXCursor_OMPDistributeDirective: Result := 'OMPDistributeDirective';
    CXCursor_OMPTargetEnterDataDirective: Result := 'OMPTargetEnterDataDirective';
    CXCursor_OMPTargetExitDataDirective: Result := 'OMPTargetExitDataDirective';
    CXCursor_OMPTargetParallelDirective: Result := 'OMPTargetParallelDirective';
    CXCursor_OMPTargetParallelForDirective: Result := 'OMPTargetParallelForDirective';
    CXCursor_OMPTargetUpdateDirective: Result := 'OMPTargetUpdateDirective';
    CXCursor_OMPDistributeParallelForDirective: Result := 'OMPDistributeParallelForDirective';
    CXCursor_OMPDistributeParallelForSimdDirective: Result := 'OMPDistributeParallelForSimdDirective';
    CXCursor_OMPDistributeSimdDirective: Result := 'OMPDistributeSimdDirective';
    CXCursor_OMPTargetParallelForSimdDirective: Result := 'OMPTargetParallelForSimdDirective';
    CXCursor_OMPTargetSimdDirective: Result := 'OMPTargetSimdDirective';
    CXCursor_OMPTeamsDistributeDirective: Result := 'OMPTeamsDistributeDirective';
    CXCursor_OMPTeamsDistributeSimdDirective: Result := 'OMPTeamsDistributeSimdDirective';
    CXCursor_OMPTeamsDistributeParallelForSimdDirective: Result := 'OMPTeamsDistributeParallelForSimdDirective';
    CXCursor_OMPTeamsDistributeParallelForDirective: Result := 'OMPTeamsDistributeParallelForDirective';
    CXCursor_OMPTargetTeamsDirective: Result := 'OMPTargetTeamsDirective';
    CXCursor_OMPTargetTeamsDistributeDirective: Result := 'OMPTargetTeamsDistributeDirective';
    CXCursor_OMPTargetTeamsDistributeParallelForDirective: Result := 'OMPTargetTeamsDistributeParallelForDirective';
    CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective: Result := 'OMPTargetTeamsDistributeParallelForSimdDirective';
    CXCursor_OMPTargetTeamsDistributeSimdDirective: Result := 'OMPTargetTeamsDistributeSimdDirective';
    CXCursor_BuiltinBitCastExpr: Result := 'BuiltinBitCastExpr';
    CXCursor_OMPMasterTaskLoopDirective: Result := 'OMPMasterTaskLoopDirective';
    CXCursor_OMPParallelMasterTaskLoopDirective: Result := 'OMPParallelMasterTaskLoopDirective';
    CXCursor_OMPMasterTaskLoopSimdDirective: Result := 'OMPMasterTaskLoopSimdDirective';
    CXCursor_OMPParallelMasterTaskLoopSimdDirective: Result := 'OMPParallelMasterTaskLoopSimdDirective';
    CXCursor_OMPParallelMasterDirective: Result := 'OMPParallelMasterDirective';
    CXCursor_OMPDepobjDirective: Result := 'OMPDepobjDirective';
    CXCursor_OMPScanDirective: Result := 'OMPScanDirective';
    CXCursor_OMPTileDirective: Result := 'OMPTileDirective';
    CXCursor_OMPCanonicalLoop: Result := 'OMPCanonicalLoop';
    CXCursor_OMPInteropDirective: Result := 'OMPInteropDirective';
    CXCursor_OMPDispatchDirective: Result := 'OMPDispatchDirective';
    CXCursor_OMPMaskedDirective: Result := 'OMPMaskedDirective';
    CXCursor_OMPUnrollDirective: Result := 'OMPUnrollDirective';
    CXCursor_OMPMetaDirective: Result := 'OMPMetaDirective';
    CXCursor_OMPGenericLoopDirective: Result := 'OMPGenericLoopDirective';
    //CXCursor_LastStmt = CXCursor_OMPGenericLoopDirective;

    CXCursor_TranslationUnit: Result := 'TranslationUnit';

    //CXCursor_FirstAttr = 400;
    CXCursor_UnexposedAttr: Result := 'UnexposedAttr';
    CXCursor_IBActionAttr: Result := 'IBActionAttr';
    CXCursor_IBOutletAttr: Result := 'IBOutletAttr';
    CXCursor_IBOutletCollectionAttr: Result := 'IBOutletCollectionAttr';
    CXCursor_CXXFinalAttr: Result := 'CXXFinalAttr';
    CXCursor_CXXOverrideAttr: Result := 'CXXOverrideAttr';
    CXCursor_AnnotateAttr: Result := 'AnnotateAttr';
    CXCursor_AsmLabelAttr: Result := 'AsmLabelAttr';
    CXCursor_PackedAttr: Result := 'PackedAttr';
    CXCursor_PureAttr: Result := 'PureAttr';
    CXCursor_ConstAttr: Result := 'ConstAttr';
    CXCursor_NoDuplicateAttr: Result := 'NoDuplicateAttr';
    CXCursor_CUDAConstantAttr: Result := 'CUDAConstantAttr';
    CXCursor_CUDADeviceAttr: Result := 'CUDADeviceAttr';
    CXCursor_CUDAGlobalAttr: Result := 'CUDAGlobalAttr';
    CXCursor_CUDAHostAttr: Result := 'CUDAHostAttr';
    CXCursor_CUDASharedAttr: Result := 'CUDASharedAttr';
    CXCursor_VisibilityAttr: Result := 'VisibilityAttr';
    CXCursor_DLLExport: Result := 'DLLExport';
    CXCursor_DLLImport: Result := 'DLLImport';
    CXCursor_NSReturnsRetained: Result := 'NSReturnsRetained';
    CXCursor_NSReturnsNotRetained: Result := 'NSReturnsNotRetained';
    CXCursor_NSReturnsAutoreleased: Result := 'NSReturnsAutoreleased';
    CXCursor_NSConsumesSelf: Result := 'NSConsumesSelf';
    CXCursor_NSConsumed: Result := 'NSConsumed';
    CXCursor_ObjCException: Result := 'ObjCException';
    CXCursor_ObjCNSObject: Result := 'ObjCNSObject';
    CXCursor_ObjCIndependentClass: Result := 'ObjCIndependentClass';
    CXCursor_ObjCPreciseLifetime: Result := 'ObjCPreciseLifetime';
    CXCursor_ObjCReturnsInnerPointer: Result := 'ObjCReturnsInnerPointer';
    CXCursor_ObjCRequiresSuper: Result := 'ObjCRequiresSuper';
    CXCursor_ObjCRootClass: Result := 'ObjCRootClass';
    CXCursor_ObjCSubclassingRestricted: Result := 'ObjCSubclassingRestricted';
    CXCursor_ObjCExplicitProtocolImpl: Result := 'ObjCExplicitProtocolImpl';
    CXCursor_ObjCDesignatedInitializer: Result := 'ObjCDesignatedInitializer';
    CXCursor_ObjCRuntimeVisible: Result := 'ObjCRuntimeVisible';
    CXCursor_ObjCBoxable: Result := 'ObjCBoxable';
    CXCursor_FlagEnum: Result := 'FlagEnum';
    CXCursor_ConvergentAttr: Result := 'ConvergentAttr';
    CXCursor_WarnUnusedAttr: Result := 'WarnUnusedAttr';
    CXCursor_WarnUnusedResultAttr: Result := 'WarnUnusedResultAttr';
    CXCursor_AlignedAttr: Result := 'AlignedAttr';
    //CXCursor_LastAttr = CXCursor_AlignedAttr;

    CXCursor_PreprocessingDirective: Result := 'PreprocessingDirective';
    CXCursor_MacroDefinition: Result := 'MacroDefinition';
    CXCursor_MacroExpansion: Result := 'MacroExpansion';
    //CXCursor_MacroInstantiation = CXCursor_MacroExpansion;
    CXCursor_InclusionDirective: Result := 'InclusionDirective';
    //CXCursor_FirstPreprocessing = CXCursor_PreprocessingDirective;
    //CXCursor_LastPreprocessing = CXCursor_InclusionDirective;

    CXCursor_ModuleImportDecl: Result := 'ModuleImportDecl';
    CXCursor_TypeAliasTemplateDecl: Result := 'TypeAliasTemplateDecl';
    CXCursor_StaticAssert: Result := 'StaticAssert';
    CXCursor_FriendDecl: Result := 'FriendDecl';
    //CXCursor_FirstExtraDecl = CXCursor_ModuleImportDecl;
    //CXCursor_LastExtraDecl = CXCursor_FriendDecl;

    CXCursor_OverloadCandidate: Result := 'OverloadCandidate';
  else
    Result := 'Unknow';
  end;
  if aShowType then
    Result := Result + '(' + Integer(Self).ToString + ')';
end;

function CXCursorKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXCursorKindHelper2.getCursorKindSpellingCXString: CXString;
begin
  Result := clang_getCursorKindSpelling(Self);
end;

function CXCursorKindHelper2.getCursorKindSpelling: string;
begin
  Result := clang_getCursorKindSpelling(Self).ToString;
end;

{$endregion 'CXCursorKindHelper2'}

{$region 'CXTypeHelper'}

{ CXTypeHelper }

function CXTypeHelper.equalTypes(const other: PCXType): Boolean;
begin
  Result := clang_equalTypes(Self, other^) <> 0;
end;

function CXTypeHelper.getTypeSpellingCXString: CXString;
begin
  Result := clang_getTypeSpelling(Self);
end;

function CXTypeHelper.getTypeSpelling: string;
begin
  Result := clang_getTypeSpelling(Self).ToString;
end;

function CXTypeHelper.getCanonicalType: CXType;
begin
  Result := clang_getCanonicalType(Self);
end;

function CXTypeHelper.isConstQualifiedType: Boolean;
begin
  Result := clang_isConstQualifiedType(Self) <> 0;
end;

function CXTypeHelper.isVolatileQualifiedType: Boolean;
begin
  Result := clang_isVolatileQualifiedType(Self) <> 0;
end;

function CXTypeHelper.isRestrictQualifiedType: Boolean;
begin
  Result := clang_isRestrictQualifiedType(Self) <> 0;
end;

function CXTypeHelper.getAddressSpace: Cardinal;
begin
  Result := clang_getAddressSpace(Self);
end;

function CXTypeHelper.getTypedefNameCXString: CXString;
begin
  Result := clang_getTypedefName(Self);
end;

function CXTypeHelper.getTypedefName: string;
begin
  Result := clang_getTypedefName(Self).ToString;
end;

function CXTypeHelper.getPointeeType: CXType;
begin
  Result := clang_getPointeeType(Self);
end;

function CXTypeHelper.getTypeDeclaration: CXCursor;
begin
  Result := clang_getTypeDeclaration(Self);
end;

function CXTypeHelper.Type_getObjCEncodingCXString: CXString;
begin
  Result := clang_Type_getObjCEncoding(Self);
end;

function CXTypeHelper.Type_getObjCEncoding: string;
begin
  Result := clang_Type_getObjCEncoding(Self).ToString;
end;

function CXTypeHelper.getFunctionTypeCallingConv: CXCallingConv;
begin
  Result := clang_getFunctionTypeCallingConv(Self);
end;

function CXTypeHelper.getResultType: CXType;
begin
  Result := clang_getResultType(Self);
end;

function CXTypeHelper.getExceptionSpecificationType: CXCursor_ExceptionSpecificationKind;
begin
  Result := clang_getExceptionSpecificationType(Self);
end;

function CXTypeHelper.getNumArgTypes: Integer;
begin
  Result := clang_getNumArgTypes(Self);
end;

function CXTypeHelper.getArgType(i: Cardinal): CXType;
begin
  Result := clang_getArgType(Self, i);
end;

function CXTypeHelper.isPODType: Boolean;
begin
  Result := clang_isPODType(Self) <> 0;
end;

function CXTypeHelper.getElementType: CXType;
begin
  Result := clang_getElementType(Self);
end;

function CXTypeHelper.getNumElements: Int64;
begin
  Result := clang_getNumElements(Self);
end;

function CXTypeHelper.getArrayElementType: CXType;
begin
  Result := clang_getArrayElementType(Self);
end;

function CXTypeHelper.getArraySize: Int64;
begin
  Result := clang_getArraySize(Self);
end;

function CXTypeHelper.Type_getNamedType: CXType;
begin
  Result := clang_Type_getNamedType(Self);
end;

function CXTypeHelper.Type_isTransparentTagTypedef: Boolean;
begin
  Result := clang_Type_isTransparentTagTypedef(Self) <> 0;
end;

function CXTypeHelper.Type_getNullability: CXTypeNullabilityKind;
begin
  Result := clang_Type_getNullability(Self);
end;

function CXTypeHelper.Type_getAlignOf: Int64;
begin
  Result := clang_Type_getAlignOf(Self);
end;

function CXTypeHelper.Type_getClassType: CXType;
begin
  Result := clang_Type_getClassType(Self);
end;

function CXTypeHelper.Type_getSizeOf: Int64;
begin
  Result := clang_Type_getSizeOf(Self);
end;

function CXTypeHelper.Type_getOffsetOf(S: PChar): Int64;
begin
  Result := clang_Type_getOffsetOf(Self, S);
end;

function CXTypeHelper.Type_getModifiedType: CXType;
begin
  Result := clang_Type_getModifiedType(Self);
end;

function CXTypeHelper.Type_getValueType: CXType;
begin
  Result := clang_Type_getValueType(Self);
end;

function CXTypeHelper.Type_getNumTemplateArguments: Integer;
begin
  Result := clang_Type_getNumTemplateArguments(Self);
end;

function CXTypeHelper.Type_getTemplateArgumentAsType(i: Cardinal): CXType;
begin
  Result := clang_Type_getTemplateArgumentAsType(Self, i);
end;

function CXTypeHelper.Type_getCXXRefQualifier: CXRefQualifierKind;
begin
  Result := clang_Type_getCXXRefQualifier(Self);
end;

type
  TInternal_CXFieldVisitor_Event = record
    event: TCXFieldVisitorEvent;
    args: TCXClientDataArray;
  end;
  PInternal_CXFieldVisitor_Event = ^TInternal_CXFieldVisitor_Event;

function _Internal_CXFieldVisitor(
  C: CXCursor;
  client_data: CXClientData
  ): CXVisitorResult; cdecl;
var
  e: PInternal_CXFieldVisitor_Event absolute client_data;
begin
  Result := e^.event(C, e^.args);
end;

function CXTypeHelper.Type_visitFields(visitor: TCXFieldVisitorEvent;
  args: TCXClientDataArray): Cardinal;
var
  e: TInternal_CXFieldVisitor_Event;
begin
  e.event := visitor;
  e.args := args;

  Result := clang_Type_visitFields(Self, @_Internal_CXFieldVisitor, @e);
end;

{$endregion 'CXTypeHelper'}

{$region 'CXTypeKindHelper2'}

{ CXTypeKindHelper2 }

function CXTypeKindHelper2.Value: Integer;
begin
  Result := Self;
end;

function CXTypeKindHelper2.ToString(aShowKind: Boolean): string;
begin
  case Self of
    CXType_Invalid: Result := 'Invalid';
    CXType_Unexposed: Result := 'Unexposed';
    CXType_Void: Result := 'Void';
    CXType_Bool: Result := 'Bool';
    CXType_Char_U: Result := 'Char_U';
    CXType_UChar: Result := 'UChar';
    CXType_Char16: Result := 'Char16';
    CXType_Char32: Result := 'Char32';
    CXType_UShort: Result := 'UShort';
    CXType_UInt: Result := 'UInt';
    CXType_ULong: Result := 'ULong';
    CXType_ULongLong: Result := 'ULongLong';
    CXType_UInt128: Result := 'UInt128';
    CXType_Char_S: Result := 'Char_S';
    CXType_SChar: Result := 'SChar';
    CXType_WChar: Result := 'WChar';
    CXType_Short: Result := 'Short';
    CXType_Int: Result := 'Int';
    CXType_Long: Result := 'Long';
    CXType_LongLong: Result := 'LongLong';
    CXType_Int128: Result := 'Int128';
    CXType_Float: Result := 'Float';
    CXType_Double: Result := 'Double';
    CXType_LongDouble: Result := 'LongDouble';
    CXType_NullPtr: Result := 'NullPtr';
    CXType_Overload: Result := 'Overload';
    CXType_Dependent: Result := 'Dependent';
    CXType_ObjCId: Result := 'ObjCId';
    CXType_ObjCClass: Result := 'ObjCClass';
    CXType_ObjCSel: Result := 'ObjCSel';
    CXType_Float128: Result := 'Float128';
    CXType_Half: Result := 'Half';
    CXType_Float16: Result := 'Float16';
    CXType_ShortAccum: Result := 'ShortAccum';
    CXType_Accum: Result := 'Accum';
    CXType_LongAccum: Result := 'LongAccum';
    CXType_UShortAccum: Result := 'UShortAccum';
    CXType_UAccum: Result := 'UAccum';
    CXType_ULongAccum: Result := 'ULongAccum';
    CXType_BFloat16: Result := 'BFloat16';
    CXType_Ibm128: Result := 'Ibm128';
    //CXType_FirstBuiltin: Result := 'FirstBuiltin';
    //CXType_LastBuiltin: Result := 'LastBuiltin';
    CXType_Complex: Result := 'Complex';
    CXType_Pointer: Result := 'Pointer';
    CXType_BlockPointer: Result := 'BlockPointer';
    CXType_LValueReference: Result := 'LValueReference';
    CXType_RValueReference: Result := 'RValueReference';
    CXType_Record: Result := 'Record';
    CXType_Enum: Result := 'Enum';
    CXType_Typedef: Result := 'Typedef';
    CXType_ObjCInterface: Result := 'ObjCInterface';
    CXType_ObjCObjectPointer: Result := 'ObjCObjectPointer';
    CXType_FunctionNoProto: Result := 'FunctionNoProto';
    CXType_FunctionProto: Result := 'FunctionProto';
    CXType_ConstantArray: Result := 'ConstantArray';
    CXType_Vector: Result := 'Vector';
    CXType_IncompleteArray: Result := 'IncompleteArray';
    CXType_VariableArray: Result := 'VariableArray';
    CXType_DependentSizedArray: Result := 'DependentSizedArray';
    CXType_MemberPointer: Result := 'MemberPointer';
    CXType_Auto: Result := 'Auto';
    CXType_Elaborated: Result := 'Elaborated';
    CXType_Pipe: Result := 'Pipe';
    CXType_OCLImage1dRO: Result := 'OCLImage1dRO';
    CXType_OCLImage1dArrayRO: Result := 'OCLImage1dArrayRO';
    CXType_OCLImage1dBufferRO: Result := 'OCLImage1dBufferRO';
    CXType_OCLImage2dRO: Result := 'OCLImage2dRO';
    CXType_OCLImage2dArrayRO: Result := 'OCLImage2dArrayRO';
    CXType_OCLImage2dDepthRO: Result := 'OCLImage2dDepthRO';
    CXType_OCLImage2dArrayDepthRO: Result := 'OCLImage2dArrayDepthRO';
    CXType_OCLImage2dMSAARO: Result := 'OCLImage2dMSAARO';
    CXType_OCLImage2dArrayMSAARO: Result := 'OCLImage2dArrayMSAARO';
    CXType_OCLImage2dMSAADepthRO: Result := 'OCLImage2dMSAADepthRO';
    CXType_OCLImage2dArrayMSAADepthRO: Result := 'OCLImage2dArrayMSAADepthRO';
    CXType_OCLImage3dRO: Result := 'OCLImage3dRO';
    CXType_OCLImage1dWO: Result := 'OCLImage1dWO';
    CXType_OCLImage1dArrayWO: Result := 'OCLImage1dArrayWO';
    CXType_OCLImage1dBufferWO: Result := 'OCLImage1dBufferWO';
    CXType_OCLImage2dWO: Result := 'OCLImage2dWO';
    CXType_OCLImage2dArrayWO: Result := 'OCLImage2dArrayWO';
    CXType_OCLImage2dDepthWO: Result := 'OCLImage2dDepthWO';
    CXType_OCLImage2dArrayDepthWO: Result := 'OCLImage2dArrayDepthWO';
    CXType_OCLImage2dMSAAWO: Result := 'OCLImage2dMSAAWO';
    CXType_OCLImage2dArrayMSAAWO: Result := 'OCLImage2dArrayMSAAWO';
    CXType_OCLImage2dMSAADepthWO: Result := 'OCLImage2dMSAADepthWO';
    CXType_OCLImage2dArrayMSAADepthWO: Result := 'OCLImage2dArrayMSAADepthWO';
    CXType_OCLImage3dWO: Result := 'OCLImage3dWO';
    CXType_OCLImage1dRW: Result := 'OCLImage1dRW';
    CXType_OCLImage1dArrayRW: Result := 'OCLImage1dArrayRW';
    CXType_OCLImage1dBufferRW: Result := 'OCLImage1dBufferRW';
    CXType_OCLImage2dRW: Result := 'OCLImage2dRW';
    CXType_OCLImage2dArrayRW: Result := 'OCLImage2dArrayRW';
    CXType_OCLImage2dDepthRW: Result := 'OCLImage2dDepthRW';
    CXType_OCLImage2dArrayDepthRW: Result := 'OCLImage2dArrayDepthRW';
    CXType_OCLImage2dMSAARW: Result := 'OCLImage2dMSAARW';
    CXType_OCLImage2dArrayMSAARW: Result := 'OCLImage2dArrayMSAARW';
    CXType_OCLImage2dMSAADepthRW: Result := 'OCLImage2dMSAADepthRW';
    CXType_OCLImage2dArrayMSAADepthRW: Result := 'OCLImage2dArrayMSAADepthRW';
    CXType_OCLImage3dRW: Result := 'OCLImage3dRW';
    CXType_OCLSampler: Result := 'OCLSampler';
    CXType_OCLEvent: Result := 'OCLEvent';
    CXType_OCLQueue: Result := 'OCLQueue';
    CXType_OCLReserveID: Result := 'OCLReserveID';
    CXType_ObjCObject: Result := 'ObjCObject';
    CXType_ObjCTypeParam: Result := 'ObjCTypeParam';
    CXType_Attributed: Result := 'Attributed';
    CXType_OCLIntelSubgroupAVCMcePayload: Result := 'OCLIntelSubgroupAVCMcePayload';
    CXType_OCLIntelSubgroupAVCImePayload: Result := 'OCLIntelSubgroupAVCImePayload';
    CXType_OCLIntelSubgroupAVCRefPayload: Result := 'OCLIntelSubgroupAVCRefPayload';
    CXType_OCLIntelSubgroupAVCSicPayload: Result := 'OCLIntelSubgroupAVCSicPayload';
    CXType_OCLIntelSubgroupAVCMceResult: Result := 'OCLIntelSubgroupAVCMceResult';
    CXType_OCLIntelSubgroupAVCImeResult: Result := 'OCLIntelSubgroupAVCImeResult';
    CXType_OCLIntelSubgroupAVCRefResult: Result := 'OCLIntelSubgroupAVCRefResult';
    CXType_OCLIntelSubgroupAVCSicResult: Result := 'OCLIntelSubgroupAVCSicResult';
    CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout: Result := 'OCLIntelSubgroupAVCImeResultSingleRefStreamout';
    CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout: Result := 'OCLIntelSubgroupAVCImeResultDualRefStreamout';
    CXType_OCLIntelSubgroupAVCImeSingleRefStreamin: Result := 'OCLIntelSubgroupAVCImeSingleRefStreamin';
    CXType_OCLIntelSubgroupAVCImeDualRefStreamin: Result := 'OCLIntelSubgroupAVCImeDualRefStreamin';
    CXType_ExtVector: Result := 'ExtVector';
    CXType_Atomic: Result := 'Atomic';
  else
    Result := 'Unknow';
  end;

  if aShowKind then
    Result := Result + '(' + IntToStr(Self) + ')';
end;

function CXTypeKindHelper2.getTypeKindSpellingCXString: CXString;
begin
  Result := clang_getTypeKindSpelling(Self);
end;

function CXTypeKindHelper2.getTypeKindSpelling: string;
begin
  Result := clang_getTypeKindSpelling(Self).ToString;
end;

function CXTypeKindHelper2.IsInvalid: Boolean;
begin
  Result := Self = CXType_Invalid;
end;

function CXTypeKindHelper2.IsUnexposed: Boolean;
begin
  Result := Self = CXType_Unexposed;
end;

function CXTypeKindHelper2.IsBuiltinType: Boolean;
begin
  Result := (Self >= CXType_FirstBuiltin) and (Self <= CXType_LastBuiltin);
end;

{$endregion 'CXTypeKindHelper2'}

{ CXDiagnosticHelper }

function CXDiagnosticHelper.getChildDiagnostics: CXDiagnosticSet;
begin
  Result := clang_getChildDiagnostics(Self);
end;

procedure CXDiagnosticHelper.disposeDiagnostic;
begin
  clang_disposeDiagnostic(Self);
end;

function CXDiagnosticHelper.formatDiagnosticCXString(
  Option: CXDiagnosticDisplayOptions): CXString;
begin
  Result := clang_formatDiagnostic(Self, Option);
end;

function CXDiagnosticHelper.formatDiagnostic(Option: CXDiagnosticDisplayOptions
  ): string;
begin
  Result := clang_formatDiagnostic(Self, Option).ToString;
end;
      
function CXDiagnosticHelper.getDiagnosticSeverity: CXDiagnosticSeverity;
begin
  Result := clang_getDiagnosticSeverity(Self);
end;

function CXDiagnosticHelper.getDiagnosticLocation: CXSourceLocation;
begin
  Result := clang_getDiagnosticLocation(Self);
end;

function CXDiagnosticHelper.getDiagnosticSpellingCXString: CXString;
begin
  Result := clang_getDiagnosticSpelling(Self);
end;

function CXDiagnosticHelper.getDiagnosticSpelling: string;
begin
  Result := clang_getDiagnosticSpelling(Self).ToString;
end;

function CXDiagnosticHelper.getDiagnosticOptionCXString(Disable: PString
  ): CXString;
var
  pCs: PCXString;
  cs: CXString;
begin
  if Assigned(Disable) then
  begin
    cs := Default(CXString);
    pCs := @cs;
  end
  else
    pCs := nil;
  Result := clang_getDiagnosticOption(Self, pCs);
  if Assigned(Disable) then
    Disable^ := cs.ToString;
end;

function CXDiagnosticHelper.getDiagnosticOption(Disable: PString): string;
var
  pCs: PCXString;
  cs: CXString;
begin
  if Assigned(Disable) then
  begin
    cs := Default(CXString);
    pCs := @cs;
  end
  else
    pCs := nil;
  Result := clang_getDiagnosticOption(Self, pCs).ToString;
  if Assigned(Disable) then
    Disable^ := cs.ToString;
end;

function CXDiagnosticHelper.getDiagnosticCategory: Cardinal;
begin
  Result := clang_getDiagnosticCategory(Self);
end;

function CXDiagnosticHelper.getDiagnosticCategoryTextCXString: CXString;
begin
  Result := clang_getDiagnosticCategoryText(Self);
end;

function CXDiagnosticHelper.getDiagnosticCategoryText: string;
begin
  Result := clang_getDiagnosticCategoryText(Self).ToString;
end;

function CXDiagnosticHelper.getDiagnosticNumRanges: Cardinal;
begin
  Result := clang_getDiagnosticNumRanges(Self);
end;

function CXDiagnosticHelper.getDiagnosticRange(Range: Cardinal): CXSourceRange;
begin
  Result := clang_getDiagnosticRange(Self, Range);
end;

function CXDiagnosticHelper.getDiagnosticNumFixIts: Cardinal;
begin
  Result := clang_getDiagnosticNumFixIts(Self);
end;

function CXDiagnosticHelper.getDiagnosticFixItCXString(FixIt: Cardinal;
  ReplacementRange: PCXSourceRange): CXString;
begin
  Result := clang_getDiagnosticFixIt(Self, FixIt, ReplacementRange);
end;

function CXDiagnosticHelper.getDiagnosticFixIt(FixIt: Cardinal;
  ReplacementRange: PCXSourceRange): string;
begin
  Result := clang_getDiagnosticFixIt(Self, FixIt, ReplacementRange).ToString;
end;

{ CXDiagnosticDisplayOptionsHelper2 }

class function CXDiagnosticDisplayOptionsHelper2.defaultDiagnosticDisplayOptions: CXDiagnosticDisplayOptions;
begin
  Result := clang_defaultDiagnosticDisplayOptions;
end;

{ CXEvalResultHelper }

function CXEvalResultHelper.getKind: CXEvalResultKind;
begin
  Result := clang_EvalResult_getKind(Self);
end;

function CXEvalResultHelper.getAsInt: Integer;
begin
  Result := clang_EvalResult_getAsInt(Self);
end;

function CXEvalResultHelper.getAsLongLong: Int64;
begin
  Result := clang_EvalResult_getAsLongLong(Self);
end;

function CXEvalResultHelper.isUnsignedInt: Boolean;
begin
  Result := clang_EvalResult_isUnsignedInt(Self) = 0;
end;

function CXEvalResultHelper.getAsUnsigned: UInt64;
begin
  Result := clang_EvalResult_getAsUnsigned(Self);
end;

function CXEvalResultHelper.getAsDouble: Double;
begin
  Result := clang_EvalResult_getAsDouble(Self);
end;

function CXEvalResultHelper.getAsStrP: PChar;
begin
  Result := clang_EvalResult_getAsStr(Self);
end;

function CXEvalResultHelper.getAsStr: string;
var
  p: PChar;
begin
  p := clang_EvalResult_getAsStr(Self);
  if Assigned(p) then
    Result := StrPas(p)
  else
    Result := EmptyStr;
end;

procedure CXEvalResultHelper.dispose;
begin
  clang_EvalResult_dispose(Self);
end;

{ CXRemappingHelper }

class function CXRemappingHelper.getRemappingsP(const path: PChar): CXRemapping;
begin
  Result := clang_getRemappings(path);
end;

class function CXRemappingHelper.getRemappings(path: string): CXRemapping;
begin
  Result := clang_getRemappings(PChar(path));
end;

class function CXRemappingHelper.getRemappingsFromFileList(
  filePaths: TStringArray): CXRemapping;
var
  pFilePaths: array of PChar;
  pFilePathsLength, i: Integer;
  ppFilePaths: PPChar;
begin
  pFilePathsLength := Length(filePaths);
  if pFilePathsLength > 0  then
  begin
    SetLength(pFilePaths{%H-}, pFilePathsLength);
    for i := 0 to pFilePathsLength - 1 do
      pFilePaths[i] := PChar(filePaths[i]);
    ppFilePaths := PPChar(@pFilePaths[0]);
  end
  else
    ppFilePaths := nil;

  Result := clang_getRemappingsFromFileList(ppFilePaths, pFilePathsLength);
end;

function CXRemappingHelper.getNumFiles: Cardinal;
begin
  Result := clang_remap_getNumFiles(Self);
end;

procedure CXRemappingHelper.getFilenames(index: Cardinal; original: PCXString;
  transformed: PCXString);
begin
  clang_remap_getFilenames(Self, index, original, transformed);
end;

procedure CXRemappingHelper.dispose;
begin
  clang_remap_dispose(Self);
end;

{ CXIndexActionHelper }

class function CXIndexActionHelper.create(CIdx: CXIndex): CXIndexAction;
begin
  Result := CIdx.IndexAction_create;
end;

procedure CXIndexActionHelper.dispose;
begin
  clang_IndexAction_dispose(Self);
end;

function CXIndexActionHelper.indexSourceFile(client_data: CXClientData;
  index_callbacks: PIndexerCallbacks; index_callbacks_size: Cardinal;
  index_options: CXIndexOptFlags; source_filename: string;
  command_line_args: TStringArray; unsaved_files: PCXUnsavedFile;
  num_unsaved_files: Cardinal; out_TU: PCXTranslationUnit;
  TU_options: CXTranslationUnit_Flags): CXErrorCode;
var
  pArgs: array of PChar;
  argsLength, i: Integer;
  ppArgs: PPChar;
  pFileName: PChar;
begin
  argsLength := Length(command_line_args);
  if argsLength > 0  then
  begin
    SetLength(pArgs{%H-}, argsLength);
    for i := 0 to argsLength - 1 do
      pArgs[i] := PChar(command_line_args[i]);
    ppArgs := PPChar(@pArgs[0]);
  end
  else
    ppArgs := nil;

  if not source_filename.IsEmpty then
    pFileName := PChar(source_filename)
  else
    pFileName := nil;

  Result := clang_indexSourceFile(
    Self,
    client_data,
    index_callbacks, index_callbacks_size,
    index_options,
    pFileName,
    ppArgs, argsLength,
    unsaved_files, num_unsaved_files,
    out_TU, TU_options
    );
end;

function CXIndexActionHelper.indexTranslationUnit(client_data: CXClientData;
  index_callbacks: PIndexerCallbacks; index_callbacks_size: Cardinal;
  index_options: CXIndexOptFlags; TU: CXTranslationUnit): Integer;
begin
  Result := clang_indexTranslationUnit(  
    Self,
    client_data,
    index_callbacks, index_callbacks_size,
    index_options,
    TU
  );
end;

end.

