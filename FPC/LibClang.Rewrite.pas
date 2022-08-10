unit LibClang.Rewrite;

{$mode ObjFPC}{$H+}

interface

uses
  LibClang.Base, LibClang.Index;

type
  CXRewriter = type Pointer;

  {
  Create CXRewriter.
  }
  function clang_CXRewriter_create(
    TU: CXTranslationUnit
    ): CXRewriter; cdecl; external LibClang_dll;

  {
  Insert the specified string at the specified location in the original buffer.
  }
  procedure clang_CXRewriter_insertTextBefore(
    Rew: CXRewriter;
    Loc: CXSourceLocation;
    const Insert: PChar
    ); cdecl; external LibClang_dll;

  {
  Replace the specified range of characters in the input with the specified
  replacement.
  }
  procedure clang_CXRewriter_replaceText(
    Rew: CXRewriter;
    ToBeReplaced: CXSourceRange;
    const Replacement: PChar
    ); cdecl; external LibClang_dll;

  {
  Remove the specified range.
  }
  procedure clang_CXRewriter_removeText(
    Rew: CXRewriter;
    ToBeRemoved: CXSourceRange
    ); cdecl; external LibClang_dll;

  {
  Save all changed files to disk.
  Returns 1 if any files were not saved successfully, returns 0 otherwise.
  }
  function clang_CXRewriter_overwriteChangedFiles(
    Rew: CXRewriter
    ): Integer; cdecl; external LibClang_dll;

  {
  Write out rewritten version of the main file to stdout.
  }
  procedure clang_CXRewriter_writeMainFileToStdOut(
    Rew: CXRewriter
    ); cdecl; external LibClang_dll;

  {
  Free the given CXRewriter.
  }
  procedure clang_CXRewriter_dispose(
    Rew: CXRewriter
    ); cdecl; external LibClang_dll;

implementation

end.

