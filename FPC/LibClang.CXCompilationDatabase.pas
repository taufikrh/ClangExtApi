unit LibClang.CXCompilationDatabase;

{$mode ObjFPC}{$H+} 
{$PACKRECORDS C}
{$minenumsize 4}

interface

uses
  LibClang.Base, LibClang.CXString;

type
  // A compilation database holds all information used to compile files in a
  // project. For each file in the database, it can be queried for the working
  // directory or the command line used for the compiler invocation.
  //
  // Must be freed by clang_CompilationDatabase_dispose
  CXCompilationDatabase = type Pointer;

  // Contains the results of a search in the compilation database
  //
  // When searching for the compile command for a file, the compilation db can
  // return several commands, as the file may have been compiled with
  // different options in different places of the project. This choice of compile
  // commands is wrapped in this opaque data structure. It must be freed by
  // clang_CompileCommands_dispose.
  CXCompileCommands = type Pointer;

  // Represents the command line invocation to compile a specific file.
  CXCompileCommand = type Pointer;

  // Error codes for Compilation Database
  CXCompilationDatabase_Error = (
    // No error occurred
    CXCompilationDatabase_NoError,

    // Database can not be loaded
    CXCompilationDatabase_CanNotLoadDatabase
  );
  PCXCompilationDatabase_Error = ^CXCompilationDatabase_Error;

  // Creates a compilation database from the database found in directory
  // buildDir. For example, CMake can output a compile_commands.json which can
  // be used to build the database.
  //
  // It must be freed by clang_CompilationDatabase_dispose.
  function clang_CompilationDatabase_fromDirectory(
    const BuildDir: PChar;
    out ErrorCode: CXCompilationDatabase_Error
    ): CXCompilationDatabase; cdecl; external LibClang_dll;

  // Free the given compilation database
  procedure clang_CompilationDatabase_dispose(
    db: CXCompilationDatabase
    ); cdecl; external LibClang_dll;

  // Find the compile commands used for a file. The compile commands
  // must be freed by clang_CompileCommands_dispose.
  function clang_CompilationDatabase_getCompileCommands(
    db: CXCompilationDatabase;
    const CompleteFileName: PChar
    ): CXCompileCommands; cdecl; external LibClang_dll;

  // Get all the compile commands in the given compilation database.
  function clang_CompilationDatabase_getAllCompileCommands(
    db: CXCompilationDatabase
    ): CXCompileCommands; cdecl; external LibClang_dll;

  // Free the given CompileCommands
  procedure clang_CompileCommands_dispose(
    cmd: CXCompileCommands
    ); cdecl; external LibClang_dll;

  // Get the number of CompileCommand we have for a file
  function clang_CompileCommands_getSize(
    cmd: CXCompileCommands
    ): Cardinal; cdecl; external LibClang_dll;

  // Get the I'th CompileCommand for a file
  //
  // Note : 0 <= i < clang_CompileCommands_getSize(CXCompileCommands)
  function clang_CompileCommands_getCommand(
    cmd: CXCompileCommands;
    I: Cardinal
    ): CXCompileCommand; cdecl; external LibClang_dll;

  // Get the working directory where the CompileCommand was executed from
  function clang_CompileCommand_getDirectory(
    cmd: CXCompileCommand
    ): CXString; cdecl; external LibClang_dll;

  // Get the filename associated with the CompileCommand.
  function clang_CompileCommand_getFilename(
    cmd: CXCompileCommand
    ): CXString; cdecl; external LibClang_dll;

  //Get the number of arguments in the compiler invocation.
  function clang_CompileCommand_getNumArgs(
    cmd: CXCompileCommand
    ): Cardinal; cdecl; external LibClang_dll;

  // Get the I'th argument value in the compiler invocations
  //
  // Invariant :
  // - argument 0 is the compiler executable
  function clang_CompileCommand_getArg(
    cmd: CXCompileCommand;
    I: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  //Get the number of source mappings for the compiler invocation.
  function clang_CompileCommand_getNumMappedSources(
    cmd: CXCompileCommand
    ): Cardinal; cdecl; external LibClang_dll;

  // Get the I'th mapped source path for the compiler invocation.
  function clang_CompileCommand_getMappedSourcePath(
    cmd: CXCompileCommand;
    I: Cardinal
    ): CXString; cdecl; external LibClang_dll;

  // Get the I'th mapped source content for the compiler invocation.
  function clang_CompileCommand_getMappedSourceContent(
    cmd: CXCompileCommand;
    I: Cardinal
    ): CXString; cdecl; external LibClang_dll;

implementation

end.

